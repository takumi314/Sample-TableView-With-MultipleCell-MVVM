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

struct Profile {
    var fullName: String?
    var photoURL: String?
    var email: String?
    var about: String?
    var friends = [Friend]()
    var profileAttributes = [Attribute]()

    init?(data: Data) {
        let json: [String: Any]?
        do {
            json = try JSONSerialization.jsonObject(with: data, options: .allowFragments) as? [String: Any]
        }
        catch {
            print("Error deserializing JSON: \(error)")
            return nil
        }

        if let body = json?["data"] as? [String: Any] {
            self.fullName = body["fullName"] as? String
            self.photoURL = body["photoURL"] as? String
            self.about = body["about"] as? String
            self.email = body["email"] as? String

            if let friends = body["friends"] as? [[String: Any]] {
                self.friends = friends.map { Friend(json: $0) }
            }

            if let profileAttributes = body["profileAttributes"] as? [[String: Any]] {
                self.profileAttributes = profileAttributes.map { Attribute(json: $0) }
            }
        }
    }

}
