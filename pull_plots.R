
# Load packages -----------------------------------------------------------

library(here) 
library(tidyverse)


# Load objects ------------------------------------------------------------

# Vector of folder names in _bookdown_files
folders <- list.files(here::here("_bookdown_files"))


# Load functions ----------------------------------------------------------

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

count_plots <- function(ch_file) {
  # Counts plots in the chapter folder 
  # Args: 
  #  ch_file: name of the folder in _bookdown_files as a character type
  
  # Check to see if the figure-html file exists in the folder
  if (file.exists(
    here::here("_bookdown_files", ch_file, "figure-html")) == TRUE) {
    
    # Count plots in the chapter folder     
    list.files(
      here::here("_bookdown_files", ch_file, "figure-html"), full.names = TRUE
    ) %>% 
      length()
    
  }
}


# Copy files --------------------------------------------------------------

# Copy plots to the output folder   
folders %>% walk(pull_plots)


# Test result -------------------------------------------------------------

# Count of plots in chapter folders
plot_counts <-  folders %>% 
  map(count_plots) %>% 
  unlist() %>% 
  sum()

# Count of plots in output folder
output_counts <- 
  list.files(here::here("output")) %>% 
  length()

# Message 
cat(
  "Number of plots in chapter folders: ", 
  plot_counts, 
  "\nNumber of plots in output folder: ", 
  output_counts
  )