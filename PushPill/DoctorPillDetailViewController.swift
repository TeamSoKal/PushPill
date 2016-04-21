//
//  DoctorPillDetailViewController.swift
//  PushPill
//
//  Created by LeeSunhyoup on 2016. 4. 10..
//  Copyright © 2016년 Kim Ga-eun. All rights reserved.
//

import UIKit
import Alamofire
import AlamofireObjectMapper
import SwiftyJSON

class DoctorPillDetailViewController: UIViewController {
    @IBOutlet var imageView: UIImageView!
    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var numberLabel: UILabel!
    @IBOutlet var daysOfWeekLabel: UILabel!
    @IBOutlet var notesLabel: UILabel!
    
    var userId: Int?
    var pillId: Int?

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        getPill()
    }
    
    func getPill() {
        guard let pillId = pillId else {
            print("Error")
            return
        }
        Alamofire.request(.GET, "\(Config.baseURL)/api/pills/\(pillId)")
            .responseObject { (response: Response<Pill, NSError>) in
                switch response.result {
                case .Success(let pill):
                    if let name = pill.name {
                        self.nameLabel.text = "Name : \(name)"
                    }
                    if let number = pill.number {
                        self.numberLabel.text = "Number : \(number)"
                    }
                    if let daysOfWeek = pill.daysOfWeek {
                        self.daysOfWeekLabel.text = "Days of week : \(daysOfWeek)"
                    }
                    if let imagePath = pill.imagePath {
                        self.imageView.sd_setImageWithURL(NSURL(string: "\(Config.baseURL)/\(imagePath)"), placeholderImage: UIImage(named: "PillPlaceholder")!)
                    } else {
                        self.imageView.image = UIImage(named: "PillPlaceholder")!
                    }
                    self.notesLabel.text = pill.notes
                case .Failure(let error):
                    print(error.localizedDescription)
                }
        }
    }
    
    @IBAction func removePill() {
        guard let pillId = pillId else {
            print("Error")
            return
        }
        
        let alertController = UIAlertController(title: "Alert", message: "Do you want to delete this item?", preferredStyle: .Alert)
        
        alertController.addAction(UIAlertAction(title: "Yes", style: .Default, handler: { (alert) in
            Alamofire.request(.DELETE, "\(Config.baseURL)/api/pills/\(pillId)")
                .responseJSON { (response) in
                    switch response.result {
                    case .Success(let jsonData):
                        let json = JSON(jsonData)
                        if let _ = json["success"].bool {
                            self.navigationController?.popViewControllerAnimated(true)
                        }
                    case .Failure(let error):
                        print(error.localizedDescription)
                    }
            }
            alertController.dismissViewControllerAnimated(true, completion: nil)
        }))
        
        alertController.addAction(UIAlertAction(title: "No", style: .Default, handler: { (alert) in
            alertController.dismissViewControllerAnimated(true, completion: nil)
        }))
        
        presentViewController(alertController, animated: true, completion: nil)
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        guard let identifier = segue.identifier else { return }
        switch identifier {
        case "PillModify":
            let controller = (segue.destinationViewController as? UINavigationController)?.visibleViewController as? DoctorPillModifyViewController
            controller?.userId = userId
            controller?.pillId = pillId
        default:
            return
        }
    }
}
