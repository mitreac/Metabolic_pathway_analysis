# read expression data
read_expression_data <- function(file_name){
  expr_data <- read.table(file = file_name, header = T, sep = "\t")
  return(expr_data)
}

# test_expr_file.txt:
# metab cond  ctrl
# m1  10  11
# m2  12  20
file_name = "test_expr_file.txt"
df = data.frame(cond = c(10,12), ctrl = c(11,20), row.names = c("m1","m2"))
write.table(df, file_name, sep = "\t")
df1 = read_expression_data(file_name)
print(df1)
print(df1==df)

# read pathway data
read_pathway_data <- function(file_name){
  pathway_data <- NULL
  # read pathway data
  return(pathway_data)
}

compute_pathway_score <- function(expr_data, pathway_data){
  pert_score <- 0
  # compute perturbation score using expression data and pathway data
  return(pert_score)
}

get_pathway_files <- function(reactome_url){
  pathways_file_names <- NULL
  # retrieve pathways file names
  return(pathways_file_names)
}
  
MPA < function(expr_data_file, reactome_url){
  expr_data <- read_expression_data(expr_data_file)
  pathways_file_names <- get_pathway_files(reactome_url)
  pathway_scores <- NULL
  pathway_pvals <- NULL
  # compute pathway scores and p-values
  # go through the list of pathway files 
  for (file_name in pathways_file_names)
    # and call the read_pathway_data 
    pathway_data <- read_pathway_data(file_name)
    parhway_score <- compute_pathway_score(expr_data, pathway_data)
    pathway_scores <- c(pathway_scores, pathway_score)
  return(data.frame(pathway_scores, pathway_pvals))
}
  

