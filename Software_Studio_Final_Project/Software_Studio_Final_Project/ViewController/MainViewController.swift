import UIKit
import MapKit
class MainViewController: UIViewController, CLLocationManagerDelegate {

    // Map 관련 Outlet
    @IBOutlet weak var myMap: MKMapView!
    @IBOutlet weak var lblLocationInfo1: UILabel!
    @IBOutlet weak var lblLocationInfo2: UILabel!
    @IBOutlet weak var headerView: UIView!
    
    let locationManager = CLLocationManager()
    
    @IBOutlet weak var homeBtn: UIButton!
    
    let maxHeight: CGFloat = 100.0 //headerView의 최대 높이값
    let minHeight: CGFloat = 100.0 //headerView의 최소 높이값
    
    // Home 버튼 액션
    @IBAction func onHomeBtnClicked(_ sender: Any) {
        
    }
    
    // Chat 버튼 액션
    @IBAction func onChatBtnClicked(_ sender: Any) {
        
    }
    
    // MyPage 버튼 액션
    @IBAction func onMyPageBtnClicked(_ sender: Any) {
        
        // 마이페이지 화면 present
        let sb = UIStoryboard(name: "Main", bundle: nil)
        let vc = sb.instantiateViewController(withIdentifier: "MyPageViewController") as! MyPageViewController
        vc.signInDelegate = self.signInDelegate
        self.present(vc, animated: true, completion: nil)
    }
    
    // 상품 버튼 액션
    @IBAction func onProductBtnClicked(_ sender: Any) {
        
        let sb = UIStoryboard(name: "Main", bundle: nil)
        let tv = sb.instantiateViewController(withIdentifier: "ProductsViewController") as! ProductsViewController
        self.present(tv, animated: true, completion: nil)
        
    }
    
    var signInDelegate: SignInDelegate?
    
    override func viewDidLoad() {
        self.homeBtn.isSelected = true
        
        lblLocationInfo1.text = ""
        lblLocationInfo2.text = ""
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.requestWhenInUseAuthorization()
        locationManager.startUpdatingLocation()
        myMap.showsUserLocation = true
    }
    
    func goLocation(latitudeValue: CLLocationDegrees,
                    longtudeValue: CLLocationDegrees,
                    delta span: Double) -> CLLocationCoordinate2D {
        let pLocation = CLLocationCoordinate2DMake(latitudeValue, longtudeValue)
        let spanValue = MKCoordinateSpan(latitudeDelta: span, longitudeDelta: span)
        let pRegion = MKCoordinateRegion(center: pLocation, span: spanValue)
        myMap.setRegion(pRegion, animated: true)
        return pLocation
    }
    
    func setAnnotation(latitudeValue: CLLocationDegrees,
                       longitudeValue: CLLocationDegrees,
                       delta span :Double,
                       title strTitle: String,
                       subtitle strSubTitle:String){
        let annotation = MKPointAnnotation()
        annotation.coordinate = goLocation(latitudeValue: latitudeValue, longtudeValue: longitudeValue, delta: span)
        annotation.title = strTitle
        annotation.subtitle = strSubTitle
        myMap.addAnnotation(annotation)
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        let pLocation = locations.last
        _ = goLocation(latitudeValue: (pLocation?.coordinate.latitude)!,
                   longtudeValue: (pLocation?.coordinate.longitude)!,
                   delta: 0.01)
        CLGeocoder().reverseGeocodeLocation(pLocation!, completionHandler: {(placemarks, error) -> Void in
            let pm = placemarks!.first
            let country = pm!.country
            var address: String = ""
            if country != nil {
                address = country!
            }
            if pm!.locality != nil {
                address += " "
                address += pm!.locality!
            }
            if pm!.thoroughfare != nil {
                address += " "
                address += pm!.thoroughfare!
            }
            self.lblLocationInfo1.text = "현재 위치"
            self.lblLocationInfo2.text = address
        })
        locationManager.stopUpdatingLocation()
    }
    
    @IBAction func sgChangeLocation(_ sender: UISegmentedControl) {
        if sender.selectedSegmentIndex == 0 {
                    // "현재 위치" 선택 - 현재 위치 표시
                    self.lblLocationInfo1.text = ""
                    self.lblLocationInfo2.text = ""
                    locationManager.startUpdatingLocation()
                } else if sender.selectedSegmentIndex == 1 {
                    // "냉정캠퍼스" 선택 - 핀을 설치하고 위치 정보 표시
                    setAnnotation(latitudeValue: 35.14401208395857, longitudeValue: 129.01055949812945, delta: 0.1, title: "동서대학교 냉정캠퍼스", subtitle: "부산광역시 사상구 주례2동 주례로 47")
                    self.lblLocationInfo1.text = "보고 계신 위치"
                    self.lblLocationInfo2.text = "동서대학교 냉정캠퍼스"
                } else if sender.selectedSegmentIndex == 2 {
                    // "센텀캠퍼스" 선택 - 핀을 설치하고 위치 정보 표시
                    setAnnotation(latitudeValue: 35.173305898738796, longitudeValue: 129.12765999813007, delta: 0.1, title: "동서대학교 센텀캠퍼스", subtitle: "부산광역시 해운대구 우동 센텀중앙로 55")
                               self.lblLocationInfo1.text = "보고 계신 위치"
                               self.lblLocationInfo2.text = "동서대학교 센텀캠퍼스"
                }
    }
}

