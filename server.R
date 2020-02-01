server <- function(input, output) {
  selected_var <- reactive({
    data.frame(GA_world[, c("long", "lat", "group", "country", input$which_variable)])
  })
  
  
  output$World_map <- renderPlotly({
    p_world_2 <- ggplot() + 
      geom_polygon(data = selected_var(), color = 'gray', size = 0.1, 
                   aes(x = long, y = lat, fill = selected_var()[, 5], group = group, text = paste0("COUNTRY: ", country, ", REVENUE: ", selected_var()[, 5]))) + 
      theme_minimal() + 
      scale_fill_gradient2(limits=c(summary(selected_var()[, 5])[1] %>% unname(), summary(selected_var()[, 5])[6] %>% unname()), 
                           midpoint = summary(selected_var()[, 5])[3] %>% unname(), 
                           low = "#E0E0E0", mid = "#7AFEC6", high = "#006000", name = input$which_variable) + 
      coord_fixed(xlim = c(-180, 180), ylim = c(-100, 100))
    
    
    ggplotly(p_world_2, tooltip = "text", width = 900, height = 600)
  })
}