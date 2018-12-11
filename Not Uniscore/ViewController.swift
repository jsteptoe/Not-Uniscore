import UIKit
import MapKit
import Firebase


class MapViewController: UIViewController {
    @IBOutlet weak var mapView: MKMapView!
    
    let locationManager = CLLocationManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //zoom in on map
        mapView.setCenter(clubManager.clubs [0].coordinate, animated: true)
        
        mapView.userTrackingMode = .follow
        
        locationManager.requestAlwaysAuthorization()
        locationManager.delegate = self
        locationManager.startUpdatingLocation()
        
        
        
    }
    
}


extension MapViewController: CLLocationManagerDelegate {
    
    
    
    
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        print(locations.last!)
        
    }
    
    
    private func locationManager(_ manager: CLLocationManager, didExitRegion region: CLRegion) {
        
    }
    
}

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
