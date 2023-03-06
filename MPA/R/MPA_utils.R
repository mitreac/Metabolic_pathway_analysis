#' @import dplyr
library(dplyr)
#' @import utils
library(utils)

#' Retrieves from a tab-separated file a data.frame with the metabolite data
#' @param file_name the metabolite level data file name - tab-separated file with
#' metabolite average values for condition and control
#' rows are metabolites, rownames are metabolites ids and 2 columns condition and control
#' @return data.frame with the expression data
#' @export
read_expression_data <- function(file_name){
  expr_data <- read.table(file = file_name, header = T, sep = "\t")
  return(expr_data)
}

# test_expr_file.txt:
# metab cond  ctrl
# m1  10  11
# m2  12  20
# file_name = "test_expr_file.txt"
# df = data.frame(cond = c(10,12), ctrl = c(11,20), row.names = c("m1","m2"))
# write.table(df, file_name, sep = "\t")
# df1 = read_expression_data(file_name)
# print(df1)
# print(df1==df)

#' Reads pathway data from file
#' @param file_name of the metabolic pathway in SBML format
#' @return list of reactions
#' @export
read_pathway_data <- function(file_name){
  pathway_data <- NULL
  # read pathway data
  return(pathway_data)
}


#' Computes a perturbation score - a metric that evaluates reaction disruption
#' based on the input metabolite data
#' @param expr_data the metabolite level data - data frame with metabolite average values for condition and control
#' rows are metabolites, rownames are metabolites ids and 2 columns condition and control
#' @param reaction_data the reaction data in a list format list
#' left and right with each list having another list of elements which
#' are the metabolites and its coefficient
#' @return numeric value the reaction perturbation score
#' @export
compute_reaction_score <- function(expr_data, reaction_data){
  reaction_score <- 0
  common_metabolites <- intersect(rownames(expr_data), rownames(reaction_data$right))
  reaction_score <- min(abs(log2(as.numeric(expr_data[common_metabolites,1])/as.numeric(expr_data[common_metabolites,2]))))
  # compute perturbation score using expression data and pathway data
  return(reaction_score)
}

#' Computes a perturbation score - a metric that evaluates pathway disruption
#' based on the input metabolite data
#' @param expr_data the metabolite level data - data frame with metabolite average values for condition and control
#' rows are metabolites, rownames are metabolites ids and 2 columns condition and control
#' @param pathway_data the pathway data in a SBML format - this will be a custom structure
#' @return numeric value the pathway perturbation score
#' @export
compute_pathway_score <- function(expr_data, pathway_data){
  pert_score <- 0
  # pert_score <- expr_data + pathway_data
  # compute perturbation score using expression data and pathway data
  return(pert_score)
}

#' Retrieves the files for the reactome files from url
#' @param reactome_url the reactome pathway data url
#' @return named vector with the pathway file names
#' @export
get_pathway_files <- function(reactome_url){
  pathways_file_names <- NULL
  # retrieve pathways file names
  return(pathways_file_names)
}

#' Performs metabolic pathway analysis
#' based on the input metabolite data and the input pathways
#' @param expr_data_file the file with the metabolite level data - tab separated file with
#' metabolite average values for condition and control
#' rows are metabolites, rownames are metabolites ids and 2 columns condition and control
#' @param reactome_url the reactome pathway data url
#' @return data.frame with the ranked pathway and pathway scores and p-values
#' @export
MPA_analysis <- function(expr_data_file, reactome_url){
  expr_data <- read_expression_data(expr_data_file)
  pathways_file_names <- get_pathway_files(reactome_url)
  pathway_scores <- NULL
  pathway_pvals <- NULL
  # compute pathway scores and p-values
  # go through the list of pathway files
  for (file_name in pathways_file_names){

    # and call the read_pathway_data
    pathway_data <- read_pathway_data(file_name)
    pathway_score <- compute_pathway_score(expr_data, pathway_data)
    pathway_scores <- c(pathway_scores, pathway_score)
  }
  return(data.frame(pathway_scores, pathway_pvals))
}


# ------ Hello function code





# Hello, world!
#
# This is an example function named 'hello'
# which prints 'Hello, world!'.
#
# You can learn more about package authoring with RStudio at:
#
#   http://r-pkgs.had.co.nz/
#
# Some useful keyboard shortcuts for package authoring:
#
#   Install Package:           'Cmd + Shift + B'
#   Check Package:             'Cmd + Shift + E'
#   Test Package:              'Cmd + Shift + T'

#' Displays hello, world and the parameter x
#' based on the input metabolite data
#' @param x the text to display next to Hello, world!
#' @return string x the text that was displaied next to Hello, world!
#' @export
hello <- function(x) {
  print(paste("Hello, world!", x))
  return(x)
}

#' Displays Hello again, world!
#' based on the input metabolite data
#' @return string Hello again, world!
#' @export
hello2 <- function() {
  text <- "Hello again, world!"
  print(text)
}


# hello("BIOINF576")
# df <- data.frame(x = c(1,2), y = c(3,4), z = c(5,6))
# dplyr::select(df, z)
