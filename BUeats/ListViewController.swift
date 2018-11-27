import UIKit
import CoreLocation
import MapKit

class ListViewController: UIViewController, CLLocationManagerDelegate {
    
    let locationManager = CLLocationManager()
    let placeManager = PlaceManager()
    // link to tableview
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        locationManager.requestAlwaysAuthorization()
        locationManager.delegate = self
        locationManager.startUpdatingLocation()
        
}
