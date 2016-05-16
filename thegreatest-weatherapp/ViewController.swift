//
//  ViewController.swift
//  thegreatest-weatherapp
//
//  Created by David Clare on 3/23/16.
//  Copyright © 2016 David Clare. All rights reserved.
//

import UIKit
import Foundation
import CoreData


extension Double {
    func format(f: String) -> String{
        return String(format: "%\(f)f", self)
    }
}

class ViewController: UIViewController, UISearchBarDelegate, UINavigationControllerDelegate, SecondVCDelegate {

    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var pinImg: UIImageView!
    @IBOutlet weak var cityLbl: UILabel!
    @IBOutlet weak var todayImg: UIImageView!
    @IBOutlet weak var currentTempLbl: UILabel!
    @IBOutlet weak var currentTimeLbl: UILabel!
    @IBOutlet weak var currentDayLbl: UILabel!
    @IBOutlet weak var todayImg2: UIImageView!
    @IBOutlet weak var pressureLbl: UILabel!
    @IBOutlet weak var windSpeedLbl: UILabel!
    @IBOutlet weak var humidityLbl: UILabel!
    @IBOutlet weak var dayOneLbl: UILabel!
    @IBOutlet weak var dayOneImg: ImgExt!
    @IBOutlet weak var dayOneHighLbl: LblExt!
    @IBOutlet weak var dayOneLowLbl: LblExt!
    @IBOutlet weak var dayTwoLbl: UILabel!
    @IBOutlet weak var dayTwoImg: ImgExt!
    @IBOutlet weak var dayTwoHighLbl: LblExt!
    @IBOutlet weak var dayTwoLowLbl: LblExt!
    @IBOutlet weak var dayThreeLbl: UILabel!
    @IBOutlet weak var dayThreeImg: ImgExt!
    @IBOutlet weak var dayThreeHighLbl: UILabel!
    @IBOutlet weak var dayThreeLowLbl: UILabel!
    
    
    func didFinishSecondVC(item: String){
        self._currentCity = item
    }
    
    
    var _dayOneDesc: String = ""
    var _dayOneDate: String = ""
  
    var _dayTwoDesc: String = ""
    var _dayTwoDate: String = ""
  
    var _dayThreeDesc: String = ""
    var _dayThreeDate: String = ""

    private var _currentCity: String?
    
    var currentCity : String {
        set{ _currentCity = newValue}
        get{ return _currentCity!}
    }

    var searchBarText: String?
    var weather: Weather!
    
    
  func configureSearchController() {
        searchBarConfig_full()
        searchBar.setImage(UIImage(named: "01d"), forSearchBarIcon: UISearchBarIcon.Search, state: UIControlState.Normal)
    }
    

    
    func searchBarTextDidBeginEditing(searchBar: UISearchBar) {
        searchBarConfig_empty()
    }
    
