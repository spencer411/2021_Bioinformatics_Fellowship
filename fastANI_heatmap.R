library("reshape2")
library("ComplexHeatmap")
library("gplots")

### get data, convert to matrix
x <- read.csv("fastani_output.csv")
matrix <- acast(x, X~Y, value.var="ANI")

### define the colors within 2 zones
breaks = seq(min(matrix), max(100), length.out=100)
gradient1 = colorpanel( sum( breaks[-1]<=95), "blue", "white" )
gradient2 = colorpanel( sum( breaks[-1]>95 & breaks[-1]<=100), "white", "red" )

hm.colors = c(gradient1, gradient2)
heatmap.2(matrix, scale = "none", trace = "none", col = hm.colors)

