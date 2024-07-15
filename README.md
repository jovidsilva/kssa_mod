
# kssa modified

<!-- badges: start -->
[![R-CMD-check](https://github.com/SteffenMoritz/kssa/workflows/R-CMD-check/badge.svg)](https://github.com/SteffenMoritz/kssa/actions)
[![Lifecycle: experimental](https://img.shields.io/badge/lifecycle-experimental-orange.svg)](https://lifecycle.r-lib.org/articles/stages.html#experimental)
<!-- badges: end -->

This package implements the Known Sub-Sequence Algorithm <doi: 10.1016/j.aaf.2021.12.013> which helps to automatically compare, validate and identify the best methods for missing data imputation in time series. It compares the performance of 11 state-of-the-art's imputation methods avaliable from multiple CRAN packages and delivers a best method suited for each particular time series.

## Installation

You can install this development version of kssa like so:

```
library(devtools)
install_github("jovidsilva/kssa_mod")
```

## Installation

You can install original version of kssa like so:

```
library(devtools)
install_github("pipeben/kssa")
```



## Reference
You can cite the original kssa paper using the following: 

  > Ivan-Felipe Benavides, Steffen Moritz, Brayan-David Aroca-Gonzalez, Jhoana
  Romero, Marlon Santacruz and John-Josephraj Selvaraj (2022). kssa: Known
  Sub-Sequence Algorithm. R package version 0.0.1.
  https://github.com/pipeben/kssa

if you use this version of the Repo consider attributing this repo along with the above paper
  
## License
GPL-3
 
