//
//  CustomCollectionViewVC.swift
//  UIFaster
//
//  Created by 0000 on 2024/1/5.
//

import UIKit

class CustomCollectionViewVC: UIViewController {
    @IBOutlet weak var collectionView: UICollectionView!
    
    var items: [String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .mmPink
        
        
        
        collectionView.register(OnboardingUploadingViewPreviewCell.self, forCellWithReuseIdentifier: "OnboardingUploadingViewPreviewCell")
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        items.append("girl_01")
        collectionView.reloadData()
    }
}

extension CustomCollectionViewVC: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return items.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "OnboardingUploadingViewPreviewCell", for: indexPath) as! OnboardingUploadingViewPreviewCell
        cell.imageView.image = UIImage.init(named: items[indexPath.item])
//        cell.imageView.backgroundColor = .red
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = collectionView.frame.size.width
        let itmW = floor((width - 4 * 8 - 40.0)/5.0)
        return CGSize(width: itmW, height: itmW)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 8
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 8
    }
}


class OnboardingUploadingViewPreviewCell: UICollectionViewCell {
   var imageView = UIImageView()
   
   override init(frame: CGRect) {
      super.init(frame: frame)
      setupViews()
   }
   
   required init?(coder: NSCoder) {
      super.init(coder: coder)
   }
   
//   var item: OnboardingManager.Item? {
//      didSet {
//         updateUI()
//      }
//   }
   
   func setupViews() {
      contentView.addSubview(imageView)
      imageView.contentMode = .scaleAspectFill
      imageView.clipsToBounds = true
      imageView.layer.cornerRadius = 8.0
//      imageView.snp.makeConstraints { make in
//         make.edges.equalToSuperview()
//      }
   }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        imageView.frame = contentView.bounds
    }
   
//   func updateUI() {
//      guard let item else { return }
//      if item.cellType == .img {
//         hideSkeletonViews([imageView])
//         imageView.kf.setImage(with: item.uploadResult?.imageURL.url, placeholder: RImage.default_place_image())
//      } else {
//         showSkeletonViews([imageView])
//      }
//   }
}
