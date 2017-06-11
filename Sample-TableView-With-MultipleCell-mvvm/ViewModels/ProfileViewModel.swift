//
//  ProfileViewModel.swift
//  Sample-TableView-With-MultipleCell-mvvm
//
//  Created by NishiokaKohei on 2017/06/11.
//  Copyright © 2017年 Kohey. All rights reserved.
//

import Foundation
import UIKit

enum ProfileViewModelItemType {
    case namePhoto
    case about
    case email
    case friend
    case attribute
}

class ProfileViewModel: NSObject {
    var items = [ProfileViewModelItem]()

    var reloadSections: ((_ section: Int) -> Void)?

    override init() {
        super.init()
        guard let data = dataFromFile("TestData"), let profile = Profile(data: data) else {
            return
        }

        if let name = profile.fullName, let photoURL = profile.photoURL {
            let namePhoto = ProfileViewModelNamePhotoItem(name: name, photoURL: photoURL)
            items.append(namePhoto)
        }

        if let about = profile.about {
            let about = ProfileViewModelAboutItem(about: about)
            items.append(about)
        }

        if let email = profile.email {
            let email = ProfileViewModelEmailItem(email: email)
            items.append(email)
        }

        let friends = profile.friends
        if !friends.isEmpty {
            let friends = ProfileViewModeFriendsItem(friends: friends)
            items.append(friends)
        }

        let attributes = profile.profileAttributes
        if !attributes.isEmpty {
            let attributes = ProfileViewModeAttributeItem(attributes: attributes)
            items.append(attributes)
        }
    }

}

// MARK: - UITableViewDataSource

extension ProfileViewModel: UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items[section].rowCount
    }

    public func numberOfSections(in tableView: UITableView) -> Int {
        return items.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return UITableViewCell()
    }

}

// MARK: - UITableViewDelegate

extension ProfileViewModel: UITableViewDelegate {

    public func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        return UIView()
    }
}

extension ProfileViewModel {
}
