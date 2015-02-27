context("Total Trip Time")

test_that("TotalTripTime returns the number of records in route", {
    setwd("/Users/shannonmrush/git/DriverTelematics/RouteFeatures")
    route <- read.csv("../data/original/drivers/1/1.csv")
    expect_equal(nrow(route), 863)
    expect_equal(TotalTripTime(route), nrow(route))
})

context("Stop Frequency")

test_that("the correct number of stops is returned", {
    route <- data.frame(x=c(0,0,0,3,20,20,20), y=c(0,0,0,5,25,25,25))
    expect_equal(StopFrequency(route),2)
    route <- read.csv("../data/original/drivers/1/10.csv")
    expect_equal(StopFrequency(route),2)
    route <- read.csv("../data/original/drivers/1/1.csv")
    expect_equal(StopFrequency(route),4)
})

context("Average Stop Duration")

test_that("correct average stop duration is returned", {
    seconds <- c(1,2,3,7,8,9,10,15,16,17,18,19)
    expect_equal(AverageStopDuration(seconds),4)
})
