The script `pull_plots.R` copies plots from the chapter folders into a new folder called `output`. We made it to work on the {bookdown} directory for our book [Data Science in Education Using R](https://datascienceineducation.com). It might also work on other {bookdown} directories. 

# pull_plots

This function copies plots from the bookdown directory and stores them in a folder called `output`. 

The function assumes the default {bookdown} file structure, where 

 - plots are stored in a folder called `figure-html` 
 - `figure-html` folders are stored in chapter folders 
 - chapter folders are stored in a folder called `_bookdown_files` 

The code chunks that produce the plots should be individually named. Code chunks with the same name will overwrite each other in the `output` folder. 

Arguments: 

`ch_file`: the name of the chapter folder in the {bookdown} directory that contains the `figure-html` folder. Needs to be in quotes. 

# count_plots

This function counts plots from the bookdown directory. 

The function assumes the default {bookdown} file structure, where 

 - plots are stored in a folder called `figure-html` 
 - `figure-html` folders are stored in chapter folders 
 - chapter folders are stored in a folder called `_bookdown_files` 

Arguments: 

`ch_file`: the name of the chapter folder in the {bookdown} directory that contains the `figure-html` folder. Needs to be in quotes. 