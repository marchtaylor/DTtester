#' Create object
#'
#' @param n number ind individuals
#'
#' @return list object
#'
#' @import data.table
#'
#' @export
#'
#' @examples
#' obj <- create.obj(n = 20)
#' obj
#'
create.obj <- function(n = 10){
  obj = list()
  obj$inds <- data.table(age = rep(0.1, n), m = NA)
  obj$m$model <- function(age, a){return(age^a)}
  obj$m$params <- list(a = 2)
}

