library(shiny)
shinyUI(fluidPage(
  titlePanel(""),
  sidebarLayout(
    sidebarPanel(
      numericInput("numeric1", "How Many Uniform Values Should be Sampled", 
                   value = 1000, min = 1, max = 1000, step = 1),
      numericInput("numeric2", "How Many Histogram bins Should be Plotted?", 
                   value = 20, min = 1, max = 1000, step = 1)
    
    ),
    mainPanel(
      h3("Exploration of the relationship between the uniform and exponential distributions"), 
      h5("A sample of uniformly distributed values is drawn based on the number of values (n_unif) set by the user in the side panel.
        the sampling is done in the range [0, n_unif].The sample values are laid out in order (smallest to highest) and the distances between successive points calculated. A histogram of these 
        inter-point distances is plotted, using the number of bins selected by the user. A similar number of samples is drawn from an 
        exponential distribution having the same mean as the inter-point distances. 
        A histogram of this exponential sample is plotted alongside the histogram of inter-point distances for comparison (see below).  
         A third histogram shows the inter-point and exponential distributions overlaid.
         Finally a comparison of the two samples is made using the Kolomogorov-Smirnov (KS) two-sample test."),
      plotOutput("plot1"), h4("KS test results"),
      textOutput("kstest"), 
      h5("In the KS two-sample test the statistic D is a measure of the closeness of the cumulative distributions of the two samples.
         The p-value has the same interpretation as the p-value in other statistical tests.  You reject the null hypothesis that the two samples are drawn from the same distribution 
         if the p-value is less than your required significance level.")
    )
  )
))