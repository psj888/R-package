#注释中文乱码 方法：File-Reopen with Encoding-CP936


library(tidyverse)
library(DESeq2)
#import data
setwd("C:/Users/psj/Desktop")
mycounts<-read.csv("counts.CSV")
head(mycounts)
a<- gsub("\\_\\d*", "", mycounts$gene)
ENSEMBL <- gsub("\\.\\d*", "", a)
row.names(mycounts) <- ENSEMBL
head(mycounts)
mycounts <- cbind(ENSEMBL,mycounts)
colnames(mycounts)[1] <- c("ensembl_gene_id")
mycounts<-mycounts[ ,-1:-2]
head(mycounts)
write.csv(mycounts, file = "C:/Users/psj/Desktop/mycounts")

counts<-read.csv("counts.csv")
IDs <- counts$gene
ID_type = "ENSEMBL"
annoGene(IDs, ID_type,out_file ='convert.csv')

condition <- factor(c(rep("control", 3), rep("treat", 3)), levels = c("control","treat"))
condition
colData <- data.frame(row.names = colnames(mycounts), condition)
colData

dds <- DESeqDataSetFromMatrix(mycounts, colData, design= ~ condition)
dds <- DESeq(dds)
 # 查看一下dds的内容
 dds
 
 #使用DESeq2包中的results()函数，提取差异分析的结果
 #Usage:results(object, contrast, name, .....）
 #将提取的差异分析结果定义为变量"res" 
 #contrast: 定义谁和谁比较
 res = results(dds, contrast=c("condition", "control", "treat"))
 #对结果res利用order()函数按pvalue值进行排序
 #创建矩阵时，X[i,]指矩阵X中的第i行，X[,j]指矩阵X中的第j列
 #order()函数先对数值排序，然后返回排序后各数值的索引，常用用法：V[order(V)]或者df[order(df$variable),]
 res = res[order(res$pvalue),]
 #显示res结果首信息
 head(res)
 #对res矩阵进行总结，利用summary命令统计显示一共多少个genes上调和下调
 summary(res)
 #将分析的所有结果进行输出保存
 write.csv(res, file="All_results.csv")
 #显示显著差异的数目
 table(res$padj<0.05)
 
 
 #使用subset()函数过滤需要的结果至新的变量diff_gene_Group2中
 #Usage:subset(x, ...)，其中x为objects，...为筛选参数或条件
 diff_gene_Group2 <- subset(res, padj < 0.05 & abs(log2FoldChange) > 1)
 #也可以将差异倍数分开来写：
 #> diff_gene_Group2 <-subset(res,padj < 0.05 & (log2FoldChange > 1 | log2FoldChange < -1))
 #使用dim函数查看该结果的维度、规模
 dim(diff_gene_Group2)
 #显示结果的首信息
 head(diff_gene_Group2)
 #将结果进行输出保存
 write.csv(diff_gene_Group2, file = "C:/Users/psj/Desktop/different_gene_Group2_1")
 
 #BiocManager::install("clusterProfiler")
 library(clusterProfiler)
 BiocManager::install("DOSE")
 require(DOSE)
 library(DO.db)
 # 人类的注释数据
 #BiocManager::install("org.Hs.eg.db")
 library(org.Hs.eg.db)
 
 #BiocManager::install("keytype")
 #library("keytypes")
 keytypes(org.Hs.eg.db)
 
 gene <- row.names(diff_gene_Group2)
 tansid <- select(org.Hs.eg.db,keys = gene,columns = c("GENENAME","SYMBOL","ENTREZID"),keytype = "ENSEMBL")
 head(tansid) 
 write.csv(tansid, file = "C:/Users/psj/Desktop/tansid")
 
 
 
