#
# title: "Week 8 Shiny Assignment"
# author: "K Boysen, J Kidson, J Palacios-Abrantes"
# date: "February 29, 2016"

####### Plot from Week 5 Assignment of octopus landings with a slider to select time range #########
library(readr)
library(dplyr)
library(tidyr)
library(ggplot2)

Octo1 = read_csv("../Data/OctoLanding.csv")      

octo <- Octo1[, 1:6] %>% 
  gather("fishery", "catch", 2:4) %>% 
  filter(fishery!="Total.Landings") 

# Define UI for application
ui <- fluidPage(
   # Application title
   titlePanel("Octopus Landings"),
   sidebarLayout(
      sidebarPanel(
        # Creates the slider for the date range
         sliderInput("range",
                     "Date Range:",
                     min = 1980,max = 2013,
                     value = c(1980,2013))
      ),
      # Below is the section that creates the checkbox widget (to select Pacific, Caribbean, or both)
      checkboxGroupInput("checkGroup", 
                         label = h3("Select Index"),
                         choices = list("Normal" = 1, "El Nino" = 2, "La Nina" = 3),
                         selected = 1)
   ),
      # Show the scatter plot of catch data in the main panel
      mainPanel(
         plotOutput("distPlot"),
         br(), br(),
         tableOutput("results")
      )
   )

 
 # Define server logic required to plot octopus landings
 server <- shinyServer(function(input, output) {
   # Create output plot
   # **** Right now the display part ALMOST works. The plot doesn't display at all unless the La Nina box is checked, in which case that will display correctly. I'm not sure if this is to do with the way that the ggplot stuff is set up (like we need to initialize the plot outside an if statement?) or because it's the last item?******
   output$distPlot <- renderPlot({

     if (1 %in% input$checkGroup) {
       ggplot(subset(octo, ONI == "Normal")) +
         aes(x=Year, y=catch) +
         geom_point(aes(color=fishery, size=ONI)) +
         xlim(input$range[1],input$range[2]) +
         theme_classic() +
         ggtitle("Octopus Landings") +
         labs(x="Year", y="Octopus landings (tons)") +
         theme(legend.position = "bottom")
     }

     if (2 %in% input$checkGroup) {
       ggplot(subset(octo, ONI == "Nino")) +
        aes(x=Year, y=catch) +
        geom_point(aes(color=fishery, size=ONI)) +
        xlim(input$range[1],input$range[2]) +
        theme_classic() +
        ggtitle("Octopus Landings") +
        labs(x="Year", y="Octopus landings (tons)") +
        theme(legend.position = "bottom")
     }

     if (3 %in% input$checkGroup) {
      ggplot(subset(octo, ONI == "Nina")) +
      aes(x=Year, y=catch) +
      geom_point(aes(color=fishery, size=ONI)) +
      xlim(input$range[1],input$range[2]) +
      theme_classic() +
      ggtitle("Octopus Landings") +
      labs(x="Year", y="Octopus landings (tons)") +
      theme(legend.position = "bottom")
      }
      })
   })
 
 # Run the application 
shinyApp(ui = ui, server = server)