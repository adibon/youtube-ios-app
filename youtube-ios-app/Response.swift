//
//  Response.swift
//  youtube-ios-app
//
//  Created by Arhur Dibon on 07/07/2020.
//  Copyright © 2020 Arthur D. All rights reserved.
//

import Foundation

struct Response : Decodable {
    
    var items:[Video]?
    
    enum CodingKeys: String, CodingKey {
        case items
    }
    
    init(from decoder:Decoder) throws {
        
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        self.items = try container.decode([Video].self, forKey: CodingKeys.items)
    }
}
