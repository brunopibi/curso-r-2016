#
# This is a Shiny web application. You can run the application by clicking
# the 'Run App' button above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)
library(ggplot2)
library(magrittr)

# Define UI for application that draws a histogram
ui <- shinyUI(fluidPage(
   
  titlePanel("Lab 8"),
  
  sidebarLayout(
    sidebarPanel(
      # coloque aqui um seletor de qual variável do banco de dados será a resposta
      # (somente 'price', 'carat', 'x', 'y', 'z')
      wellPanel(selectInput('resposta', 
                                   label = 'Escolha qual será a resposta', 
                                   choices=c('Preço'='price', 'Quilates'='carat', 'x' = 'x', 'y'='y', 'z'='z'))),
      
      # coloque aqui um seletor de qual variável será a explicativa
      # (somente 'price', 'carat', 'x', 'y', 'z')
      
      wellPanel(selectInput('x', 
                            label = 'Escolha qual será a explicativa', 
                            choices=c('Quilates'='carat', 'Preço'='price', 'x' = 'x', 'y'='y', 'z'='z')))
    ),
    
    mainPanel(
      tags$h2('Gráfico!'),
      plotOutput("reta_ajustada")
    )
  )
))

# Define server logic required to draw a histogram
server <- shinyServer(function(input, output) {
  
  #dados <- reactive({
  #  input$resposta
  # input$x
  #  diamonds[head]
  #})  
  
  
   
  output$reta_ajustada <- renderPlot({
    
    # definição das variáveis 
    y <- input$resposta
    x <- input$x
    
    coef <- coef(lm(diamonds[[y]]~diamonds[[x]]))
    ggplot(data = head(diamonds, 100)) +
      geom_point(aes_string(x, y)) +
      geom_abline(intercept = coef[1], slope =coef[2],  color = "blue",linetype = "dashed", size= 1)
    
    # faça um gráfico da variável resposta pela variável selecionada para o eixo X
    # inclua a reta de regressão ajustada.
    
    
  })
})

# Run the application 
shinyApp(ui = ui, server = server)

