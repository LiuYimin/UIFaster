//
//  NotificationV5Cell.swift
//  ArtisseAI
//
//  Created by 0000 on 2023/12/29.
//

import UIKit


class NotificationV5Cell: UITableViewCell {
   @IBOutlet weak var userIconImv: UIImageView!
   @IBOutlet weak var rightImv: UIImageView!
   @IBOutlet weak var topupBtn: UIButton!
   @IBOutlet weak var titleLab: UILabel!
   @IBOutlet weak var timeLab: UILabel!
   
//   var item: NotificationModel? {
//      didSet {
//         hideSkeletonUI()
//         updateUI()
//      }
//   }
   
   override func awakeFromNib() {
      super.awakeFromNib()
      setupViews()
      setupBinds()
   }
   
   func setupViews() {
      selectionStyle = .none
      topupBtn.superview?.isHidden = true
//      topupBtn.gradientType = .g6x
//      topupBtn.setTitle(RString.v5_topup(), for: .normal)
   }
   
   func showSkeletonUI() {
//      showSkeletonViews([userIconImv, titleLab, timeLab])
   }
   
   func hideSkeletonUI() {
//      hideSkeletonViews([userIconImv, titleLab, timeLab])
   }
   
   func setupBinds() {
      
   }
   
//   func updateUI() {
//      guard let item else { return }
//      
//      userIconImv.kf.setImage(with: item.actor?.avatar.url, placeholder: RImage.profile_default())
//      rightImv.kf.setImage(with: item.imageUrl.url, placeholder: RImage.default_place_image())
//      titleLab.attributedText = getAttrText(name: item.actor?.name ?? "", message: item.message)
//      timeLab.text = item.createdAt.toDateRegion?.date.formatElapsedTime() ?? ""
//    
//      switch item.action {
//      case .lowCredit:
//         userIconImv.image = RImage.v5_notification_logo()
//         rightImv.superview?.isHidden = true
//         topupBtn.superview?.isHidden = false
//      case .appUpdate, .imageGenerated, .trainCompleted, .freeTrial:
//         userIconImv.kf.setImage(with: item.item.imageLeft.url, placeholder: RImage.profile_default())
//         rightImv.isHidden = item.item.imageRight.count == 0
//         rightImv.superview?.isHidden = rightImv.isHidden
//         if !rightImv.isHidden {
//            rightImv.kf.setImage(with: item.item.imageRight.url, placeholder: RImage.default_place_image())
//         }
//         titleLab.attributedText = getAttrText(name: item.actor?.name ?? "", message: item.item.text)
//         topupBtn.superview?.isHidden = true
//      default:
//         topupBtn.superview?.isHidden = true
//         rightImv.superview?.isHidden = item.imageUrl.count == 0
//      }
//      
//      contentView.backgroundColor = item.read ? UIColor.white:UIColor.init(hexString: "#FFF6F2")
//   }
   
//   func getAttrText(name: String, message: String) -> NSAttributedString {
//      let attributedString = NSMutableAttributedString()
//
//      // Name部分
//      let nameAttributes: [NSAttributedString.Key: Any] = [
//         .font: UIFont.nunitoBold(16),
//      ]
//
//      let nameAttributedString = NSAttributedString(string: name + " ", attributes: nameAttributes)
//      attributedString.append(nameAttributedString)
//
//      // Message部分
//      let messageAttributes: [NSAttributedString.Key: Any] = [
//         .font: UIFont.nunitoRegular(14),
//      ]
//
//      let messageAttributedString = NSAttributedString(string: message, attributes: messageAttributes)
//      attributedString.append(messageAttributedString)
//      return attributedString
//   }
}
