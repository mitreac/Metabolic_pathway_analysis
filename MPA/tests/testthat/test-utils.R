test_that("multiplication works", {
  expect_equal(2 * 2, 4)
})


test_that("compute_pathway_score", {
  expr_data <- 2
  pathway_data <- 1
  input3 <- 7
  expected_score <- 2
  expect_equal(compute_pathway_score(expr_data, pathway_data, input3), expected_score)
})
