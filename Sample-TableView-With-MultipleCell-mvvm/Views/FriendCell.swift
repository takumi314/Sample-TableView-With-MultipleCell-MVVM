//
//  FriendCell.swift
//  Sample-TableView-With-MultipleCell-mvvm
//
//  Created by NishiokaKohei on 2017/06/12.
//  Copyright © 2017年 Kohey. All rights reserved.
//

import UIKit

class FriendCell: UITableViewCell {
    @IBOutlet weak var photoImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!

    var item: Friend? {
        didSet {
            guard let item = item else {
                return
            }
            if let pictureUrl = item.photoURL {
                photoImageView?.image = UIImage(named: pictureUrl)
            }
            nameLabel?.text = item.name
        }
    }
}
