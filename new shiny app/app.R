# This is a improved Shiny web application. I use the dataset of flow_sample from STAT545A Mini-Data Analysis. 

# For the original version, I achieved four features from the list: 
# Feature 1. Add an option to sort the table by flow.
# Feature 2. Use the DT package to turn a static table into an interactive table.
# Feature 3. Allows the user to search for the extreme type "maximum", "minimum", and both together. 
# Feature 4. Allow the user to download your table as .csv file. 
# 
# According to the feedback, the Feature 1 (sort by flow) is redundant since the interactive table already does that, so I remove it. 
#
# In this improved version, three new features have been added:
# New Feature 1: Year Range Selection
# - Introduced a slider input to allow users to select a specific range of years.
# - This helps users narrow down the dataset to focus on the data most relevant to their needs.
#
# New Feature 2: Improved Aesthetics with Custom CSS
# - Added custom CSS styling to improve the visual appeal and organization of the app.
# - The CSS enhances readability, provides a clean and professional look, and makes the app more user-friendly.
#
# New Feature 3: Image Integration
# - Incorporated an image into the UI to make the app visually engaging.

library(shiny)        # For creating the Shiny web application
library(datateachr)   # For accessing the flow_sample dataset
library(tidyverse)    # For data manipulation

data <- flow_sample

ui <- fluidPage(
  # New Feature 2: Add custom CSS to improve the app's appearance
  tags$head(
    tags$style(HTML('
    body {
        font-family: "Arial", sans-serif;
        background-color: #ffffff;
      }
      .well {
        background-color: #ffffff;
        border: 2px solid #808080;
      }
      #app-title {
        color: #404040;
        text-align: center;
        margin-bottom: 30px;
        font-size: 1.5em;
        font-weight: bold;
      }
      #floating-image {
        display: block;
        margin: 20px auto 0 auto;
        border: 1px solid #808080;
      }
      #welcome-message {
        text-align: center;
        color: #404040;
        margin-bottom: 30px;
        font-size: 1.1em;
      }
      '))
  ),
  
  div(
    id = "app-title", 
    h1("Extreme Flow Sample Data"),               #title
  ),
  div(
    id = "welcome-message",
    p("Welcome to the Extreme Flow Sample Data app! Follow the instructions on the left to explore the data. This dataset is from the Government of Canada's Historical Hydrometric Database.")
  ),                                              #welcome message

  
  sidebarLayout(
    sidebarPanel(
      h3("How to Use This App"),                   #Instructions
      tags$ul(
        tags$li("Choose 'maximum', 'minimum', or both from the dropdown to see the flow type you want."),
        tags$li("Move the year slider to pick the years you want to see."),
        tags$li("Use the table below to search, sort, or filter the data."),
        tags$li("Click 'Download Table' to save the data as a CSV file.")
      ),
      selectInput("extreme_type_input", "Select Extreme Type",      # Feature 3:selecting extreme flow type
                  choices = c("maximum","minimum"),
                  selected = c("maximum","minimum"),
                  multiple = TRUE),
      sliderInput("year_input", "Select Year Range",                # New Feature 1: Year selection
                  min = min(data$year, na.rm = TRUE),
                  max = max(data$year, na.rm = TRUE),
                  value = c(min(data$year, na.rm = TRUE), max(data$year, na.rm = TRUE)),
                  step = 1,
                  sep = ""),
      downloadButton("download","Download Table"),                 # Feature 4: download the table
      img(id = "floating-image", src = "extreme_flow_image.png", height = "300px")      # New Feature 3: add an image 
    ),
    mainPanel(
      DT::dataTableOutput("table")                       # Feature 2: interactive table
    )
  )
)



server <- function(input, output) {
  
  filtered_data <- reactive({
    data%>%
      filter(extreme_type %in% input$extreme_type_input,                  # Feature 3: filter by extreme type
             year >= input$year_input[1],
             year <= input$year_input[2])                                 # New Feature 1: filter by year
  })
  
  output$table <- DT::renderDataTable({                                           
    DT::datatable(filtered_data(), options = list(pageLength=15))                   #Feature 2: interactive table
  })
  
  output$download <- downloadHandler(
    filename = function(){
      paste("Extreme Flow Data",Sys.Date(),".csv", sep="")
    },
    content=function(file){
      write.csv(filtered_data(), file, row.names=FALSE)                              #Feature 4: download the table
      }
    )
}

# Run the application 
shinyApp(ui = ui, server = server)
