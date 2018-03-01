library(ISLR)

set.seed(20)
rows = sample(nrow(Auto))
Auto = Auto[rows,]
#50 split in training and test sets
split = round(nrow(Auto)*0.50)
training = Auto[1:split,]
test = Auto[(split+1):nrow(Auto),]
