//
//  ViewController.swift
//  Web Service Example
//
//  Created by Santosh Sankar on 10/14/14.
//  Copyright (c) 2014 Santosh Sankar. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var myNameLabel: UILabel!
    @IBOutlet weak var loadSpinner: UIActivityIndicatorView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let manager = AFHTTPRequestOperationManager()

        manager.GET( "http:/graph.facebook.com/ssankar2010",
            parameters: nil,
            success: { (operation: AFHTTPRequestOperation!,responseObject: AnyObject!) in
                println("JSON: " + responseObject.description)
            
                if let myName = responseObject.valueForKey("name") as? String {
                    self.loadSpinner.startAnimating();
                    self.loadSpinner.stopAnimating();
                    self.loadSpinner.hidesWhenStopped = 1;
                    self.myNameLabel.text = myName;
                }
            
            },
            failure: { (operation: AFHTTPRequestOperation!,error: NSError!) in
                println("Error: " + error.localizedDescription)
        })
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

