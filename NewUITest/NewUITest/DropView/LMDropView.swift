//
//  LMDropView.swift
//  NewUITest
//
//  Created by 0000 on 2024/2/21.
//

import UIKit
import SnapKit

class LMDropView: UIView {
    var titleLabel: UILabel = {
        let lab = UILabel()
        lab.textColor = .black
        lab.font = UIFont.systemFont(ofSize: 14)
        lab.text = "Default"
        return lab
    }()
    
    var arrowImageView: UIImageView = {
        let imv = UIImageView()
        imv.image = .down
        return imv
    }()
    
    var coverBtn: UIButton = {
        let btn = UIButton.init(type: .custom)
        return btn
    }()
    
    var tableView: UITableView = {
        let tbv = UITableView(frame: .zero, style: .plain)
        return tbv
    }()
    
    fileprivate var backgroundView = UIView()

    var items = ["Strong", "Slight", "None"]
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        addSubview(titleLabel)
        addSubview(arrowImageView)
        addSubview(coverBtn)
        
        coverBtn.addTarget(self, action: #selector(clickSelf), for: .touchUpInside)
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(LMSimpleDropBoxCell.self, forCellReuseIdentifier: "LMSimpleDropBoxCell")
        
        titleLabel.snp.makeConstraints { make in
            make.left.equalToSuperview().offset(12)
            make.centerY.equalToSuperview()
        }
        arrowImageView.snp.makeConstraints { make in
            make.left.equalTo(titleLabel.snp.right).offset(10)
            make.right.equalToSuperview().offset(-12)
            make.width.height.equalTo(24.0)
            make.centerY.equalToSuperview()
        }
        coverBtn.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
    
    @objc func clickSelf() {
        showList()
    }
    
    var parentViewController: UIViewController? {
        var parentResponder: UIResponder? = self
        while parentResponder != nil {
            parentResponder = parentResponder!.next
            if let viewController = parentResponder as? UIViewController {
                return viewController
            }
        }
        return nil
    }
    
    public func showList() {
        guard let parentVC = parentViewController else { return }
        let pointToParent = getConvertedPoint(self, baseView: parentVC.view)
        backgroundView.frame = parentVC.view.frame
        parentVC.view.insertSubview(backgroundView, aboveSubview: self)
        tableView = UITableView(frame: CGRect(x: pointToParent.x,
                                          y: pointToParent.y + frame.height,
                                          width: frame.width,
                                          height: 90))
        tableView.reloadData()
        parentVC.view.addSubview(tableView)
    }
    
    func getConvertedPoint(_ targetView: UIView, baseView: UIView?) -> CGPoint {
        var pnt = targetView.frame.origin
        if nil == targetView.superview {
            return pnt
        }
        var superView = targetView.superview
        while superView != baseView {
            pnt = superView!.convert(pnt, to: superView!.superview)
            if nil == superView!.superview {
                break
            } else {
                superView = superView!.superview
            }
        }
        return superView!.convert(pnt, to: baseView)
    }
}

extension LMDropView: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "LMSimpleDropBoxCell", for: indexPath) as! LMSimpleDropBoxCell
        cell.setModel(text: items[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 30.0
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
}

private class LMSimpleDropBoxCell: UITableViewCell {
    
    private var label: UILabel!
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        layer.borderColor = UIColor.lightGray.cgColor
        layer.borderWidth = 1
        
        // 选中后右边显示一个“勾选”符号
        let selectedView = UIImageView(image: UIImage(named: "check"))
        selectedView.contentMode = .right
        selectedBackgroundView = selectedView
        
        // 文字标题
        label = UILabel(frame: .zero)
        label.font = UIFont.systemFont(ofSize: 15)
        self.addSubview(label)
    }
    
    func setModel(text: String) {
        label.text = text
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        label.frame = CGRect(x:10, y: 0, width: self.frame.width - 80, height: 44)
        selectedBackgroundView?.frame = CGRect(x: 0, y: 0, width: frame.width - 10, height: 44)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
