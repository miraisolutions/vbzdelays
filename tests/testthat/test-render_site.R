test_that("the whole website can be rendered", {
  # skip unless part of a pull requests run on Travis
  skip_if(Sys.getenv("TRAVIS_PULL_REQUEST", "false") == "false")
  index <- render_site(output_dir = tempfile())
  expect_true(file.exists(index))
  expect_equal(basename(index), "index.html")
})
