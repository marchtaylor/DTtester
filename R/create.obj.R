#' Create object
#'
#' @param n number ind individuals
#'
#' @return list
#' @export
#'
#' @examples
#' obj <- create.obj(n = 20)
#'
create.obj <- function(n = 100){
  obj = list()
  obj$inds <- data.table(age = rep(0.1, n), m = NA)
  obj$m$model <- function(age, a){return(age^a)}
  obj$m$params <- list(a = 2)
}

