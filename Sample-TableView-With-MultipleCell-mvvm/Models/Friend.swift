//
//  Friend.swift
//  Sample-TableView-With-MultipleCell-mvvm
//
//  Created by NishiokaKohei on 2017/06/08.
//  Copyright © 2017年 Kohey. All rights reserved.
//

import Foundation

struct Friend {
    var name: String?
    var photoURL: String?

    init(json: [String: Any]) {
        self.name = json["name"] as? String
        self.photoURL = json["pictureUrl"] as? String
    }
}
