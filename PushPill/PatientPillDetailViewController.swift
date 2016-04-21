//
//  PatientPillDetailViewController.swift
//  PushPill
//
//  Created by Gaeun Kim on 2016. 4. 10..
//  Copyright © 2016 Kim Ga-eun. All rights reserved.
//

import UIKit
import Alamofire
import AlamofireObjectMapper
import SwiftyJSON

class PatientPillDetailViewController: UIViewController {
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
    
    @IBAction func check() {
        guard let pillId = pillId else {
            print("Error")
            return
        }
        Alamofire.request(.GET, "\(Config.baseURL)/api/pills/\(pillId)/check")
            .responseJSON { (response) in
                switch response.result {
                case .Success(let jsonData):
                    let json = JSON(jsonData)
                    if let _ = json["success"].bool {
                        UIAlertView(title: "Alert", message: "Checked!", delegate: nil, cancelButtonTitle: "OK").show()
                    }
                case .Failure(let error):
                    print(error.localizedDescription)
                }
        }
    }
}