## Each record in a route represents 1 second of time
## TotalTripTime takes a route and returns the number of
## records (which also represents the number of seconds)

TotalTripTime <- function(route) {
    nrow(route)
}

## StopFrequency wants to find the number of stops made during
## a trip.  A stop is defined as 1 or more seconds spent traveling
## 0 distance

StopFrequency <- function(route) {
    
}