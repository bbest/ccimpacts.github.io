##climate change impacts!
#here is some data

impacts<- c(1,2,3,4,5,6,7)
temp<- c(20,22, 24,28 ,32)

real_data<-as.data.frame(merge(impacts, temp))
colnames(real_data)<- c("sea_rise", "ave_temp")

