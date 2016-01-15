##climate change impacts!
#here is some data

impacts<- as.data.frame(c(1,2,3,4,5,6))
temp<- as.data.frame(c(20,22, 24,28, 28, 32))

real_data<-as.data.frame(c(impacts, temp))
colnames(real_data)<- c("sea_rise", "ave_temp")

View(real_data)

plot(real_data$sea_rise, real_data$ave_temp)
