//
//  FSPagerViewVC.swift
//  UIFaster
//
//  Created by 0000 on 2024/1/2.
//

import UIKit

class FSPagerViewVC: UIViewController {
    @IBOutlet weak var mainPagerView: FSPagerView!
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .purple
        mainPagerView.interitemSpacing = 8.0
        mainPagerView.register(FSPagerViewCell.self, forCellWithReuseIdentifier: "FSPagerViewCell")
        mainPagerView.reloadData()
        
        mainPagerView.collectionView.clipsToBounds = false
        mainPagerView.clipsToBounds = false
    }
}

extension FSPagerViewVC: FSPagerViewDataSource, FSPagerViewDelegate {
   func numberOfItems(in pagerView: FSPagerView) -> Int {
       return 9
   }
   
   func pagerView(_ pagerView: FSPagerView, cellForItemAt index: Int) -> FSPagerViewCell {
      let cell = pagerView.dequeueReusableCell(withReuseIdentifier: "FSPagerViewCell", at: index)
      cell.contentView.setNeedsLayout()
      cell.contentView.layoutIfNeeded()
      
       cell.imageView?.image = UIImage.init(named: "girl_0\(index+1)")
       cell.imageView?.contentMode = .scaleAspectFill
       cell.clipsToBounds = true
      
      return cell
   }
   
   func pagerViewWillEndDragging(_ pagerView: FSPagerView, targetIndex: Int) {
   }
   
   func pagerViewDidEndScrollAnimation(_ pagerView: FSPagerView) {
   }
   
   func pagerView(_ pagerView: FSPagerView, didSelectItemAt index: Int) {
      if let cell = pagerView.cellForItem(at: index) {
         DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
            cell.isSelected = false
            cell.isHighlighted = false
         }
      }
   }
   
   func pagerViewDidScroll(_ pagerView: FSPagerView) {
//      let scoffset = pagerView.scrollOffset
   }
}
