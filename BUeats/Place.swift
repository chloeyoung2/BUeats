import Foundation
import MapKit

class Place {
    var title: String
    var restauraunt = [Restauraunts]()
    
    init(title: String) {
        self.title = title
    }
}
