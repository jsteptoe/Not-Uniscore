import Foundation
import CoreLocation

class UniManager {
    
  
    
    var uni = [Uni]()
    
    init() {
        
        //the coordinate (lat and long) and uni as the title- if we expanded to more unis we could change title to each one and add images
        
        let uniCoordinate = CLLocationCoordinate2D(latitude: 50.7424473, longitude: -1.8982909)
        let uniLocation = Uni(coordinate: uniCoordinate, title: "Uni")
        uni.append(uniLocation)
        
    }
    
    func setActivateUni(title: String) {
    }
    
}

