
import UIKit

class CustomCell: UITableViewCell {
    
  
    @IBOutlet weak var myLabel: UILabel!
    @IBOutlet weak var myImage: UIImageView!
    
    override func prepareForReuse() {
        super.prepareForReuse()
    }
    
}

