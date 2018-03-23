library("e1071")

# load 10 SVM models
m1_1<- load("model1_prob_v2.rda")
m2_1 <- load("model2_prob_v2.rda")
m3_1 <- load("model3_prob_v2.rda")
m4_1 <-load("model4_prob_v2.rda")
m5_1 <-load("model5_prob_v2.rda")
m6_1 <-load("model6_prob_v2.rda")
m7_1 <-load("model7_prob_v2.rda")
m8_1 <-load("model8_prob_v2.rda")
m9_1 <-load("model9_prob_v2.rda")
m10_1 <-load("model10_prob_v2.rda")


# read input file
x <- read.csv('Test_orfSeqs.csv',header=FALSE)

print(nrow(x))

gc = x[,c(503)]
pre<- c(0)

for (i in  1:nrow(x))
{ 
     GcR=gc[i]

  if (GcR>=0  &  GcR< 0.3657){
 
       newdf <- data.frame(x=x[c(i),])
       pred<- predict(get(m1_1), newdf, probability=TRUE)
       pre[i]<-attr(pred, "probabilities") [2]}

  else if (GcR>=0.3657  &  GcR< 0.4157){
       newdf <- data.frame(x=x[c(i),])
       pred<- predict (get(m2_1), newdf, probability=TRUE)
       pre[i]<-attr(pred, "probabilities") [2]
}
  else if (GcR>=0.4157  &  GcR< 0.46){

       newdf <- data.frame(x=x[c(i),])      
       pred<- predict (get(m3_1), newdf, probability=TRUE)
       
    
     pre[i]<-attr(pred, "probabilities") [1]
}
  else if (GcR>=0.46  &  GcR< 0.5014){
      newdf <- data.frame(x=x[c(i),])
      pred<- predict (get(m4_1), newdf, probability=TRUE)
       
     pre[i]<-attr(pred, "probabilities") [2]
}

  else if (GcR>=0.5014  &  GcR< 0.5428){
     newdf <- data.frame(x=x[c(i),])
     pred<- predict (get(m5_1), newdf, probability=TRUE)
       
     pre[i]<-attr(pred, "probabilities") [2]
}

  else if (GcR>=0.5428  &  GcR< 0.5814){
 newdf <- data.frame(x=x[c(i),])
     pred<- predict (get(m6_1), newdf, probability=TRUE)
       
     pre[i]<-attr(pred, "probabilities") [2]
}
  else if (GcR>=0.5814  &  GcR< 0.6185){
 newdf <- data.frame(x=x[c(i),])
     pred<- predict (get(m7_1), newdf, probability=TRUE)
      
     pre[i]<-attr(pred, "probabilities") [2]
}
  else if (GcR>=0.6185  &  GcR< 0.65){
 newdf <- data.frame(x=x[c(i),])
      pred<- predict (get(m8_1), newdf, probability=TRUE)
      
     pre[i]<-attr(pred, "probabilities") [1]
}
  else if (GcR>=0.65  &  GcR< 0.6828){
 newdf <- data.frame(x=x[c(i),])
     pred<- predict (get(m9_1), newdf, probability=TRUE)
       
     pre[i]<-attr(pred, "probabilities") [2]
}
     
  else if (GcR>=0.6828  &  GcR< 1){
 newdf <- data.frame(x=x[c(i),])
      pred<- predict (get(m10_1), newdf, probability=TRUE)
       
     pre[i]<-attr(pred, "probabilities") [2]
}
}

# output file
write(pre, "test.txt", sep="\n")

