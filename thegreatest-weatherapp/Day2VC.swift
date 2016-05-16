//
//  Day2VC.swift
//  thegreatest-weatherapp
//
//  Created by David Clare on 5/1/16.
//  Copyright © 2016 David Clare. All rights reserved.
//

import UIKit

class Day2VC: UIViewController {

    
    
    @IBOutlet weak var Day2City: UILabel!
    @IBOutlet weak var Day2Desc: UILabel!
    @IBOutlet weak var Day2Img: UIImageView!
    @IBOutlet weak var Day2Date: UILabel!
    @IBOutlet weak var Day2HighLbl: UILabel!
    @IBOutlet weak var Day2LowLbl: UILabel!
    
    var weather: Weather!
    
    var _cityName: String = ""
    var _dayTwoDesc: String = ""
    var _dayTwoImg: UIImage?
    var _dayTwoDate: String = ""
    var _dayTwoHigh: String = ""
    var _dayTwoLow: String = ""

    
    override func viewDidLoad() {
        super.viewDidLoad()

        swipeRight()
        
        self.navigationController?.navigationBar.translucent = true
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), forBarMetrics: .Default)
        
        Day2City.text = _cityName
        Day2Desc.text = _dayTwoDesc
        Day2Img.image = _dayTwoImg
        Day2Date.text = _dayTwoDate
        Day2HighLbl.text = _dayTwoHigh
        Day2LowLbl.text = _dayTwoLow
        
    }

    
    func swipeRight () {
        
        let swipeR = UISwipeGestureRecognizer(target: self, action: #selector(Day2VC.popToRoot))
        swipeR.direction = UISwipeGestureRecognizerDirection.Right
        self.view.addGestureRecognizer(swipeR)
    }
    
    func popToRoot(){
        self.navigationController?.popViewControllerAnimated(true)
    }
    
    
}
