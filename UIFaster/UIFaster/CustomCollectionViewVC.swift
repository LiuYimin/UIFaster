//
//  CustomCollectionViewVC.swift
//  UIFaster
//
//  Created by 0000 on 2024/1/5.
//

import UIKit

class GradientSwitch: UISwitch {
    private var gradientLayer: CAGradientLayer!

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupGradient()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupGradient()
    }

    private func setupGradient() {
        gradientLayer = CAGradientLayer()
        gradientLayer.frame = bounds
        gradientLayer.colors = [UIColor.red.cgColor, UIColor.blue.cgColor]
        gradientLayer.locations = [0.0, 1.0]
        layer.insertSublayer(gradientLayer, at: 0)
        layer.cornerRadius = bounds.height / 2.0
        clipsToBounds = true
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        gradientLayer.frame = bounds
    }

    override func setOn(_ on: Bool, animated: Bool) {
        super.setOn(on, animated: animated)

        let startColor = on ? UIColor.green : UIColor.red
        let endColor = on ? UIColor.blue : UIColor.yellow

        if animated {
            let colorAnimation = CABasicAnimation(keyPath: "colors")
            colorAnimation.fromValue = gradientLayer.colors
            colorAnimation.toValue = [startColor.cgColor, endColor.cgColor]
            colorAnimation.duration = 0.3
            colorAnimation.timingFunction = CAMediaTimingFunction(name: .easeInEaseOut)

            gradientLayer.colors = [startColor.cgColor, endColor.cgColor]
            gradientLayer.add(colorAnimation, forKey: "colorChange")
        } else {
            gradientLayer.colors = [startColor.cgColor, endColor.cgColor]
        }
    }
}


class CustomCollectionViewVC: UIViewController {
    @IBOutlet weak var collectionView: UICollectionView!
    
    var items: [String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        view.backgroundColor = .mmPink
        
        let switchBtn = GradientSwitch()
        
        view.addSubview(switchBtn)
        
        switchBtn.snp.makeConstraints { make in
            make.center.equalToSuperview()
        }
        
        switchBtn.setOn(false, animated: true)
        
        
//        let v = UIView()
//        v.backgroundColor = .red
//        view.addSubview(v)
//        
//        v.snp.makeConstraints { make in
//            make.width.equalTo(100)
//            make.height.equalTo(100)
//            make.top.equalToSuperview().offset(100)
//            make.left.equalToSuperview().offset(100)
//        }
//        
//        v.snp.remakeConstraints { make in
//            make.top.equalToSuperview().offset(500)
//        }
        
        
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
