#AULA 08 - SHINY

install.packages("shiny")
library(shiny)

shiny::runGitHub('abjur/vistemplate', 
                 subdir='exemplo_01_helloworld', 
                 display.mode='showcase')

shiny::runGitHub('garrettgman/shinyWidgets')

#EXEMPLOS
setwd('script/')
shiny::runGitHub('rstudio/shiny-examples', subdir='055-observer-demo')
