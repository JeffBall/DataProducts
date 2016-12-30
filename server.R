#   this Shiny app will demonstrate the relationship
#   between the surface area of different shapes having
#   the same volume.

#   this file is for the server code...

library(shiny)
library(ggplot2)

#   Define server logic required to draw the line chart...
shinyServer(function(input, output) {
   
    output$volumePlot <- renderPlot({
    
#   calculate the surface areas for the shapes.  start with
#   the tetrahedron...

        allVals <- seq(1:100)

        edgeTetra <- (allVals * 6 * sqrt(2)) ^ (1/3)
        faceTetra <- sqrt(3) / 4 * (edgeTetra^2)
        SATetra <- 4 * faceTetra
        
#	next, the cube...
        
        edgeCube <- allVals ^ (1/3)
        faceCube <- (edgeCube^2)
        SACube <- 6 * faceCube
        
#	finally, the sphere...
        
        RSphere <- (allVals * 3 / (4 * pi)) ^ (1/3)
        SASphere <- 4 * pi * (RSphere^2)

        df <- data.frame(SATetra,SACube,SASphere)

#   use ggplot to make the graph...

        volPlot <- ggplot(df)
        volPlot <- volPlot + coord_cartesian(xlim=c(1,100),ylim=c(1,200))
        volPlot <- volPlot + labs(title="Volume and Surface Area",
            x="Volume",y="Surface Area")
        volPlot <- volPlot + geom_vline(xintercept=input$volume)
        if(input$chkTetra){
            volPlot <- volPlot+geom_path(aes(x=seq(1:100),y=SATetra),
                color="red",size=2)
            volPlot <- volPlot+annotate("text",
                x=input$volume,
                y=SATetra[input$volume]+20,
                label=paste("T",
                    format(round(SATetra[input$volume],2),nsmall=2),
                    sep=":"),size=5)
        }
        if(input$chkCube){
            volPlot <- volPlot+geom_path(aes(x=seq(1:100),y=SACube),
                color="green",size=2)
            volPlot <- volPlot+annotate("text",
                x=input$volume,
                y=SACube[input$volume]+10,
                label=paste("C",
                    format(round(SACube[input$volume],2),nsmall=2),
                    sep=":"),size=5)
        }
        if(input$chkSphere){
            volPlot <- volPlot+geom_path(aes(x=seq(1:100),y=SASphere),
                color="blue",size=2)
            volPlot <- volPlot+annotate("text",
                x=input$volume,
                y=SASphere[input$volume],
                label=paste("S",
                    format(round(SASphere[input$volume],2),nsmall=2),
                    sep=":"),size=5)
        }
        volPlot
    })
  
})
