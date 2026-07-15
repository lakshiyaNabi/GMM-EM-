

#############################
# Part 1 : Generate Dataset
#############################

set.seed(200000)

n <- 100000   # per cluster

# Cluster 1
x1_c1 <- rnorm(n, mean = 3, sd = 1)
x2_c1 <- rnorm(n, mean = 4, sd = 1)

# Cluster 2
x1_c2 <- rnorm(n, mean = 9, sd = 1)
x2_c2 <- rnorm(n, mean = 10, sd = 1)

data1 <- cbind(x1_c1, x2_c1)
data2 <- cbind(x1_c2, x2_c2)

data <- rbind(data1, data2)
colnames(data) <- c("X1", "X2")

write.csv(data, "synthetic_data.csv", row.names = FALSE)

# Create Output folder
if (!dir.exists("Output")) dir.create("Output")

png("Output/dataset.png")
plot(data, col="blue", pch=16, main="Generated Dataset")
dev.off()

#############################
# Part 2 : Initialize Parameters
#############################

K <- 2
N <- nrow(data)
D <- ncol(data)

pi_k <- c(0.5, 0.5)

set.seed(100)
mu_k <- data[sample(1:N, K), ]

sigma_k <- list(diag(D), diag(D))

#############################
# Part 3 : Gaussian PDF
#############################

gaussian_pdf <- function(x, mu, sigma) {
  det_sigma <- det(sigma)
  inv_sigma <- solve(sigma)

  diff <- x - matrix(mu, nrow=nrow(x), ncol=ncol(x), byrow=TRUE)
  exponent <- rowSums((diff %*% inv_sigma) * diff)

  coef <- 1 / sqrt((2*pi)^ncol(x) * det_sigma)

  return(coef * exp(-0.5 * exponent))
}

#############################
# Part 4 : E-Step
#############################

E_step <- function(data, pi_k, mu_k, sigma_k) {
  N <- nrow(data)
  K <- length(pi_k)

  gamma <- matrix(0, nrow=N, ncol=K)

  for (k in 1:K) {
    gamma[,k] <- pi_k[k] * gaussian_pdf(data, mu_k[k,], sigma_k[[k]])
  }

  gamma <- gamma / rowSums(gamma)
  return(gamma)
}

#############################
# Part 5 : M-Step
#############################

M_step <- function(data, gamma) {
  N <- nrow(data)
  K <- ncol(gamma)
  D <- ncol(data)

  Nk <- colSums(gamma)

  pi_k <- Nk / N
  mu_k <- matrix(0, K, D)
  sigma_k <- list()

  for (k in 1:K) {
    mu_k[k,] <- colSums(gamma[,k] * data) / Nk[k]

    diff <- data - matrix(mu_k[k,], nrow=N, ncol=D, byrow=TRUE)
    sigma_k[[k]] <- t(diff) %*% (gamma[,k] * diff) / Nk[k]
  }

  return(list(pi_k=pi_k, mu_k=mu_k, sigma_k=sigma_k))
}

#############################
# Part 6 & 7 : EM Algorithm
#############################

# Fast log-likelihood
log_likelihood <- function(data, pi_k, mu_k, sigma_k) {
  N <- nrow(data)
  K <- length(pi_k)

  probs <- matrix(0, nrow=N, ncol=K)

  for (k in 1:K) {
    probs[,k] <- pi_k[k] * gaussian_pdf(data, mu_k[k,], sigma_k[[k]])
  }

  return(sum(log(rowSums(probs))))
}

max_iter <- 20
log_likelihoods <- c()

# Use smaller sample for speed
sample_idx <- sample(1:N, 30000)
data_small <- data[sample_idx, ]

for (iter in 1:max_iter) {

  gamma <- E_step(data_small, pi_k, mu_k, sigma_k)

  params <- M_step(data_small, gamma)
  pi_k <- params$pi_k
  mu_k <- params$mu_k
  sigma_k <- params$sigma_k

  if (iter %% 2 == 0) {
    ll <- log_likelihood(data_small, pi_k, mu_k, sigma_k)
    log_likelihoods <- c(log_likelihoods, ll)
    cat("Iteration:", iter, "Log Likelihood:", ll, "\n")
  }
}

#############################
# Part 8 : Visualization
#############################

# Final clusters (use full data)
gamma_full <- E_step(data, pi_k, mu_k, sigma_k)
clusters <- apply(gamma_full, 1, which.max)

# Final cluster plot
png("Output/final_clusters.png")
plot(data, col=clusters, pch=16, main="Final Clusters")
dev.off()

# Cluster 1
png("Output/cluster1.png")
plot(data[clusters==1,], col="blue", pch=16, main="Cluster 1")
dev.off()

# Cluster 2
png("Output/cluster2.png")
plot(data[clusters==2,], col="red", pch=16, main="Cluster 2")
dev.off()

# Log likelihood plot
png("Output/log_likelihood.png")
plot(log_likelihoods, type="o", pch=16,
     main="Log Likelihood vs Iteration",
     xlab="Iteration", ylab="Log Likelihood")
dev.off()

#############################
# End of Program
#############################
