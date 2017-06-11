//
//  ProfileViewModeAttributeItem.swift
//  Sample-TableView-With-MultipleCell-mvvm
//
//  Created by NishiokaKohei on 2017/06/11.
//  Copyright © 2017年 Kohey. All rights reserved.
//

import Foundation

struct ProfileViewModeAttributeItem: ProfileViewModelItem {

    var type: ProfileViewModelItemType {
        return .attribute
    }

    var isCollapsible: Bool {
        return true
    }

    var sectionTitle: String {
        return "Attributes"
    }

    var rowCount: Int {
        return attributes.count
    }

    var isCollapsed = true

    var attributes: [Attribute]

    init(attributes: [Attribute]) {
        self.attributes = attributes
    }

}
