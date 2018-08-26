

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


qplot(data = movie.ratings, x= Critic.ratings, y = Genre, 
      size = I(5), alpha =I(0.6), color = Year)


qplot(data = movie.ratings, x= Genre, size = I(5), alpha =I(0.6), color = Year)
#comedy and action movies are made more
#more movies were made in 2007 & less in 2011

qplot(data = movie.ratings, x= Genre, y = Budget,
      size = I(5), alpha =I(0.6), color = Year)
# budget for horror, romance,drama and comedy is less. Thriller, adventure and action is more


qplot(data = movie.ratings, x= Genre, y= A.ratings, 
      size - I(5), alpha =I(0.6), color = Year)


qplot(data = movie.ratings, x= Budget..million..., y = Year.of.release, 
      size - I(5), alpha =I(0.6), color = Genre)
#Action films have higher budget
#less adventure movies critically acclained in 2011
#more romance movies critically acclaimed in 2011

qplot(data = movie.ratings, x= A.ratings,y= Budget,  
      size - I(5), alpha =I(0.6), color = Genre)
#audience rating doesn't vary much with budget of the film
#Action movies have high budget

#Main question
qplot(data = movie.ratings, x= Critic.ratings, y = A.ratings, 
      size - I(5), alpha =I(0.6), color = Genre)

# consistent


qplot(data = movie.ratings, x= Budget,y =Critic.ratings,  
      size - I(5), alpha =I(0.6), color = Genre)

#rotten tomatoes rating doesnt vary much with budget

qplot(data = movie.ratings, x= Critic.ratings, y = A.ratings, 
      size - I(5), alpha =I(0.6), color = Year)
