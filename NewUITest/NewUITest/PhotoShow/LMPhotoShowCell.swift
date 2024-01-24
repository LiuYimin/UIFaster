//
//  LMPhotoShowCell.swift
//  UIFaster
//
//  Created by 0000 on 2024/1/24.
//

import UIKit
import RxSwift
import RxCocoa

class LMPhotoShowCell: UICollectionViewCell {
    @IBOutlet weak var coverImageView: UIImageView!

    override func awakeFromNib() {
       super.awakeFromNib()
       setupViews()
    }
    
    func setupViews() {
       coverImageView.image = nil
       
    }
}
