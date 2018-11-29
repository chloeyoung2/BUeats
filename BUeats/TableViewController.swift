import UIKit
import MapKit
import Firebase
import CoreLocation

class TableViewController: UIViewController {
    
    @IBOutlet weak var mapView: MKMapView!
    
    var place: Place!
    var restauraunts = [Restauraunts]()
    
    let locationManager = CLLocationManager()
    let placeManager = PlaceManager()

    override func viewDidLoad() {
        super.viewDidLoad()
        restauraunts = RestaurauntsManager.loadRestauraunts(for: place.title)
        
        mapView.showAnnotations(Restauraunts, animated: false)
    
        locationManager.requestAlwaysAuthorization()
        locationManager.startUpdatingLocation()
        
        for restauraunts in RestaurauntsManager.loadRestauraunts(for: place.title) {
            locationManager.startMonitoring(for: Restauraunts.region)
            mapView.addAnnotation(Restauraunts)
        }
    
    }

    @IBOutlet weak var tableView: UITableView!

    
}

extension TableViewController: MKMapViewDelegate {
    
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        
        guard let annotation = annotation as? Restauraunts else { return nil }
        
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
//extension TableViewController: UITableViewDataSource {
//
//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return placeManager.places.count
//    }
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
//        let restauraunts = PlaceManager.places[indexPath.row]
//
//        cell.textLabel?.text = restauraunts.title
//        return cell
// }
//}

