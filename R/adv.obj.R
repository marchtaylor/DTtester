#' Advance individuals using internal functions
#'
#' @param obj
#' @param times
#'
#' @return list object
#'
#' @import data.table
#'
#' @export
#'
#' @examples
#' obj <- create.obj(n=10)
#' obj <- adv.obj(obj, times = 5)
#' obj
#'
adv.obj <- function(obj, times = 1){
  for(i in seq(times)){
    obj <- age.inds(obj)
    obj <- m.inds(obj)
  }
}
