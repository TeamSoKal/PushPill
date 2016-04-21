//
//  DoctorSigninViewController.swift
//  PushPill
//
//  Created by Gaeun Kim on 2016. 4. 19..
//  Copyright © 2016 Kim Ga-eun. All rights reserved.
//

import UIKit
import Alamofire
import AlamofireObjectMapper
import SwiftyJSON

class DoctorSigninViewController: UIViewController {
    
    @IBOutlet var emailTextField: UITextField!
    @IBOutlet var passwordTextField: UITextField!
    @IBOutlet var signinButton: UIButton!
    @IBOutlet var patientButton: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func signinButtonTouch() {
        guard let email = emailTextField.text, let password = passwordTextField.text else {
            return
        }
        let params = [
            "doctor[email]": email,
            "doctor[password]": password
        ]
        Alamofire.request(.POST, "\(Config.baseURL)/doctor/sign_in", parameters: params)
            .responseJSON { (response) in
                switch response.result {
                case .Success(let jsonData):
                    let json = JSON(jsonData)
                    if let success = json["success"].bool {
                        if success == true {
                            Config.token = json["token"].string!
                            Config.mode = 2
                            self.performSegueWithIdentifier("DoctorMain", sender: nil)
                        }
                    }
                case .Failure(let error):
                    UIAlertView(title: nil, message: "Invalid email or password", delegate: nil, cancelButtonTitle: "Cancel").show()
                    print(error.localizedDescription)
                }
            }
    }
    
    @IBAction func patientButtonTouch() {
        dismissViewControllerAnimated(true, completion: nil)
    }

}
