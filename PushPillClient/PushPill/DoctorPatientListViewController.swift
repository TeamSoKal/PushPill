//
//  DoctorPatientListViewController.swift
//  PushPill
//
//  Created by Gaeun Kim on 2016. 4. 10..
//  Copyright © 2016 Kim Ga-eun. All rights reserved.
//

import UIKit
import Alamofire
import AlamofireObjectMapper

class DoctorPatientListViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UISearchBarDelegate {
    
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
        Alamofire.request(.GET, "\(Config.baseURL)/api/doctor/patients", parameters: ["token": Config.token])
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
        
        performSegueWithIdentifier("PillList", sender: indexPath.row)
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
