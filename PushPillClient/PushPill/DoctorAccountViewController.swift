//
//  DoctorAccountViewController.swift
//  PushPill
//
//  Created by Gaeun Kim on 2016. 4. 10..
//  Copyright © 2016 Kim Ga-eun. All rights reserved.
//

import UIKit
import Alamofire
import AlamofireObjectMapper

class DoctorAccountViewController: UIViewController {
    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var emailLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        getDoctor()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func getDoctor() {
        Alamofire.request(.GET, "\(Config.baseURL)/api/doctor", parameters: ["token": Config.token])
            .responseObject { (response:Response<Doctor, NSError>) in
                switch response.result {
                case .Success(let doctor):
                    self.nameLabel.text = doctor.name
                    self.emailLabel.text = doctor.email
                case .Failure(let error):
                    print(error.localizedDescription)
                }
        }
    }
    
    @IBAction func logout() {
        dismissViewControllerAnimated(true, completion: nil)
    }
}
