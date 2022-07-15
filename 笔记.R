#注释中文乱码 方法：File-Reopen with Encoding-CP936

#向量
rm(list = ls())
a <- c(1, 2, 5, 3, 6, -2, 4)  #数值型
b <- c("one", "two", "three") #字符型 
c <- c(TRUE, TRUE, TRUE, FALSE, TRUE, FALSE) #逻辑型
d <- c(1:20) #冒号用于生成一个数值序列

#矩阵
rm(list = ls())
y <- matrix(c(1:20),nrow=4,ncol=5,dimnames = list(c("r1","r2","r3","r4"),c("c1","c2","c3","c4","C5")))
y

#简化 将复杂变量赋值给某个变量
#nrow ncol可省略，rnames cnames必须为字符型向量，''同等于""
rm(list = ls())
x <- c(1:20)
rnames <- c("r1","r2","r3","r4")
cnames <- c("c1","c2","c3","c4","C5")
y <- matrix(x,c(4,5),dimnames = list(rnames,cnames))
#或y <- matrix(x,4,5,dimnames = list(rnames,cnames))
y

#数组 array(vector, dimensions, dimnames) dimensions-数值型向量 
rm(list = ls())
z <- array(1:24, c(2, 3, 4), dimnames=list(c("A1", "A2"), c("B1", "B2", "B3"), c("C1", "C2", "C3", "C4")))
z
#简化
rm(list = ls())
e <- c(1:24)
f <- c(2, 3, 4)
dim1 <- c("A1", "A2")
dim2 <- c("B1", "B2", "B3")
dim3 <- c("C1", "C2", "C3", "C4")
z <- array(e, f, dimnames=list(dim1, dim2, dim3))
z
z[1,2,3]#从数组中选取元素

l <- array(1:24, c(2, 3, 4))#三维
m <- array(1:120, c(2, 3, 4,5))#四维
n <- array(1:720, c(2, 3, 4,5,6))#五维


#数据框 mydata <- data.frame(col1, col2, col3,...)
summary(mtcars$mpg)
plot(mtcars$mpg, mtcars$disp) 
plot(mtcars$mpg, mtcars$wt)
#简化 
#函数attach()-绑定数据框 结合紧密
#函数detach()-解绑数据框（可省略）
#局限性：对象的名称必须唯一
attach(mtcars) 
summary(mpg) 
plot(mpg, disp) 
plot(mpg, wt) 
detach(mtcars)
#或 花括号{}之间的语句都针对特定数据框执行
#函数需要隔行
#函数with()的局限性在于，赋值仅在此函数的括号内生效 结合松散
with(mtcars,{summary(mpg)
  plot(mpg, disp)
  plot(mpg, wt)})

#使用特殊赋值符<<-可将对象保存到with()之外的全局环境中
with(mtcars, {nokeepstats <- summary(mpg) 
  keepstats <<- summary(mpg)})
nokeepstats #Error: object 'nokeepstats' not found
keepstats 

patientID <- c(1, 2, 3, 4) 
age <- c(25, 34, 28, 52)
diabetes <- c("Type1", "Type2", "Type1", "Type1") 
status <- c("Poor", "Improved", "Excellent", "Poor") 
diabetes <- factor(diabetes) 
status <- factor(status, order=TRUE)
patientdata <- data.frame(patientID, age, diabetes, status)
patientdata 
str(patientdata)
summary(patientdata)


g <- "My First List" 
h <- c(25, 26, 18, 39) 
j <- matrix(1:10, nrow=5) 
k <- c("one", "two", "three")
mylist <- list(title=g, ages=h, j, k)
mylist
mylist$ages
