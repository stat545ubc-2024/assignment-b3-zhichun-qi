# Assignment B-3 and Assignment B-4

This is a Shiny web application. I use the dataset of `flow_sample` from STAT545A Mini-Data Analysis.The link to run instance of this Shiny app is <https://zhichun.shinyapps.io/assignment-b3-zhichun-qi/>.

My app is built to provide an interactive experience for users analyzing the extreme flow data.

## App Features


### Feature 1. Interactive Table

This app uses the `DT` package to make the data interactive, including sorting, searching, and pagination.

### Feature 2. Search Multiple Extreme Types

Users can filter the data by selecting one or both extreme types (maximum, minimum or both).

### Feature 3. Download Filtered Data

Users can download the currently filtered and sorted table as a `.csv` file for future analysis.

### New Feature 1. Year Range Selection

Introduced a slider input to allow users to select a specific range of years, and this helps users narrow down the dataset to focus on the data most relevant to their needs.

### New Feature 2: Improved Aesthetics with Custom CSS
Added custom CSS styling to improve the visual appeal and organization of the app. The CSS enhances readability, provides a clean and professional look, and makes the app more user-friendly.

### New Feature 3: Image Integration
Incorporated an image into the UI to make the app visually engaging.

## Dataset

Acknowledge the dataset `flow_sample` from the `datateachr` package by Hayley Boyce and Jordan Bourak. This dataset acquired courtesy of the The Government of Canada's Historical Hydrometric Database. It has 218 rows and 7 columns.

## Installation and Running Locally

To run this app locally, users need to 1. Clone this repository; 2. Open the R project and install the required packages: `shiny`,`DT`, `datateachr`, and `tidyverse`; 3. Run the app.
