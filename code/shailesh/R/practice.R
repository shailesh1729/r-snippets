print.mylist <- function(lst, ...){
  for (name in names(lst)){
      cat(name); cat(': '); cat(lst[[name]]); cat(' ')
  }
  cat('\n')
}
