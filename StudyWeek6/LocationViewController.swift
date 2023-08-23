//
//  LocationViewController.swift
//  StudyWeek6
//
//  Created by 박다혜 on 2023/08/22.
//

import UIKit
import CoreLocation // 1. 위치 import
import MapKit
import SnapKit

class LocationViewController: UIViewController {

    // 2. 위치 매니저 생성 : 위치에 대한 대부분을 담당
    let locationManager = CLLocationManager()

    let mapView = MKMapView()
    let button1 = UIButton()
    let button2 = UIButton()

    override func viewDidLoad() {
        super.viewDidLoad()

        view.addSubview(mapView)
        mapView.snp.makeConstraints { make in
            make.edges.equalToSuperview().inset(50)
        }

        view.addSubview(button1)
        button1.backgroundColor = .red
        button1.addTarget(self, action: #selector(cafeButtonClicked), for: .touchUpInside)
        button1.snp.makeConstraints { make in
            make.top.equalTo(view).offset(60)
            make.size.equalTo(50)
            make.leading.equalTo(view).offset(60)
        }
        view.addSubview(button2)
        button2.backgroundColor = .blue
        button2.snp.makeConstraints { make in
            make.top.equalTo(view).offset(60)
            make.size.equalTo(50)
            make.trailing.equalTo(view).offset(-60)
        }

        view.backgroundColor = .white

        //3. 위치 프로토콜 연결
        locationManager.delegate = self

        //info.plist <<< 얼럿
        locationManager.requestWhenInUseAuthorization()

        checkDeviceLocationAuthorization()

        let center = CLLocationCoordinate2D(latitude: 37.55150857883287, longitude: 126.98806083901165)
        setResionAndAnnotation(center: center)

        setAnnotation(type: 0)
    }

    @objc func cafeButtonClicked() {
        setAnnotation(type: 1)
        print("clicked")
    }

    func setAnnotation(type: Int) {

        let annotation1 = MKPointAnnotation()
        annotation1.coordinate = CLLocationCoordinate2D(latitude: 37.548877920787966, longitude: 126.99095824230014)

        mapView.removeAnnotation(annotation1)

        let annotation2 = MKPointAnnotation()
        annotation2.coordinate = CLLocationCoordinate2D(latitude: 37.55320160199145, longitude: 126.98145144316429)
        mapView.addAnnotations([annotation1, annotation2])

        if type == 0 {  //viewDidLoad
            mapView.addAnnotations([annotation1, annotation2])
        } else if type == 1 {

            mapView.removeAnnotations(mapView.annotations)
            mapView.addAnnotations([annotation2])
        }
    }

    func setResionAndAnnotation(center: CLLocationCoordinate2D) {

        //지도 중심 기반으로 보여질 범위 설정
        let region = MKCoordinateRegion(center: center, latitudinalMeters: 100, longitudinalMeters: 100)
        mapView.setRegion(region, animated: true)

        //지도에 어노테이션 추가
        let annotation = MKPointAnnotation()
        annotation.title = "남산타워"
        annotation.coordinate = center
        mapView.addAnnotation(annotation)
    }

    func showLocationSettingAlert() {
        let alert = UIAlertController(title: "위치 정보 이용", message: "위치 서비스를 사용할 수 없습니다. 기기의 설정>개인정보 보호 에서 위치 서비스를 켜주세요", preferredStyle: .alert)

        let goSetting = UIAlertAction(title: "설정으로 이동", style: .default) { _ in

            // 설정으로의 경로
            // 설정에서 직접적으로 앱 설정 화면에 들어간 적이 없다면..
            // 한번도 설정 앱에 들어가지 않았거나 막 다운받은 앱이라서..
            // 설정 페이지로 넘어갈지, 설정 상세 페이지로 넘어갈지 결정할수는 없음..
            if let appSetting = URL(string: UIApplication.openSettingsURLString) {
                UIApplication.shared.open(appSetting)
            }
        }

        let cancel = UIAlertAction(title: "취소", style: .cancel)

        alert.addAction(goSetting)
        alert.addAction(cancel)

        present(alert, animated: true)
    }

    func checkDeviceLocationAuthorization() {

        DispatchQueue.global().async {
            //iOS 위치 서비스 활성화 체크
            if CLLocationManager.locationServicesEnabled() {

                // 현재 사용자의 위치 권한 상태를 가져옴
                let authorization: CLAuthorizationStatus

                if #available(iOS 14.0, *) {
                    authorization = self.locationManager.authorizationStatus
                } else {
                    authorization = CLLocationManager.authorizationStatus()
                }

                print(authorization)
                
                DispatchQueue.main.async {
                    self.checkCurrentLocationAuthorization(status: authorization)
                }

            } else {
                print("위치 서비스가 꺼져 있어서 위치 권한 요청을 못합니다")
            }

        }
    }

    func checkCurrentLocationAuthorization(status: CLAuthorizationStatus) {

        print("check", status)
        switch status {
        case .notDetermined:
            locationManager.desiredAccuracy = kCLLocationAccuracyBest   // 정확도
            locationManager.requestWhenInUseAuthorization() // alert
        case .restricted:
            print("restricted")
        case .denied:
            print("denied")
            showLocationSettingAlert()
        case .authorizedAlways:
            print("authorizedAlways")
        case .authorizedWhenInUse:
            print("authorizedWhenInUse")
            //didUpdateLocation 실행
            locationManager.startUpdatingLocation()
        case .authorized:
            print("authorized")
        @unknown default:
            print("default")    // 위치 권한 종류가 더 생길 가능성 대비
        }
    }

}

// 4. 프로토콜 선언
extension LocationViewController: CLLocationManagerDelegate {

    // 5. 사용자의 위치를 성공적으로 가지고 온 경우
    // 한번만 실행되지 않는다, iOS 위치 업데이트가 필요한 시점에 알아서 여러번 호출
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {

        //위경도
        if let coordinate = locations.last?.coordinate {
            print(coordinate)
            setResionAndAnnotation(center: coordinate)
            //날씨 API 호출
        }

        // 가져왔다면 위치 업데이트 멈춰..!
        locationManager.stopUpdatingLocation()
    }

    // 사용자의 위치를 가지고 오지 못한 경우
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        //
    }

    // 사용자의 권한 상태가 바뀔 때를 알려줌
    // 거부했다가 설정에서 변경을 했거나, 혹인 notDetermined 상태에서 허용을 했거나
    // 허용해서 위치를 가지고 오는 도중에, 설정에서 거부를 하고 앱으로 다시 돌아올 때 등
    // iOS14 이상
    func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
        print(#function)
        checkDeviceLocationAuthorization()
    }

    // 사용자의 권한 상태가 바뀔 때를 알려줌
    // iOS14 미만
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        //
    }
}

extension LocationViewController: MKMapViewDelegate {

    func mapView(_ mapView: MKMapView, regionDidChangeAnimated animated: Bool) {
        print(#function)
    }

    func mapView(_ mapView: MKMapView, didSelect annotation: MKAnnotation) {
        print(#function)
    }

//    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
//        <#code#>
//    }

}
