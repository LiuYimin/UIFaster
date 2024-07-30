//
//  LMPhotoShowVC.swift
//  UIFaster
//
//  Created by 0000 on 2024/1/24.
//

import UIKit
import RxSwift
import RxCocoa

class LMPhotoShowVC: UIViewController, UIGestureRecognizerDelegate {
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var waterFlowLayout: WaterFallFlowLayout!
    
    var gridCount = 2
    
    var dataList = [UIImage.init(named: "girl_01")!, UIImage.init(named: "girl_02")!, UIImage.init(named: "girl_03")!, UIImage.init(named: "girl_04")!, UIImage.init(named: "girl_05")!, UIImage.init(named: "girl_06")!, UIImage.init(named: "girl_07")!, UIImage.init(named: "girl_08")!, UIImage.init(named: "girl_09")!, UIImage.init(named: "girl_10")!, UIImage.init(named: "girl_11")!, UIImage.init(named: "girl_12")!, UIImage.init(named: "girl_13")!, UIImage.init(named: "girl_14")!, UIImage.init(named: "girl_15")!, UIImage.init(named: "girl_16")!, UIImage.init(named: "girl_17")!, UIImage.init(named: "girl_18")!, UIImage.init(named: "girl_19")!, UIImage.init(named: "girl_20")!, UIImage.init(named: "girl_21")!]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .mmGray4
        
        waterFlowLayout.delegate = self
        waterFlowLayout.minimumLineSpacing = 12.0
        waterFlowLayout.minimumInteritemSpacing = 12.0
        collectionView.register(UINib.init(nibName: "LMPhotoShowCell", bundle: nil), forCellWithReuseIdentifier: "LMPhotoShowCell")
        
        let pinchGesture = UIPinchGestureRecognizer(target: self, action: #selector(handlePinch(_:)))
        pinchGesture.delegate = self
        view.addGestureRecognizer(pinchGesture)
        
        
        var arr = [1,2,3,4]
        for (idx, item) in arr.enumerated() {
            if item == 3 {
                arr.remove(at: idx)
            }
        }
        print("BBBB")
        print(arr)
        
    }
    
    @objc func handlePinch(_ gesture: UIPinchGestureRecognizer) {
        guard let view = gesture.view else { return }
        
        if gesture.state == .ended {
            if gesture.scale > 1.1 {
                gridCount -= 1
            } else if gesture.scale < 0.9 {
                gridCount += 1
            }
            if gridCount <= 2 {
                gridCount = 2
            }
            if gridCount >= 4 {
                gridCount = 4
            }
            collectionView.reloadData()
        }
        
    }
    
    func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldRecognizeSimultaneouslyWith otherGestureRecognizer: UIGestureRecognizer) -> Bool {
        if let pinchGesture = gestureRecognizer as? UIPinchGestureRecognizer {
            // 在手势结束时判断是放大还是缩小
            print("Scale\(pinchGesture.scale)")
            if pinchGesture.state == .ended {
                
            }
        }
        return true
    }
}

extension LMPhotoShowVC: WaterFallLayoutDelegate {
    func heightForRowAtIndexPath(collectionView collection: UICollectionView, layout: WaterFallFlowLayout, indexPath: IndexPath, itemWidth: CGFloat) -> CGFloat {
        let itemW = (collectionView.bounds.size.width - 20.0 * 2.0 - 12.0)/2.0
        if indexPath.item % 2 == 0 {
            return itemW * 1.5
        }
        return itemW
    }
    
    func columnNumber(collectionView collection: UICollectionView, layout: WaterFallFlowLayout, section: Int) -> Int {
        return gridCount
    }
    
    func insetForSection(collectionView collection: UICollectionView, layout: WaterFallFlowLayout, section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 20, bottom: 50, right: 20)
    }
    
    func lineSpacing(collectionView collection: UICollectionView, layout: WaterFallFlowLayout, section: Int) -> CGFloat {
        return 12
    }
    
    func interitemSpacing(collectionView collection: UICollectionView, layout: WaterFallFlowLayout, section: Int) -> CGFloat {
        return 12
    }
}

extension LMPhotoShowVC: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return dataList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "LMPhotoShowCell", for: indexPath) as! LMPhotoShowCell
        
        cell.coverImageView.image = dataList[indexPath.item]
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if let cell = collectionView.cellForItem(at: IndexPath.init(item: 30, section: 0)) as? LMPhotoShowCell {
            print("OKKK")
        }
    }
}
