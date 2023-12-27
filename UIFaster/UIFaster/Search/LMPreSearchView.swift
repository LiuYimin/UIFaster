//
//  LMPreSearchInView.swift
//  UIFaster
//
//  Created by 0000 on 2023/12/26.
//

import UIKit
import RxSwift
import RxCocoa
import RxGesture

class LMPreSearchView: UIView, UITableViewDelegate, UITableViewDataSource {
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
    var headerView: LMPreSearchHeaderView = {
        let h = LMPreSearchHeaderView()
        h.clipsToBounds = true
        return h
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
        backgroundColor = .white
        tableView.delegate = self
        tableView.dataSource = self
        tableView.separatorStyle = .none
        tableView.contentInset = UIEdgeInsets.zero
        tableView.register(LMPreSearchTrendingCell.self, forCellReuseIdentifier: "LMPreSearchTrendingCell")
        
        headerView.updateHeightCallback = {[weak self] h in
            if let header = self?.headerView {
                var f = header.frame
                f.size.height = h
                header.frame = f
                self!.tableView.tableHeaderView = header
                self!.tableView.reloadData()
            }
        }
        tableView.tableHeaderView = headerView
        
        addSubview(tableView)
        tableView.snp.makeConstraints { make in
            make.left.right.top.bottom.equalToSuperview()
        }
    }
    
    func setupBind() {
        LMSearchManager.shared.trendingNowList.subscribe(with: self) { owner, list in
            owner.tableView.reloadData()
        }.disposed(by: disposeBag)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return LMSearchManager.shared.trendingNowList.value.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "LMPreSearchTrendingCell", for: indexPath) as! LMPreSearchTrendingCell
        tableView.separatorStyle = .none
        if LMSearchManager.shared.trendingNowList.value.count > indexPath.row {
            cell.titleLab.text = LMSearchManager.shared.trendingNowList.value[indexPath.row]
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        if LMSearchManager.shared.historyKeyList.value.count == 0 {
            return 50.0
        }
        return 40.0
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let header = LMPreSearchSectionView.init(frame: CGRect(x: 0, y: 0, width: tableView.bounds.size.width, height: 40.0))
        header.deleteBtn.isHidden = true
        header.imageView.image = UIImage.init(named: "search_history_trending")
        header.titleLabel.text = "Trending Now"
        return header
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 52.0
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let cell = tableView.cellForRow(at: indexPath) as? LMPreSearchTrendingCell {
            LMSearchManager.shared.selectedKey.onNext(cell.titleLab.text ?? "")
        }
    }
}

class LMPreSearchHeaderView: UIView {
    let disposeBag = DisposeBag()
    var topView: LMPreSearchSectionView = {
        let v = LMPreSearchSectionView()
        v.titleLabel.text = "History"
        v.imageView.image = UIImage.init(named: "search_history_icon")
        return v
    }()
    
    var containerView: UIView = {
        let cv = UIView()
        return cv
    }()
    
    var openAll = false
    var allItems: [LMPreSearchHistoryItemView] = []
    var selfWidth = 10.0
    var keys: [String] = []
    let maxLine = 2
    
