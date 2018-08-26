#use function created for myplot in function script

#Salary

myplot(Salary)

#inconsistency due to injury of players
myplot(Salary/Games)
myplot(Salary/FieldGoals)


#In-Game Metrices
myplot(MinutesPlayed)
myplot(Points)

#in-Game Metrices Normalized
#better way of analysis as affect of injury is mitigated by taking goals per game
myplot(FieldGoals/Games)
  #accuracy
myplot(FieldGoals/FieldGoalAttempts)
myplot(FieldGoalAttempts/Games)
myplot(Points/Games)



#interesting observation - dropping overall
myplot(MinutesPlayed/Games)
#consisteent no of games overall
myplot(Games)

#time is valuable
myplot(FieldGoals/MinutesPlayed)


#player style
myplot(Points/FieldGoals)









