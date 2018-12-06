import UIKit
import Firebase
import FirebaseCore


class StudentViewController: UIViewController {
    
    let database = ["One", "Two", "Three"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        FirebaseApp.configure()
        
        let db = Firestore.firestore()
        
    }
}

