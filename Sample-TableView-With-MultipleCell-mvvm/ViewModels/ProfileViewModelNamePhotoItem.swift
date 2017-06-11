//
//  ProfileViewModelNamePhotoItem.swift
//  Sample-TableView-With-MultipleCell-mvvm
//
//  Created by NishiokaKohei on 2017/06/11.
//  Copyright © 2017年 Kohey. All rights reserved.
//

import Foundation

struct ProfileViewModelNamePhotoItem: ProfileViewModelItem {

    var type: ProfileViewModelItemType {
        return .namePhoto
    }

    var isCollapsible: Bool {
        return true
    }

    var sectionTitle: String {
        return "Main Info"
    }

    var isCollapsed = true

    var name: String
    var photoURL: String

    init(name: String, photoURL: String) {
        self.name = name
        self.photoURL = photoURL
    }

}
