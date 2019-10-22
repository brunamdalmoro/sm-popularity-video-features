library(ggvis)
library(shinythemes)


shinyUI(
  fluidPage(theme = shinytheme("united"),
            navbarPage(title="Gráficos e Descritivas",
                       tabPanel("Dados",
                                fluidRow(
                                  column(3,
                                         wellPanel(
                                           
                                         )
                                  ),
                                  
                                  column(9)
                                  )
                                ),
                       
                       tabPanel("Gráficos",
                                fluidRow(
                                  column(3,
                                         wellPanel()
                                  ),
                                  column(9)
                                )
                       ),
                       
                       tabPanel("Medidas Descritivas",
                                fluidRow(
                                  column(3,
                                         wellPanel()
                                  ),
                                  column(9)
                                )
                       )
          )
  )
)