    func searchBarTextDidEndEditing(searchBar: UISearchBar) {
        searchBarConfig_full()
        //view.endEditing(true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        searchBar.delegate = self
        
        _currentCity = "Newportbeach"
        
        configureSearchController()
        tap1()
        updateUI()
       
        self.navigationController?.navigationBar.translucent = true
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), forBarMetrics: .Default)
        
        }
    
    override func viewDidAppear(animated: Bool) {
        updateUI()
    }
    
    
    
    func updateUI(){
        let weather = Weather(cityName: currentCity)
        
        weather.downloadWeatherDetails { () -> () in
        self.todayImg.image = UIImage(named: weather.icon)
        self.cityLbl.text = "\(weather.cityName.capitalizedString), \(weather.countryName)"
        self.currentTempLbl.text = "\(weather.temperature)\u{00B0}F"
        self.currentTimeLbl.text = "\(weather.time)"
        self.currentDayLbl.text = weather.today
        self.pressureLbl.text = "\(weather.pressure.format(".1")) psi"
        self.windSpeedLbl.text = "\(weather.windSpeed) m/s"
        self.humidityLbl.text = "\(weather.humidity) %"
        self.dayOneLbl.text = "\(weather.dayOneName)"
        self.dayOneImg.image = UIImage(named: weather.dayOneIcon)
        self.dayOneHighLbl.text = "\(weather.dayOneMaxTemp)\u{00B0}F"
        self.dayOneLowLbl.text = "\(weather.dayOneMinTemp)\u{00B0}F"
        self.dayTwoLbl.text = "\(weather.dayTwoName)"
        self.dayTwoImg.image = UIImage(named: weather.dayTwoIcon)
        self.dayTwoHighLbl.text = "\(weather.dayTwoMaxTemp)\u{00B0}F"
        self.dayTwoLowLbl.text = "\(weather.dayTwoMinTemp)\u{00B0}F"
        self.dayThreeLbl.text = "\(weather.dayThreeName)"
        self.dayThreeImg.image = UIImage(named: weather.dayThreeIcon)
        self.dayThreeHighLbl.text = "\(weather.dayThreeMaxTemp)\u{00B0}F"
        self.dayThreeLowLbl.text = "\(weather.dayThreeMinTemp)\u{00B0}F"
            
        self._dayOneDesc = weather.dayOneDesc
        self._dayOneDate = weather.dayOneName2
            
        self._dayTwoDesc = weather.dayTwoDesc
        self._dayTwoDate = weather.dayTwoName2
        
        self._dayThreeDesc = weather.dayThreeDesc
        self._dayThreeDate = weather.dayThreeName2
    
        }

    }

    
    func tap1 () {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(ViewController.dismissKeyboard))
        view.addGestureRecognizer(tap)

    }
    
    func searchBarSearchButtonClicked(searchBar: UISearchBar) {
            currentCity = searchBar.text!.stringByReplacingOccurrencesOfString(" ", withString: "") + ",us"
            updateUI()
            dismissKeyboard()
        
    }
    
    func dismissKeyboard(){
        searchBar.resignFirstResponder()
        view.endEditing(true)
    }
    
    func searchBarConfig_full(){
        for subView in self.searchBar.subviews {
            for subsubView in subView.subviews {
                if let textField = subsubView as? UITextField {
                    textField.attributedPlaceholder = NSAttributedString(string: NSLocalizedString("Search any city in the US", comment: ""), attributes: [NSForegroundColorAttributeName: UIColor.whiteColor()])
                    textField.textColor = UIColor.whiteColor()
                }
                
            }
        }

    }
    
    func searchBarConfig_empty(){
        for subView in self.searchBar.subviews {
            for subsubView in subView.subviews {
                if let textField = subsubView as? UITextField {
                    textField.attributedPlaceholder = NSAttributedString(string: NSLocalizedString("", comment: ""), attributes: [NSForegroundColorAttributeName: UIColor.whiteColor()])
                    textField.textColor = UIColor.whiteColor()
                }
                
            }
        }
        
    }

    func displayAnimation() {
        var timer = NSTimer.scheduledTimerWithTimeInterval(2.0, target: self, selector: #selector(ViewController.moveToMain), userInfo: nil, repeats: false)
    }
    
    
    @IBOutlet weak var logo: UIImageView!
    
    func moveToMain() {
        UIView.animateWithDuration(2){
            self.logo.alpha = 0
        }
    }
    
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "Day1Segue" {
            let nextVC =  segue.destinationViewController as? Day1VC
            nextVC!._cityName = self.cityLbl.text!
            nextVC!._dayOneDate = self._dayOneDate
            nextVC!._dayOneDesc = self._dayOneDesc
            nextVC!._dayOneHigh = self.dayOneHighLbl.text!
            nextVC!._dayOneLow = self.dayOneLowLbl.text!
            nextVC!._dayOneImg = self.dayOneImg.image
        }
        if segue.identifier == "Day2Segue" {
            let nextVC =  segue.destinationViewController as? Day2VC
            nextVC!._cityName = self.cityLbl.text!
            nextVC!._dayTwoDate = self._dayTwoDate
            nextVC!._dayTwoDesc = self._dayTwoDesc
            nextVC!._dayTwoHigh = self.dayTwoHighLbl.text!
            nextVC!._dayTwoLow = self.dayTwoLowLbl.text!
            nextVC!._dayTwoImg = self.dayTwoImg.image
        }
        if segue.identifier == "Day3Segue" {
            let nextVC =  segue.destinationViewController as? Day3VC
            nextVC!._cityName = self.cityLbl.text!
            nextVC!._dayThreeDate = self._dayThreeDate
            nextVC!._dayThreeDesc = self._dayThreeDesc
            nextVC!._dayThreeHigh = self.dayThreeHighLbl.text!
            nextVC!._dayThreeLow = self.dayThreeLowLbl.text!
            nextVC!._dayThreeImg = self.dayThreeImg.image
        }
        
        if segue.identifier == "SaveSegue" {
            
            if let cityTitle = self.cityLbl.text {
                let app = UIApplication.sharedApplication().delegate as! AppDelegate
                let context = app.managedObjectContext
                let entity = NSEntityDescription.entityForName("City", inManagedObjectContext: context)!
                let city = City(entity: entity, insertIntoManagedObjectContext: context)
                city.cityName = cityTitle
                
                context.insertObject(city)
                
                do{
                    try context.save()
                }
                catch{
                    print("could not save city")
                }
                
                
            }
            
        }


    }
    

}
    
        
    

