#
# title: "Week 5 ggplot Group Assignment"
# author: "K Boysen, J Kidson, J Palacios-Abrantes"
# date: "February 29, 2016"

####### Plot from Week 5 Assignment of octopus landings with a slider to select time range #########
library(readr)

# Define UI for application
ui <- shinyUI(fluidPage(
   # Application title
   titlePanel("Octopus Landings"),
   # Sidebar with a slider input for number of bins
   sidebarLayout(
      sidebarPanel(
         sliderInput("range",
                     "Range:",
                     min = 1980,
                     max = 2013,
                     value = c(1980,2013))
      ),

      # Show a plot of the generated distribution
      mainPanel(
         plotOutput("distPlot")
      )
   )
))
 
Octo = read_csv("../Data/OctoLanding.csv")
test <- Octo[, 1:6] %>% 
  gather("fishery", "catch", 2:4) %>% 
  filter(fishery!="Total.Landings")

 # Define server logic required to plot octopus landings
 server <- shinyServer(function(input, output) {
  library(ggplot2)
  octo_plot <- ggplot(test, aes(x=Year, y=catch)) +
    geom_point(aes(color=fishery, size=ONI)) +
    xlim(1980,2013) +                             # I think these will need to be variable names in                                                       # order to let the user change the slider?
    theme_classic() +
    ggtitle("Octopus Landings") +
    labs(x="Year", y="Octopus landings (tons)") +
    theme(legend.position = "bottom")
    })

 # Run the application 
shinyApp(ui = ui, server = server)