    var updateHeightCallback: ((CGFloat) -> Void)?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
        setupBind()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupUI()
    }
    
    func setupUI() {
        addSubview(topView)
        addSubview(containerView)
        topView.snp.makeConstraints { make in
            make.top.leading.trailing.equalToSuperview()
            make.height.equalTo(56.0)
        }
        containerView.snp.makeConstraints { make in
            make.left.right.bottom.equalToSuperview()
            make.top.equalTo(topView.snp.bottom)
        }
    }
    
    func setupBind() {
        LMSearchManager.shared.historyKeyList.distinctUntilChanged().subscribe(with: self) { owner, keys in
            owner.keys = keys
            owner.updateItems()
        }.disposed(by: disposeBag)
        LMSearchManager.shared.openMoreHistory.subscribe(with: self) { owner, _ in
            owner.openAll = !owner.openAll
            owner.updateItems()
        }.disposed(by: disposeBag)
        
        topView.deleteCallback = {
            LMSearchManager.shared.deleteAllHistory()
        }
    }
    
    func updateItems() {
        allItems.forEach { item in
            item.removeFromSuperview()
        }
        allItems.removeAll()
        
        guard keys.count > 0 else { return }
        
        let paddingLR = 24.0
        var startX = paddingLR
        var startY = 0.0
        let gap = 8.0
        let height = 34.0
        var line = 1
        let emptyWidth = LMPreSearchHistoryItemView.getWidth("")
        var keys = keys
        if openAll {
            //插入个收起
            keys.append("")
        }
        
        for key in keys {
            let itemWidth = LMPreSearchHistoryItemView.getWidth(key)
            var frame = CGRect(x: startX, y: startY, width: itemWidth, height: height)
            
            var img = UIImage.init(named: "search_history_close")
            if frame.maxX > (selfWidth - paddingLR) {
                line += 1
                frame.origin.x = paddingLR
                frame.origin.y = startY + height + gap
            }
            
            if !openAll && ((line == maxLine && (frame.maxX + emptyWidth) > (selfWidth - paddingLR)) || line > maxLine) {
                //这时，就插入个展开按钮
                img = UIImage.init(named: "search_history_arrow_down")
                frame.size.width = emptyWidth
                frame.origin.y = height + gap
                frame.origin.x = startX
                let item = LMPreSearchHistoryItemView.init(frame: frame)
                item.keyLabel.text = ""
                item.flagImv.image = img
                item.updateSingleLayout()
                allItems.append(item)
                containerView.addSubview(item)
                
                break
            }
            
            if openAll && key.count == 0 {
                img = UIImage.init(named: "search_history_arrow_up")
            }
            
            startX = frame.maxX + gap
            startY = frame.minY
            
            let item = LMPreSearchHistoryItemView.init(frame: frame)
            item.keyLabel.text = key
            item.flagImv.image = img
            if key.count == 0 {
                item.updateSingleLayout()
            }
            allItems.append(item)
            containerView.addSubview(item)
        }
        adjustHeight()
    }
    
    func adjustHeight() {
        let maxYMax = allItems.reduce(CGFloat.leastNormalMagnitude) { (currentMax, view) in
            return max(currentMax, view.frame.maxY)
        }
        var h = 56.0 + maxYMax + 16.0
        if allItems.count == 0 {
            h = 0.0
        }
        if let cb = updateHeightCallback {
            
            cb(h)
        }
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        if selfWidth != bounds.size.width {
            selfWidth = bounds.size.width
            updateItems()
        }
        
        adjustHeight()
    }
}

class LMPreSearchSectionView: UIView {
    let disposeBag = DisposeBag()
    var deleteCallback: (() -> ())? = nil
    
    var imageView: UIImageView = UIImageView()
    var titleLabel: UILabel = UILabel()
    var deleteBtn: UIButton = {
        let btn = UIButton(type: .custom)
        btn.setImage(UIImage.init(named: "search_history_delete"), for: .normal)
        return btn
    }()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupUI()
        setupBind()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
        setupBind()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupUI()
    }
    
    func setupUI() {
        addSubview(imageView)
        addSubview(titleLabel)
        addSubview(deleteBtn)
        
        imageView.snp.makeConstraints { make in
            make.left.equalToSuperview().offset(24.0)
            make.centerY.equalToSuperview()
            make.width.height.equalTo(24)
        }
        
        titleLabel.snp.makeConstraints { make in
            make.left.equalTo(imageView.snp.right).offset(5)
            make.centerY.equalToSuperview()
        }
        
        deleteBtn.snp.makeConstraints { make in
            make.right.equalToSuperview().offset(-16)
            make.centerY.equalToSuperview()
            make.width.equalTo(48)
            make.height.equalTo(38)
        }
        
        titleLabel.font = UIFont.boldSystemFont(ofSize: 16)
        titleLabel.textColor = .black
    }
    
    func setupBind() {
        deleteBtn.rx
            .tap
            .throttle(.seconds(2), latest: false, scheduler: MainScheduler.instance).subscribe(with: self) { owner, _ in
                if let action = owner.deleteCallback {
                    action()
                }
            }.disposed(by: disposeBag)
    }
}

