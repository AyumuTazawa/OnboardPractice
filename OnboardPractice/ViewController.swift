//
//  ViewController.swift
//  OnboardPractice
//
//  Created by 田澤歩 on 2020/12/24.
//

import UIKit
import EAIntroView
import Instructions

class ViewController: UIViewController, EAIntroDelegate {
    
    @IBOutlet weak var button: UIButton!
    var coachController = CoachMarksController()
    private var pointOfInterest:UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tutoriau()
        self.coachController.dataSource = self
        print("起動")
      
        self.pointOfInterest = self.button
        

            
    }
    
    override func viewDidAppear(_ animated: Bool) {
            super.viewDidAppear(animated)
            self.coachController.start(in: .currentWindow(of: self))
        }
    
    
    
    func tutoriau() {
        let page1 = EAIntroPage()
        page1.title = "ページ1"
        page1.desc = "こんにちは"
        page1.bgImage = UIImage(named: "image12.png")
        let page2 = EAIntroPage()
        page2.title = "ページ2"
        page2.desc = "こんばんは"
        page2.bgImage = UIImage(named: "image11.png")

        let page3 = EAIntroPage()
        page3.title = "ページ3"
        page3.desc = "おやすみ"
        page3.bgImage = UIImage(named: "AchievementCounter_1242_2208_3.jpg")
        page3.titleFont = UIFont(name: "Helvetica-Bold", size: 32)
        page3.titleColor = UIColor.orange
        page3.descPositionY = self.view.bounds.size.height/2
        
        let introView = EAIntroView(frame: self.view.bounds, andPages: [page1, page2, page3])
        introView?.skipButton.setTitle("スキップ", for: UIControl.State.normal)
        introView?.delegate = self
        introView?.show(in: self.view, animateDuration: 1.0)
    }

}

extension ViewController:CoachMarksControllerDataSource, CoachMarksControllerDelegate{
    func coachMarksController(_ coachMarksController: CoachMarksController, coachMarkViewsAt index: Int, madeFrom coachMark: CoachMark) -> (bodyView: (UIView & CoachMarkBodyView), arrowView: (UIView & CoachMarkArrowView)?) {
        let coachViews = coachMarksController.helper.makeDefaultCoachViews(withArrow: true, withNextText: true, arrowOrientation: coachMark.arrowOrientation)
        coachViews.bodyView.hintLabel.text = "ボタン"
        coachViews.bodyView.nextLabel.text = "OK"
        return (bodyView: coachViews.bodyView, arrowView: coachViews.arrowView)
    }
    
    func numberOfCoachMarks(for coachMarksController: CoachMarksController) -> Int {
        return 1
    }

    func coachMarksController(_ coachMarksController: CoachMarksController,
                                  coachMarkAt index: Int) -> CoachMark {
        return coachMarksController.helper.makeCoachMark(for: pointOfInterest)
    }
}
