import Foundation
import MapKit

//the class is the container for all of the uni information- the coordinate, region and title

class Uni: NSObject, MKAnnotation {
    
    
    var coordinate: CLLocationCoordinate2D
    var title: String?
    let region: CLCircularRegion
    
    init(coordinate: CLLocationCoordinate2D, title: String) {
        self.coordinate = coordinate
        self.title = title
        region = CLCircularRegion(center: coordinate, radius: 200, identifier: title)
    }
    
}


