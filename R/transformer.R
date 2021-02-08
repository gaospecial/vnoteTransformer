#' Transform VNoteX 3.x notebook to VNote 2.x notebook
#'
#' @param from is the notebook directory of 3.x
#' @param to is the new notebook directory of 2.x
#' @param mode replace (default), or coexist
#'
#' @return NULL
#' @export
#'
#' @examples
#' \dontrun{
#' library(vnoteTransformer)
#' vnote32(from = "E:/VNoteBook/", to = "E:/VNotebook2/")
#' }
vnote32 <- function(from, to = tempdir(), mode = c("replace","coexist")){
  mode <- match.arg(mode)
  if (!is.null(to)){
    file.copy(from, to, recursive = TRUE)
    from <- file.path(to, basename(from))
  }
  json3_files <- list.files(from, pattern = json3_pattern, recursive = TRUE, full.names = TRUE)
  # json3_files <- grep(x = json3_files, pattern = "vx_recycle_bin", invert = TRUE, value = TRUE)
  json2_files <- filename32(json3_files)

  for (i in seq_along(json3_files)){
    file3 <- json3_files[[i]]
    file2 <- json2_files[[i]]
    transform_notebook_json(file3, file2)
  }
  if (mode == "replace") unlink(json3_files)
  message("The transformation is done.\n",
          "Your notebook is located in \"", to, "\".\n",
          "Please import notebook in VNote by yourself.\n",
          "HAVE A NICE DAY!")
  NULL
}

json3_pattern = "vx.json"
json2_pattern = "_vnote.json"

#' @importFrom jsonlite fromJSON write_json
transform_notebook_json <- function(file_in, file_out, keymap = three2two){
  # write v2 json file
  j <- fromJSON(file_in)
  j <- rename_list(j, keymap)
  write_json(j, file_out)
}


filename32 <- function(file){
  # v3 json file to v2 json file
  file.path(dirname(file), json2_pattern)
}

#' @importFrom purrr map
rename_list <- function(nested_list, keymap = three2two) {
  # change key name
  found <- names(nested_list) %in% names(keymap)
  names(nested_list)[found] <- keymap[names(nested_list)[found]]
  nested_list %>% map(~{
    if (is.list(.) & !is.data.frame(.)) {
      rename_list(., keymap = keymap)
    } else {
      .
    }
  })
}

