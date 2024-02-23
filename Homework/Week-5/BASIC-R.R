######## Basic R ########

# Ctrl + Enter to push code
getwd()
setwd("/Users/sarah/Desktop")

# Similar to ls
list.files()


## VECTORS
x<-c(1,2,3,4,5)
y<-c(6,7,8,9,10)

typeof(x) # Double = Float
class(x) # Numeric

z<-x+y
z


## CHARACTERS
a<-c("x","b","c")
typeof(a) # Character = String
class(a)


## BOOLEAN
g<-c(TRUE,FALSE,TRUE)
class(g) # Logical = Boolean


## Ctrl + L = Clean your console
## Clear your values :
rm(list=ls())



#### CREATING VECTORS WITH THE COLON
x<-1:100 # x= 1 through 100

z<-100:1 # z = 100 through 1

k<-c(1:50,100:150)
k



#### CREATING VECTOR WITH rep() FUNCTION, replicate
x<-rep(5,3) # Makes a list of THREE 5's
x

x<-rep("ab",3)
x # "ab" "ab" "ab"

a<-rep(c(1,5,10),4)
a

x<-rep(4:10,3)
x



#### CREATE A NUMERIC VECTOR WITH 100 ELEMENTS
x<-numeric(100) # Makes one hundred 0's
x

one_v<-rep(1,100) #Makes one hundred 1's
one_v



#### CREATING VECTOR WITH seq(), CREATE SEQUENCE OF REAL NUMBERS

# start, end, and step
x<-seq(from=1, to=1000, by=50)
x # Remember, doesn't include 1000

seq(-1,1,0.1)

## Combine seq() with c() and rep()
a<-c(seq(0,30,length=5),40,60)
a
# Saying length= divides the 0-30 in 5

b<-rep(seq(1,10,3), times=4)
b

c<-rep(seq(1,10,3), each=3)
c
# each=3 makes 3 of each element in the sequence



#### CREATE VECTORS WITH RANDOM NUMBERS
c<-sample(100,12) # 12 numbers from 1-100
c

sample(400,50)

# you cannot write sample(10,12) because 12 is > 10

# If you want to have repeats:
sample(100,50,replace=TRUE)


h<-100:300
sample(h,100) # Takes 100 values between 100 and 300



#### CREATE EMPTY VECTORS
x<-c()
x
class(x) # null



#### INDEXING VECTORS
x<-c(10,20,30,40,50,60)
x

# Access one component
x[2] # = 20. Note how index doesn't start at 0

x[length(x)] # =60

x[-2] # TAKES OUT 20 FROM LIST

x[-2:-4] # TAKES OUT 20, 30, 40 FROM LIST



#### ADD A COMPONENT TO AN EXISTING
x

x[7]<-80
x



#### NAMING VECTOR COMPONENT
salary<-c(4000,2000,3000)
salary

names(salary)<-c("John", "Alice", "Max")
salary

salary["John"]



#### FILTERING VECTORS
x<-c(10,20,30,40,50,60)
x

j=x[x>30]
j

x[x!=30]
x[x>27&x>83] # 0 bc we don't have a number >83

x[x>=27&x<83]

x[x==30]

x[x>=27 | x>83] # = OR




#### FINDING INDICES THAT MEET CONDITION
x<-c(10,20,30,40,50,60)
x

which(x==40)
which.max(20) #??
which.min(20) #??



#### all() AND any()
x<-c(10,20,30,40,50,60)
x

all(x>0) # Comes back TRUE
all(x<0) # Comes back FALSE
all(x>0 & x>12) # FALSE

any(x>4) # Comes TRUE



#### SUM AND PRODUCT
x<-c(10,20,30,40,50,60)
x

sum(x)
prod(x)

mean(x)
median(x)
var(x)
sd(c)


## Cumulative Sum
cumsum(x) # Add the previous number/sum
cumprod(x)

summary(x) # like .describe()




#### round()
z<-c(1.4,1.6,1.9,3.4)
z

round(z)
round(-4.7)

# Floor()
floor(z) # round down

# Ceiling()
ceiling(z) #round up


# Get factorial
factorial(z)


## UNDERSTAND FUNCTIONS
help(factorial)
?factorial




#### MISSING VALUES IN VECTORS
z<-c(1.4,1.6,1.9,NA,3.4)
z

mean(z) #NA

z2<-na.omit(z)
z2

mean(z2)


## Another method
mean(z,na.rm=TRUE)




#### SORT A VECTOR
z<-c(1.4,1.6,1.9,6.9,3.4)
z

order(z) # Order of indices


sort(z)
sort(z, decreasing=TRUE)




#### VECTOR CORRELATION
sal<-c(100,60,40,35,57,89,34)
edu<-c(15,18,12,12,16,13,12)

# Compute Cor
cor.test(sal,edu)




# working on DF.csv file
df = read.csv("DF.csv")
df

head(df)

dim(df) #Find dimensions. 195 rows, 4 columns

names(df) # Gives you column names

summary(df)

str(df) # Gives info on everything


cor(df$Birth.rate,df$Internet.users)
cor.test(df$Birth.rate,df$Internet.users)




#### Matrices and Array
m<- matrix(c(1,2,3,4,5,6), nrow=3, ncol=2)
m

matrix(1:32, 2, 16)

matrix(seq(1,80,2),4,20)

m<- matrix(c(1,2,3,4,5,6), nrow=3, ncol=2, byrow=TRUE)
m




#### cbind() and rbind()
x<-c(1,2,3,4)
y<-c(10,20,31,41)
z<-c(11,21,31,41)

a<-rbind(x,y,z) #rbind is by row
a

b<-cbind(x,y,z) #cbind is by column
b



#### ADDING AND REMOVING ROWS AND COLUMNS
a<-matrix(1:16, nrow=4, byrow=TRUE)
a

rownames(a)

colnames(a)





#### Apply Function in R
a<-matrix(1:16, nrow=4, byrow=TRUE)
a

# Compute the sum of elements in rows and columns
apply(a, 1, sum) # 1 = sum of each row
apply(a, 2, sum) # 2 = sum of each col

apply(a, 1, prod)

apply(a, 1, mean)

apply(a, 1, sd)





#### IMPORTING DATA IN R
?read.csv() # tells you info


## Select the file manually
stat<-read.csv(file.choose()) # Opens up file finder


### Explore our dataset
nrow(stat)

ncol(stat)

head(stat,10)
tail(stat,2)

str(stat)
summary(stat)



#### USING $ sign
View(stat) # Opens in new window

stat[3,3]
names(stat)

stat[3,"Birth.Rate"]

levels(stat$Income.Group)

# The way to fix
stat$Income.Group<-as.factor(stat$Income.Group)

levels(stat$Income.Group)
