#download data file,unzip and name the file as data
download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip",destfile="project1",method="curl")
temp<-unzip("project1")
data<-read.table(temp,sep=";",header=TRUE,na.strings='?')

#reformat the date and time, combine them into one column
data$date_time<-strptime(paste(data$Date, data$Time), "%d/%m/%Y %H:%M:%S") 

#select date only from 2007-02-01 to 2007-02-02,remove na rows
data2<-data[data$date_time>='2007-02-01 00:00:00' & data$date_time<='2007-02-02 24:00:00',]
data3<-na.omit(data2)

#plot 2
png(filename='plot2.png',width=480,height=480,units='px')
plot(data3$date_time,data3$Global_active_power,ylab='Global Active Power (kilowatts)', xlab='', type='l')
dev.off()