//
//  LMPostSearchView.swift
//  UIFaster
//
//  Created by 0000 on 2023/12/26.
//

import UIKit
import RxSwift
import RxCocoa

class LMPostSearchView: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
        setupBind()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    func setupViews() {
        backgroundColor = .blue
    }
    
    func setupBind() {
        
    }
}
