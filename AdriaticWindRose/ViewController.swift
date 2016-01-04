import UIKit
import CoreLocation

extension Double {
    var degreesToRadians: CGFloat {
        return CGFloat(self) * CGFloat(M_PI) / 180.0
    }
}

class ViewController: UIViewController, CLLocationManagerDelegate {
    
    @IBOutlet weak var image: UIImageView!
    var locationManager:CLLocationManager!
    
    // MARK: - View lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        locationManager = CLLocationManager()
        locationManager.delegate = self
        locationManager.startUpdatingHeading()
    }
    
    // MARK: - Image
    
    func updateImageAngle(degree degree: Double) {
        UIView.animateWithDuration(
            0.25,
            delay: 0,
            options: UIViewAnimationOptions.CurveEaseOut,
            animations: {
                self.image.transform = CGAffineTransformMakeRotation(-degree.degreesToRadians)
            },
            completion: { finish in }
        )
    }
    
    // MARK: - CLLocationManagerDelegate
    
    func locationManager(manager: CLLocationManager, didUpdateHeading newHeading: CLHeading) {
        self.updateImageAngle(degree: Double(newHeading.magneticHeading))
    }
    
}