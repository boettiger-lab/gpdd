
context("Testing functions in load_gpdd.R")


test_that("Do not load anything if no dataset is present", {
  skip_on_cran()
  # create a temporary directory and folder
  test_path <- tempfile("gpdd", tempdir())
  dir.create(test_path, showWarnings = FALSE, recursive = TRUE)
  path_data = file.path(test_path, "gpdd_data.csv")
  expect_false(file.exists(path_data))

  expect_message(load_gpdd("gpdd_data", dir = test_path),
                 "gpdd_data does not exist. Proceeding to the next dataset.")

  # remove the contents of the temp paths
  unlink(test_path, recursive = TRUE)
})


test_that("Correctly load gpdd_data.csv", {
  skip_on_cran()
  # create a temporary directory and folder
  test_path <- tempfile("gpdd", tempdir())
  dir.create(test_path, showWarnings = FALSE, recursive = TRUE)
  download_gpdd("gpdd_data", test_path)
  path_data = file.path(test_path, "gpdd_data.csv")
  expect_true(file.exists(path_data))

  # pass in the path to load_gpdd
  load_gpdd("gpdd_data", dir = test_path)
  expect_true(exists("gpdd_data", envir = .GlobalEnv))
  expect_message(load_gpdd("gpdd_data", dir = test_path),
                 "All datasets successfullly loaded.")

  # remove the contents of the temp paths
  unlink(test_path, recursive = TRUE)
})


test_that("Load all available datasets as default when first argument not provided", {
  skip_on_cran()
  # create a temporary directory and folder
  test_path <- tempfile("gpdd_load", tempdir())
  dir.create(test_path, showWarnings = FALSE, recursive = TRUE)

  # download a selection of datasets first
  download_gpdd(c("gpdd_main", "gpdd_taxon", "gpdd_biotope", "gpdd_location"), dir = test_path)

  path_main <- file.path(test_path, "gpdd_main.csv")
  path_taxon <- file.path(test_path, "gpdd_taxon.csv")
  path_biotope <- file.path(test_path, "gpdd_biotope.csv")
  path_location <- file.path(test_path, "gpdd_location.csv")

  expect_true(file.exists(path_main))
  expect_true(file.exists(path_taxon))
  expect_true(file.exists(path_biotope))
  expect_true(file.exists(path_location))

  # load available datasets
  load_gpdd(dir = test_path)

  expect_true(exists("gpdd_main", envir = .GlobalEnv))
  expect_true(exists("gpdd_taxon", envir = .GlobalEnv))
  expect_true(exists("gpdd_biotope", envir = .GlobalEnv))
  expect_true(exists("gpdd_location", envir = .GlobalEnv))
  expect_true(exists("gpdd_data", envir = .GlobalEnv))

  expect_message(load_gpdd(dir = test_path),
                 "All datasets successfullly loaded.")

  # remove the contents of the temp paths
  unlink(test_path, recursive = TRUE)
})
