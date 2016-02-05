#
# This is a Shiny web application. You can run the application by clicking
# the 'Run App' button above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)

# Define UI for application that draws a histogram
ui <- shinyUI(fluidPage(
   
   # Application title
   titlePanel("Old Faithful Geyser Data"),
   
   # Sidebar with a slider input for number of bins 
   sidebarLayout(
      sidebarPanel(
         wellPanel(dateInput(inputId = 'data', label = 'Data')
                     ), 
         wellPanel(checkboxGroupInput(inputId = 'cb', 
                                      label = 'CheckBox', 
                                      choices=c('a'='A', 'b'='B')),
                   textInput(inputId = 'txt', label='Texto'),
                   numericInput('n', label = 'N', value = 3))
      ),
      
      # Show a plot of the generated distribution
      mainPanel(
         fluidRow(
           plotOutput('id_graf') 
         ),
         fluidRow(
           
           tableOutput('id_tab')
         )
      )
   )
))

# Define server logic required to draw a histogram
server <- shinyServer(function(input, output) {
  dados <- reactive({
    input$n
    mtcars[1:input$n]
    
  }) 
  
  output$id_graf <- renderPlot({
     pairs(dados())
   })
   output$id_tab <- renderTable({
     cor(dados())
   })
   })


# Run the application 
shinyApp(ui = ui, server = server)

