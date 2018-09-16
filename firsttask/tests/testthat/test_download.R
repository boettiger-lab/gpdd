
context("Output format")

test_that("Output is a tibble", {
  expect_true(is.data.frame(download_gpdd('data')))
  expect_true(is.data.frame(download_gpdd('main')))
  expect_true(is.data.frame(download_gpdd('timeperiod')))
  expect_true(is.data.frame(download_gpdd('taxon')))
  expect_true(is.data.frame(download_gpdd('datasource')))
  expect_true(is.data.frame(download_gpdd('biotope')))
  expect_true(is.data.frame(download_gpdd('location')))
})

test_that("Input must be a string", {
  expect_error(download_gpdd(123), 'Input must be a string')
  expect_error(download_gpdd(TRUE), 'Input must be a string')
})

test_that("Input must match the names of datasets", {
  expect_error(download_gpdd('data123'), 'No such dataset')
})
