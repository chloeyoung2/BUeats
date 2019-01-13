
import UIKit

class CustomCell: UITableViewCell {
    
    let UserImage = UIImageView()
    
    @IBOutlet weak var myLabel: UILabel!
    @IBOutlet weak var myImage: UIImageView!
//    @IBOutlet weak var myButton: UILabel!
    
    override func prepareForReuse() {
        super.prepareForReuse()
    }
    
}

