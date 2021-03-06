
# vbzdelays

<!-- badges: start -->
[![Travis build status](https://travis-ci.com/miraisolutions/vbzdelays.svg?branch=master)](https://travis-ci.com/miraisolutions/vbzdelays)
<!-- badges: end -->

The goal of vbzdelays is to analyze VBZ delays.

## Installation

You can install vbzdelays with:

``` r
remotes::install_github("miraisolutions/vbzdelays")
```

## Example

Load line data

``` r
data <- vbzdelays::get_line_data(line = 11)
```

Plot delays by hour per weekday

``` r
vbzdelays::plot_delays_by_weekday_hour(data)
```

Produce delay analysis report by line

``` r
report <- vbzdelays::render_line_report(line = 11, tempdir())
browseURL(report)
```

Create a website as collection of reports for all lines

``` r
website <- vbzdelays::render_site(output_dir = tempfile("_site"))
browseURL(website)
```
