rm(list=ls()) #清空工作历史的所有变量 
setwd("C:/Users/psj/Desktop/质谱分析结果/CO-IP MS结果/SW620/原始结果")
library(openxlsx) #加载openxlsx包
read_excel("SW620 Flag .xlsx")
read.xlsx("SW620 Flag .xlsx")
read.csv()


rm(list=ls())
x <- c(2,3,1,4)
x#or head(x)
head(x)
y <- c(5,3,4,2)
setdiff(x,y)#向量x与向量y中不同的元素(只取x中不同的元素)
intersect(x,y) #取交集

rm(list=ls()) #清空工作历史的所有变量 
setwd("C:/Users/psj/Desktop/质谱分析结果/CO-IP MS结果/SW620/原始结果")
library(openxlsx) #加载openxlsx包
x<- read.xlsx("SW620 Flag .xlsx") #导入xlsx
x1 <- x[,2]
y<- read.xlsx("SW620 IgG 5.15 .xlsx")
y1 <- y[,2]
z1 <- setdiff(x1,y1)
z1

write.csv(z1, file = "SW620 Flag setdiff.CSV")

rm(list=ls())
library(openxlsx)
setwd("C:/Users/psj/Desktop/质谱分析结果/CO-IP MS结果/SW620/原始结果")
x<- read.xlsx("SW620 SYTL5.xlsx")
x1 <- x[,2]
y<- read.xlsx("SW620 IgG 6.24.xlsx")
y1 <- y[,2]
z1 <- setdiff(x1,y1)
z1
write.csv(z1, file = "SW620 SYTL5 setdiff.CSV")


rm(list=ls())
library(openxlsx)
setwd("C:/Users/psj/Desktop/质谱分析结果/CO-IP MS结果/HT29/原始结果")
x<- read.xlsx("HT29 Flag.xlsx")
x1 <- x[,2]
y<- read.xlsx("HT29 IgG.xlsx")
y1 <- y[,2]
z1 <- setdiff(x1,y1)
z1
write.csv(z1, file = "HT29 Flag setdiff.CSV")

rm(list=ls())
library(openxlsx)
setwd("C:/Users/psj/Desktop/质谱分析结果/CO-IP MS结果/HT29/原始结果")
x<- read.xlsx("HT29 SYTL5.xlsx")
x1 <- x[,2]
y<- read.xlsx("HT29 IgG.xlsx")
y1 <- y[,2]
z1 <- setdiff(x1,y1)
z1
write.csv(z1, file = "HT29 SYTL5 setdiff.CSV")

rm(list=ls())
setwd("C:/Users/psj/Desktop")
x<- read.csv("SW620 Flag setdiff.CSV")
x1 <- x[,3]
y<- read.csv("HT29 Flag setdiff.CSV")
y1 <- y[,3]
z1 <- intersect(x1,y1)
z1
write.csv(z1, file = "Flag intersect.csv")

rm(list=ls())
setwd("C:/Users/psj/Desktop")
x<- read.csv("SW620 SYTL5 setdiff.CSV")
x1 <- x[,3]
y<- read.csv("HT29 SYTL5 setdiff.CSV")
y1 <- y[,3]
z1 <- intersect(x1,y1)
z1
write.csv(z1, file = "SYTL5 intersect.csv")

rm(list=ls())
setwd("C:/Users/psj/Desktop")
x<- read.csv("C:/Users/psj/Desktop/质谱分析结果/CO-IP MS结果/SW620/分析结果（-IgG）/SW620 Flag setdiff.CSV")
x1 <- x[,3]
y<- read.csv("C:/Users/psj/Desktop/质谱分析结果/CO-IP 转录因子预测/2022.5.16 AnimalTFDB_tfbs_predict_result.CSV")
y1 <- y[,1]
z1 <- intersect(x1,y1)
z1
write.csv(z1, file = "C:/Users/psj/Desktop/质谱分析结果/CO-IP MS结果/Flag-SYTL5交集/SW620 Flag-SYTL5 TF预测 交集.csv")

rm(list=ls())
setwd("C:/Users/psj/Desktop")
x<- read.csv("C:/Users/psj/Desktop/质谱分析结果/CO-IP MS结果/HT29/分析结果（-IgG）/HT29 Flag setdiff.CSV")
x1 <- x[,3]
y<- read.csv("C:/Users/psj/Desktop/质谱分析结果/CO-IP 转录因子预测/2022.5.16 AnimalTFDB_tfbs_predict_result.CSV")
y1 <- y[,1]
z1 <- intersect(x1,y1)
z1
write.csv(z1, file = "C:/Users/psj/Desktop/质谱分析结果/CO-IP MS结果/Flag-SYTL5交集/HT29 Flag-SYTL5 TF预测 交集.csv")
