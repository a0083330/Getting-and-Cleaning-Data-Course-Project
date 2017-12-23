
#get training and test data
trainData <- read.table("train/X_train.txt")
testData <- read.table("test/X_test.txt")

#get variable names
name<-read.table("features.txt")
data_name<- as.vector(name$V2)

#assign variable names to data
names(trainData)<-data_name
names(testData)<-data_name

#join data with the subjects and activities
subject_train<-read.table("train/subject_train.txt")
activity_train<-read.table("train/Y_train.txt")
train_data<-cbind(Subject=subject_train$V1,Activity=activity_train$V1,trainData)

subject_test<-read.table("test/subject_test.txt")
activity_test<-read.table("test/Y_test.txt")
test_data<-cbind(Subject=subject_test$V1,Activity=activity_test$V1,testData)

#merge training and testing data -> Step 1
combine_data<-rbind(train_data,test_data)

#extract only the mean and standard deviation results -> Step 2
extract_name<-grep("mean\\(\\)|std\\(\\)",data_name,perl=TRUE,value=TRUE)
extract_data<-combine_data[which(names(combine_data) %in% c("Subject","Activity",extract_name))]

#assign descriptive activity names to name the activities in the data set -> Step 3
activity_labels<-read.table("activity_labels.txt")
activity<-activity_labels$V2
extract_data$Activity<-factor(extract_data$Activity,labels=activity)
extract_name<-gsub("Acc"," Accelerometer",extract_name)
extract_name<-gsub("Gyro"," Gyroscope",extract_name)
extract_name<-gsub("Jerk"," Jerk Signal",extract_name)
extract_name<-gsub("Mag"," Magnitude",extract_name)
extract_name<-gsub("tBody","Time Domain Body",extract_name)
extract_name<-gsub("tGravity","Time Domain Gravity",extract_name)
extract_name<-gsub("fBody","Frequency Domain Body",extract_name)
extract_name<-gsub("BodyBody","Body Body",extract_name)
extract_name<-gsub("\\(\\)","",extract_name)
names(extract_data)<-c("Subject","Activity",extract_name)

#create another data set with the average of each variable for each activity and each subject
summarize_data<-extract_data%>% group_by(Subject,Activity) %>% summarise_all(funs(mean))

#write data sets into files
write.csv(extract_data, file="resultData.csv")
write.csv(summarize_data, file="summarizeData.csv")
