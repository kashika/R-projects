movie.ratings <-read.csv("Movie-Ratings.csv")
head(movie.ratings)
str(movie.ratings)
summary(movie.ratings)
nrow(movie.ratings)    #562
levels(movie.ratings$Genre) #"Action"    "Adventure" "Comedy"    "Drama"     "Horror"    "Romance"   "Thriller"
# year - 2007 -1011
# rotton tomatoes - 0 -97
# audience - 0 -96
# budget - 0 -300 million


colnames(movie.ratings) <- c("Film","Genre","Critic.ratings","A.ratings",
                             "Budget", "Year")

#convert the year to factor 
factor(movie.ratings$Year)

movie.ratings$Year <-factor(movie.ratings$Year)
str(movie.ratings)

#----------------Aesthetics
library(ggplot2)

ggplot(data = movie.ratings, aes(x=Critic.ratings,y= A.ratings))
# empty plot as ggplot doesn't have idea about geometry


# add geometry
ggplot(data = movie.ratings, aes(x=Critic.ratings,y= A.ratings)) + geom_point()

#add color
ggplot(data = movie.ratings, aes(x=Critic.ratings,y= A.ratings, color = Genre)) + geom_point()


#add size
ggplot(data = movie.ratings, aes(x=Critic.ratings,y= A.ratings, color = Genre, size=Genre)) + geom_point()


#better way for size
ggplot(data = movie.ratings, aes(x=Critic.ratings,y= A.ratings, color = Genre, size=Budget)) + geom_point()



#--------Plotting with layers

p<- ggplot(data = movie.ratings, aes(x=Critic.ratings,y= A.ratings, color = Genre, size=Budget))
#this is an object

#add layers to object
p+ geom_point()

p+geom_line()

p+ geom_line() +geom_point() 



#------------Overriding Aesthetics
q <- ggplot(data = movie.ratings, aes(x = Critic.ratings, y =A.ratings,
                                      color= Genre, Size=Budget))
#add geom layer

q+geom_point()
#aesthetics are inherited from q


#overriding aesthetics by new mapping
#example 1
q +geom_point(aes(size = Critic.ratings))

#example 2

q+geom_point(aes(color=Budget))
q+geom_point() # same as before as q is not modified

#example 3 - overriding x axis or y axis
#but x axis title is not changed
q+geom_point(aes(x=Budget))

#to fix that -
q+geom_point(aes(x=Budget)) + xlab("Budget")


#example 4 - reduce line size
#here we did not use aes function.
#this is setting the value. Earlier we were mapping the value, so we used aes function
q + geom_line(size =1) +geom_point() 




#Mapping vs Setting Aesthetics

r <- ggplot(data = movie.ratings, aes(x = Critic.ratings, y =A.ratings))
r+geom_point()                                      


#add color
#1. mapping

r + geom_point(aes(color = Genre))

#2.Setting

r + geom_point(color = "DarkGreen")

#Error

r + geom_point(aes(color="DarkGreen"))



#.......Histograms & Density charts

# we can use only x axis which we are comparing with count which is created by R
s<- ggplot(data = movie.ratings, aes(x= Budget))                                     
s + geom_histogram(binwidth = 10)

#add color
#1. fill will set the entire bars.
s + geom_histogram(binwidth = 10, fill = "Green")

#2 fill through aesthetics
s + geom_histogram(binwidth = 10, aes(fill = Genre))

#add border - set border (not map)
s + geom_histogram(binwidth = 10, aes(fill = Genre), color = "Black")


#Density chart
s + geom_density(aes(fill=Genre), position = "stack")


#---------------Starting Layer tips

t<-ggplot(data=movie.ratings, aes(x=A.ratings))
t + geom_histogram(binwidth = 10, fill = "White", color = "Blue")

#another way to achieve the same thing

t<- ggplot(data = movie.ratings)
t + geom_histogram(binwidth = 10, aes(x= A.ratings), fill = "White", color = "Blue")

