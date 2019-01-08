import UIKit
import Firebase

class StudentViewController: UIViewController {
    
    let database = ["One", "Two", "Three"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Auth.auth().currentUser!.uid
        
        
        gotToUni()
    }
    
    
    func gotToUni() {
        
        let userRef = Firestore.firestore().collection("Users").document("9805HxIKStYkzxgZIQXMvDJxv6H2")
        userRef.getDocument { document, error in
            let lastUpdated = document!.data()!["date"] as! Timestamp
            
            if self.hasVisitedToday(date: lastUpdated.dateValue()) {
                print("has visited already ")
            } else {
                self.newVisit()
            }
            
        }

    }
    
    
    func newVisit() {
        
    }
    
    
    func hasVisitedToday(date: Date) -> Bool {
        let cal = Calendar.current
        return cal.isDateInToday(date)
    }
    
}

