
context("Testing functions in download_gpdd.R")


### First test when overwrite is "No". 

test_that("Download all datasets as default when first argument not provided", {
  skip_on_cran()
  # create a temporary directory and folder
  test_path <- tempfile("gpdd", tempdir())
  dir.create(test_path, showWarnings = FALSE, recursive = TRUE)

  # download all datasets and test
  download_gpdd(dir = test_path, overwrite = "No")

  path_data = file.path(test_path, "gpdd_data.csv")
  path_main = file.path(test_path, "gpdd_main.csv")
  path_timeperiod = file.path(test_path, "gpdd_timeperiod.csv")
  path_taxon = file.path(test_path, "gpdd_taxon.csv")
  path_datasource = file.path(test_path, "gpdd_datasource.csv")
  path_biotope = file.path(test_path, "gpdd_biotope.csv")
  path_location = file.path(test_path, "gpdd_location.csv")

  expect_true(file.exists(path_data))
  expect_true(file.exists(path_main))
  expect_true(file.exists(path_timeperiod))
  expect_true(file.exists(path_taxon))
  expect_true(file.exists(path_datasource))
  expect_true(file.exists(path_biotope))
  expect_true(file.exists(path_location))

  # remove the contents of the temp paths
  unlink(test_path, recursive = TRUE)
})


test_that("Do not download when requested dataset exists in the directory", {
  skip_on_cran()
  # create a temporary directory and folder
  test_path <- tempfile("gpdd", tempdir())
  dir.create(test_path, showWarnings = FALSE, recursive = TRUE)

  # download gpdd_data.csv for the first time
  download_gpdd("gpdd_data", dir = test_path, overwrite = "No")

  # call download_gpdd again to test behavior
  expect_message(download_gpdd("gpdd_data", dir = test_path, overwrite = "No"),
                 "gpdd_data already exists. Not overwriting. Proceeding to the next dataset.")

  # remove the contents of the temp paths
  unlink(test_path, recursive = TRUE)
})


test_that("Download when requested datasets don't exist in the directory", {
  skip_on_cran()
  # create a temporary directory and folder
  test_path <- tempfile("gpdd", tempdir())
  dir.create(test_path, showWarnings = FALSE, recursive = TRUE)

  # gpdd_data doesn't exist before download
  path_data = file.path(test_path, "gpdd_data.csv")
  expect_false(file.exists(path_data))

  # download gpdd_data.csv for the first time
  download_gpdd("gpdd_data", dir = test_path, overwrite = "No")
  expect_true(file.exists(path_data))

  # download the rest of the datasets (vector input) and test all of them
  download_gpdd(
        c("gpdd_main", "gpdd_timeperiod", "gpdd_taxon", "gpdd_datasource", "gpdd_biotope", "gpdd_location"),
        dir = test_path, overwrite = "No")
  path_main = file.path(test_path, "gpdd_main.csv")
  path_timeperiod = file.path(test_path, "gpdd_timeperiod.csv")
  path_taxon = file.path(test_path, "gpdd_taxon.csv")
  path_datasource = file.path(test_path, "gpdd_datasource.csv")
  path_biotope = file.path(test_path, "gpdd_biotope.csv")
  path_location = file.path(test_path, "gpdd_location.csv")

  expect_true(file.exists(path_data))
  expect_true(file.exists(path_main))
  expect_true(file.exists(path_timeperiod))
  expect_true(file.exists(path_taxon))
  expect_true(file.exists(path_datasource))
  expect_true(file.exists(path_biotope))
  expect_true(file.exists(path_location))

  # remove the contents of the temp paths
  unlink(test_path, recursive = TRUE)
})


