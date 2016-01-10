//
//  TheaterViewController.swift
//  MyMovieChart
//
//  Created by Nebula_MAC on 2016. 1. 8..
//  Copyright © 2016년 Nebula_MAC. All rights reserved.
//

import UIKit
import MapKit

class TheaterViewController : UIViewController {
    //전달되는 데이터를 받을 변수
    var param : NSDictionary?
    
    @IBOutlet var map: MKMapView!

    @IBOutlet var navibar: UINavigationItem!
    
    override func viewDidLoad() {
        //내비게이션 타이틀에 영화관명 표시
        navibar.title = param?["상영관명"] as? String
    
        //위도와 경도를 추출하여 Double 값으로 캐스팅
        let lat = (param?["위도"] as! NSString).doubleValue
        let lng = (param?["경도"] as! NSString).doubleValue
        
        //위도와 경도를 인스로 하는 2D 위치 정보 객체 정의
        let location = CLLocationCoordinate2D(latitude: lat, longitude: lng)
        
        //지도에 표현될 거리: 값의 단위는 m
        let regionRadius : CLLocationDistance = 100
        
        //거리를 반영한 지역 정보를 조합한 지도 데이터를 생성
        let coordinateRegion = MKCoordinateRegionMakeWithDistance(location, regionRadius, regionRadius)
        
        //map 변수에 연결된 지도 객체에 데이터를 전달하여 화면에 표시
        self.map.setRegion(coordinateRegion, animated: true)
        
        //위치를 표시해줄 객체를 생성하고, 앞에서 작성해준 위치값 객체를 할당
        let point = MKPointAnnotation()
        point.coordinate = location
        
        //위치 표현값을 추가
        self.map.addAnnotation(point)
    }
}
