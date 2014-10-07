## ----eval=TRUE-----------------------------------------------------------
library(dpcR)
#generate some data from 15x16 array. Let's presume, that we have results from two plates
sample_runs <- matrix(rpois(480, lambda = 1.5), ncol = 2)
#check its class - it's a typical R structure
class(sample_runs)
#save it to adpcr object
adpcr_experiments <- create_dpcr(sample_runs, n = 30L, type = "nm", adpcr = TRUE)
class(adpcr_experiments)

## ----eval=TRUE-----------------------------------------------------------
#remember, you can plot only single panel at once 
plot_panel(extract_dpcr(adpcr_experiments, 1), nx_a = 15, ny_a = 16, main = "Experiment 1")

## ----eval=TRUE-----------------------------------------------------------
#remember, you can plot only single panel at once 
test_panel(extract_dpcr(adpcr_experiments, 1), nx_a = 15, ny_a = 16)

