setwd("UCI HAR Dataset/")
# read data
subject.train <- read.table("train/subject_train.txt", header = F)
X.train <- read.table("train/X_train.txt", header = F)
y.train <- read.table("train/y_train.txt", header = F)
subject.test <- read.table("test/subject_test.txt", header = F)
X.test <- read.table("test/X_test.txt", header = F)
y.test <- read.table("test/y_test.txt", header = F)



# assign names to each column
namedata <- read.table("features.txt")
dim(namedata)
colnames <- namedata[,2]
colnames <- as.character(colnames)
sub("()","",colnames,)


# extract mean and standard deviation for each measurement
toMatch <-c("mean\\(\\)$","std\\(\\)$")
names(X.train) <- colnames
X.train <- X.train[,grep(paste(toMatch, collapse ="|"), names(data), value = T)]
dim(X.train )
names(X.train )
names(X.train ) <- sub("\\(\\)","",names(X.train ),)

names(X.test) <- colnames
X.test <- X.test[,grep(paste(toMatch, collapse ="|"), names(data), value = T)]
dim(X.test )
names(X.test )
names(X.test ) <- sub("\\(\\)","",names(X.test ),)


# column combine training/testing data
# row combine training and testing data
train <- cbind(subject.train, y.train, X.train)
test <- cbind(subject.test, y.test, X.test)
data <- rbind(train,test)
names(data)
names(data)[1:2] <- c("subject", "activity")

names(data)
dim(data)
write.table(data, "tidy_data.txt", sep="\t")

# calculate mean for each activity
activity <- factor(data$activity)
length(activity)



data.X <- data[, c(3:20)]
dim(data.X)
#tapply(data.X[,2], activity, mean)

var.mean <- matrix(, nrow = 18, ncol = 6)
dim(var.mean)
for(j in c(1:18)){
    var.mean[j,] <- tapply(data.X[,j], activity, mean)
    var.mean[i]
}
var.mean
write.table(var.mean, "variable_mean.txt", sep = "\t")