import Foundation
import CoreLocation

class RestaurauntsManager {
    
    func loadRestauraunts(for placeName: String) -> [Restauraunts] {
        var restauraunts = [Restauraunts]()
        
        if placeName == "Dylans" {
            
            let restaurauntsCoordinate = CLLocationCoordinate2D(latitude: 50.7429011, longitude: -1.8990322)
            let restaurauntsTreasure = Restauraunts(coordinate: restaurauntsCoordinate, title: "Dylans" )
            restauraunts.append(restaurauntsTreasure)
            
        }
    
        
        return restauraunts
    }
    
    
    
}

