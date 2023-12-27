//
//  Cells.swift
//  UIFaster
//
//  Created by 0000 on 2023/12/10.
//

import UIKit
import SnapKit

class NormalCell: UITableViewCell {
    var person: Person? {
        didSet {
            updateUI()
        }
    }
    
    var imv: UIImageView = UIImageView()
    var lab: UILabel = UILabel()
    
    @IBOutlet weak var heightConst: NSLayoutConstraint!
    @IBOutlet weak var titleLabl: UILabel!
    @IBOutlet weak var height1Const: NSLayoutConstraint!

    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupViews()
    }
    
    func setupViews() {
//        contentView.addSubview(imv)
//        contentView.addSubview(lab)
//        imv.backgroundColor = .orange
//        imv.snp.makeConstraints { make in
//            make.left.top.right.equalToSuperview()
//            make.height.equalTo(100)
//        }
//        lab.snp.makeConstraints { make in
//            make.top.equalTo(imv.snp.bottom).offset(10)
//            make.left.right.bottom.equalToSuperview()
//        }
//        lab.numberOfLines = 0
    }
    
    func updateUI() {
        guard let person else { return }
        titleLabl.text = person.name
        
//        lab.text = person.name
        let h = person.age%2==0
        if h {
            heightConst.isActive = true
            height1Const.isActive = false
        } else {
            heightConst.isActive = false
            height1Const.isActive = true
        }
//        imv.snp.remakeConstraints { make in
//            make.left.top.right.equalToSuperview()
//            make.height.equalTo(h)
//        }
    }
}
