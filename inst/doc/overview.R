## ----eval=TRUE-----------------------------------------------------------
library(dpcR)
#generate some data from 15x16 array. Let's presume, that we have results from two plates
sample_runs <- matrix(rpois(480, lambda = 1.5), ncol = 2)
#check its class - it's a typical R structure
class(sample_runs)
#save it to adpcr object
adpcr_experiments <- create_dpcr(sample_runs, n = 240L, type = "nm", adpcr = TRUE)
class(adpcr_experiments)

## ----eval=TRUE-----------------------------------------------------------
#remember, you can plot only single panel at once 
plot_panel(extract_dpcr(adpcr_experiments, 1), nx_a = 15, ny_a = 16, main = "Experiment 1")

## ----eval=TRUE-----------------------------------------------------------
#remember, you can plot only single panel at once 
plot_panel(binarize(extract_dpcr(adpcr_experiments, 1)), nx_a = 15, ny_a = 16, main = "Experiment 1")

## ----eval=TRUE-----------------------------------------------------------
#comparison of the experiments using GLM

#1. Simulate results of three different experiments with two repetitions each
#experiment 2 differs significantly from others
adpcr1 <- sim_adpcr(m = 20, n = 765, times = 1e5, pos_sums = FALSE, n_panels = 2)
adpcr2 <- sim_adpcr(m = 100, n = 765, times = 1e5, pos_sums = FALSE, n_panels = 2)
adpcr3 <- sim_adpcr(m = 20, n = 765, times = 1e5, pos_sums = FALSE, n_panels = 2)

#2. Join results for convenience
adpcrs <- bind_dpcr(adpcr1, adpcr2, adpcr3)

#3. Perform test.
comp <- test_counts(adpcrs)

#4. See summary of the test
summary(comp)

#5. Plot results of the test 
plot(comp, aggregate = FALSE)
plot(comp, aggregate = TRUE)

#extract coefficients for the further usage
coef(comp)

