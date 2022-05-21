# Air quality dataset 
 library(shiny)
 data(airquality)
 
 #ui
ui <- fluidPage(
  titlePanel("Ozone Level:"),
  sidebarPanel(
    sliderInput(inputId = "bins",
                label = "Number of bins :",
                min = 1,
                max = 100,
                value = 20)
  ),
  
  #Main panel
  mainPanel(
  plotOutput(outputId = "distplot")
  )
)

#server
server <- function(input, output){
  output$distplot <- renderPlot({
    x <- na.omit(airquality$Ozone)
    bins <- seq(min(x), max(x), length.out = input$bins+1)
    
    hist(x, breaks = bins, col = "green", border = "black",
         xlab = "Ozone level")
  })
}

#ShinyApp
shinyApp(ui = ui, server = server)