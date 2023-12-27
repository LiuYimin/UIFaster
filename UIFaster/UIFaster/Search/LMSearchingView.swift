//
//  LMSearchView.swift
//  UIFaster
//
//  Created by 0000 on 2023/12/26.
//

import UIKit
import RxSwift
import RxCocoa
import RxGesture

class LMSearchingView: UIView, UITableViewDelegate, UITableViewDataSource {
    let disposeBag = DisposeBag()
    
    var tableView: UITableView = {
        let tbv = UITableView(frame: .zero, style: .plain)
        tbv.separatorStyle = .none
        if #available(iOS 15.0, *) {
            tbv.sectionHeaderTopPadding = 0
        } else {
            // Fallback on earlier versions
        }
        return tbv
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
        setupBind()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    func setupViews() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.separatorStyle = .none
        tableView.contentInset = UIEdgeInsets.zero
        tableView.register(LMSearchSuggestCell.self, forCellReuseIdentifier: "LMSearchSuggestCell")
        
        addSubview(tableView)
        tableView.snp.makeConstraints { make in
            make.left.right.top.bottom.equalToSuperview()
        }
    }
    
    func setupBind() {
        LMSearchManager.shared.suggestedKeys.subscribe(with: self) { owner, list in
            owner.tableView.reloadData()
        }.disposed(by: disposeBag)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return LMSearchManager.shared.suggestedKeys.value.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "LMSearchSuggestCell", for: indexPath) as! LMSearchSuggestCell
        tableView.separatorStyle = .none
        if LMSearchManager.shared.suggestedKeys.value.count > indexPath.row {
            cell.titleLab.text = LMSearchManager.shared.trendingNowList.value[indexPath.row]
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 52.0
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let cell = tableView.cellForRow(at: indexPath) as? LMSearchSuggestCell {
            LMSearchManager.shared.selectedKey.onNext(cell.titleLab.text ?? "")
        }
    }
}

class LMSearchSuggestCell: UITableViewCell {
    var titleLab: UILabel = {
        let lab = UILabel()
        lab.font = UIFont.nunitoRegular(14)
        lab.textColor = .black
        return lab
    }()
    
    var lineView: UIView = {
        let line = UIView()
        line.backgroundColor = UIColor.init(red: 0xEE/255.0, green: 0xEE/255.0, blue: 0xEE/255.0, alpha: 1)
        return line
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupViews()
        setupBind()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    func setupViews() {
        selectionStyle = .none
        contentView.backgroundColor = .white
        contentView.addSubview(titleLab)
        titleLab.snp.makeConstraints { make in
            make.left.equalToSuperview().offset(24.0)
            make.right.equalToSuperview().offset(-24.0)
            make.centerY.equalToSuperview()
        }
        contentView.addSubview(lineView)
        lineView.snp.makeConstraints { make in
            make.left.equalToSuperview().offset(24.0)
            make.right.equalToSuperview().offset(-24.0)
            make.bottom.equalToSuperview()
            make.height.equalTo(1.0)
        }
    }
    
    func setupBind() {
        
    }
}
