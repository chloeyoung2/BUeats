import UIKit
import MapKit
import Firebase
import CoreLocation

class TestViewController: UIViewController {
    
    class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    
    }
   
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    
    
    @IBAction func LoginButton(_ sender: Any) {
        guard let email = emailTextField.text, let password = passwordTextField.text else { return }
        
        Auth.auth().signIn(withEmail: email, password: password) { user, error in
            if let _  = user {
                self.dismiss(animated: true, completion: nil)
            }
        }
   }


}
    
   class ListViewController: UIViewController, CLLocationManagerDelegate {
    
    let locationManager = CLLocationManager()
    let placeManager = PlaceManager()
    
    @IBOutlet weak var tableView: UITableView!
    

    locationManager.delegate = self 
    locationManager.startUpdatingLocation()
    }
    extension ListViewController: UITableViewDataSource {
        
        func tableView(_ tableView: UITableView, numberofRowsInSection section: Int) -> Int {
        return placeManager.places.count
        }
        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
            let restauraunts = PlaceManager.places[indexPath.row]
            
            cell.textLabel?.text = restauraunts.title
            return cell
    }
  }
}
