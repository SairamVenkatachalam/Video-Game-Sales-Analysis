library(ggplot2)


df=read.csv("C:/Users/saira/OneDrive/Desktop/GWU Courses/Intro to DS/Project 1/Datasets/OnlineNewsPopularity.csv")
head(df,5)

dim(df)

ggplot(df, aes(x = timedelta, y = shares)) +
  geom_point(size = 3) +
  labs(title = "Scatter Plot of Time vs shares", x = "Time", y = "Shares")

cor(df$timedelta,df$shares)



library(dplyr)

df <- df %>%
  mutate(
    weekday_name = case_when(
      weekday_is_monday == 1 ~ "Monday",
      weekday_is_tuesday == 1 ~ "Tuesday",
      weekday_is_wednesday == 1 ~ "Wednesday",
      weekday_is_thursday == 1 ~ "Thursday",
      weekday_is_friday == 1 ~ "Friday",
      weekday_is_saturday == 1 ~ "Saturday",
      weekday_is_sunday == 1 ~ "Sunday",
      TRUE ~ NA_character_
    )
  )



ggplot(df, aes(x = weekday_name, y = shares,color=weekday_name)) +
  geom_point(size = 3) +
  labs(title = "Scatter Plot of Day vs shares", x = "Day", y = "Shares")


df <- df %>%
  mutate(
    category_name = case_when(
      data_channel_is_lifestyle == 1 ~ "lifestyle",
      data_channel_is_entertainment == 1 ~ "entertainment",
      data_channel_is_bus == 1 ~ "bus",
      data_channel_is_socmed == 1 ~ "socmed",
      data_channel_is_tech == 1 ~ "tech",
      data_channel_is_world == 1 ~ "world",
      TRUE ~ NA_character_
    )
  )


ggplot(df, aes(x = category_name, y = shares,color=category_name)) +
  geom_point(size = 3) +
  labs(title = "Scatter Plot of Day vs shares", x = "Cat", y = "Shares")
