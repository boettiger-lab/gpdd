library(testthat)
context("download_gpdd")
library(gpdd)
data <- lapply(names(indexes), function(name) {
  list(name, download_gpdd(name))
})
test_that("download_gpdd() is equal to download_gpdd(\"data\")", {
  expect_equal(data[[1]][[2]], download_gpdd("data"))
})
dims <- c(10, 25, 6, 12, 9, 3, 24)
names(dims) <- names(indexes)
lapply(data, function(f) {
  test_that(paste(f[[1]], "has the correct dimensions"), {
    expect_equal(dim(f[[2]])[2], dims[[f[[1]]]])
    expect_gt(dim(f[[2]])[2], 1)
  })
})
