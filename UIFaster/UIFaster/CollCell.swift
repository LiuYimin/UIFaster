//
//  CollCell.swift
//  UIFaster
//
//  Created by 0000 on 2024/1/2.
//

import UIKit


class CollCell: UICollectionViewCell {
    @IBOutlet weak var imageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
    }
}
