import UIKit
import MapKit
import Firebase
import CoreLocation

class TableViewController: UIViewController {
    
    @IBOutlet weak var mapView: MKMapView!
    
    let locationManager = CLLocationManager()
    let restaurantManager = RestaurauntsManager()

    @IBOutlet weak var tableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
        
        
        mapView.addAnnotations(restaurantManager.restauraunts)
        mapView.showAnnotations(mapView.annotations, animated: false)
        locationManager.requestAlwaysAuthorization()
        locationManager.startUpdatingLocation()
        
        restaurantManager.loadRestaurants {
            self.tableView.reloadData()
        }
    }
    

    
    
    @IBAction func LogOutButton(_ sender: Any) {
        AppManager.shared.logout()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "Show" {
            let destination = segue.destination as! MenuViewController
            destination.restaurant = (sender as! Restauraunt)
        }
    }

}


extension TableViewController: MKMapViewDelegate {
    
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        
        guard let annotation = annotation as? Restauraunt else { return nil }
        
        let identifier = "marker"
        var view: MKMarkerAnnotationView
        
        if let dequeuedView = mapView.dequeueReusableAnnotationView(withIdentifier: identifier)
            as? MKMarkerAnnotationView {
            dequeuedView.annotation = annotation
            view = dequeuedView
        } else {
            view = MKMarkerAnnotationView(annotation: annotation, reuseIdentifier: identifier)
            view.canShowCallout = true
            view.calloutOffset = CGPoint(x: -5, y: 5)
            view.rightCalloutAccessoryView = UIButton(type: .detailDisclosure)
        }
        
        view.markerTintColor = .purple
        
        return view
 }
}
extension TableViewController: UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return restaurantManager.restauraunts.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell") as! CustomCell
        return cell

        cell.myLabel.text = "Row \(indexPath.row)"

        let restaurauntForCell = restaurantManager.restauraunts[indexPath.row]
        
    
        cell.textLabel?.text = restaurauntForCell.title! + " \(restaurauntForCell.menu.count)"
        return cell
  }


}

extension TableViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let restaurauntForCell = restaurantManager.restauraunts[indexPath.row]
        performSegue(withIdentifier: "Show", sender: restaurauntForCell)
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
}
