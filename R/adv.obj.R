#' Advance individuals using internal functions
#'
#' @param obj
#' @param times
#'
#' @return
#' @export
#'
#' @examples
#' library(data.table)
#' obj <- create.obj(n=10)
#' obj <- adv.obj(obj, times = 5)
#'
adv.obj <- function(obj, times = 1){
  for(i in seq(times)){
    obj <- age.inds(obj)
    obj <- m.inds(obj)
  }
}
