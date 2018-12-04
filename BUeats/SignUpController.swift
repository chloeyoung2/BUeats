import UIKit
import Firebase

class SignUpController: UIViewController {
    
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
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        Auth.auth().createUser(withEmail: "test@test.com", password: "chloeyoung123") { authResult, error in
            guard let user = authResult?.user else { return }
            print(user.email!)
        }
        Auth.auth().signIn(withEmail: "test@test.com", password: "chloeyoung123") { (user, error) in
        }
    }
    
}

