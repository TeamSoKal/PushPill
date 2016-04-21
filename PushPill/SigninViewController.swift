//
//  SigninViewController.swift
//  PushPill
//
//  Created by LeeSunhyoup on 2016. 4. 10..
//  Copyright © 2016년 Kim Ga-eun. All rights reserved.
//

import UIKit
import Alamofire
import AlamofireObjectMapper
import SwiftyJSON

class SigninViewController: UIViewController {
    
    @IBOutlet var emailTextField: UITextField!
    @IBOutlet var passwordTextField: UITextField!
    @IBOutlet var signinButton: UIButton!
    @IBOutlet var doctorButton: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func signinButtonTouch() {
        guard let email = emailTextField.text, let password = passwordTextField.text else {
            return
        }
        let params = [
            "user[email]": email,
            "user[password]": password,
            "user[device_token]": device_token
        ]
        Alamofire.request(.POST, "\(Config.baseURL)/users/sign_in", parameters: params)
            .responseJSON { (response) in
                switch response.result {
                case .Success(let jsonData):
                    let json = JSON(jsonData)
                    if let success = json["success"].bool {
                        if success == true {
                            Config.token = json["token"].string!
                            Config.mode = 1
                            self.performSegueWithIdentifier("UserMain", sender: nil)
                        }
                    }
                case .Failure(let error):
                    UIAlertView(title: nil, message: "Invalid email or password", delegate: nil, cancelButtonTitle: "Cancel").show()
                    print(error.localizedDescription)
                }
        }
    }
}
