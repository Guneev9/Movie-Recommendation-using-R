library(shiny)
if (interactive()){
  
  shinyUI(fluidPage(
    titlePanel("Recommendation System for Movies"),
    navbarPage("D-Miners",
               tabPanel("Preprocessing",
                        sidebarLayout( position = "left",
                                       sidebarPanel(
                                         "Reading files before preprocessing",
                                         numericInput("obs", "Number of observations to view:", 25),
                                         fileInput("movies",
                                                   "Choose CSV files from directory",
                                                   multiple = TRUE,
                                                   accept=c('text/csv', 
                                                            'text/comma-separated-values,text/plain', 
                                                            '.csv')),
                                         checkboxInput('header1', 'Header', TRUE),
                                         radioButtons('sep1', 'Separator',
                                                      c(Comma=',',
                                                        Semicolon=';',
                                                        Tab='\t'),
                                                      ','),
                                         radioButtons('quote1', 'Quote',
                                                      c(None='',
                                                        'Double Quote'='"',
                                                        'Single Quote'="'"),
                                                      '"'),
                                         fileInput("ratings",
                                                   "Choose CSV files from directory",
                                                   multiple = TRUE,
                                                   accept=c('text/csv', 
                                                            'text/comma-separated-values,text/plain', 
                                                            '.csv')),
                                         checkboxInput('header2', 'Header', TRUE),
                                         radioButtons('sep2', 'Separator',
                                                      c(Comma=',',
                                                        Semicolon=';',
                                                        Tab='\t'),
                                                      ','),
                                         radioButtons('quote2', 'Quote',
                                                      c(None='',
                                                        'Double Quote'='"',
                                                        'Single Quote'="'"),
                                                      '"')
                                       ),
                                       mainPanel(
                                         tabsetPanel(
                                           tabPanel("movies.csv", tableOutput("contents1")),
                                           tabPanel("ratings.csv", tableOutput("contents2"))
                                         )
                                       )
                        )
               ),
               
               
               tabPanel("Data Exploration & Testing",
                        sidebarLayout( position = "left",
                                       sidebarPanel(
                                         "After Aggregating by UserId & Genre",
                                         br(),
                                         actionButton("afteragg", "show data", width = 200),
                                         br(), br(),
                                         "After calculating average score genre wise",
                                         br(),
                                         actionButton("aftermerge", "show data", width = 200),
                                         br(), br(),
                                         "Testing for a given User Id",
                                         br(),
                                         actionButton("testing", "Testing", width = 200)
                                         
                                       ),
                                       mainPanel(
                                         fluidRow(
                                           column(
                                             dataTableOutput('table'), width=12)
                                         )
                                       )
                        )
               )
    )
  ))
  
}

