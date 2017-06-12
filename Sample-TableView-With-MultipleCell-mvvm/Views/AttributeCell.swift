//
//  AttributeCell.swift
//  Sample-TableView-With-MultipleCell-mvvm
//
//  Created by NishiokaKohei on 2017/06/12.
//  Copyright © 2017年 Kohey. All rights reserved.
//

import UIKit

class AttributeCell: UITableViewCell {
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var valueLabel: UILabel!

    var item: Attribute?  {
        didSet {
            titleLabel?.text = item?.key
            valueLabel?.text = item?.value
        }
    }

    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func prepareForReuse() {
        super.prepareForReuse()
    }

}

extension AttributeCell: CellIdentifiable {

}
