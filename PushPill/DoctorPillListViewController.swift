//
//  DoctorPillListViewController.swift
//  PushPill
//
//  Created by LeeSunhyoup on 2016. 4. 10..
//  Copyright © 2016년 Kim Ga-eun. All rights reserved.
//

import UIKit
import Alamofire
import AlamofireObjectMapper
import SwiftyJSON
import SDWebImage

class DoctorPillListViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    
    @IBOutlet var morningCollectionView: UICollectionView!
    @IBOutlet var lunchCollectionView: UICollectionView!
    @IBOutlet var dinnerCollectionView: UICollectionView!
    
    var morningPills: [Pill] = []
    var lunchPills: [Pill] = []
    var dinnerPills: [Pill] = []
    
    var patientId: Int?

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        getPatient()
    }
    
    func getPatient() {
        guard let patientId = patientId else {
            print("Error")
            return
        }
        self.morningPills.removeAll()
        self.lunchPills.removeAll()
        self.dinnerPills.removeAll()
        
        Alamofire.request(.GET, "\(Config.baseURL)/api/doctor/patients/\(patientId)", parameters: ["token": Config.token])
            .responseObject { (response: Response<Patient, NSError>) in
                switch response.result {
                case .Success(let patient):
                    self.title = patient.name
                    if let pills = patient.pills {
                        for pill in pills {
                            switch pill.time {
                            case "morning":
                                self.morningPills.append(pill)
                            case "lunch":
                                self.lunchPills.append(pill)
                            case "dinner":
                                self.dinnerPills.append(pill)
                            default:
                                print("ERROR")
                            }
                        }
                    }
                    self.morningCollectionView.reloadData()
                    self.lunchCollectionView.reloadData()
                    self.dinnerCollectionView.reloadData()
                case .Failure(let error):
                    print(error.localizedDescription)
                }
        }
    }
    
    @IBAction func removePatient() {
        guard let patientId = patientId else { return }
        let alertController = UIAlertController(title: "Alert", message: "Do you want to delete this patient?", preferredStyle: .Alert)
        
        alertController.addAction(UIAlertAction(title: "Yes", style: .Default, handler: { (alert) in
            Alamofire.request(.DELETE, "\(Config.baseURL)/api/doctor/patients/\(patientId)", parameters: ["token": Config.token])
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
    
    func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        switch collectionView.tag {
        case 0:
            return morningPills.count
        case 1:
            return lunchPills.count
        case 2:
            return dinnerPills.count
        default:
            return 0
        }
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        switch collectionView.tag {
        case 0:
            let cell = collectionView.dequeueReusableCellWithReuseIdentifier("MorningPill", forIndexPath: indexPath)
            if let imagePath = morningPills[indexPath.row].imagePath {
                let imageView = UIImageView(frame: cell.bounds)
                imageView.sd_setImageWithURL(NSURL(string: "\(Config.baseURL)/\(imagePath)"), placeholderImage: UIImage(named: "PillPlaceholder")!)
                cell.addSubview(imageView)
            } else {
                let imageView = UIImageView(frame: cell.bounds)
                imageView.image = UIImage(named: "PillPlaceholder")!
                cell.addSubview(imageView)
            }
            return cell
        case 1:
            let cell = collectionView.dequeueReusableCellWithReuseIdentifier("LunchPill", forIndexPath: indexPath)
            if let imagePath = lunchPills[indexPath.row].imagePath {
                let imageView = UIImageView(frame: cell.bounds)
                imageView.sd_setImageWithURL(NSURL(string: "\(Config.baseURL)/\(imagePath)"), placeholderImage: UIImage(named: "PillPlaceholder")!)
                cell.addSubview(imageView)
            } else {
                let imageView = UIImageView(frame: cell.bounds)
                imageView.image = UIImage(named: "PillPlaceholder")!
                cell.addSubview(imageView)
            }
            return cell
        case 2:
            let cell = collectionView.dequeueReusableCellWithReuseIdentifier("DinnerPill", forIndexPath: indexPath)
            if let imagePath = dinnerPills[indexPath.row].imagePath {
                let imageView = UIImageView(frame: cell.bounds)
                imageView.sd_setImageWithURL(NSURL(string: "\(Config.baseURL)/\(imagePath)"), placeholderImage: UIImage(named: "PillPlaceholder")!)
                cell.addSubview(imageView)
            } else {
                let imageView = UIImageView(frame: cell.bounds)
                imageView.image = UIImage(named: "PillPlaceholder")!
                cell.addSubview(imageView)
            }
            return cell
        default:
            print("ERROR")
            return UICollectionViewCell()
        }
    }
    
    func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        let cell = collectionView.cellForItemAtIndexPath(indexPath)
        cell?.selected = false
        var pillId = 0
        switch collectionView.tag {
        case 0:
            pillId = morningPills[indexPath.row].id!
        case 1:
            pillId = lunchPills[indexPath.row].id!
        case 2:
            pillId = dinnerPills[indexPath.row].id!
        default:
            print("ERROR")
            return
        }
        performSegueWithIdentifier("PillDetail", sender: pillId)
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        guard let identifier = segue.identifier else { return }
        switch identifier {
        case "PillDetail":
            let controller = segue.destinationViewController as? DoctorPillDetailViewController
            controller?.pillId = sender as? Int
            controller?.userId = patientId
        case "PillAdd":
            let controller = (segue.destinationViewController as? UINavigationController)?.visibleViewController as? DoctorPillAddViewController
            controller?.userId = patientId
        default:
            return
        }
    }
}
