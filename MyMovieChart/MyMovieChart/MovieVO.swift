//
//  MovieVO.swift
//  MyMovieChart
//
//  Created by Nebula_MAC on 2016. 1. 1..
//  Copyright © 2016년 Nebula_MAC. All rights reserved.
//

import UIKit

class MovieVO {
    
    init() {
        //값의 초기화가 필요한 경우 여기에 작성
    }
    
    //영화 섬네일 이미지 주소
    var thumbnail : String?
    
    //영화 제목
    var title : String?
    
    //영화 설명
    var description : String?
    
    //상세정보
    var detail : String?
    
    //개봉일
    var opendate : String?
    
    //평점
    var rating : Float?
    
    //영화 썸네일 이미지를 담은 UIImage 객체를 추가한다.
    var thumbnailImage : UIImage?
}
