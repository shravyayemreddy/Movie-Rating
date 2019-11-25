 mov <-read.csv(file.choose())
head(mov)
summary(mov)
str(mov)

#activate ggplot

library(ggplot2)

ggplot(data=mov, aes(x=Day.of.Week)) +geom_bar()


filt <- (mov$Genre =="action") | (mov$Genre =="adventure") | (mov$Genre == "animation") | (mov$Genre =="drama") |(mov$Genre =="comdey") | (mov$Genre =="crime")

filt2 <- mov$Studio %in% c("Buena Vista Studios ", "WB", "Fox", "Universal", "Sony", "Paramount Pictures", "Weinstein Company", "New Line Cinema", "TriStar")
 
filt
filt2

mov2 <-mov[filt & filt2,]
mov2


# prepare the plots data  and aes 
 

p<-ggplot(data =mov2, aes(x=Genre, y=Gross...US ))

p



 q<-p+ geom_jitter( aes(size=Budget...mill., color=Studio)) + geom_boxplot(alpha =0.7, outlier.color= NA)


 
  q <- q + xlab("Genre")+ 
    ylab("Gross % US")+ 
    
    ggtitle("Domestic Gross % by genre")
  
  q
  
  q<- q +
    theme (
      
      axis.title.x = element_text(colour = "Blue", size = 30),
      axis.title.y = element_text(colour = "Blue", size = 30),
      
      axis.text.x  = element_text(size = 20),
      axis.text.y = element_text(size = 20),
      
      plot.title = element_text(size = 40),
      
      legend.title = element_text(size=20),
      legend.text = element_text(size=20)

    
      
    )
  q
  
  q$labels$size <- "Budget $M"
  
  q
  
  