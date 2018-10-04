# required functions ------------------------------------------------------

# create object
create.obj <- function(n = 100){
  obj = list()
  obj$inds <- data.table(age = rep(0.1, n), m = NA)
  obj$m$model <- function(age, a){return(age^a)}
  obj$m$params <- list(a = 2)
  return(obj)
}

# calculate new 'age' of inds
age.inds <- function(obj){
  obj$inds[, age := age + 1]
  return(obj)
}

# calculate new 'm' of inds
m.inds <- function(obj){
  ARGS <- list()
  args.incl <- which(names(obj$m$params) %in% names(formals(obj$m$model)))
  ARGS <- c(ARGS, obj$m$params[args.incl])
  args.incl <- names(obj$inds)[names(obj$inds) %in% names(formals(obj$m$model))]
  ARGS <- c(ARGS, obj$inds[, ..args.incl]) # double dot '..' version
  # ARGS <- c(ARGS, inds[, args.incl, with = FALSE]) # 'with' version

  obj$inds[, m := do.call(obj$m$model, ARGS)]
  return(obj)
}

# advance object
adv.obj <- function(obj, times = 1){
  for(i in seq(times)){
    obj <- age.inds(obj)
    obj <- m.inds(obj)
  }
  return(obj)
}



# Example  ----------------------------------------------------------------
# this doesn't work
obj <- create.obj(n = 10)
obj # so far so good
obj <- age.inds(obj)
obj # 'inds' gone

# would ultimately like to call adv.obj
obj <- adv.obj(obj, times = 5)