class LMPreSearchTrendingCell: UITableViewCell {
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

class LMPreSearchHistoryItemView: UIView {
    let disposeBag = DisposeBag()

    var keyLabel: UILabel = {
        let lab = UILabel()
        return lab
    }()
    var flagImv: UIImageView = {
        let v = UIImageView()
        return v
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
        setupBind()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupUI()
    }
    
    //只有图片时
    func updateSingleLayout() {
        flagImv.snp.remakeConstraints { make in
            make.width.height.equalTo(24.0)
            make.center.equalToSuperview()
        }
    }

    func setupBind() {
        keyLabel.rx
            .tapGesture().when(.recognized)
            .throttle(.seconds(2), latest: false, scheduler: MainScheduler.instance).subscribe(with: self) { owner, _ in
                LMSearchManager.shared.selectedKey.onNext(owner.keyLabel.text ?? "")
            }.disposed(by: disposeBag)
        flagImv.rx
            .tapGesture().when(.recognized)
            .throttle(.seconds(2), latest: false, scheduler: MainScheduler.instance).subscribe(with: self) { owner, _ in
                if let key = owner.keyLabel.text, key.count > 0 {
                    LMSearchManager.shared.deleteSingleHistory(key)
                } else {
                    LMSearchManager.shared.openMoreHistory.onNext("")
                }
            }.disposed(by: disposeBag)
    }
    
    func setupUI() {
        addSubview(flagImv)
        addSubview(keyLabel)
        
        layer.borderColor = UIColor.init(named: "mm_gray2")?.cgColor
        layer.borderWidth = 1
        
        keyLabel.textColor = .black
        keyLabel.font = UIFont.nunitoRegular(14)
        
        keyLabel.snp.makeConstraints { make in
            make.left.equalToSuperview().offset(12.0)
            make.centerY.equalToSuperview()
        }
        flagImv.snp.makeConstraints { make in
            make.left.equalTo(keyLabel.snp.right).offset(4.0)
            make.right.equalToSuperview().offset(-8.0)
            make.width.height.equalTo(24.0)
            make.centerY.equalToSuperview()
        }
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        layer.cornerRadius = bounds.size.height/2.0
    }
    
    static func getWidth(_ text: String) -> CGFloat {
        func getLabWidth(_ text: String) -> CGFloat {
            let lab = UILabel()
            lab.font = UIFont.nunitoRegular(14)
            lab.text = text
            return ceil(lab.sizeThatFits(CGSize(width: 120, height: 20)).width)
        }
        
        var width = 0.0
        if text.count > 0 {
            width += 12.0
            width += getLabWidth(text)
            width += 4.0
            width += 24.0
            width += 8.0
        } else {
            width += 8.0
            width += 24.0
            width += 8.0
        }
        return width
    }
}

class UICollectionViewLeftFlowLayout: UICollectionViewFlowLayout {
    override init() {
        super.init()
        estimatedItemSize=CGSize(width:100, height:25)
        sectionInset = .init(top: 0, left: 24, bottom: 0, right: 24)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        estimatedItemSize=CGSize(width:100, height:30)
        sectionInset = .init(top: 0, left: 24, bottom: 0, right: 24)
    }
    
    override func layoutAttributesForElements(in rect: CGRect) -> [UICollectionViewLayoutAttributes]? {
        guard let attrsArry = super.layoutAttributesForElements(in: rect) else {
            return nil
        }
        for i in 0..<attrsArry.count {
            if i != attrsArry.count-1 {
                let curAttr = attrsArry[i] //当前attr
                let nextAttr = attrsArry[i+1]  //下一个attr
                //如果下一个在同一行则调整，不在同一行则跳过
                if curAttr.frame.minY == nextAttr.frame.minY {
                    if nextAttr.frame.minX - curAttr.frame.maxX > minimumInteritemSpacing{
                        var frame = nextAttr.frame
                        let x = curAttr.frame.maxX + minimumInteritemSpacing
                        frame = CGRect(x: x, y: frame.minY, width: frame.width, height: frame.height)
                        nextAttr.frame = frame
                    }
                }
            }
        }
        return attrsArry
    }
}
