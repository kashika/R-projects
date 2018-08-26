

movie<- read.csv("Section6-Homework-Data.csv")
str(movie)
summary(movie)

colnames(movie) <-c("Day","Director", "Genre","title","ReleaseDate","Studio","Adj.gross",
                    "Budget", "Gross", "Imdb", "MovieLens", "Overseas","Overseas%",
                    "Profit","ProfitPercent", "Runtime","Us", "GrossUS")
levels(movie$Studio)

a <-ggplot(data= movie, aes(x = Genre, y = GrossUS)) 
a +geom_jitter(aes(color = Studio, size = Budget)) + 
  geom_boxplot(size =1.5, alpha = 0.7, outlier.color = NA) +
  xlim(c("action","adventure", "animation","comedy","drama")) +
  lims(color = c("Buena Vista Studios","Fox","Paramount Pictures","Sony","Universal","WB"))+
  ggtitle("Domestic Gross % by Genre") +
  ylab("Gross % US") +
  theme( axis.title.y = element_text(color = "DarkBlue", size = 20),
         axis.text.y  = element_text(size =15),
         axis.title.x = element_text(color = "DarkBlue", size = 20),
         axis.text.x  = element_text(size =15),
         legend.title = element_text(size =15),
         plot.title = element_text(size = 25),
         text = element_text(family = "Comic Sans MS"))

a <- tapply(movie$Budget, movie$Genre, FUN = sum) # calculate sum of budget based on enre





#combing vectors
a<- c("col1", "col2", "col3","col4")
b<- c(1,2,3)
c<- c("i", "am","hulk")

d <-rbind(a,b,c)
d

e<- cbind(1:50)
e

f<-cbind(1:25)
f
g<-cbind(1:13)
h<-cbind(e,1:25)


class("a")
dim(movie)
x<-1:3
y<-10:12
z<-data.frame(x,y)
z

z <-paste(x)
is.character(z)
z<-x
is.character(z)
x <- list(1, "a", TRUE, 1 + 4i)
 x
 x <- fact(c("yes", "yes", "no", "yes", "no"))
 x <- factor(c("yes", "yes", "no", "yes", "no")) 
x 
x <- factor(factor("yes", "yes", "no", "yes", "no"))


