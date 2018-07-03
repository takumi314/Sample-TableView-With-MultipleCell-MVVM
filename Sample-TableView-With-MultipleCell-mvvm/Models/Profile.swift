//
//  Profile.swift
//  Sample-TableView-With-MultipleCell-mvvm
//
//  Created by NishiokaKohei on 2017/06/08.
//  Copyright © 2017年 Kohey. All rights reserved.
//

import Foundation

public func dataFromFile(_ filename: String) -> Data? {
    @objc class TestClass: NSObject { }

    let bundle = Bundle(for: TestClass.self)
    if let path = bundle.path(forResource: filename, ofType: "json") {
        return try? Data(contentsOf: URL(fileURLWithPath: path))
    }
    return nil
}

struct Profile: Codable {
    var fullName: String
    var photoURL: String
    var email: String
    var about: String
    var friends = [Friend]()
    var profileAttributes = [Attribute]()
}
