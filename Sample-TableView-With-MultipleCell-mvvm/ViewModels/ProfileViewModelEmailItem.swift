//
//  ProfileViewModelEmailItem.swift
//  Sample-TableView-With-MultipleCell-mvvm
//
//  Created by NishiokaKohei on 2017/06/11.
//  Copyright © 2017年 Kohey. All rights reserved.
//

import Foundation

struct ProfileViewModelEmailItem: ProfileViewModelItem {
    var type: ProfileViewModelItemType {
        return .email
    }

    var isCollapsible: Bool {
        return true
    }

    var sectionTitle: String {
        return "Email"
    }

    var isCollapsed = true

    var email: String

    init(email: String) {
        self.email = email
    }

}
