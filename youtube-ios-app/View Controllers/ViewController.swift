//
//  ViewController.swift
//  youtube-ios-app
//
//  Created by Arhur Dibon on 07/07/2020.
//  Copyright © 2020 Arthur D. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, ModelDelegate {
   
    
    @IBOutlet weak var tableview: UITableView!
    
    var model = Model()
    var videos = [Video]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        tableview.dataSource = self
        tableview.delegate = self
        model.delegate = self
        
        model.getVideos()
    }

    //MARK: - TableView Methods
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return videos.count
    }
       
   func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    
        let cell = tableView.dequeueReusableCell(withIdentifier: Constants.VIDEO_CELL_ID, for: indexPath) as! VideoTableViewCell
    
        //configure cell data
        let video = self.videos[indexPath.row]
        cell.setCell(video)
        return cell
   }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
    
    func videosFecthed(_ videos: [Video]) {
        self.videos = videos
    
        tableview.reloadData()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        guard tableview.indexPathForSelectedRow != nil else {
            return
        }
        
        let selectedVideo = videos[tableview.indexPathForSelectedRow!.row]
        
        let detail = segue.destination as! DetailViewController
        
        detail.video = selectedVideo
        
        tableview.reloadData()
    }
    
}

