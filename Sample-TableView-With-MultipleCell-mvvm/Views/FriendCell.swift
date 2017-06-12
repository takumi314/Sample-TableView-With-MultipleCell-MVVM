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

    override func awakeFromNib() {
        super.awakeFromNib()

        photoImageView?.layer.cornerRadius = 40
        photoImageView?.clipsToBounds = true
        photoImageView?.contentMode = .scaleAspectFit
        photoImageView?.backgroundColor = .lightGray
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    override func prepareForReuse() {
        super.prepareForReuse()

        // if the cell is reusable (has a reuse identifier), 
        // this is called just before the cell is returned from 
        // the table view method dequeueReusableCellWithIdentifier:.
        // If you override, you MUST call super.
        photoImageView?.image = nil
    }

}

extension FriendCell: CellIdentifiable {

}
