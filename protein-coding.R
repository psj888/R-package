#注释中文乱码 方法：File-Reopen with Encoding-CP936

rm(list=ls())
setwd("C:/Users/psj/Desktop/620-seq")

#修改ENSEBL号，去掉，_后的数字
library(tidyverse)
library(DESeq2)
#import data
mycounts<-read.csv("counts.CSV")
a<- gsub("\\_\\d*", "", mycounts[,1]) #去除mycounts第1列中_后数值并赋值给a
ENSEMBL <- gsub("\\.\\d*", "", a)#去除a中.后数值并赋值给ENSEMBL 
mycounts <- cbind(ENSEMBL,mycounts)#将mycounts和ENSEMBL列合并
colnames(mycounts)[1] <- c("ENSEMBL")#设置mycounts第1列名称为ENSEMBL
mycounts<-mycounts[ ,-2]#删除mycounts第2列ensemble_ID版本号
head(mycounts)
write.csv(mycounts, file = "C:/Users/psj/Desktop/620-seq/ENSEMBLcounts.csv")

#基因类型注释
#BiocManager::install("AnnoProbe") 
library(AnnoProbe)
IDs <- mycounts$ENSEMBL
ID_type = "ENSEMBL"
type <- annoGene(IDs, ID_type,out_file ='convert.csv')

#提取protein_coding基因
library(dplyr)
a<- filter(type,biotypes=="protein_coding")#提取type中biotypes=="protein_coding"的行
y <- a[!duplicated(a$ENSEMBL), ]#去除重复ENSEMBL
row.names(mycounts) <- ENSEMBL
row.names(y) <- y$ENSEMBL
z <- merge(y, mycounts, by = c("ENSEMBL", "ENSEMBL")) 
m <- z[,-2:-6]
write.csv(m, file = "C:/Users/psj/Desktop/620-seq/protein_coding.csv")



