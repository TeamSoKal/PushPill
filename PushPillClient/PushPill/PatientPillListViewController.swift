//
//  PatientPillListViewController.swift
//  PushPill
//
//  Created by Gaeun Kim on 2016. 4. 10..
//  Copyright © 2016 Kim Ga-eun. All rights reserved.
//

import UIKit
import Alamofire
import AlamofireObjectMapper

class PatientPillListViewController: UIViewController {
    @IBOutlet var morningCollectionView: UICollectionView!
    @IBOutlet var lunchCollectionView: UICollectionView!
    @IBOutlet var dinnerCollectionView: UICollectionView!
    
    var morningPills: [Pill] = []
    var lunchPills: [Pill] = []
    var dinnerPills: [Pill] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        getPatient()
    }
    
    func getPatient() {
        self.morningPills.removeAll()
        self.lunchPills.removeAll()
        self.dinnerPills.removeAll()
        
        Alamofire.request(.GET, "\(Config.baseURL)/api/user", parameters: ["token": Config.token])
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
    
    @IBAction func logout() {
        dismissViewControllerAnimated(true, completion: nil)
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
            let controller = segue.destinationViewController as? PatientPillDetailViewController
            controller?.pillId = sender as? Int
        default:
            return
        }
    }
}
