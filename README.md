# Assignment B-3

This is a Shiny web application. I use the dataset of `flow_sample` from STAT545A Mini-Data Analysis.The link to run instance of this Shiny app is <https://zhichun.shinyapps.io/assignment-b3-zhichun-qi/>.

My app is built to provide an interactive experiene for users analyzing the extreme flow data.

## App Features

### 1. Sort the Table by Flow

Users can sort the data by the column `flow` to identify the smallest flow values

### 2. Interactive Table

This app uses the `DT` package to make the data interactive, including sorting, searching, and pagination.

### 3. Search Multiple Extreme Types

Users can filter the data by selecting one or both extreme types (maximum, minimum or both).

### 4. Download Filtered Data

Users can download the currently filtered and sorted table as a `.csv` file for future analysis.

## Dataset

Acknowledge the dataset `flow_sample` from the `datateachr` package by Hayley Boyce and Jordan Bourak. This dataset acquired courtesy of the The Government of Canada's Historical Hydrometric Database. It has 218 rows and 7 columns.

## Installation and Running Locally

To run this app locally, users need to 1. Clone this repository; 2. Open the R project and install the required packages: `shiny`,`DT`, and `datateachr`; 3. Run the app.
