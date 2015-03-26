library(gtools)

setwd("D:\\Solar 공정분석\\job\\20150225요청\\설비 데이터\\전처리\\6.Run ID별 통합\\P2\\csv")
file_names   <- list.files()

partialName <- "_MAX_"
partialName2 <- "_MIN_"

for( i in 1:length(file_names))

{
print(i)
Data <- read.csv(file_names[i], stringsAsFactors = FALSE)
###################MAX값추출###################################
print("MAX값 추출")
##MAX변수명추출
MAX_Headings <- names(Data[,grep(partialName,colnames(Data))])
##MAX변수명 정렬
sorted_MAX_Headings <- mixedsort(MAX_Headings)
##MAX값만 추출
subsetData <- subset(Data, select=sorted_MAX_Headings)
##NA값 0으로 변환
subsetData[is.na(subsetData)] <- 0

####################MIN값추출####################################
print("MIN값 추출")
##MIN변수명추출
MIN_Headings <- names(Data[,grep(partialName2,colnames(Data))])
##MIN변수명 정렬
sorted_MIN_Headings <- mixedsort(MIN_Headings)
##MIN값만 추출
subsetData2 <- subset(Data, select=sorted_MIN_Headings)
##NA값 0으로 변환
subsetData2[is.na(subsetData2)] <- 0

####################Range값추출####################################
print("Range 계산중")

Range <- read.csv("D:\\Solar 공정분석\\job\\20150225요청\\설비 데이터\\전처리\\7.range생성\\7.2 Range계산\\range.csv", stringsAsFactors = FALSE)

for( j in 1: length(Data[[1]]))
{
##계산중인 row 표시
print(paste(i,j,length(Data[[1]]), sep=","))
##Range계산
 RangeData <- subsetData[j,] - subsetData2[j,]
##RunID 삽입
 Range[j,1] <- Data[j,1]
##RunID + Range
 Range[j,-1] <- RangeData
 rm(RangeData)
 }
##RundID순 정렬
 sorted <- Range[order(Range[1]),]
##저장할 파일명 생성
subsetName2 <- paste("Range_", file_names[i], sep = "")
##파일로 저장
print("파일저장중")
write.csv(sorted, subsetName2, row.names=FALSE)

rm(Range)
rm(MAX_Headings)
rm(sorted_MAX_Headings)
rm(subsetData)
rm(MIN_Headings)
rm(sorted_MIM_Headings)
rm(subsetData2)

rm(sorted)
rm(data)
}
