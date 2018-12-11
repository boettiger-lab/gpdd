
context("Testing functions in helper.R")


test_that("check_character behaves correctly", {
  # we don't need to check behavior for vector input
  expect_silent(check_character("gpdd_data"))
  expect_silent(check_character("hello world"))
  expect_error(check_character(123),
               "Input must be a string vector.")
  expect_error(check_character(TRUE),
               "Input must be a string vector.")
})


test_that("check_name behaves correctly", {
  # we don't need to check behavior for vector input
  expect_silent(check_name('gpdd_data'))
  expect_silent(check_name('gpdd_main'))
  expect_silent(check_name('gpdd_timeperiod'))
  expect_silent(check_name('gpdd_taxon'))
  expect_silent(check_name('gpdd_datasource'))
  expect_silent(check_name('gpdd_biotope'))
  expect_silent(check_name('gpdd_location'))

  expect_error(check_name("gpdd_dataset"),
               "Requested dataset is invalid.")
  expect_error(check_name("hello world"),
               "Requested dataset is invalid.")

  expect_error(check_name(123),
               "Requested dataset is invalid.")
  expect_error(check_name(TRUE),
               "Requested dataset is invalid.")
})


test_that("dataset_in_dir behaves correctly", {
  skip_on_cran()
  # create a temporary directory and folder
  test_path <- tempfile("gpdd", tempdir())
  dir.create(test_path, showWarnings = FALSE, recursive = TRUE)

  # check behavior of dataset_in_dir when no dataset is present
  expect_equal(dataset_in_dir(dir = test_path), character())

  # download gpdd_data.csv (temporarily)
  download_gpdd("gpdd_data", dir = test_path)

  # check behavior of dataset_in_dir when gpdd_data.csv is present
  expect_equal(dataset_in_dir(dir = test_path), "gpdd_data")

  # download more temporary datasets
  download_gpdd(c("gpdd_main", "gpdd_timeperiod", "gpdd_taxon"), dir = test_path)

  # check behavior of datast_in_dir when multiple datasets are present
  expect_equal(dataset_in_dir(dir = test_path),
               c("gpdd_data", "gpdd_main", "gpdd_timeperiod", "gpdd_taxon"))

  # remove the contents of the temp paths
  unlink(test_path, recursive = TRUE)
})
