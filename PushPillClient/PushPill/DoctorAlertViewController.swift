//
//  DoctorAlertViewController.swift
//  PushPill
//
//  Created by Gaeun Kim on 2016. 4. 10..
//  Copyright © 2016 Kim Ga-eun. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class DoctorAlertViewController: UIViewController {
    
    @IBOutlet var textView: UITextView!
    var userId: Int?

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func send() {
        guard let userId = userId else { return }
        Alamofire.request(.POST, "\(Config.baseURL)/api/patients/\(userId)/push")
        .responseJSON { (response) in
            switch response.result {
            case .Success(let jsonData):
                let json = JSON(jsonData)
                if let _ = json["success"].bool {
                    UIAlertView(title: "Alert", message: "Message sent successfully", delegate: nil, cancelButtonTitle: nil).show()
                }
            case .Failure(let error):
                print(error.localizedDescription)
            }
        }
    }
}
