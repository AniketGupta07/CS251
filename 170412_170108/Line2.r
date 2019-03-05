data1 <- read.csv("branch_bias1")
data2 <- read.csv("branch_bias2")
data3 <- read.csv("branch_bias3")
data4 <- read.csv("branch_bias4")
data5 <- read.csv("branch_bias5")
 
newcol <- seq(1,1,length.out = length(data1$branch_line))
data1 <- cbind(data1,newcol)
colnames(data1)[3] = "run"
 
newcol <- seq(2,2,length.out = length(data2$branch_line))
data2 <- cbind(data2,newcol)
colnames(data2)[3] = "run"
 
newcol <- seq(3,3,length.out = length(data3$branch_line))
data3 <- cbind(data3,newcol)
colnames(data3)[3] = "run"
 
newcol <- seq(4,4,length.out = length(data4$branch_line))
data4 <- cbind(data4,newcol)
colnames(data4)[3] = "run"
 
newcol <- seq(5,5,length.out = length(data5$branch_line))
data5 <- cbind(data5,newcol)
colnames(data5)[3] = "run"

final = rbind(data1,data2,data3,data4,data5)
library(ggplot2)
ggplot(data=final, aes(x=branch_line, y=bias, colour = as.factor(run),group=1) )  + geom_line() + geom_point() + facet_wrap(~ run)
