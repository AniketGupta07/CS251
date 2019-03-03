library("ggplot2")
data<-read.csv("flat")
ggplot(data , aes(x=Function, y=Time,fill=Function)) + geom_bar(position = "dodge", stat = "identity") + xlab("Func")
