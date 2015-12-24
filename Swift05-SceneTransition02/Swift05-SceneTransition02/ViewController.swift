//
//  ViewController.swift
//  Swift05-SceneTransition02
//
//  Created by Nebula_MAC on 2015. 12. 23..
//  Copyright © 2015년 Nebula_MAC. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func moveNext(sender: AnyObject) {
        /*
        //스토리보드가 여러개일 경우에
        //번들 리소스에서 스토리보드 파일을 선택하여 UIStoryboard 객체로 생성함
        //let storyboard : UIStoryboard = UIStoryboard(name: "Main", bundle: NSBundle.mainBundle())
        
        //화면을 전환할 뷰 컨트롤러 객체를 스토리보드에서 storybordID 정보를 이용하여 읽어온다.
        let uvc = self.storyboard!.instantiateViewControllerWithIdentifier("SecondVC") //self로 메인에서 불러오는 경우
        //let uvc = storyboard.instantiateViewControllerWithIdentifier("SecondVC")
        
        //화면을 전환할 때 애니메이션 정의
        //uvc.modalTransitionStyle = UIModalTransitionStyle.FlipHorizontal
        uvc.modalTransitionStyle = UIModalTransitionStyle.CoverVertical
        //uvc.modalTransitionStyle = UIModalTransitionStyle.CrossDissolve
        //uvc.modalTransitionStyle = UIModalTransitionStyle.PartialCurl
        
        //인자값으로 받은 뷰 컨트롤러로 화면 전환
        // self.presentViewController(uvc, animated: true, completion: nil)
        */
        
        //위 코드를 옵셔널 비강제 해제 구문으로
        //화면을 전환할 뷰 컨트롤러 객체를 스토리보드에서 storybordID 정보를 이용하여 읽어온다.
        if let uvc = self.storyboard?.instantiateViewControllerWithIdentifier("SecondVC") {
            //화면을 전환할 때 애니메이션 정의
            uvc.modalTransitionStyle = UIModalTransitionStyle.CrossDissolve
            
            //인자값으로 받은 뷰 컨트롤러로 화면 전환
            self.presentViewController(uvc, animated: true, completion: nil)
            
        }
        
    }
    
    @IBAction func moveByNavi(sender: AnyObject) {
        if let uvc = self.storyboard?.instantiateViewControllerWithIdentifier("SecondVC")
        {
            //화면을 전환한다.
            self.navigationController?.pushViewController(uvc, animated: true)
            
        }
    }
    
}