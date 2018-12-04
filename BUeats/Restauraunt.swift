import UIKit
import MapKit

class Restauraunt: NSObject, MKAnnotation {
    
    var coordinate: CLLocationCoordinate2D
    var title: String?
    let region: CLCircularRegion
    
    init(coordinate: CLLocationCoordinate2D, title: String) {
        self.coordinate = coordinate
        self.title = title
        region = CLCircularRegion(center: coordinate, radius: 200, identifier: title)
    }
    
}
