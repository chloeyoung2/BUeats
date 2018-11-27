import UIKit
import Firebase

class LoginViewController: UIViewController {
    
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        Auth.auth().createUser(withEmail: "test@test.com", password: "chloeyoung123") { authResult, error in
            guard let user = authResult?.user else { return }
            print(user.email)
        }
        Auth.auth().signIn(withEmail: "test@test.com", password: "chloeyoung123") { (user, error) in
        }
    }
    
}
