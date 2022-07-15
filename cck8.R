#注释中文乱码 方法：File-Reopen with Encoding-CP936

cck8 <- read.csv("C:/Users/psj/Desktop/cck8.csv") 
## ??????ת??Ϊ??????
library(reshape2) 
cck8_long<-melt(cck8,
                id.vars = c('Time'),
                variable.name='sample',
                value.name='OD450')
## ????һ??????
cck8_long$Group=rep(c('control', 'treat'), each = 15)  ##??Ϊ��?飬ÿ??15??????
### ʹ??ggpubr??ͼ??????ʹ??prism????
library(ggpubr)
library(ggprism)
ggline(cck8_long, x = "Time", y = "OD450", 
       color = "Group",shape='Group', 
       add = "mean_sd",ylab = "OD450 value",
       ggtheme = theme_prism(base_size = 12))
compare_means(OD450~Group, data=cck8_long, group.by = "Time",method = 'anova')
####################################################################################
# A tibble: 5 x 7
#  Time  .y.           p   p.adj p.format p.signif method
#  <chr> <chr>     <dbl>   <dbl> <chr>    <chr>    <chr> 
# 1 day1  OD450 0.0823    0.082   0.08228  ns       Anova 
# 2 day2  OD450 0.00701   0.014   0.00701  **       Anova 
# 3 day3  OD450 0.000371  0.0015  0.00037  ***      Anova 
# 4 day4  OD450 0.0000675 0.00034 6.7e-05  ****     Anova 
# 5 day5  OD450 0.00309   0.0093  0.00309  **       Anova 
####################################################################################
ggline(cck8_long, x = "Time", y = "OD450", 
       color = "Group",shape='Group', title = 'xxx cell',
       add = "mean_sd", palette = 'lancet',ylab = "OD450 value",legend = c(0.1,0.9),
       ggtheme = theme_prism(base_size = 12))+stat_compare_means(label = "p.signif",
                                                                 aes(group=Group),
                                                                 method = "anova",  
                                                                 hide.ns = TRUE)
https://www.jianshu.com/p/f7344f7bac9b