
setwd("D:\\Solar �����м�\\job\\20150225��û\\P4_Feb")
file_names   <- list.files()
for(i in 1:length(file_names))
{
  print(i)
  if(i == 1) 
  { 
    aaa <- read.csv(file_names[i], sep=",")
    P4_Feb_data <- aaa
    rm(aaa)
  }
  
  if(i > 1)
  { 
    bbb <- read.csv(file_names[i], sep=",")
    P4_Feb_data <- rbind(P4_Feb_data,bbb[-c(1),])
    rm(bbb)
  }
}

write.csv(P4_Feb_data, "P4_Feb.csv")
