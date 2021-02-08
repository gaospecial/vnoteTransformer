## code to prepare `keymap32` dataset goes here

keymap32 = tibble::tribble(
  ~v2,                       ~v3,
  "created_time",            "created_time",
  "version",                 "version",
  "attachment_folder",       "attachment_folder",
  "modified_time",           "modified_time",
  "name",                    "name",
  "sub_directories",         "folders",
  "attachments",             NA,
  "image_folder",            NA,
  "recycle_bin_folder",      NA,
  NA,                        "id",
)


keymap32 <- keymap32 %>%
  dplyr::filter(!is.na(v2), !is.na(v3), v2 != v3)

three2two <-  keymap32$v2
names(three2two) <- keymap32$v3


usethis::use_data(three2two, overwrite = TRUE, internal = TRUE)
