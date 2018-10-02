library(testthat)
context("download_gpdd(\"data\")")
library(gpdd)

data <- download_gpdd()

test_that("download_gpdd() is equal to download_gpdd(\"data\")", {
  expect_equal(data, download_gpdd("data"))
})

test_that("data has the correct dimensions", {
  expect_equal(dim(data)[2], 10)
})
