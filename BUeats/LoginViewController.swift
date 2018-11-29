import UIKit
import Firebase

@IBOutlet weak var emailTextField: UITextField!
@IBOutlet weak var passwordTextField: UITextField!



@IBAction func LoginButton(_ sender: Any) {
    guard let email = emailTextField.text, let password = passwordTextField.text else { return }
    
    Auth.auth().signIn(withEmail: email, password: password) { user, error in
        if let _  = user {
            self.dismiss(animated: true, completion: nil)
        }
}

}
