//
//  ViewController.swift
//  OnboardPractice
//
//  Created by 田澤歩 on 2020/12/24.
//

import UIKit
import EAIntroView


class ViewController: UIViewController, EAIntroDelegate {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tutoriau()
        
        print("起動")
    }
    
    func tutoriau() {
        let page1 = EAIntroPage()
        page1.title = "ページ1"
        page1.desc = "こんにちは"
        page1.bgImage = UIImage(named: "IMG_1940.jpeg")
        let page2 = EAIntroPage()
        page2.title = "ページ2"
        page2.desc = "こんばんは"
        page2.bgImage = UIImage(named: "IMG_1940.jpeg")

        let page3 = EAIntroPage()
        page3.title = "ページ3"
        page3.desc = "おやすみ"
        page3.bgImage = UIImage(named: "IMG_1940.jpeg")
        page3.titleFont = UIFont(name: "Helvetica-Bold", size: 32)
        page3.titleColor = UIColor.orange
        page3.descPositionY = self.view.bounds.size.height/2
        
        let introView = EAIntroView(frame: self.view.bounds, andPages: [page1, page2, page3])
        introView?.skipButton.setTitle("スキップ", for: UIControl.State.normal) //スキップボタン欲しいならここで実装！
        introView?.delegate = self
        introView?.show(in: self.view, animateDuration: 1.0)
    }

}
