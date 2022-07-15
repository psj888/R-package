rm(list = ls())
setwd("C:/Users/psj/Desktop/lovo-seq")
BiocManager::install("AnnotationHub")	#下载安装数据包，缺少的数据包都可以这样安装

library(AnnotationHub)	#library导入需要使用的数据包
library(org.Hs.eg.db)   #人类注释数据库
library(clusterProfiler)
library(dplyr)
library(ggplot2)

results <- read.csv("GO KEGG data.csv")
gene <- results$ENTREZID

kk <- enrichGO(gene = gene,
               OrgDb = org.Hs.eg.db,
               pvalueCutoff =0.05,
               qvalueCutoff = 0.05,
               ont="all",
               readable =T)
write.table(kk,file="GO.txt",sep="\t",quote=F,row.names = F)   

pdf(file="GO柱状图.pdf",width = 10,height = 8)
barplot(kk, drop = TRUE, showCategory =10,split="ONTOLOGY") + facet_grid(ONTOLOGY~., scale='free')
dev.off()

pdf(file="GO点图.pdf",width = 10,height = 8)
dotplot(kk,showCategory = 10,split="ONTOLOGY") + facet_grid(ONTOLOGY~., scale='free')
#注释中文乱码 方法：File-Reopen with Encoding-CP936


dev.off()

#1、KEGG富集
kk <- enrichKEGG(gene = gene,keyType = "kegg",organism= "hsa", qvalueCutoff = 0.05, pvalueCutoff=0.05)

#2、可视化
###柱状图
hh <- as.data.frame(kk)#自己记得保存结果哈！
rownames(hh) <- 1:nrow(hh)
hh$order=factor(rev(as.integer(rownames(hh))),labels = rev(hh$Description))
ggplot(hh,aes(y=order,x=Count,fill=p.adjust))+
  geom_bar(stat = "identity",width=0.7)+####柱子宽度
  #coord_flip()+##颠倒横纵轴
  scale_fill_gradient(low = "red",high ="blue" )+#颜色自己可以换
  labs(title = "KEGG Pathways Enrichment",
       x = "Gene numbers", 
       y = "Pathways")+
  theme(axis.title.x = element_text(face = "bold",size = 16),
        axis.title.y = element_text(face = "bold",size = 16),
        legend.title = element_text(face = "bold",size = 16))+
  theme_bw()

###气泡图
hh <- as.data.frame(kk)
rownames(hh) <- 1:nrow(hh)
hh$order=factor(rev(as.integer(rownames(hh))),labels = rev(hh$Description))
ggplot(hh,aes(y=order,x=Count))+
  geom_point(aes(size=Count,color=-1*p.adjust))+# 修改点的大小
  scale_color_gradient(low="green",high = "red")+
  labs(color=expression(p.adjust,size="Count"), 
       x="Gene Number",y="Pathways",title="KEGG Pathway Enrichment")+
  theme_bw()

#或#KEGG分析#
ekk <- enrichKEGG(gene= id,organism  = 'hsa', qvalueCutoff = 0.05)	 #KEGG富集分析
dotplot(ekk,font.size=8)	# 画气泡图
browseKEGG(ekk,'mmu01100')	# 显示通路图