##climate change impacts!
#here is some data

impacts<- c(1,2,3,4,5,6)
temp<- c(20,22, 24,28, 28, 32)

real_data<-data.frame(impacts, temp)
colnames(real_data)<- c("sea_rise", "ave_temp")

View(real_data)

plot(real_data$ave_temp, real_data$sea_rise, ylab = "Sea Level Rise (m)", xlab="Temp")
