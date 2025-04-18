test_that("Error handling", {
  skip_if_offline()
  expect_error(get_available_imagery(product_id = "abcdc"))
  expect_error(get_satellite_imagery(product_id = "abcdc"))
  expect_error(get_satellite_imagery())
})

test_that("get_available_imagery returns a {terra} object properly", {
  skip_if_offline()
  i <- get_available_imagery()
  expect_type(i, "character")
  expect_error(get_satellite_imagery(product_id = c("IDE00425", "IDE00420")))
  j <-
    get_satellite_imagery(product_id = "IDE00425",
                          scans = 1)
  expect_s4_class(j, "SpatRaster")
})

test_that("get_available_imagery returns a {stars} object properly", {
  skip_if_offline()
  j <-
    get_satellite_imagery(product_id = "IDE00425",
                          scans = 1,
                          compat = "stars")
  expect_s3_class(j, "stars")
})

test_that("product ID urls are properly handled", {
  skip_if_offline()
  ftp_base <- "ftp://ftp.bom.gov.au/anon/gen/gms/"

  pid <- "IDE00420"
  x <- .ftp_images(product_id = pid, ftp_base)
  expect_identical(substr(basename(x), 1, 8)[1], pid)

  pid <- "IDE00421"
  x <- .ftp_images(product_id = pid, ftp_base)
  expect_identical(substr(basename(x), 1, 8)[1], pid)

  pid <- "IDE00422"
  x <- .ftp_images(product_id = pid, ftp_base)
  expect_identical(substr(basename(x), 1, 8)[1], pid)

  pid <- "IDE00423"
  x <- .ftp_images(product_id = pid, ftp_base)
  expect_identical(substr(basename(x), 1, 8)[1], pid)

  pid <- "IDE00425"
  x <- .ftp_images(product_id = pid, ftp_base)
  expect_identical(substr(basename(x), 1, 8)[1], pid)

  pid <- "IDE00426"
  x <- .ftp_images(product_id = pid, ftp_base)
  expect_identical(substr(basename(x), 1, 8)[1], pid)

  pid <- "IDE00427"
  x <- .ftp_images(product_id = pid, ftp_base)
  expect_identical(substr(basename(x), 1, 8)[1], pid)

  pid <- "IDE00430"
  x <- .ftp_images(product_id = pid, ftp_base)
  expect_identical(substr(basename(x), 1, 8)[1], pid)

  pid <- "IDE00431"
  x <- .ftp_images(product_id = pid, ftp_base)
  expect_identical(substr(basename(x), 1, 8)[1], pid)

  pid <- "IDE00432"
  x <- .ftp_images(product_id = pid, ftp_base)
  expect_identical(substr(basename(x), 1, 8)[1], pid)

  pid <- "IDE00433"
  x <- .ftp_images(product_id = pid, ftp_base)
  expect_identical(substr(basename(x), 1, 8)[1], pid)

  pid <- "IDE00435"
  x <- .ftp_images(product_id = pid, ftp_base)
  expect_identical(substr(basename(x), 1, 8)[1], pid)

  pid <- "IDE00436"
  x <- .ftp_images(product_id = pid, ftp_base)
  expect_identical(substr(basename(x), 1, 8)[1], pid)

  pid <- "IDE00437"
  x <- .ftp_images(product_id = pid, ftp_base)
  expect_identical(substr(basename(x), 1, 8)[1], pid)

  #   This product ID doesn't seem to have images associated with it,
  #   in spite of being valid
  #   "IDE00439"

  pid <- "IDE30"
  expect_error(.ftp_images(product_id = pid, ftp_base))
})
