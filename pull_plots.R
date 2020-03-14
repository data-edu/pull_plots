
# Load packages -----------------------------------------------------------

library(here) 
library(tidyverse)


# Load objects ------------------------------------------------------------

# Vector of folder names in _bookdown_files
folders <- list.files(here::here("_bookdown_files"))


# Load function -----------------------------------------------------------

pull_plots <- function(ch_file) {
  # Looks for plots in the _bookdown_files folder 
  # and copies them to the output folder
  # Args: 
  #  ch_file: name of the folder in _bookdown_files as a character type
  
  # Check to see if the figure-html file exists in the folder
  if (file.exists(
    here::here("_bookdown_files", ch_file, "figure-html")) == TRUE) {
    
    # Vector of file paths for figures
    file_paths <- list.files(
      here::here("_bookdown_files", ch_file, "figure-html"), full.names = TRUE
      ) 
    # Copy each figure to the output folder 
    file_paths %>% purrr::walk(~file.copy(from = .x, to = here::here("output")))
    
  }
}


# Copy files --------------------------------------------------------------

# Copy plots to the output folder   
folders %>% walk(pull_plots)