ui <- fluidPage(
  h4("Choose which variable you want to see"),
  selectInput(
    inputId = "which_variable",
    label = "",
    choices = colnames(GA_world)[5:8]
  ),
  fluidPage(
    width = 12,
    h4("World map"),
    plotlyOutput(outputId = "World_map")
  )
)