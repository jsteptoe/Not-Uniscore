import Foundation
import CoreLocation

class UniManager {
    
    var uni = [Uni]()
    
    init() {
        
        let uniCoordinate = CLLocationCoordinate2D(latitude: 50.7424473, longitude: -1.8982909)
        let newUni = Uni(coordinate: uniCoordinate, title: "Uni")
        uni.append(newUni)
        
    }
    
    func setActivateUni(title: String) {
    }
    
}

