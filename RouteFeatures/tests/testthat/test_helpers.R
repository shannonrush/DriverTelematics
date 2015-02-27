context("Distances Traveled")

test_that("returned vector consists of 1 less elements than route records", {
    route <- data.frame(x=c(0,3,4,5,6), y=c(0,7,5,-9,3))
    expect_equal(length(DistancesTraveled(route)), nrow(route)-1)
})

context("Distance Traveled")

test_that("the distance between two points is calculated correctly", {
    point.a <- data.frame(x=0, y=0)
    point.b <- data.frame(x=3, y=4)
    expect_equal(DistanceTraveled(point.a, point.b), 5)
})

context("Seconds Stopped")

test_that("only distance indices with values less than or equal to 1.5 are returned", {
    distances <- c(0,0,0,5,6,5,7,0,1.5)
    expect_equal(SecondsStopped(distances), c(1,2,3,8,9))
})

test_that("the distance between two points is calculated correctly", {
    point.a <- data.frame(x=0, y=0)
    point.b <- data.frame(x=-3, y=-4)
    expect_equal(DistanceTraveled(point.a, point.b), 5)
})

context("Split By Range")

test_that("the correct list of vectors is returned", {
    x <- c(1,2,3,5,6,7,8,11,12,13)
    expect_equal(SplitByRange(x), list(c(1,2,3),c(5,6,7,8),c(11,12,13)))
    x <- c(1,4,8)
    expect_equal(SplitByRange(x), list(c(1),c(4),c(8)))
})