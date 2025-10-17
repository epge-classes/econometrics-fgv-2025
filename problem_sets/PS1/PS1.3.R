library(here)
library(readr)

csv_path <- here("problem_sets", "PS1", "karlan.csv")

# Read data
df = read.csv(csv_path)
Y <- df$applied
X <- df$offer4
n <- length(X)
sx <- sd(X)

# Bandwidths
hS     <- 1.06 * sx * n^(-1/5)
hSmall <- 0.30 * hS
hLarge <- 3.00 * hS
Hs     <- c(hSmall, hS, hLarge)

# Grids for evaluation
qx <- quantile(X, c(0.01, 0.99), na.rm = TRUE)
xg <- seq(qx[1], qx[2], length.out = 400L)

# Kernels
k_gauss <- function(u) dnorm(u)
k_epan  <- function(u) { w <- pmax(0, 1 - u^2); 0.75 * w }

# Generic NW estimator returning a vector over xg
nw <- function(xgrid, X, Y, h, kfun){
  sapply(xgrid, function(x){
    w <- sum(kfun((X - x)/h))
    w_i <- kfun((X - x)/h)
    if(all(w == 0)) return(NA_real_)
    sum(w_i * Y)/w
  })
}

# Compute estimates
out_g  <- sapply(Hs, function(h) nw(xg, X, Y, h, k_gauss))
out_e  <- sapply(Hs, function(h) nw(xg, X, Y, h, k_epan))
colnames(out_g) <- c("Gaussian: 0.3 hS", "Gaussian: hS", "Gaussian: 3 hS")
colnames(out_e) <- c("Epanechnikov: 0.3 hS", "Epanechnikov: hS", "Epanechnikov: 3 hS")

# Plot helper
plot_many <- function(x, mat, main){
  matplot(x, mat, type = "l", lty = 1, lwd = 2,
          xlab = "offer4", ylab = "Pr(applied = 1 | offer4 = x)",
          main = main, ylim = c(0,0.2))
  legend("topright", legend = colnames(mat), col = 1:ncol(mat),
         lty = 1, lwd = 2, bty = "n")
}

par(mfrow = c(1,2))
plot_many(xg, out_g, "Gaussian kernel")
plot_many(xg, out_e, "Epanechnikov kernel")

