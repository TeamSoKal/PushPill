//
//  DoctorPillAddViewController.swift
//  PushPill
//
//  Created by LeeSunhyoup on 2016. 4. 19..
//  Copyright © 2016년 Kim Ga-eun. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class DoctorPillAddViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    @IBOutlet var imageView: UIImageView!
    @IBOutlet var nameTextField: UITextField!
    @IBOutlet var amountField: UITextField!
    @IBOutlet var daysOfWeekTextField: UITextField!
    @IBOutlet var timeSegmentedControl: UISegmentedControl!
    @IBOutlet var noteTextView: UITextView!
    var userId: Int?
    
    let imagePicker = UIImagePickerController()

    override func viewDidLoad() {
        super.viewDidLoad()
        imagePicker.delegate = self
        imageView.clipsToBounds = true
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    @IBAction func imagePick() {
        imagePicker.allowsEditing = false
        imagePicker.sourceType = .PhotoLibrary
        
        presentViewController(imagePicker, animated: true, completion: nil)
    }
    
    func imagePickerController(picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : AnyObject]) {
        if let pickedImage = info[UIImagePickerControllerOriginalImage] as? UIImage {
            imageView.contentMode = .ScaleAspectFill
            imageView.image = pickedImage
        }
        
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    func imagePickerControllerDidCancel(picker: UIImagePickerController) {
         dismissViewControllerAnimated(true, completion: nil)
    }
    
    @IBAction func cancel() {
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    @IBAction func save() {
        guard let userId = userId else { return }
        var time = ""
        switch timeSegmentedControl.selectedSegmentIndex {
        case 0:
            time = "morning"
        case 1:
            time = "lunch"
        case 2:
            time = "dinner"
        default:
            print("ERROR")
        }
        let params = [
            "pill[name]": nameTextField.text!,
            "pill[number]": amountField.text!,
            "pill[days_of_week]": daysOfWeekTextField.text!,
            "pill[time]": time,
            "pill[notes]": noteTextView.text!,
            "pill[user_id]": "\(userId)"
        ]
        
        Alamofire.upload(.POST, "\(Config.baseURL)/api/pills", multipartFormData: {
            multipartFormData in
            guard let image = self.imageView.image else { return }
            if  let imageData = UIImagePNGRepresentation(image) {
                multipartFormData.appendBodyPart(data: imageData, name: "pill[image_path]", fileName: "\(NSUUID().UUIDString).png", mimeType: "image/png")
            }
            for (key, value) in params {
                multipartFormData.appendBodyPart(data: value.dataUsingEncoding(NSUTF8StringEncoding)!, name: key)
            }
            }, encodingCompletion: {
                encodingResult in
                
                switch encodingResult {
                case .Success(let upload, _, _):
                    upload.responseJSON { response in
                        if let JSON = response.result.value {
                            print("JSON: \(JSON)")
                            self.dismissViewControllerAnimated(true, completion: nil)
                        }
                    }
                    
                case .Failure(let encodingError):
                    print(encodingError)
                }
        })
    }
    
    @IBAction func keyboardDown() {
        view.endEditing(true)
    }
}