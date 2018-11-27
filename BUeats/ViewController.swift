import UIKit
import MapKit
import Firebase


class TestViewController: UIViewController {

class ViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    @IBAction func loginLabel(_ sender: Any) {

        guard let email = emailTextField.text, let password = passwordTextField.text else { return }
        
        Auth.auth().signIn(withEmail: email, password: password) { user, error in
            if let _  = user {
                self.dismiss(animated: true, completion: nil)
            }
        }
   }

 }
}
