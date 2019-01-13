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
    
        let nib = UINib(nibName: "CustomCell", bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: "Cell")
        tableView.rowHeight = 100

        let dylans = MKPointAnnotation()
        dylans.title = "Dylans"
        dylans.coordinate = CLLocationCoordinate2D(latitude: 50.7429011, longitude: -1.8990322)
        mapView.addAnnotation(dylans)
        
        let costa = MKPointAnnotation()
        costa.title = "Costa Coffee"
        costa.coordinate = CLLocationCoordinate2D(latitude: 50.742834, longitude: -1.894754)
        mapView.addAnnotation(costa)
        
        let shop = MKPointAnnotation()
        shop.title = "Student Shop"
        shop.coordinate = CLLocationCoordinate2D(latitude: 50.7425833, longitude: -1.8966615)
        mapView.addAnnotation(shop)
        
        let starbucks = MKPointAnnotation()
        starbucks.title = "StarBucks"
        starbucks.coordinate = CLLocationCoordinate2D(latitude: 50.743121, longitude: -1.897231)
        mapView.addAnnotation(starbucks)
        
        let fusion = MKPointAnnotation()
        fusion.title = "Fusion Cafe"
        fusion.coordinate = CLLocationCoordinate2D(latitude: 50.7428838, longitude: -1.8973855)
        mapView.addAnnotation(starbucks)
        
       
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
     
        let restaurauntForCell = restaurantManager.restauraunts[indexPath.row]
    
        cell.myLabel.text = restaurauntForCell.title!
//        cell.myButton.text = restaurauntForCell.label!
        
//        cell.imageView?.image = UIImage(named: "Dylans menu")

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
