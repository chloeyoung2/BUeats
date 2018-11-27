import Foundation
import CoreLocation

class PlaceManager {
   
    var places = [Place]()
    
    init() {
        
        let dylansTreasure = places(title: "Dylans" )
        places.append(dylansTreasure)
    }
}
