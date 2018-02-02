library(shiny)
shinyServer(function(input, output) {
  output$plot1 <- renderPlot({
	set.seed(17467)
	n_unif = input$numeric1
	bins = input$numeric2
	random_point = runif(n_unif, 0, n_unif)

	## compute interpoint distances, after sorting
	order_point = random_point[order(random_point)]
	
	inter_point = random_point
	inter_point = 0
	for (i in 1:(n_unif-1)) (inter_point[i] = order_point[i+1]-order_point[i])

	lambda = mean(inter_point)
	exponential = rexp(n_unif, rate=lambda)

	mmax = max(inter_point, exponential)

	bands = (0:bins)/bins*mmax
  par(mfrow=c(2,2))
	hist(inter_point, breaks=bands, col = rgb(0,0,1,0.5))
	hist(exponential, breaks = bands, col = rgb(1,0,0,0.5))

	## now the overlay
	hist(inter_point, breaks=bands, main="Overlay of inter_point and exponential", col = rgb(0,0,1,0.5))
	hist(exponential, breaks = bands, col = rgb(1,0,0,0.5), add=TRUE)
	
  })
 
  output$kstest = renderPrint({
    n_unif = input$numeric1
    set.seed(17467)
    random_point = runif(n_unif, 0, n_unif)
    
    ## compute interpoint distances, after sorting
    order_point = random_point[order(random_point)]
    
    inter_point = random_point
    inter_point = 0
    for (i in 1:(n_unif-1)) (inter_point[i] = order_point[i+1]-order_point[i])
    
    lambda = mean(inter_point)
    exponential = rexp(n_unif, rate=lambda)
    kst = ks.test(inter_point, exponential)
    
    cat(paste("D = ", signif(kst$statistic, digits=4), 
            "p-value = ", signif(kst$p.value, digits=4))) 
           
  
    })
})