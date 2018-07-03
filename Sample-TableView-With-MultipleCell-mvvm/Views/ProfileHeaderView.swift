//
//  ProfileHeaderView.swift
//  Sample-TableView-With-MultipleCell-mvvm
//
//  Created by NishiokaKohei on 2017/06/13.
//  Copyright © 2017年 Kohey. All rights reserved.
//

import UIKit

protocol ProfileHeaderViewDelegate: class {
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

    weak var delegete: ProfileHeaderViewDelegate?

    override func awakeFromNib() {
        super.awakeFromNib()

        addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(didTapHeader)))
    }

    @objc func didTapHeader() {
        delegete?.toggleSection(header: self, section: section)
    }

    func setCollapsed(collopsed: Bool) {
        arrowLabel?.rotate(collopsed ? 0.0 : .pi)
    }

}

extension ProfileHeaderView: CellIdentifiable {
    // Default implementation
}


