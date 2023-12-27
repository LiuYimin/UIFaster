//
//  UIFontEx.swift
//  ArtisseAI
//
//  Created by 0000 on 2023/9/23.
//

import UIKit

extension UIFont {
   // weight 200
   static func nunitoThin(_ size: CGFloat, useFit: Bool = false) -> UIFont {
      let sz = size
      return UIFont(name: "Nunito-ExtraLight", size: sz) ?? UIFont.systemFont(ofSize: sz, weight: .thin)
   }
   
   // weight 300
   static func nunitoLight(_ size: CGFloat, useFit: Bool = false) -> UIFont {
      let sz = size
      return UIFont(name: "Nunito-Light", size: sz) ?? UIFont.systemFont(ofSize: sz, weight: .light)
   }
   
   // weight 400
   static func nunitoRegular(_ size: CGFloat, useFit: Bool = false) -> UIFont {
      let sz = size
      return UIFont(name: "Nunito-Regular", size: sz) ?? UIFont.systemFont(ofSize: sz, weight: .regular)
   }
   
   // weight 500
   static func nunitoMedium(_ size: CGFloat, useFit: Bool = false) -> UIFont {
      let sz = size
      return UIFont(name: "Nunito-Medium", size: sz) ?? UIFont.systemFont(ofSize: sz, weight: .medium)
   }
   
   // weight 600
   static func nunitoSemiBold(_ size: CGFloat, useFit: Bool = false) -> UIFont {
      let sz = size
      return UIFont(name: "Nunito-SemiBold", size: sz) ?? UIFont.systemFont(ofSize: sz, weight: .semibold)
   }
   
   // weight 700
   static func nunitoBold(_ size: CGFloat, useFit: Bool = false) -> UIFont {
      let sz = size
      return UIFont(name: "Nunito-Bold", size: sz) ?? UIFont.systemFont(ofSize: sz, weight: .bold)
   }
   
   // weight 800
   static func nunitoHeavy(_ size: CGFloat, useFit: Bool = false) -> UIFont {
      let sz = size
      return UIFont(name: "Nunito-ExtraBold", size: sz) ?? UIFont.systemFont(ofSize: sz, weight: .heavy)
   }
   
   // weight 900
   static func nunitoBlack(_ size: CGFloat, useFit: Bool = false) -> UIFont {
      let sz = size
      return UIFont(name: "Nunito-Black", size: sz) ?? UIFont.systemFont(ofSize: sz, weight: .black)
   }
}
