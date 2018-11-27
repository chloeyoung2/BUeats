import MapKit

class Restauraunts: NSObject, MKAnnotation {
    
    var coordinate: CLLocationCoordinate2D
    var title: String?
    let region: CLCircularRegion
    var restauraunts = [Restauraunts]()
    
    init(coordinate: CLLocationCoordinate2D, title: String) {
        self.coordinate = coordinate
        self.title = title
        region = CLCircularRegion(center: coordinate, radius: 200, identifier: title)
    }
    
}
