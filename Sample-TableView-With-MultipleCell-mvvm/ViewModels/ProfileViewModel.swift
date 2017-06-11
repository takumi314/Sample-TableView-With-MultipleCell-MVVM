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
    case nameAndPhoto
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
    }


}

// MARK: - UITableViewDataSource

extension ProfileViewModel: UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }

    public func numberOfSections(in tableView: UITableView) -> Int {
        return 1
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
