#https://blog.rstudio.com/2021/03/11/time-to-shiny/
#Instruction - https://docs.google.com/document/d/1p-5Ls2kEU9TUoUTQfBNqwEMPoAL0eNHceKRXDZ1koXc/edit
#Contest 2020 - https://blog.rstudio.com/2020/07/13/winners-of-the-2nd-shiny-contest/
#contest 2019 - https://blog.rstudio.com/2019/04/05/first-shiny-contest-winners/
#https://shiny.rstudio.com/tutorial/written-tutorial/lesson1/

install.packages("shiny")
library(shiny)
#315010107 - GoDaddy ICANN

# Define UI for app that draws a histogram ----
ui <- fluidPage(
  
  # App title ----
  titlePanel("Hello Shiny!"),
  
  # Sidebar layout with input and output definitions ----
  sidebarLayout(
    
    # Sidebar panel for inputs ----
    sidebarPanel(
      
      # Input: Slider for the number of bins ----
      sliderInput(inputId = "bins",
                  label = "Number of bins:",
                  min = 1,
                  max = 50,
                  value = 30)
      
    ),
    
    # Main panel for displaying outputs ----
    mainPanel(
      
      # Output: Histogram ----
      plotOutput(outputId = "distPlot")
      
    )
  )
)
#################################
# Define server logic required to draw a histogram ----
server <- function(input, output) {
  
  output$distPlot <- renderPlot({
    
    x    <- faithful$waiting
    bins <- seq(min(x), max(x), length.out = input$bins + 1)
    
    hist(x, breaks = bins, col = "#75AADB", border = "white",
         xlab = "Waiting time to next eruption (in mins)",
         main = "Histogram of waiting times")
    
  })
  
}
##################################
shinyApp(ui = ui, server = server)