test_that("Call download_gpdd when some datasets are present while some are not", {
  skip_on_cran()
  # create a temporary directory and folder
  test_path <- tempfile("gpdd", tempdir())
  dir.create(test_path, showWarnings = FALSE, recursive = TRUE)

  # download gpdd_data.csv for the first time
  download_gpdd("gpdd_data", dir = test_path, overwrite = "No")

  # call download_gpdd again to test behavior
  expect_message(download_gpdd("gpdd_data", dir = test_path, overwrite = "No"),
                 "gpdd_data already exists. Not overwriting. Proceeding to the next dataset.")
  path_data = file.path(test_path, "gpdd_data.csv")
  expect_true(file.exists(path_data))

  # download gpdd_data.csv again, but also download gpdd_main.csv
  expect_message(download_gpdd(c("gpdd_data", "gpdd_main"), dir = test_path, overwrite = "No"),
                 "gpdd_data already exists. Not overwriting. Proceeding to the next dataset.")
  path_main = file.path(test_path, "gpdd_main.csv")
  expect_true(file.exists(path_data))
  expect_true(file.exists(path_main))

  # displaying multiple messages
  expect_message(download_gpdd(
        c("gpdd_data", "gpdd_main", "gpdd_timeperiod"),
        dir = test_path, overwrite = "No"), "gpdd_data already exists. Not overwriting. Proceeding to the next dataset.")
  expect_message(download_gpdd(
    c("gpdd_data", "gpdd_main", "gpdd_timeperiod"),
    dir = test_path, overwrite = "No"), "gpdd_main already exists. Not overwriting. Proceeding to the next dataset.")
  expect_message(download_gpdd(
    c("gpdd_data", "gpdd_main", "gpdd_timeperiod"),
    dir = test_path, overwrite = "No"), "gpdd_timeperiod already exists. Not overwriting. Proceeding to the next dataset.")

  path_timeperiod = file.path(test_path, "gpdd_timeperiod.csv")
  expect_true(file.exists(path_timeperiod))

  # remove the contents of the temp paths
  unlink(test_path, recursive = TRUE)
})


test_that("'Download finished' message displays correctly.", {
  skip_on_cran()
  # create a temporary directory and folder
  test_path <- tempfile("gpdd", tempdir())
  dir.create(test_path, showWarnings = FALSE, recursive = TRUE)
  
  # download gpdd_data.csv for the first time
  download_gpdd("gpdd_data", dir = test_path, overwrite = "No")
  
  # call download_gpdd again to test behavior
  expect_message(download_gpdd("gpdd_data", dir = test_path, overwrite = "No"),
                 "gpdd_data already exists. Not overwriting. Proceeding to the next dataset.")

  expect_message(download_gpdd("gpdd_data", dir = test_path, overwrite = "No"),
                 "Download finished.")
  
  # remove the contents of the temp paths
  unlink(test_path, recursive = TRUE)
})


### Test overwrite behavior
test_that("'When overwrite is 'Yes.'", {
  skip_on_cran()
  # create a temporary directory and folder
  test_path <- tempfile("gpdd", tempdir())
  dir.create(test_path, showWarnings = FALSE, recursive = TRUE)
  
  # download gpdd_data.csv and gpdd_main.csv for the first time
  download_gpdd(c("gpdd_data", "gpdd_main"), dir = test_path, overwrite = "No")
  
  expect_message(download_gpdd("gpdd_data", dir = test_path, overwrite = "No"),
                 "gpdd_data already exists. Not overwriting. Proceeding to the next dataset.")
  
  expect_message(download_gpdd("gpdd_main", dir = test_path, overwrite = "No"),
                 "gpdd_main already exists. Not overwriting. Proceeding to the next dataset.")
  
  expect_message(download_gpdd("gpdd_data", dir = test_path, overwrite = "Yes"),
                 "Downloading gpdd_data. This may take a while.")
  
  expect_message(download_gpdd("gpdd_main", dir = test_path, overwrite = "Yes"),
                 "Downloading gpdd_main. This may take a while.")
  
  # remove the contents of the temp paths
  unlink(test_path, recursive = TRUE)
})











