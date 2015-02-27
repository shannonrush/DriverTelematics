## DistancesTraveled takes a route and returns a vector of distance
## traveled each second

DistancesTraveled <- function(route) {
    unlist(sapply(1:nrow(route)-1, function(i) DistanceTraveled(route[i,], route[i+1,])))
}

## DistanceTraveled takes two pairs of x y coordinates
## and returns the distance between them

DistanceTraveled <- function(point.a, point.b) {
    sqrt(abs(point.a$x - point.b$x)^2 + abs(point.a$y - point.b$y)^2)
}

## SecondsStopped takes a vector of distances and returns the seconds when no distance was traveled
## (less than or equal to 1.5 m/s to account for GPS error)

SecondsStopped <- function(distances) {
    which(distances <= 1.5)
}

## TimePerStop takes a vector of seconds stopped and returns a vector of seconds per stop

TimePerStop <- function(seconds) {
    splits <- SplitByRange(seconds)
    sapply(splits, function(split) length(split))
}

## SplitByRange takes a vector and returns a list of vectors by range

SplitByRange <- function(x) {
    positions <- which(c(1,unlist(sapply(1:length(x), function(i) x[i] - x[i-1]))) != 1)
    unname(split(x, cumsum(seq_along(x) %in% positions)))
}
