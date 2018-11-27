import Foundation
import CoreLocation

class RestaurantsManager {
    
    func loadRestaurants(for placeName: String) -> [Restaurants] {
        var restaurant = [loadRestaurants]()
        
        if placeName == "Dylans" {
            
            let dylansCoordinate = CLLocationCoordinate2D(latitude: 50.7431851, longitude: -1.8971263)
            let dylansTreasure = restaurant(coordinate: dylansCoordinate, title: "Dylans" )
            restaurant.append(dylansTreasure)
            
        }
        
        return restaurants
    }
    
    
    
}

