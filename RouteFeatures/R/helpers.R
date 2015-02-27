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