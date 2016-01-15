##climate change impacts!
#here is some data

impacts<- c(1,1,3,4,5,6)
temp<- c(20,22, 24,28, 28, 32)

sea_data<-data.frame(impacts, temp)
colnames(sea_data)<- c("sea_rise", "ave_temp")

model<-lm(sea_rise~ ave_temp, data=sea_data)
plot(sea_data$ave_temp, sea_data$sea_rise, ylab = "Sea Level Rise (m)", xlab="Temp (C)")
abline(model, col="red")

