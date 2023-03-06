test_that("multiplication works", {
  expect_equal(2 * 2, 4)
})


test_that("compute_pathway_score", {
  expr_data <- data.frame(row.names = c("m1","m2","m3"),
                          condition = c(1.4,2,3),
                          control = c(3,4,5))
  reaction_data <- list(left = data.frame(row.names = c("m155","m20","m30"),
                                          coefficient = c(1,1,1)),
                        right = data.frame(row.names = c("m11","m12","m13"),
                                           coefficient = c(1,1,1)))
  pathway_data <- list(reaction1 = reaction_data,
                       reaction2 = reaction_data)
  expected_score <- 0
  expect_equal(compute_pathway_score(expr_data, pathway_data), expected_score)
})


test_that("compute_reaction_score", {
  expr_data <- data.frame(row.names = c("m1","m2","m3"),
                          condition = c(1.4,2,3),
                          control = c(3,4,5))
  reaction_data <- list(left = data.frame(row.names = c("m155","m20","m30"),
                                         coefficient = c(1,1,1)),
                       right = data.frame(row.names = c("m1","m2","m13"),
                                          coefficient = c(1,1,1)))
  expected_score <- 1
  expect_equal(compute_reaction_score(expr_data, reaction_data), expected_score)
})
