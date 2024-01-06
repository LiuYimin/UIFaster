//
//  CollVC.swift
//  UIFaster
//
//  Created by 0000 on 2024/1/2.
//

import UIKit

//public let ScreenW = UIScreen.main.bounds.width
//
//public let ScreenH = UIScreen.main.bounds.height

class CollVC: UIViewController {
    @IBOutlet weak var containerV: CommunityImageContainerView!
//    var sv = UIScrollView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        containerV.images = [
            UIImage.init(named: "girl_01"),
            UIImage.init(named: "girl_02"),
            UIImage.init(named: "girl_03"),
            UIImage.init(named: "girl_04"),
            UIImage.init(named: "girl_05"),
            UIImage.init(named: "girl_06"),
            UIImage.init(named: "girl_07"),
            UIImage.init(named: "girl_08"),
            UIImage.init(named: "girl_09")
        ]
        containerV.delegate = self
        containerV.automaticSlidingInterval = 3.0
//        containerV.addSubview(sv)
//        containerV.clipsToBounds = false
//        sv.snp.makeConstraints { make in
//            make.edges.equalToSuperview()
//        }
//        sv.isPagingEnabled = true
//        sv.clipsToBounds = false
//        
//        let itemW = ScreenW - 40
//        let itemH = itemW * 1.5
//        let gap = 0.0
//        for i in 0..<9 {
//            let imv = CollImageCell()
//            imv.imv.image = UIImage.init(named: "girl_0\(i+1)")
//            sv.addSubview(imv)
//            imv.frame = CGRect(x: CGFloat(i) * (itemW + gap), y: 0, width: itemW, height: itemH)
//            imv.clipsToBounds = true
//            imv.contentMode = .scaleAspectFill
//            sv.contentSize = CGSize(width: imv.frame.maxX, height: itemH)
//        }
        
//        collectionViewXX.isPagingEnabled = true
    }
}

//extension CollVC: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
//    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
//        return 9
//    }
//    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
//        collectionViewXX.register(UINib.init(nibName: "CollCell", bundle: nil), forCellWithReuseIdentifier: "CollCell\(indexPath.item)")
//        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CollCell\(indexPath.item)", for: indexPath) as! CollCell
//        cell.imageView.image = UIImage.init(named: "girl_0\(indexPath.item+1)")
//        return cell
//    }
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
//        return 10
//    }
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
//        return 10
//    }
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
//        return CGSize(width: collectionView.bounds.size.width-30, height: collectionView.bounds.size.height)
//    }
//}
//

extension CollVC: CommunityImageContainerViewDelegate {
    func pagerViewDidEndDecelerating(_ pagerView: CommunityImageContainerView) {
        
    }
    
    func pagerViewDidEndScrollAnimation(_ pagerView: CommunityImageContainerView) {
        print("\(pagerView.currentIndex)")
    }
}

extension CollVC: UIScrollViewDelegate {
    func scrollViewWillBeginDragging(_ scrollView: UIScrollView) {
        
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
//        adjustContentOffsetForPaging()
    }
    
//    func adjustContentOffsetForPaging() {
//        let pageWidth = collectionViewXX.bounds.width - 30
//        let currentPage = round(collectionViewXX.contentOffset.x / pageWidth)
//        
//        let newOffsetX = currentPage * pageWidth
//        collectionViewXX.setContentOffset(CGPoint(x: newOffsetX, y: 0), animated: true)
//    }
}

class CustomPagingCollectionView: UICollectionView {

//    let pageSpacing: CGFloat = 10.0 // 你可以根据需要自定义页面之间的间隔

//    override func layoutSubviews() {
//        super.layoutSubviews()
//        adjustContentOffsetForCustomPaging()
//    }
//
//    func adjustContentOffsetForCustomPaging() {
//        let pageWidth = self.bounds.width + pageSpacing
//        let currentPage = round(self.contentOffset.x / pageWidth)
//
//        let newOffsetX = currentPage * pageWidth
//        self.setContentOffset(CGPoint(x: newOffsetX, y: 0), animated: true)
//    }
}

class CollImageCell: UIView {
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
        imv.contentMode = .scaleAspectFill
        addSubview(imv)
        imv.snp.makeConstraints { make in
            make.top.bottom.equalToSuperview()
            make.right.equalToSuperview().offset(-5.0)
            make.left.equalToSuperview().offset(5.0)
        }
    }
}
