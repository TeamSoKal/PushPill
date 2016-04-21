//
//  DoctorPatientAddViewController.swift
//  PushPill
//
//  Created by LeeSunhyoup on 2016. 4. 19..
//  Copyright © 2016년 Kim Ga-eun. All rights reserved.
//

import UIKit
import Alamofire
import AlamofireObjectMapper
import SwiftyJSON

class DoctorPatientAddViewController: UIViewController, UISearchBarDelegate, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet var searchBar: UISearchBar!
    @IBOutlet var tableView: UITableView!
    var patients: [Patient] = []
    var originalPatients: [Patient] = []

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        patients.removeAll()
        originalPatients.removeAll()
        fetchPatients()
    }
    
    func fetchPatients() {
        Alamofire.request(.GET, "\(Config.baseURL)/api/user/patients")
            .responseArray { (response: Response<[Patient], NSError>) in
                switch response.result {
                case .Success(let patients):
                    self.patients = patients
                    self.originalPatients = patients
                    self.tableView.reloadData()
                case .Failure(let error):
                    print(error.localizedDescription)
                }
        }
    }
    
    @IBAction func cancel() {
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    func searchBar(searchBar: UISearchBar, textDidChange searchText: String) {
        if searchText == "" {
            patients = originalPatients
            tableView.reloadData()
            return
        }
        patients = originalPatients.filter {
            guard let name = $0.name else {
                return false
            }
            if name.containsString(searchText) {
                return true
            }
            return false
        }
        tableView.reloadData()
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return patients.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        guard let name = patients[indexPath.row].name,
            let age = patients[indexPath.row].age else { return cell }
        cell.textLabel?.text = "\(name), \(age)"
        return cell
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        let cell = tableView.cellForRowAtIndexPath(indexPath)
        cell?.selected = false
        
        guard let id = patients[indexPath.row].id else { return }
        Alamofire.request(.POST, "\(Config.baseURL)/api/doctor/patients", parameters: ["user_id": id, "token": Config.token])
            .responseJSON { (response) in
                switch response.result {
                case .Success(let jsonData):
                    let json = JSON(jsonData)
                    if let _ = json["success"].bool {
                        self.dismissViewControllerAnimated(true, completion: nil)
                    }
                case .Failure(let error):
                    print(error.localizedDescription)
                }
        }
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        guard let identifier = segue.identifier else { return }
        
        switch identifier {
        case "PillList":
            let row = sender as? Int
            if row != nil {
                let controller = segue.destinationViewController as? DoctorPillListViewController
                controller?.patientId = patients[row!].id
            }
        default:
            return
        }
    }
}
