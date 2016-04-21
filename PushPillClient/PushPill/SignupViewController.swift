//
//  SignupViewController.swift
//  PushPill
//
//  Created by Gaeun Kim on 2016. 4. 19..
//  Copyright © 2016 Kim Ga-eun. All rights reserved.
//

import UIKit
import Alamofire
import AlamofireObjectMapper
import SwiftyJSON

class SignupViewController: UIViewController {
    @IBOutlet var emailTextField: UITextField!
    @IBOutlet var passwordTextField: UITextField!
    @IBOutlet var passwordConfirmTextField: UITextField!
    @IBOutlet var nameTextField: UITextField!
    @IBOutlet var ageTextField: UITextField!
    @IBOutlet var signupButton: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func signup() {
        guard let email = emailTextField.text,
            let password = passwordTextField.text,
            let passwordConfirm = passwordConfirmTextField.text,
            let age = ageTextField.text,
            let name = nameTextField.text else {
            return
        }
        let params = [
            "user[email]": email,
            "user[password]": password,
            "user[password_confirmation]": passwordConfirm,
            "user[name]": name,
            "user[age]": age,
            "user[device_token]": device_token
        ]
        Alamofire.request(.POST, "\(Config.baseURL)/users.json", parameters: params)
            .responseJSON { (response) in
                switch response.result {
                case .Success(let jsonData):
                    let json = JSON(jsonData)
                    if let token = json["authentication_token"].string {
                        Config.token = token
                        Config.mode = 1
                        self.performSegueWithIdentifier("UserMain", sender: nil)
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