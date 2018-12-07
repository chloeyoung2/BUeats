import UIKit
import MapKit
import Firebase
import CoreLocation

class TableViewController: UIViewController {
    
    @IBOutlet weak var mapView: MKMapView!
    
    var place: Place!
    var restauraunts = [Restauraunt]()
    
    let locationManager = CLLocationManager()
    let restaurantManager = RestaurauntsManager()

    @IBOutlet weak var tableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
    
        
        mapView.addAnnotations(restaurantManager.restauraunts)
        
        mapView.showAnnotations(mapView.annotations, animated: false)
        
        locationManager.requestAlwaysAuthorization()
        locationManager.startUpdatingLocation()
    
    }
    
    
    @IBAction func LogOutButton(_ sender: Any) {
        
        do{
            try! Auth.auth().signOut()
            } catch {
                print("Logout Failed")
            }
        let vc = self.storyboard?.instantiateInitialViewController()
        self.present(vc!, animated: true, completion: nil)
        
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
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        let restaurauntForCell = restaurantManager.restauraunts[indexPath.row]

        cell.textLabel?.text = restaurauntForCell.title
        return cell
 }



}


