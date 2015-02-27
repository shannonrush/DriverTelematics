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