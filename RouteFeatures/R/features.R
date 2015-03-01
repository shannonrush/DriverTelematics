######################################################
## All time units are seconds, all distance units   ##
## are meters, all velocities are m/s, unless       ##
## otherwise specified                              ##
######################################################

## Each record in a route represents 1 second of time
## TotalTripTime takes a route and returns the number of
## records (which also represents the number of seconds)

TotalTripTime <- function(route) {
    nrow(route)-1
}

## StopFrequency wants to find the number of stops made during
## a trip.  A stop is defined as 1 or more seconds spent traveling
## <= 1.5 m/s

StopFrequency <- function(time.per.stop) {
    length(time.per.stop)
}

## AverageStopDuration takes a route and returns the average
## number of seconds the driver spent stopped

AverageStopDuration <- function(time.per.stop) {
    mean(time.per.stop)
}

## TotalTimeStopped takes a route and returns the total time spent not traveling

TotalTimeStopped <- function(seconds.stopped) {
    length(seconds.stopped)
}

## TotalTimeTraveling takes a route and returns the total time spent traveling

TotalTimeTraveling <- function(total.trip, total.stopped) {
    total.trip - total.stopped
}

## AverageTravelSpeed takes a route and returns the average velocity per second traveling

AverageTravelSpeed <- function(distances) {
    velocities <- distances[distances != 0]
    round(mean(velocities), digits=5)
}

## TotalDistanceTraveled takes a route and returns the total distance traveled

TotalDistanceTraveled <- function(distances) {
    round(sum(distances), digits=5)
}

## MaxDistanceFromStart takes a route and returns the euclidean distance from the point
## furthest from start

MaxDistanceFromStart <- function(route) {
    start <- data.frame(x=0, y=0)
    distances.from.start <- sapply(1:nrow(route), function(i) DistanceTraveled(start,route[i,]))
    round(max(distances.from.start), digits=5)
}
