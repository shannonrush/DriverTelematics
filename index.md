---
title       : Driver Telematics Analysis
subtitle    : Exploration and Analysis of Driver Telematics Analysis Kaggle competition data
author      : Shannon Rush
job         : 
framework   : io2012        # {io2012, html5slides, shower, dzslides, ...}
highlighter : highlight.js  # {highlight.js, prettify, highlight}
hitheme     : tomorrow      # 
widgets     : []            # {mathjax, quiz, bootstrap}
mode        : selfcontained # {standalone, draft}
knit        : slidify::knit2slides
---

## Competition Summary

The goal of this competition is to identify which driving trips were taken by a unique driver.  Each anonymized driver is associated with a set of trips, the majority of which were driven by the driver and the remainder were not.

## The Data

The data is provided as CSV files (200 for each driver) and contain X and Y position data for the car, each record representing one second of time.  All trips begin at the 0,0 position.

---
## Initial Exploration

First we'll look at one route made by one driver.


```r
route1 <- read.csv("data/original/drivers/1/1.csv")
dim(route1)
```

```
## [1] 863   2
```

```r
head(route1)
```

```
##      x     y
## 1  0.0   0.0
## 2 18.6 -11.1
## 3 36.1 -21.9
## 4 53.7 -32.6
## 5 70.1 -42.8
## 6 86.5 -52.6
```

---

This route lasted 863 seconds and consists of x and y positions as expected. Now we'll roughly plot this single route:


```r
plot(route1[,"x"], route1[,"y"])
```

![plot of chunk unnamed-chunk-2](assets/fig/unnamed-chunk-2.png) 




