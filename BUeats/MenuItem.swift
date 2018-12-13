import Firebase

class MenuItem {
    
    let price: Double
    let description: String
    let title: String
    
    init(title: String, data: [String: Any]) {
        self.title = title
        description = data["description"] as! String
        price = data["price"] as! Double
    }
    
}
