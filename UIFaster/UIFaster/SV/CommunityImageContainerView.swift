//
//  CommunityCellImageView.swift
//  UIFaster
//
//  Created by 0000 on 2024/1/2.
//

import UIKit
import RxSwift
import RxCocoa


@objc
protocol CommunityImageContainerViewDelegate: NSObjectProtocol {
    /// Tells the delegate when a scrolling animation in the pager view concludes.
    @objc(pagerViewDidEndScrollAnimation:)
    optional func pagerViewDidEndScrollAnimation(_ pagerView: CommunityImageContainerView)
    
    /// Tells the delegate that the pager view has ended decelerating the scrolling movement.
    @objc(pagerViewDidEndDecelerating:)
    optional func pagerViewDidEndDecelerating(_ pagerView: CommunityImageContainerView)
}

class CommunityImageContainerView: UIView {
    let scrollView = UIScrollView()
    var currentIndex: Int = 0
    internal var timer: Timer?
    open weak var delegate: CommunityImageContainerViewDelegate?

    open var automaticSlidingInterval: CGFloat = 0.0 {
        didSet {
            self.cancelTimer()
            if self.automaticSlidingInterval > 0 {
                self.startTimer()
            }
        }
    }
    
    var images: [UIImage?] = [] {
        didSet {
            refreshItems()
        }
    }
    
    var itemWidth: CGFloat {
        get {
            if self.scrollView.bounds.width > 0 {
                return scrollView.bounds.width
            }
            return 1.0
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        initUI()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        initUI()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    func initUI() {
        addSubview(scrollView)
        scrollView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        scrollView.isPagingEnabled = true
        scrollView.clipsToBounds = false
        scrollView.delegate = self
    }
    
    func refreshItems() {
        scrollView.subviews.forEach { $0.removeFromSuperview() }
        let itemW = ScreenW - 40
        let itemH = itemW * 1.5
        for i in 0..<images.count {
            let imv = CommunityCellImageView()
            imv.imv.image = images[i]
            scrollView.addSubview(imv)
            imv.frame = CGRect(x: CGFloat(i) * itemW, y: 0, width: itemW, height: itemH)
            imv.clipsToBounds = true
            imv.contentMode = .scaleAspectFill
            scrollView.contentSize = CGSize(width: imv.frame.maxX, height: itemH)
        }
    }
    
    func scrollToItem(at index: Int, animated: Bool) {
        guard index < images.count else { return }
        let contentOffset = CGPoint(x: CGFloat(index) * self.itemWidth, y: 0)
        scrollView.setContentOffset(contentOffset, animated: animated)
    }
    
}

extension CommunityImageContainerView {
    override func willMove(toWindow newWindow: UIWindow?) {
        super.willMove(toWindow: newWindow)
        if newWindow != nil {
            self.startTimer()
        } else {
            self.cancelTimer()
        }
    }
}

extension CommunityImageContainerView: UIScrollViewDelegate {
    public func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let currentIndex = Int(Double(self.scrollView.contentOffset.x/self.itemWidth))
        if (currentIndex != self.currentIndex) {
            self.currentIndex = currentIndex
        }
//        guard let function = self.delegate?.pagerViewDidScroll else {
//            return
//        }
//        function(self)
    }
    
    public func scrollViewWillBeginDragging(_ scrollView: UIScrollView) {
//        if let function = self.delegate?.pagerViewWillBeginDragging(_:) {
//            function(self)
//        }
        if self.automaticSlidingInterval > 0 {
            self.cancelTimer()
        }
    }
    
    public func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
//        if let function = self.delegate?.pagerViewWillEndDragging(_:targetIndex:) {
//            let contentOffset = self.scrollDirection == .horizontal ? targetContentOffset.pointee.x : targetContentOffset.pointee.y
//            let targetItem = lround(Double(contentOffset/self.collectionViewLayout.itemSpacing))
//            function(self, targetItem % self.numberOfItems)
//        }
        if self.automaticSlidingInterval > 0 {
            self.startTimer()
        }
    }
    
    public func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        if let function = self.delegate?.pagerViewDidEndDecelerating {
            function(self)
        }
    }
    
    public func scrollViewDidEndScrollingAnimation(_ scrollView: UIScrollView) {
        if let function = self.delegate?.pagerViewDidEndScrollAnimation {
            function(self)
        }
    }
    
}

extension CommunityImageContainerView {
    fileprivate func cancelTimer() {
        guard self.timer != nil else {
            return
        }
        self.timer!.invalidate()
        self.timer = nil
    }
    
    fileprivate func startTimer() {
        guard self.automaticSlidingInterval > 0 && self.timer == nil else {
            return
        }
        self.timer = Timer.scheduledTimer(timeInterval: TimeInterval(self.automaticSlidingInterval), target: self, selector: #selector(self.flipNext(sender:)), userInfo: nil, repeats: true)
        RunLoop.current.add(self.timer!, forMode: .common)
    }
    
    @objc
    fileprivate func flipNext(sender: Timer?) {
        guard let _ = self.superview, let _ = self.window, self.images.count > 0 else {
            return
        }
        let contentOffset: CGPoint = {
            let current = Int(self.scrollView.contentOffset.x/self.itemWidth)
            var next = current + 1
            if next >= self.images.count {
                next = 0
            }
            return CGPoint(x: CGFloat(next) * self.itemWidth, y: 0)
        }()
        self.scrollView.setContentOffset(contentOffset, animated: contentOffset.x != 0)
    }
}

class CommunityCellImageView: UIView {
    var imv = UIImageView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    func setupViews() {
        imv.clipsToBounds = true
        imv.layer.cornerRadius = 8.0
        imv.contentMode = .scaleAspectFill
        addSubview(imv)
        imv.snp.makeConstraints { make in
            make.top.bottom.equalToSuperview()
            make.right.equalToSuperview().offset(-5.0)
            make.left.equalToSuperview().offset(5.0)
        }
    }
}
