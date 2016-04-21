//
//  DoctorAlramListTableViewController.swift
//  PushPill
//
//  Created by Gaeun Kim on 2016. 4. 10..
//  Copyright © 2016 Kim Ga-eun. All rights reserved.
//

import UIKit
import Alamofire
import AlamofireObjectMapper

class DoctorAlramListTableViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet var tableView: UITableView!
    var patients: [Patient] = []

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        patients.removeAll()
    }
    
    func fetchPatients() {
        Alamofire.request(.GET, "\(Config.baseURL)/api/doctor/patients/alert", parameters: ["token": Config.token])
            .responseArray { (response: Response<[Patient], NSError>) in
                switch response.result {
                case .Success(let patients):
                    self.patients = patients
                    self.tableView.reloadData()
                case .Failure(let error):
                    print(error.localizedDescription)
                }
        }
    }

    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }

    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return patients.count
    }

    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("AlramCell", forIndexPath: indexPath)

        return cell
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        let cell = tableView.cellForRowAtIndexPath(indexPath)
        cell?.selected = false
        performSegueWithIdentifier("Alert", sender: patients[indexPath.row].id)
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        guard let identifier = segue.identifier else { return }
        switch identifier {
        case "Alert":
            let controller = segue.destinationViewController as? DoctorAlertViewController
            controller?.userId = sender as? Int
        default:
            return
        }
    }
}
