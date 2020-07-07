//
//  Model.swift
//  youtube-ios-app
//
//  Created by Arhur Dibon on 07/07/2020.
//  Copyright © 2020 Arthur D. All rights reserved.
//

import Foundation

protocol ModelDelegate {
    
    func videosFecthed(_ videos: [Video])
}

class Model {
    

    var delegate: ModelDelegate?
    
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
    
               let response = try decoder.decode(Response.self, from: data!)
                          
                if(response.items != nil) {
                    
                    DispatchQueue.main.async {
                        self.delegate?.videosFecthed(response.items!)
                    }
                }
                
            }catch {
                
            }
            
            
        }
        
        // Kick of the task
        dataTask.resume()
    
    }
    
}
