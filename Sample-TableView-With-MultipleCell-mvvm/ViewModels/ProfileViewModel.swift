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
        let item = items[section]
        guard item.isCollapsible else {
            return item.rowCount
        }
        if item.isCollapsed {
            return 0
        } else {
            return item.rowCount
        }
    }

    func numberOfSections(in tableView: UITableView) -> Int {
        return items.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let item = items[indexPath.section]
        switch item.type {
        case .namePhoto:
            if let cell = tableView.dequeueReusableCell(withIdentifier: NamePhotoCell.identifier, for: indexPath) as? NamePhotoCell {
                cell.item = item
                return cell
            }
        case .about:
            if let cell = tableView.dequeueReusableCell(withIdentifier: AboutCell.identifier, for: indexPath) as? AboutCell {
                cell.item = item
                return cell
            }
        case .email:
            if let cell = tableView.dequeueReusableCell(withIdentifier: EmailCell.identifier, for: indexPath) as? EmailCell {
                cell.item = item
                return cell
            }
        case .friend:
            if let cell = tableView.dequeueReusableCell(withIdentifier: FriendCell.identifier, for: indexPath) as? FriendCell,
                let item =  item as? ProfileViewModeFriendsItem {
                cell.item = item.friends[indexPath.row]
                return cell
            }
        case .attribute:
            if let cell = tableView.dequeueReusableCell(withIdentifier: AttributeCell.identifier, for: indexPath) as? AttributeCell,
                let item = item as? ProfileViewModeAttributeItem {
                cell.item = item.attributes[indexPath.row]
                return cell
            }
        }

        return UITableViewCell()
    }

}

// MARK: - UITableViewDelegate

extension ProfileViewModel: UITableViewDelegate {

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        switch items[indexPath.section].type {
        case .namePhoto, .about, .email:
            // do appropriate action for each type
            break
        case .friend:
            break
        case .attribute:
            break
            // do appropriate action for each type
        }
    }

    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        if let header = tableView.dequeueReusableHeaderFooterView(withIdentifier: ProfileHeaderView.identifier)  as? ProfileHeaderView {
            let item = items[section]

            header.item = item
            header.section = section
            header.delegete = self
            return header
        }
        return UIView()
    }
}

// MARK: ProfileHeaderViewDelegate

extension ProfileViewModel: ProfileHeaderViewDelegate {

    func toggleSection(header: ProfileHeaderView, section: Int) {
        var item = items[section]
        if item.isCollapsible {

            // Toggle collapse
            let collapsed = !item.isCollapsed
            item.isCollapsed = collapsed
            header.setCollapsed(collopsed: collapsed)

            // Adjust the number of the rows inside the section
            reloadSections?(section)
        }
    }

}
