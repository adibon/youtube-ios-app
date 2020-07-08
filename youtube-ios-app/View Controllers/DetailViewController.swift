//
//  DetailViewController.swift
//  youtube-ios-app
//
//  Created by Arhur Dibon on 08/07/2020.
//  Copyright © 2020 Arthur D. All rights reserved.
//

import UIKit
import WebKit

class DetailViewController: UIViewController {

    
    
    @IBOutlet weak var titleLabel: UILabel!
    
    
    @IBOutlet weak var dateLabel: UILabel!
    
    @IBOutlet weak var webbView: WKWebView!
    
    var video:Video?
    
    @IBOutlet weak var textview: UITextView!
    
    override func viewWillAppear(_ animated: Bool) {
        // Clear
        titleLabel.text = ""
        dateLabel.text = ""
        textview.text = ""
        
        //Check if there is a video
        guard video != nil else {
            return
        }
        
        let embedUrl = Constants.YOUTUBE_EMBEDDED_URL + video!.videoId
        
        let url = URL(string: embedUrl)
        
        let request = URLRequest(url: url!)
        
        self.webbView.load(request)
        
        titleLabel.text = video!.title
        
        let df = DateFormatter()
        df.dateFormat = "EEEE, MMM d, yyyy"
        
        dateLabel.text = df.string(from: video!.published)
        
        textview.text = video?.description
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
