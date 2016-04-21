//
//  DoctorSignupViewController.swift
//  PushPill
//
//  Created by Gaeun Kim on 2016. 4. 19..
//  Copyright © 2016 Kim Ga-eun. All rights reserved.
//

import UIKit
import Alamofire
import AlamofireObjectMapper
import SwiftyJSON

class DoctorSignupViewController: UIViewController {
    @IBOutlet var emailTextField: UITextField!
    @IBOutlet var passwordTextField: UITextField!
    @IBOutlet var passwordConfirmTextField: UITextField!
    @IBOutlet var nameTextField: UITextField!
    @IBOutlet var signupButton: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func signup() {
        guard let email = emailTextField.text,
            let password = passwordTextField.text,
            let passwordConfirm = passwordConfirmTextField.text,
        let name = nameTextField.text else {
                return
        }
        let params = [
            "doctor[email]": email,
            "doctor[password]": password,
            "doctor[password_confirmation]": passwordConfirm,
            "doctor[name]": name
        ]
        Alamofire.request(.POST, "\(Config.baseURL)/doctor.json", parameters: params)
            .responseJSON { (response) in
                switch response.result {
                case .Success(let jsonData):
                    let json = JSON(jsonData)
                    print(json.description)
                    if let token = json["authentication_token"].string {
                        Config.token = token
                        Config.mode = 2
                        self.performSegueWithIdentifier("DoctorMain", sender: nil)
                    }
                case .Failure(let error):
                    UIAlertView(title: nil, message: "Invalid email or password", delegate: nil, cancelButtonTitle: "Cancel").show()
                    print(error.localizedDescription)
                }
        }
    }
    
    @IBAction func cancel() {
        dismissViewControllerAnimated(true, completion: nil)
    }
}