import Firebase

class MenuItem {
    
    let price: Double
    let description: String
    let title: String
//    let db = Firestore.firestore()
   
    var db: Firestore!
   
    init(title: String, data: [String: Any]) {
        self.title = title
        description = data["description"] as! String
        price = data["price"] as! Double
    }
  
    
   private func getCollection() {
    db.collection("users").getDocuments() { (querySnapshot, err) in
    if let err = err {
    print("Error getting documents: \(err)")
    } else {
    for document in querySnapshot!.documents {
    print("\(document.documentID) => \(document.data())")
        }
        
      }
        
    }



 }
    
}
