library(ISLR)

rmse.vector = rep(0,5)
attach(Auto)
set.seed(1)
row.names(Auto) = sample(nrow(Auto))
#Reset row numbers
row.names(Auto) = NULL
#50 split in training and test sets
split = round(nrow(Auto)*0.50)
training = Auto[1:split,]
test = Auto[(split+1):nrow(Auto),]

model_1 = lm(mpg~horsepower,data=training)
p_1 = predict(model_1,data=test)
error_1 = p_1-test[['mpg']]
rmse_1 = sqrt(mean(error_1^2))

model_2 = lm(mpg~poly(horsepower,2),data=training)
p_2 = predict(model_2,data=test)
error_2 = p_2-test[['mpg']]
rmse_2 = sqrt(mean(error_2^2))

model_3 = lm(mpg~poly(horsepower,3),data=training)
p_3 = predict(model_3,data=test)
error_3 = p_3-test[['mpg']]
rmse_3 = sqrt(mean(error_3^2))


set.seed(1)
library(ISLR)
library(caret)
set.seed(1)
temp = data.frame()
for (i in 1:5) {
  model <- train(
    mpg ~ poly(horsepower,i), Auto,
    method = 'lm',
    trControl = trainControl(
      method = "LOOCV",
      verboseIter = TRUE
    )
  )
#temp = rbind(temp,model$results)
}


