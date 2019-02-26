ggplot(data , aes(x=Function, y=Time)) + geom_bar(position = "dodge", stat = "identity") + xlab("Func") + aes(fill = as.factor(Function))
