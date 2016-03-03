## collections.R

writeMasterFile <- function() {
  sink("collections.json")
  for (i in 1:length(list.files("collections/"))) {
    if (i == 1) {
      cat("[")
    }
    cat(jsonlite::toJSON(
      jsonlite::fromJSON(paste(
        "collections/",list.files("collections/")[i],sep = ""
      )),auto_unbox = TRUE,pretty = TRUE
    ))
    if (i < length(list.files("collections/"))) {
      cat(",")
    }
    if (i == length(list.files("collections/"))) {
      cat("]")
    }
  }
  sink()
}
writeMasterFile()
collections <- jsonlite::fromJSON("collections.json")
save(collections, file = "data/collections.rda")