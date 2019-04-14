#import libraries
library(tidyverse)
library(ggplot2)
library(randomForest)


#import csv
got_data_wide_predictive <- read.csv("got_data_wide_predictive.csv", header = TRUE)

#Primitive predictive model with data in tall form
training_data_wide <- got_data_wide_predictive[1:41,]
test_data_wide <- got_data_wide_predictive[42:67, ]

got_RF_wide <- randomForest(overall_rating ~ . , data = training_data_wide, type = "classification")

plot(got_RF_wide)

round(importance(got_RF_wide), 2)

pred<-predict(got_RF_wide,test_data_wide) #Predictions on Test 
pred
plot(pred) 

pred.df <- as.data.frame(pred)
actual <- test_data_wide$overall_rating
episode_n <- data.frame(id = 42:67)
actual_vs_pred <- cbind.data.frame(episode_n, actual, pred.df)

mspe <- mean((actual_vs_pred$actual - actual_vs_pred$pred) ^ 2)
mspe <- mspe * 10

actual_vs_pred <- actual_vs_pred %>% 
  gather(key= RF, "actual", "pred", value = value)



ggplot(data = actual_vs_pred, aes(x= id, y = value)) + 
  geom_point(aes(color = RF), size = 5) +
  geom_line(aes(group = id)) +
  labs(title = "Actual vs. Predicted Ratings (mspe 29.2%)",
       x = "Episode Number",
       y = "Rating") +
  scale_fill_discrete(labels = c("Actual", "Predicted")) +
  guides(color = guide_legend(title = "Random Forest")) +
  theme(plot.title = element_text(hjust = 0.5)) 


  