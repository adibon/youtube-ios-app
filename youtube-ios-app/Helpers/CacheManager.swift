//
//  CacheManager.swift
//  youtube-ios-app
//
//  Created by Arhur Dibon on 08/07/2020.
//  Copyright © 2020 Arthur D. All rights reserved.
//

import Foundation

class CacheManager  {
    
    static var cache = [String:Data]()
    
    static func setVideoCache(_ url:String, _ data:Data?) {
        cache[url] = data!
    }
    
    static func getVideoCache(_ url:String) -> Data? {
        return cache[url]
    }
        
}
