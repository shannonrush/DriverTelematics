######################################################
## All time units are seconds, all distance units   ##
## are meters, all velocities are m/s, unless       ##
## otherwise specified                              ##
######################################################

## Each record in a route represents 1 second of time
## TotalTripTime takes a route and returns the number of
## records (which also represents the number of seconds)

TotalTripTime <- function(route) {
    nrow(route)
}

## StopFrequency wants to find the number of stops made during
## a trip.  A stop is defined as 1 or more seconds spent traveling
## <= 1.5 m/s

StopFrequency <- function(route) {
    seconds <- SecondsStopped(DistancesTraveled(route))
    length(TimePerStop(seconds))
}

## AverageStopDuration takes a vector of seconds stopped and returns the average
## number of seconds the driver spent stopped

AverageStopDuration <- function(seconds) {
    mean(TimePerStop(seconds))
}

## TotalTimeStopped takes a route and returns the total time spent not traveling

TotalTimeStopped <- function(route) {
    length(SecondsStopped(DistancesTraveled(route)))
}

## TotalTimeTraveling takes a route and returns the total time spent traveling

TotalTimeTraveling <- function(route) {
    (nrow(route)-1) - TotalTimeStopped(route)
}

## AverageTravelSpeed takes a route and returns the average velocity per second traveling

AverageTravelSpeed <- function(route) {
    distances <- DistancesTraveled(route)
    velocities <- distances[distances != 0]
    round(mean(velocities), digits=5)
}

## TotalDistanceTraveled takes a route and returns the total distance traveled

TotalDistanceTraveled <- function(route) {
    round(sum(DistancesTraveled(route)), digits=5)
}

## MaxDistanceFromStart takes a route and returns the euclidean distance from the point
## furthest from start

MaxDistanceFromStart <- function(route) {
    start <- data.frame(x=0, y=0)
    distances.from.start <- sapply(1:nrow(route), function(i) DistanceTraveled(start,route[i,]))
    round(max(distances.from.start), digits=5)
}
