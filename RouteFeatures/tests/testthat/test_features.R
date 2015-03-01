context("Total Trip Time")

test_that("TotalTripTime returns the number of records in route", {
    setwd("/Users/shannonmrush/git/DriverTelematics/RouteFeatures")
    route <- read.csv("../data/original/drivers/1/1.csv")
    expect_equal(nrow(route), 863)
    expect_equal(TotalTripTime(route), 862)
})

context("Stop Frequency")

test_that("the correct number of stops is returned", {
    time.per.stop <- c(2,2)
    expect_equal(StopFrequency(time.per.stop),2)
})

context("Average Stop Duration")

test_that("correct average stop duration is returned", {
    time.per.stop <- c(2,2)
    expect_equal(AverageStopDuration(time.per.stop),2)
    time.per.stop <- c(3,4,5)
    expect_equal(AverageStopDuration(time.per.stop),4)
})

context("Total Time Stopped")

test_that("correct number of seconds returned as stopped", {
    seconds.stopped <- c(1,2,5,6)
    expect_equal(TotalTimeStopped(seconds.stopped), 4)
})

context("Total Time Traveling")

test_that("correct number of seconds returned as traveling", {
    total.trip <- 40
    total.stopped <- 10
    expect_equal(TotalTimeTraveling(total.trip, total.stopped), 30)
})

context("Average Travel Speed")

test_that("correct mean travel velocity returned for route", {
    distances <- c(0.000000, 0.000000, 5.830952, 26.248809, 0.000000, 0.000000)
    expect_equal(AverageTravelSpeed(distances), 16.03988)
})

context("Total Distance Traveled")

test_that("correct distance returned for route", {
    distances <- c(0.000000, 0.000000, 5.830952, 26.248809, 0.000000, 0.000000)
    expect_equal(TotalDistanceTraveled(distances), 32.07976)
})

context("Max Distance From Start")

test_that("correct distance is returned as max from start for route", {
    route <- data.frame(x=c(0,0,0,3,20,20,20), y=c(0,0,0,5,25,25,25))
    expect_equal(MaxDistanceFromStart(route), 32.01562)
})
