//
//  ProfileViewModelAboutItem.swift
//  Sample-TableView-With-MultipleCell-mvvm
//
//  Created by NishiokaKohei on 2017/06/11.
//  Copyright © 2017年 Kohey. All rights reserved.
//

import Foundation

struct ProfileViewModelAboutItem: ProfileViewModelItem {

    var type: ProfileViewModelItemType {
        return .about
    }

    var isCollapsible: Bool {
        return true
    }

    var sectionTitle: String {
        return "About"
    }

    var isCollapsed = true

    var about: String

    init(about: String) {
        self.about = about
    }
}
