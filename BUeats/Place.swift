import Foundation
import MapKit

class Place {
    var title: String
    var restauraunt = [Restauraunt]()
    
    init(title: String) {
        self.title = title
    }
}
