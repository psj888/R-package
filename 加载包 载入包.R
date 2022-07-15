#注释中文乱码 方法：File-Reopen with Encoding-CP936

#安装包
install.packages("openxlsx") #openxlsx 为包名，必须要加引号 (R 中单双引号通用) 。
BiocManager::install("openxlsx")#先安装 BiocManager 包，再用 install() 函数安装 bioconductor 来源的包
#加载包
library(openxlsx)
#更新包
update.packages("openxlsx") 
update.packages()# 更新所有包
#删除包
remove.packages("openxlsx")
#获取或设置当前路径
getwd() 
setwd("D:/R-4.1.1/tests")#路径中的 \ 必须用 / 或 \\ 代替。
#基本运算
#数学运算： + - * /、^ (求幂) 、%% (按模求余1) 、%/% (整除)
#比较运算 >、<、>=、<=、==、!= identical(x,y) ——判断两个对象是否严格相等； 
#all.equal(x,y) 或 dplyr::near(x,y) ——判断两个浮点数是否近似相等 (误差 1.5e???8)
library(org.Hs.eg.db)
keytypes(org.Hs.eg.db)
gene <- row.names(diff_gene_Group2)
tansid <- select(org.Hs.eg.db,keys = gene,columns = c("GENENAME","SYMBOL","ENTREZID"),keytype = "ENSEMBL")
head(tansid) 
write.csv(tansid, file = "C:/Users/psj/Desktop/lovo-seq/tansid.csv")