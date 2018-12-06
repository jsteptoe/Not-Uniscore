import UIKit
import MapKit
import Firebase


class ViewController: UIViewController {
    
    let locationManager = CLLocationManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        mapView.userTrackingMode = .follow
        
        locationManager.requestAlwaysAuthorization()
        locationManager.delegate = self as? CLLocationManagerDelegate
        locationManager.startUpdatingLocation()
        
        for Uni in MTLCaptureManager.uni {
            locationManager.startMonitoring(for: uni.region)
            mapView.addAnnotation(uni)
        }
        
    }
    
}
