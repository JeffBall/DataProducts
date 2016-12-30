#   this Shiny app will demonstrate the relationship
#   between the surface area of different shapes having
#   the same volume.

#   this file is for the user interface...

library(shiny)

#   the sidebar will have a slider control to adjust the
#   volume, and there will be three checkboxes to toggle
#   whether or not the surface area is shown in the plot

shinyUI(fluidPage(
  
#   Application title
    titlePanel("Volume and Surface Area of Common Shapes"),
  
#   Sidebar, have slider for volume and checkboxes for shapes 
    sidebarLayout(
        sidebarPanel(
            sliderInput("volume","Volume of the shapes:",
                min = 1,
                max = 100,
                value = 10),
            checkboxInput("chkTetra","Plot surface area for tetrahedron",
                value=TRUE),
            checkboxInput("chkCube","Plot surface area for cube",
                value=TRUE),
            checkboxInput("chkSphere","Plot surface area for sphere",
                value=TRUE)
        ),

#   Show a plot with the surface areas and a horizontal line
#   corresponding to the slider input...

        mainPanel(
            plotOutput("volumePlot"),
            h3("How to use this tool"),
            "The chart above shows the surface area for a tetrahedron,",
            "a cube, and a sphere with an identical volume.  Using the",
            "controls in the upper-left box, you can make the following",
            "adjustments to the chart:",
            br(),br(),
            "The identical volume for the shapes can be adjusted from",
            "1 to 100 units using the slider.  Notice that as the slider",
            "is changed, the vertical bar on the chart will move to that",
            "position.  Additionally, the vertical line will show the",
            "surface area for the tetrahedron (denoted as T:), the cube",
            "(denoted as C:), and the sphere (denoted as S:)",
            br(),br(),
            "The chart lines for the different shapes can be turned on",
            "and off using the checkboxes.  Note that if a checkbox is",
            "turned off for a shape, the value of the surface area will",
            "also be hidden."
        )
    )
))
