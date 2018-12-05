//import UIKit
//import CoreLocation
//import MapKit
//
//class ListViewController: UIViewController, CLLocationManagerDelegate {
//
//    let locationManager = CLLocationManager()
//   // link to tableview
//    @IBOutlet weak var tableView: UITableView!
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//
//        locationManager.requestAlwaysAuthorization()
//        locationManager.delegate = self
//        locationManager.startUpdatingLocation()
//
//    }
//
////    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
////        if segue.identifier == "Show" {
////            let destination = segue.destination as! MapViewController
////            destination.place = (sender as! Place)
////            //animation = true
//        }
//    }
////
////}
//
//// adds each row to the tableview
//extension ListViewController: UITableViewDataSource {
//
//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return placeManager.places.count
//    }
//
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
//        let hotel = placeManager.places[indexPath.row]
//
//        cell.textLabel?.text = hotel.title
//        return cell
//    }
//
//}
//
//// // performs the segue between tableview and next viewcontroller when each row is selected
////extension ListViewController: UITableViewDelegate {
////
////
////    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
////        let place = placeManager.places[indexPath.row]
////        performSegue(withIdentifier: "Show", sender: place)
////
////    }
////
////}
//
//
//
