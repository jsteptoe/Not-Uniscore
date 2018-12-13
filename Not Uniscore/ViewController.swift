import UIKit
import MapKit
import Firebase

//class is the container for everything
class MapViewController: UIViewController {
    
    @IBOutlet weak var mapView: MKMapView!
    
    //constant name and function
    let locationManager = CLLocationManager()
    let uniManager = UniManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //zoom in on map
        //mapView.setCenter(UniManager.coordinate, animated: true)
        
        //tracks user
        mapView.userTrackingMode = .follow
        
        //pop up notification for allowing access
        locationManager.requestAlwaysAuthorization()
        locationManager.delegate = self as? CLLocationManagerDelegate
        locationManager.startUpdatingLocation()
        
        for uni in UniManager.uni {
            locationManager.startMonitoring(for: uni.region)
            mapView.addAnnotation(uni)
        
        //addAnnotation
        
    }
    
}
    
}

//enters and identifies region, shows on mapView
extension MapViewController: CLLocationManagerDelegate {
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        print(locations.last!)
        
    }
    
    //exitsregion
    private func locationManager(_ manager: CLLocationManager, didExitRegion region: CLRegion) {
        
    }
    
}
//brings up the annotation and tells it where to bring it up
extension MapViewController: MKMapViewDelegate {
    
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        
        func locationManager(_ manager: CLLocationManager, didEnterRegion region: CLRegion) {
            for annotation in mapView.annotations {
                if annotation.title == region.identifier {
                    guard let annotationView = mapView.view(for: annotation) as? MKMarkerAnnotationView else { return }
                    annotationView.markerTintColor = .green
                }
            }
        }
        
        
        guard let annotation = annotation as? Uni else { return nil }
        
        let identifier = "marker"
        var view: MKMarkerAnnotationView
        
        if let dequeuedView = mapView.dequeueReusableAnnotationView(withIdentifier: identifier)
            as? MKMarkerAnnotationView {
            dequeuedView.annotation = annotation
            view = dequeuedView
        } else {
            view = MKMarkerAnnotationView(annotation: annotation, reuseIdentifier: identifier)
            view.canShowCallout = true
            view.calloutOffset = CGPoint(x: -5, y: 5)
            view.rightCalloutAccessoryView = UIButton(type: .detailDisclosure)
        }
        
        view.markerTintColor = .purple
        
        return view
    }
    
}

