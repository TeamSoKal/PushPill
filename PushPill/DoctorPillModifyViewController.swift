//
//  DoctorPillModifyViewController.swift
//  PushPill
//
//  Created by LeeSunhyoup on 2016. 4. 19..
//  Copyright © 2016년 Kim Ga-eun. All rights reserved.
//

import UIKit

class DoctorPillModifyViewController: UIViewController {

    @IBOutlet var webView: UIWebView!
    var pillId: Int?
    var userId: Int?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        guard let userId = userId, let pillId = pillId else { return }
        let url = "\(Config.baseURL)/api/pills/\(pillId)/edit.html?user_id=\(userId)"
        webView?.loadRequest(NSURLRequest(URL: NSURL(string: url)!))
    }
    
    @IBAction func cancel() {
        dismissViewControllerAnimated(true, completion: nil)
    }

}
