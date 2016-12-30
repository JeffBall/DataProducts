---
title       : Volume and Surface Area Widget
subtitle    : 
author      : jeffrey.ball@comcast.net
job         : 
framework   : io2012        # {io2012, html5slides, shower, dzslides, ...}
highlighter : highlight.js  # {highlight.js, prettify, highlight}
hitheme     : tomorrow      # 
widgets     : []            # {mathjax, quiz, bootstrap}
mode        : selfcontained # {standalone, draft}
knit        : slidify::knit2slides

---

## Introduction

Recently, I was watching a television show and a comment was made that
ice used for drinks should be spherical because it has a larger surface
area than a cube.  A larger surface area means that the ice would cool
the drink down faster.

This didn't seem correct; if the volumes of the shapes were equal, then
a sphere would have the smallest surface area.  So, I created a small tool
that would show the surface area for a tetrahedron, a cube, and a sphere
given a constant volume.

---

## Directions and Link

The tool, made using R's *shiny* library, will display a set of controls
on the left and a chart on the right.  The controls available to the user
are as follows:
* a slider ranging from 1 to 100 to set the constant volume
* a checkbox to show/hide the tetrahedron surface area
* a checkbox to show/hide the cube surface area
* a checkbox to show/hide the sphere surface area

The tool can be found at the following address:
https://jeffball.shinyapps.io/week4/

---

## The Code


```r
        allVals <- seq(1:100)

        edgeTetra <- (allVals * 6 * sqrt(2)) ^ (1/3)
        faceTetra <- sqrt(3) / 4 * (edgeTetra^2)
        SATetra <- 4 * faceTetra
              
        edgeCube <- allVals ^ (1/3)
        faceCube <- (edgeCube^2)
        SACube <- 6 * faceCube
        
        RSphere <- (allVals * 3 / (4 * pi)) ^ (1/3)
        SASphere <- 4 * pi * (RSphere^2)

        df <- data.frame(SATetra,SACube,SASphere)
```

---

## Code Explanation

The code on the previous page creates 100-element vectors of the
surface areas for the three different shapes.  When the slider value
changes, the code will fetch the element in the array corresponding
to the selected volume.

For example, the SA for a tetrahedron with a volume of 14 is 41.8559127.
I put this in to demonstrate that this code is being executed within the
Slidify presentation.

Drawing the chart is done using ggplot2.  After the constant chart
elements are drawn, an IF statement will add the lines and values
for any shape where the checkbox is TRUE

