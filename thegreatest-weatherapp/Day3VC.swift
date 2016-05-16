//
//  Day3VC.swift
//  thegreatest-weatherapp
//
//  Created by David Clare on 5/1/16.
//  Copyright © 2016 David Clare. All rights reserved.
//

import UIKit

class Day3VC: UIViewController {
    
    
    
    
    @IBOutlet weak var day3CityLbl: UILabel!
    @IBOutlet weak var day3DescLbl: UILabel!
    @IBOutlet weak var day3Img: UIImageView!
    @IBOutlet weak var day3Date: UILabel!
    
    @IBOutlet weak var day3HighLbl: UILabel!
    @IBOutlet weak var Day3LowLbl: UILabel!
    
    var weather: Weather!
    
    var _cityName: String = ""
    var _dayThreeDesc: String = ""
    var _dayThreeImg: UIImage?
    var _dayThreeDate: String = ""
    var _dayThreeHigh: String = ""
    var _dayThreeLow: String = ""

    

    override func viewDidLoad() {
        super.viewDidLoad()

        swipeRight()
        
        self.navigationController?.navigationBar.translucent = true
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), forBarMetrics: .Default)
        
        day3CityLbl.text = _cityName
        day3DescLbl.text = _dayThreeDesc
        day3Img.image = _dayThreeImg
        day3Date.text = _dayThreeDate
        day3HighLbl.text = _dayThreeHigh
        Day3LowLbl.text = _dayThreeLow
        
        
        
    }

    
    func swipeRight () {
        
        let swipeR = UISwipeGestureRecognizer(target: self, action: #selector(Day3VC.popToRoot))
        swipeR.direction = UISwipeGestureRecognizerDirection.Right
        self.view.addGestureRecognizer(swipeR)
    }
    
    func popToRoot(){
        self.navigationController?.popViewControllerAnimated(true)
    }
    
    
}
