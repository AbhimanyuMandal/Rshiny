library(shiny)
#install.packages("shinythemes")
library(shinythemes)

#ui
ui <- fluidPage(theme = shinytheme("cyborg"),
                navbarPage("Basic App",
                           tabPanel("Tab1",
                                    sidebarPanel(
                                      tags$h3("Input"),
                                      textInput("txt1", "First Name:", ""),
                                      textInput("txt2", "Last Name:", ""),
                                    ), #Side Panel
                                    mainPanel(
                                      h1("Header 1"),
                                      
                                      h4("Output 1"),
                                      verbatimTextOutput("txtout"),
                                    ) #Main Panel
                           ), #Tab1
                ) #NavBar
) #FluidPage


#server
server <- function(input,output){
  output$txtout <- renderText({
    paste(input$txt1, input$txt2, sep = " ")
  })
}

#Shiny App
shinyApp(ui = ui, server = server)