//
//  ViewController.swift
//  ImagerPickerPractice
//
//  Created by Nebula_MAC on 2015. 12. 31..
//  Copyright © 2015년 Nebula_MAC. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

        @IBOutlet var imgView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func pick(sender: AnyObject) {
        
        //이미지 피커 컨트롤러 인스턴스 생성
        let picker = UIImagePickerController()
        
        //사진 라이브러리 소스를 선택
        picker.sourceType = UIImagePickerControllerSourceType.PhotoLibrary
        //수정 가능 옵션
        picker.allowsEditing = true
        //델리게이트 지정
        picker.delegate = self
        
        //화면에 표시
        self.presentViewController(picker, animated: false, completion: nil)
    }

    @IBAction func takePick(sender: AnyObject) {
        //이미지 피커 컨트롤러 인스턴스 생성
        let picker = UIImagePickerController()
        
        //사진 라이브러리 소스를 선택
        picker.sourceType = UIImagePickerControllerSourceType.Camera
        //수정 가능 옵션
        picker.allowsEditing = true
        //델리게이트 지정
        picker.delegate = self
        
        //화면에 표시
        self.presentViewController(picker, animated: false, completion: nil)

    }
    
    
    func imagePickerController(picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : AnyObject]) {
        //이미지 피커 컨트롤러 창 닫기
        picker.dismissViewControllerAnimated(false, completion: nil)
        //이미지를 이미지 뷰에 표시
        self.imgView.image = info[UIImagePickerControllerOriginalImage] as? UIImage
    }
    
    func imagePickerControllerDidCancel(picker: UIImagePickerController) {
        //이미지 피커 컨트롤러 창 닫기
        picker.dismissViewControllerAnimated(false, completion: nil)
        
        //알림창 호출
        let alert = UIAlertController(title: "", message: "실행이 취소되었습니다.", preferredStyle: .Alert)
        alert.addAction(UIAlertAction(title: "확인", style: .Cancel, handler: nil))
        
        self.presentViewController(alert, animated: false, completion: nil)
        
    }
    
}

