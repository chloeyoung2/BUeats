import MapKit
import Firebase

class Restauraunt: NSObject, MKAnnotation {
   
    var coordinate: CLLocationCoordinate2D {
        return CLLocationCoordinate2D(latitude: point.latitude, longitude: point.longitude)
    }
    
    var point: GeoPoint
    var title: String?
//    var image: UIImage?
    
    var region: CLCircularRegion {
        return CLCircularRegion(center: coordinate, radius: 200, identifier: title!)
    }
    
    var menu = [MenuItem]()
    
    init(document: QueryDocumentSnapshot) {
//        self.image = UIImageView.self
        point = document.data()["location"] as! GeoPoint
        self.title = document.data()["name"] as? String
        super.init()
        self.setMenu(data: document.data()["menu"] as! [String: Any])
    }
    
    
    private func setMenu(data: [String: Any]) {
        data.forEach { key, value in
            let item = MenuItem(title: key, data: value as! [String: Any])
            menu.append(item)
        }
    }
    
}
