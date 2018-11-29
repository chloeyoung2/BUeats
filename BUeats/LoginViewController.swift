import UIKit
import Firebase


@IBAction func LoginButton(_ sender: Any) {
    guard let email = emailTextField.text, let password = passwordTextField.text else { return }
    
    Auth.auth().signIn(withEmail: email, password: password) { user, error in
        if let _  = user {
            self.dismiss(animated: true, completion: nil)
        }
}

}
