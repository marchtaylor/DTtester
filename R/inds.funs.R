
age.inds <- function(obj){
  obj$inds[, age := age + 1][]
  return(obj)
}

m.inds <- function(obj){
  ARGS <- list()
  args.incl <- which(names(obj$m$params) %in% names(formals(obj$m$model)))
  ARGS <- c(ARGS, obj$m$params[args.incl])
  args.incl <- names(obj$inds)[names(obj$inds) %in% names(formals(obj$m$model))]
  ARGS <- c(ARGS, obj$inds[, ..args.incl]) # double dot '..' version
  # ARGS <- c(ARGS, inds[, args.incl, with = FALSE]) # 'with' version

  obj$inds[, m := do.call(obj$m$model, ARGS)][]
  return(obj)
}