t + geom_histogram(binwidth = 10, aes(x= Critic.ratings), fill = "White", color = "Blue")



#.................Statistical Transformations


u<-ggplot(data= movie.ratings, aes(x= Critic.ratings, y= A.ratings, color= Genre))

u + geom_point() + geom_smooth(fill = NA)

# boxplots

u <-ggplot(data=movie.ratings,aes(x = Genre, y = A.ratings, color = Genre))
u + geom_boxplot(size = 1.2)

u + geom_boxplot(size = 1.2) + geom_point()

u + geom_boxplot(size = 1.2) + geom_jitter()


u + geom_jitter() + geom_boxplot(size = 1.2, alpha = 0.5)


u <-ggplot(data=movie.ratings,aes(x = Genre, y = Critic.ratings, color = Genre))
u + geom_jitter() + geom_boxplot(size = 1.2, alpha = 0.5)


#-------------Using Facets

v <- ggplot(data= movie.ratings, aes(x = Budget))
v + geom_histogram(binwidth = 10, aes(fill = Genre), color = "Black")


v + geom_histogram(binwidth = 10, aes(fill = Genre), color = "Black") +
  facet_grid(Genre~.)
#left represents rows, right represents columns


v + geom_histogram(binwidth = 10, aes(fill = Genre), color = "Black") +
  facet_grid(Genre~.,scales = "free")


v + geom_histogram(binwidth = 10, aes(fill = Genre), color = "Black") +
  facet_grid(.~Genre,scales = "free")

# scatterpoint

w <- ggplot(data = movie.ratings, aes (x= Critic.ratings, y = A.ratings,
                                       color = Genre))
w + geom_point(size =3) +facet_grid(Genre~.)

w + geom_point(size =3) + facet_grid(.~Year)

w + geom_point(size=3) + facet_grid(Genre~Year)

w + geom_point(size=3) + facet_grid(Genre~Year) +
  geom_smooth()

w + geom_point(aes(size = Budget)) + facet_grid(Genre~Year) +
  geom_smooth()


#------------coordinates


m<- ggplot(data =movie.ratings, aes(x=Critic.ratings, y= A.ratings,
                                    size = Budget, color = Genre))
m + geom_point()

#limit x axis & y axis
m + geom_point() + xlim(50,100) +ylim(50,100)


#won't work well always
n<- ggplot(data = movie.ratings, aes(x=Budget))
n + geom_histogram(binwidth = 10, aes(fill = Genre), color = "Black")

n + geom_histogram(binwidth = 10, aes(fill = Genre), color = "Black") + 
  ylim(0,50)
# it cut off data which was above 50
# is incomplete.

#instead we can use zoom
n + geom_histogram(binwidth = 10, aes(fill = Genre), color = "Black") + 
   coord_cartesian(ylim = c(0,50))
  
#plot from earlier

w + geom_point(aes(size = Budget)) + facet_grid(Genre~Year) +
  geom_smooth()

w + geom_point(aes(size = Budget)) + facet_grid(Genre~Year) +
  geom_smooth() + coord_cartesian(ylim = c(0,100))



#------------Themes

o<- ggplot(data = movie.ratings, aes(Budget))
h<- o+ geom_histogram(binwidth = 10, aes(fill = Genre), color = "Black")

#axes label

h + xlab("Money Axis") + ylab("Number of movies") +
    ggtitle("Movie Budget Distribution") +
    theme(axis.title.x = element_text(color = "DarkGreen", size = 30),
        axis.title.y = element_text(color = "Red", size=30),
        axis.text.x  = element_text(size = 20),
        axis.text.y  = element_text(size = 20),
        legend.title = element_text(size = 30),
        legend.text  = element_text(size = 20),
        legend.position = c(1,1),
        legend.justification = c(1,1),
        
        plot.title = element_text(color = "DarkBlue",
                                  size = 40,
                                  family = "Courier"))



















































