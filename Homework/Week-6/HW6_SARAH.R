###### R-Statistics Homework ######


# 1. Importing Data into R: How would you read a CSV file names "data.csv" into R as a dataframe?
df<-read.csv("data.csv")

# 2. Exploring Data: What function would you use to get a summary of each column in the dataset?
summary(df)

# 3. Basic Operations with DataFrame: How can you extract the column Age from the dataset?
df$Age

# 4. Filtering a DataFrame: Write a command to filter the dataset for Individuals aged 25 and above.
df[df$Age>25,]

# 5. Generate Statistical Indicators: How do you calculate the mean Income from the dataset?
mean(df$Income)

# 6. Descriptive Statistics with the psych Package: Use describe() function from the psych package to get descriptive statistics for HoursWorkedPerWeek. What command would you use?
install.packages("psych")
library(psych)
describe(df$HoursWorkedPerWeek)

# 7. Determining the Skewness and Kurtosis: How would you calculate the skewness and kurtosis for the Weight_kg column?
library(e1071)
skewness(df$Weight_kg) # A little right-skewed
kurtosis(df$Weight_kg) # Broad with thin tail

# 8. Data Transformation: Transform the Income column to log scale and store it in a new column named LogIncome
df$LogIncome <- log(df$Income)
head(df)

# 9. Recoding Continuous Variables: Recode JobSatisfaction into 3 categories: Low(1-3), Medium(4-7), High(8-10)
df$Satisfaction[df$JobSatisfaction>=1 & df$JobSatisfaction<=3]<-"Low"
df$Satisfaction[df$JobSatisfaction>=4 & df$JobSatisfaction<=7]<-"Medium"
df$Satisfaction[df$JobSatisfaction>=8 & df$JobSatisfaction<=10]<-"High"

# 10. Sorting Data Frames: Sort the dataset by Age in descending order
df[order(-df$Age),]

# 11. Using filter(): Filter the dataset for individuals who work more than 40 hours per week and live in "USA"
library(dplyr)
filter(df, HoursWorkedPerWeek>40, Country=="USA")

# 12. Using arrange(): Arrange the dataset based on Income in ascending order.
arrange(df, Income)

# 13. Pick Variables by Their Names select(): Select the columns ID, Age, and Gender from the dataset
names(df)
select(df, ID, Age, Gender)

# 14. Create New Variables with Existing Variables mutate(): Create a new variable BMI (Body Mass Index)
mutate( df, BMI= Weight_kg / (Height_cm/100)^2 )

# 15. Label Encoding: Encode Gender as 0 for Female and 1 for Male
library(forcats)
mutate(df, Gender=fct_recode(Gender,"0"="Female","1" = "Male"))
