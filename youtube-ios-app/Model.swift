//
//  Model.swift
//  youtube-ios-app
//
//  Created by Arhur Dibon on 07/07/2020.
//  Copyright © 2020 Arthur D. All rights reserved.
//

import Foundation

class Model {
    
    func getVideos() {
        
        // Create url object
        let url = URL(string: Constants.API_URL)
        
        guard url != nil else{
            return
        }
        
        // Get the urlSession object
        let session = URLSession.shared
        
        // Get a data task from the URLSession object
        let dataTask = session.dataTask(with: url!) { (data, response, error) in
            
            if(error != nil || data == nil) {
                return
            }
            
            do {
                let decoder = JSONDecoder()
               decoder.dateDecodingStrategy = .iso8601
    
               let videos = try decoder.decode(Response.self, from: data!)
                          
               dump(videos)
                
            }catch {
                
            }
            
            
        }
        
        // Kick of the task
        dataTask.resume()
    
    }
    
}
