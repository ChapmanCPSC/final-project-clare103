//
//  Day1VC.swift
//  thegreatest-weatherapp
//
//  Created by David Clare on 5/1/16.
//  Copyright © 2016 David Clare. All rights reserved.
//

import UIKit

class Day1VC: UIViewController {
    
    
    @IBOutlet weak var DayOneCityLbl: UILabel!
    @IBOutlet weak var dayOneDescLbl: UILabel!
    @IBOutlet weak var Day1Img: UIImageView!
    @IBOutlet weak var DayOneDate: UILabel!
    @IBOutlet weak var DayOneHigh: UILabel!
    @IBOutlet weak var DayOneLowLbl: UILabel!
    
    
    
    var _cityName: String = ""
    var _dayOneDesc: String = ""
    var _dayOneImg: UIImage?
    var _dayOneDate: String = ""
    var _dayOneHigh: String = ""
    var _dayOneLow: String = ""
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        swipeRight()
        
        self.navigationController?.navigationBar.translucent = true
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), forBarMetrics: .Default)
        
       
        self.DayOneCityLbl.text = _cityName
        self.dayOneDescLbl.text = _dayOneDesc
        self.Day1Img.image = _dayOneImg
        self.DayOneDate.text = _dayOneDate
        self.DayOneHigh.text = _dayOneHigh
        self.DayOneLowLbl.text = _dayOneLow
        
    }

    
    func swipeRight () {
        
        let swipeR = UISwipeGestureRecognizer(target: self, action: #selector(Day1VC.popToRoot))
        swipeR.direction = UISwipeGestureRecognizerDirection.Right
        self.view.addGestureRecognizer(swipeR)
    }
    
    func popToRoot(){
        self.navigationController?.popViewControllerAnimated(true)
    }
    
    
}
