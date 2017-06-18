//
//  ProfileViewModeFriendsItem.swift
//  Sample-TableView-With-MultipleCell-mvvm
//
//  Created by NishiokaKohei on 2017/06/11.
//  Copyright © 2017年 Kohey. All rights reserved.
//

import Foundation

struct ProfileViewModeFriendsItem: ProfileViewModelItem {

    var type: ProfileViewModelItemType {
        return .friend
    }

    var isCollapsible: Bool {
        return true
    }

    var sectionTitle: String {
        return "Friends"
    }

    var rowCount: Int {
        return friends.count
    }

    var isCollapsed = true

    var friends: [Friend]

    init(friends: [Friend]) {
        self.friends = friends
    }

}
