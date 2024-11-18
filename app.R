# This is a Shiny web application. I use the dataset of flow_sample from STAT545A Mini-Data Analysis. 

# I achieve four features from the list: 
# Feature 1. Add an option to sort the table by one of your variables: Here I add an option to sort the table by flow, 
# so users can easily see the smallest flow, which can provide different information compared to sorting by 
# year by default.
#
# Feature 2. Use the DT package to turn a static table into an interactive table. Here, users can easily search the flow
# data of a specific year, and columns can be sorted in ascending or descending order. 
# 
# Feature 3. Allow the user to search for multiple entries simultaneously. Here, this app allows the user to search for 
# the extreme type "maximum", "minimum", and both together. 
#
# Feature 4. Allow the user to download your table as .csv file. Here, users can download the table easily for future
# exploration.

library(shiny)
library(datateachr)

data <- flow_sample

ui <- fluidPage(
  titlePanel("Extreme Flow Sample Data"),                       #App title
  sidebarLayout(
    sidebarPanel(
    checkboxInput("sort_flow","Sort by Flow",value=FALSE),      #Feature 1
    selectInput("extreme_type_input", "Select Extreme Type",    #Feature 3
                choices = c("maximum","minimum"),
                selected = c("maximum","minimum"),
                multiple = TRUE),
    downloadButton("download","Download Table")                #Feature 4
    ),
  mainPanel(
      DT::dataTableOutput("table")                             #Feature 2
    )
  )
)


server <- function(input, output) {
  
  filtered_data <- reactive({
    data_filtered <- data[data$extreme_type %in% input$extreme_type_input, ]         #Feature 3
    if (input$sort_flow){
      data_filtered <- data_filtered[order(data_filtered$flow, na.last=TRUE), ]      #Feature 1  
    }
    return(data_filtered)
  })
  
  output$table <- DT::renderDataTable({                                           
    DT::datatable(filtered_data(), options = list(pageLength=15))                   #Feature 2
  })
  
  output$download <- downloadHandler(
    filename = function(){
      paste("Extreme Flow Data",Sys.Date(),".csv", sep="")
    },
    content=function(file){
      write.csv(filtered_data(), file, row.names=FALSE)                              #Feature 4
    }
  )
}

# Run the application 
shinyApp(ui = ui, server = server)
