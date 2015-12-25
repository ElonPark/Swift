//
//  NewSegue.swift
//  Swift05-SceneTransition04
//
//  Created by Nebula_MAC on 2015. 12. 25..
//  Copyright © 2015년 Nebula_MAC. All rights reserved.
//

import UIKit

class NewSegue : UIStoryboardSegue{
    //세그웨이를 실행할 때 호출되는 메소드
    override func perform() {
        //세그웨이의 출발지 뷰 컨트롤러
        let srcUVC = self.sourceViewController
        
        //세그웨이의 목적지 뷰 컨트롤러
        let destUVC = self.destinationViewController
        
        //fromView에서 toView로 뷰를 전환한다.
        UIView.transitionFromView(srcUVC.view, toView: destUVC.view, duration: 2, options: UIViewAnimationOptions.TransitionCurlDown, completion: nil)
    }//func perform
}
