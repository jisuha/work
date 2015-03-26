
setwd("D:\\Solar 공정분석\\job\\20150225요청\\설비 데이터\\전처리\\00.Tray별 PM분리\\P4_Feb\\Tray19\\PM2")
file_names   <- list.files()
for(i in 1:length(file_names))
{
  print(i)
  if(i == 1) 
  { 
    aaa <- read.csv(file_names[i], sep=";")
    aaa$day <- substr(aaa[1,1], 11, 12)
    Tray2_data <- aaa[-c(1:6),]
    rm(aaa)
  }
  
  if(i > 1)
  { 
    bbb <- read.csv(file_names[i], sep=";")
    bbb$day <- substr(bbb[1,1], 11, 12)
    Tray2_data <- rbind(Tray2_data,bbb[-c(1:7),])
    rm(bbb)
  }
}

write.csv(Tray2_data, "aaa.csv")
