//
//  NamePhotoCell.swift
//  Sample-TableView-With-MultipleCell-mvvm
//
//  Created by NishiokaKohei on 2017/06/12.
//  Copyright © 2017年 Kohey. All rights reserved.
//

import UIKit

class NamePhotoCell: UITableViewCell {
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var photoImageView: UIImageView!

    var item: ProfileViewModelItem? {
        didSet {
            // cast the ProfileViewModelItem to appropriate item type
            guard let item = item as? ProfileViewModelNamePhotoItem  else {
                return
            }
            nameLabel?.text = item.name
            photoImageView?.image = UIImage(named: item.photoURL)
        }
    }
}
