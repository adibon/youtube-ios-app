//
//  ViewController.swift
//  youtube-ios-app
//
//  Created by Arhur Dibon on 07/07/2020.
//  Copyright © 2020 Arthur D. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var model = Model()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        model.getVideos()
    }


}

