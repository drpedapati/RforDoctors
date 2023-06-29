
# Exploring the dystonia dataset
# https://htmlpreview.github.io/?https://github.com/higgi13425/medicaldata/blob/master/man/description_docs/cdystonia_desc.html

# Get the dataset from the medicaldata package
# install.packages("medicaldata")
# install.packages("remotes")
remotes::install_github("higgi13425/medicaldata")
library(medicaldata)

load("cdystonia.rda")

# Look at the data
install.packages("dplyr")
library(dplyr)

# figure out what variables are there

cdystonia %>% names()

# what do the variables mean?
cdystonia %>%          # this is my dataset
  filter(week == 0) %>% 
  select(twstrs) %>%   # i selected one column
  dplyr::summarise( average_value = mean(twstrs),
                    std_dev = sd(twstrs),
                    n = n()) # i put into a function called summarize


# What is the different means based on the treatment at baseline
cdystonia %>%          # this is my dataset
 group_by(week, treat) %>% 
  select(twstrs) %>%   # i selected one column
  dplyr::summarise( average_value = mean(twstrs),
                    std_dev = sd(twstrs),
                    n = n()) # i put into a function called summarize





# what are the units of the measures