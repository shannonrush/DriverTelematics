context("Total Trip Time")

test_that("TotalTripTime returns the number of records in route", {
    setwd("/Users/shannonmrush/git/DriverTelematics/RouteFeatures")
    route <- read.csv("../data/original/drivers/1/1.csv")
    expect_equal(nrow(route), 863)
    expect_equal(TotalTripTime(route), nrow(route))
})

