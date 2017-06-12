//
//  ProfileHeaderView.swift
//  Sample-TableView-With-MultipleCell-mvvm
//
//  Created by NishiokaKohei on 2017/06/13.
//  Copyright © 2017年 Kohey. All rights reserved.
//

import UIKit

protocol ProfileHeaderViewDelegate {
    func toggleSection(header: ProfileHeaderView, section: Int)
}


class ProfileHeaderView: UITableViewHeaderFooterView {
    @IBOutlet weak var arrowLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!

    var item: ProfileViewModelItem? {
        didSet {
            guard let item = item else {
                return
            }
            titleLabel?.text = item.sectionTitle
            setCollapsed(collopsed: item.isCollapsed)
        }
    }

    var section: Int = 0

    override func awakeFromNib() {
        super.awakeFromNib()
    }

    func didTapHeader() {
    }

    func setCollapsed(collopsed: Bool) {
    }

}

extension ProfileHeaderView: CellIdentifiable {
    // Default implementation
}


