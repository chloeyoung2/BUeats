import UIKit

class MenuViewController: UIViewController {
    
    var restaurant: Restauraunt!

    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
    }
}

extension MenuViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return restaurant.menu.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
      let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        let menuItem = restaurant.menu[indexPath.row]
        
        cell.textLabel?.text = menuItem.title + " \(menuItem.price)"
        cell.myImage?.text = menuItem.image 
        
        return cell

    }
    

}
