//
//  AboutCell.swift
//  Sample-TableView-With-MultipleCell-mvvm
//
//  Created by NishiokaKohei on 2017/06/12.
//  Copyright © 2017年 Kohey. All rights reserved.
//

import UIKit

class AboutCell: UITableViewCell {
    @IBOutlet weak var aboutLabel: UILabel!

    var item: ProfileViewModelItem? {
        didSet {
            guard  let item = item as? ProfileViewModelAboutItem else {
                return
            }
            aboutLabel?.text = item.about
        }
    }
}
