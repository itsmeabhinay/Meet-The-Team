//
//  TeamData.swift
//  Meet The Team
//
//  Created by Abhinay Simha Vangipuram on 2/13/17.
//  Copyright © 2017 Home. All rights reserved.
//

import UIKit

class TeamData: NSObject {
    
    var title = String()
    var firstName = String()
    var lastName = String()
    var id = String()
    var bio = String()
    var avatar = String()
    
    init(dataDictionary: [String : String]) {
        self.title = dataDictionary["title"]!
        self.firstName = dataDictionary["firstName"]!
        self.lastName = dataDictionary["lastName"]!
        self.id = dataDictionary["id"]!
        self.bio = dataDictionary["bio"]!
        self.avatar = dataDictionary["avatar"]!
    }
}
