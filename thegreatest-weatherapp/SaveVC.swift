//
//  SaveVC.swift
//  thegreatest-weatherapp
//
//  Created by Ross Clare on 5/15/16.
//  Copyright © 2016 David Clare. All rights reserved.
//

import UIKit
import CoreData


protocol SecondVCDelegate {
    func didFinishSecondVC(item: String)
}


class SaveVC: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    
    @IBOutlet weak var tableView: UITableView!
    
    var citys = [City]()
    var fetchedResultsController: NSFetchedResultsController!
    
    var delegate: SecondVCDelegate?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        swipeRight()
    
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    override func viewDidAppear(animated: Bool) {
        
        fetchAndSetResults()
        tableView.reloadData()
    }
    
    func fetchAndSetResults(){
        let app = UIApplication.sharedApplication().delegate as! AppDelegate
        let context = app.managedObjectContext
        let fetchReuqest = NSFetchRequest(entityName: "City")
        
        
        do{
            let results = try context.executeFetchRequest(fetchReuqest)
            self.citys = results as! [City]
        }catch let err as NSError {
            print(err.debugDescription)
        }
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        if let cell = tableView.dequeueReusableCellWithIdentifier("SaveCell") as? SaveCell {
            let city = citys[indexPath.row]
            cell.configureCell(city)
            return cell
        }else {
            return SaveCell()
        }
        
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return citys.count
    }
    
    
    func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        switch editingStyle{
            
        case.Delete:
            let app = UIApplication.sharedApplication().delegate as! AppDelegate
            let context = app.managedObjectContext
            context.deleteObject(citys[indexPath.row] as NSManagedObject)
            citys.removeAtIndex(indexPath.row)
            
            do{
                try context.save()
            }
            catch{
                print("could not save")
            }
            self.tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        default:
            return
            
        }
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
       
        
        var replaced = citys[indexPath.row].cityName!.stringByReplacingOccurrencesOfString(" ", withString: "")
        replaced = replaced.stringByReplacingOccurrencesOfString(",US", withString: "")
       
        let a = self.navigationController!.viewControllers.first as! ViewController
        a.currentCity = replaced
        popToRoot()
 
    }
    
    func swipeRight () {
        
        let swipeR = UISwipeGestureRecognizer(target: self, action: #selector(SaveVC.popToRoot))
        swipeR.direction = UISwipeGestureRecognizerDirection.Right
        self.view.addGestureRecognizer(swipeR)
    }
    
    func popToRoot(){
        self.navigationController?.popViewControllerAnimated(true)
    }
    
       
    
    
}
