#=======================================================================
# Effect of Smoking on Lung Capacity 
#=======================================================================
# Load Data
setwd("~/Documents/Career/Data_Science/R/Two_Sample_Test")
LungCapData <- read.csv("LungCapData.txt", header=T, sep = "\t")
attach(LungCapData)
names(LungCapData)
class(LungCap)
levels(Smoke)

# Visualize Smokers an Non-Smokers Lung Capacity
boxplot(LungCap ~ Smoke)

# We run Leven's Test to determine whether population variances are equal
#
# Ho: population variances are equal
library(car)
leveneTest(LungCap~Smoke)

# We run a Two-Sided T-test to determine whether lung capacity differs between smokers and non-smokers
# 
# Ho: mean lung cap of smokes == mean lung cap of non smokers
# Two-Sided Test
# Assume non-equal variance
t.test(LungCap~Smoke, mu=0, alt="two.sided", conf=0.95, var.eq=F, paired=F)

# Given the p-value we can conclude that the alternative hypothesis is true
# There is a significant difference in lung capacity
# between smokers and non-smokers


