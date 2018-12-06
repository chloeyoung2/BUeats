import Foundation
import CoreLocation
import MapKit

class RestaurauntsManager {
    
    var restauraunts = [Restauraunt]()
    
    init() {
        
            
            let restaurauntsCoordinate = CLLocationCoordinate2D(latitude: 50.7429011, longitude: -1.8990322)
            let restaurauntsTreasure = Restauraunt(coordinate: restaurauntsCoordinate, title: "Dylans" )
            restauraunts.append(restaurauntsTreasure)
            
            let fusionCoordinate = CLLocationCoordinate2D(latitude: 50.7417838, longitude: -1.8971977)
            let fusionTreasure = Restauraunt(coordinate: fusionCoordinate, title: "Fusion Cafe" )
            restauraunts.append(fusionTreasure)
       
            let costaCoordinate = CLLocationCoordinate2D(latitude: 50.742827, longitude: -1.894646)
            let costaTreasure = Restauraunt(coordinate: costaCoordinate, title: "Costa Coffee" )
            restauraunts.append(costaTreasure)
    
            let studentshopCoordinate = CLLocationCoordinate2D(latitude: 50.742827, longitude: -1.894646)
            let studentshopTreasure = Restauraunt(coordinate: studentshopCoordinate, title: "Student Shop" )
            restauraunts.append(studentshopTreasure)
        
            let starbucksCoordinate = CLLocationCoordinate2D(latitude: 50.742473, longitude: -1.896458)
            let starbucksTreasure = Restauraunt(coordinate: starbucksCoordinate, title: "Starbucks" )
            restauraunts.append(starbucksTreasure)
        
            let nakedcoffeeCoordinate = CLLocationCoordinate2D(latitude: 50.7424538, longitude: -1.8966498)
            let nakedcoffeeTreasure = Restauraunt(coordinate: nakedcoffeeCoordinate, title: "Naked Coffee" )
            restauraunts.append(nakedcoffeeTreasure)

    }
    
    
}

