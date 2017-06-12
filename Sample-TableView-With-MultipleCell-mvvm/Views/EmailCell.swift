//
//  EmailCell.swift
//  Sample-TableView-With-MultipleCell-mvvm
//
//  Created by NishiokaKohei on 2017/06/12.
//  Copyright © 2017年 Kohey. All rights reserved.
//

import UIKit

class EmailCell: UITableViewCell {
    @IBOutlet weak var emailLabel: UILabel!

    var item: ProfileViewModelItem? {
        didSet {
            guard let item = item as? ProfileViewModelEmailItem else {
                return
            }
            emailLabel?.text = item.email
        }
    }

    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func prepareForReuse() {
        super.prepareForReuse()
    }

}

extension EmailCell: CellIdentifiable {

}
