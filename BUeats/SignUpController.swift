import UIKit
import Firebase

class SignUpController: UIViewController {
    
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    
    
    @IBAction func LoginButton(_ sender: Any) {
        guard let email = emailTextField.text, let password = passwordTextField.text else { return }
        
        Auth.auth().createUser(withEmail: email, password: password) { result, error in
            guard let _ = result?.user else { return }
            AppManager.shared.appContainer.presentedViewController?.dismiss(animated: true, completion: nil)
        }
        
    }
    
}

