## Processes all drivers, creates one data frame with one record for each route,
## to be written out to a reusable CSV with the following columns:
# * Driver
# * Route
# * TotalTripTime
# * StopFrequency
# * AvgStopDuration
# * TotalTimeStopped
# * TotalTimeTraveling
# * AvgTravelSpeed
# * TotalDistanceTraveled
# * MaxDistanceFromStart
# * RouteSimilarity (To Be Implemented)

library(RouteFeatures)

RecordForRoute <- function(driver, route) {
    distances <- DistancesTraveled(route)
    seconds.stopped <- SecondsStopped(distances)
    time.per.stop <- TimePerStop(seconds.stopped)
    total.trip <- TotalTripTime(route)
    total.stopped <- TotalTimeStopped(seconds.stopped)
    record <- data.frame("Driver" = driver, 
                         "Route" = unlist(strsplit(route.file, "[.]"))[1],
                         "TotalTripTime" = total.trip,
                         "StopFrequency" = StopFrequency(time.per.stop),
                         "AvgStopDuration" = AverageStopDuration(time.per.stop),
                         "TotalTimeStopped" = total.stopped,
                         "TotalTimeTraveling" = TotalTimeTraveling(total.trip, total.stopped),
                         "AvgTravelSpeed" = AverageTravelSpeed(distances),
                         "TotalDistanceTraveled" = TotalDistanceTraveled(distances),
                         "MaxDistanceFromStart" = MaxDistanceFromStart(route))
}

ProcessDrivers <- function() {
    drivers <- list.files("../original/drivers")
    processed.files <- list.files("./")
    for (driver in drivers) {
        if (!(paste0("processed_", driver, ".csv") %in% processed.files)) {
            processed.data <- data.frame()
            route.files <- list.files(paste0("../original/drivers/", driver))
            for (route.file in route.files) {
                route <- read.csv(paste0("../original/drivers/",driver,"/",route.file))
                record <- RecordForRoute(driver, route)
                processed.data <- rbind(processed.data,record)
            }    
            write.csv(processed.data, paste0("processed_",driver,".csv"), row.names=F)
            print(paste(driver,"written"))   
        }
    }
}

