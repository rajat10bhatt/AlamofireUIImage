//
//  Movie.swift
//  AlamofireImageTableView
//
//  Created by Rajat on 08/08/16.
//  Copyright © 2016 Rajat. All rights reserved.
//

import UIKit
import ObjectMapper

class Movie:Mappable{
    // MARK: Properties
    var poster: String? = nil
    var title: String = " "
    var certificate: String = " "
    var languages: String = " "
    var dimensions: String = " "
    
    
    //Impl. of Mappable protocol
    required convenience init?(_ map: Map) {
        self.init()
    }
    
    func mapping(map: Map) {
        poster <- map["poster"]
        title <- map["title"]
        certificate <- map["certificate"]
        languages <- map["languages"]
        dimensions <- map["dimensions"]
    }
}
