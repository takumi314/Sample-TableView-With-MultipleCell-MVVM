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
            guard let item = item as? ProfileViewModelNamePhotoItem  else {
                return
            }
            nameLabel?.text = item.name
            photoImageView?.image = UIImage(named: item.photoURL)
        }
    }

    override func awakeFromNib() {
        super.awakeFromNib()

        photoImageView?.layer.cornerRadius = 50
        photoImageView?.clipsToBounds = true
        photoImageView?.contentMode = .scaleAspectFit
        photoImageView?.backgroundColor = .lightGray
    }

    override func prepareForReuse() {
        super.prepareForReuse()

        photoImageView?.image = nil
    }

}

extension NamePhotoCell: CellIdentifiable {

}
