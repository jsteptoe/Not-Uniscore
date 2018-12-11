
import Foundation
import Firebase

protocol SendDelegate {
    func userPressedLogin(data: String)
}

class LoginViewController: UIViewController {

    
    
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    


override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    if segue.identifier == "showSecondVC" {
        let MapViewController: MapViewController = segue.destination as! MapViewController
         destination.uni = (sender as! Uni)
        
}
}
}
