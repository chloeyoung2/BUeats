import Foundation
import CoreLocation
import MapKit

class RestaurauntsManager {
    
    var restauraunts = [Restauraunt]()
    
    init() {
        
            
            let restaurauntsCoordinate = CLLocationCoordinate2D(latitude: 50.7429011, longitude: -1.8990322)
            let restaurauntsTreasure = Restauraunt(coordinate: restaurauntsCoordinate, title: "Dylans" )
            restauraunts.append(restaurauntsTreasure)
            
        
    


    }
    
    
    
}

