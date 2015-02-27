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

context("Total Time Stopped")

test_that("correct number of seconds returned as stopped", {
    route <- data.frame(x=c(0,0,0,3,20,20,20), y=c(0,0,0,5,25,25,25))
    expect_equal(TotalTimeStopped(route), 4)
})

context("Total Time Traveling")

test_that("correct number of seconds returned as traveling", {
    route <- data.frame(x=c(0,0,0,3,20,20,20), y=c(0,0,0,5,25,25,25))
    expect_equal(TotalTimeTraveling(route), 2)
})

context("Average Travel Speed")

test_that("correct mean travel velocity returned for route", {
    route <- data.frame(x=c(0,0,0,3,20,20,20), y=c(0,0,0,5,25,25,25))
    expect_equal(AverageTravelSpeed(route), 16.03988)
})

context("Total Distance Traveled")

test_that("correct distance returned for route", {
    route <- data.frame(x=c(0,0,0,3,20,20,20), y=c(0,0,0,5,25,25,25))
    expect_equal(TotalDistanceTraveled(route), 32.07976)
})

context("Max Distance From Start")

test_that("correct distance is returned as max from start for route", {
    route <- data.frame(x=c(0,0,0,3,20,20,20), y=c(0,0,0,5,25,25,25))
    expect_equal(MaxDistanceFromStart(route), 32.01562)
})
