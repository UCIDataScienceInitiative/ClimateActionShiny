
library(shiny)

shinyUI(
  fluidPage(
  # Application title
  titlePanel("Drought Awareness in California"),

  sidebarLayout(
    sidebarPanel(
      tags$b("by Alexa Ritchie, Colleen Nell, Danica Loucks, Joey Ly, and Sofia Hallerback"),
      p("Welcome to our Shiny new app! Explore drought awareness, drought index and water use in Califorinia."),
      p("The vertical line indicates January 17, 2014 when a State of Emergency was proclaimed as a result of the drought."),
      p("The second plot shows the monthly water use in California from June 2014 through January 2016. Look at the second plot to see how these values relate to drought awareness as measured by Google search trends and state action."),
      h3("Public Awareness"),
      p("Select terms to see Google search frequency of drought related term in California, realtive to the total number of searches."),
    checkboxGroupInput("google_trend", 
                       label = h5("Select Google search term:"), selected = "drought",
                choices = list("water_conservation", "drought", "drought_in_california", "climate_change","xeriscaping","water_use","pool_party", "dog_days")
                
      ),
    h3("Drought index"),
    p("Select Drought Index to see the Palmer Drought Severity Index in California. Values below 27 are considered a drought, below 9 is extreme drought. Values above 73 are considered a water surplus."),
    checkboxInput("Palmer_Drought_INDEX", 
                       label = "Palmer Drought Severity Index"
    ),
    # Date input
    h3("Scale x-axis to zoom in on time:"),
    p("Scale the first graph to see how public drought awareness compares to water use. Valid starting dates are 2004-01-01 to 2016-01-01."),
    dateInput('date_input',
              label = 'Start date input: yyyy-mm-dd',
              value = "2004-01-01"
    )
    ),

    mainPanel(
      tabsetPanel(
        tabPanel("Drought Severity and Google Search Words",
                 plotOutput("google.plot", height="350",width="800"),
                 plotOutput("water_use.plot", height="300",width="800"))
      )
    )
  )
)
)