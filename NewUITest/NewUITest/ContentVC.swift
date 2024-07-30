//
//  ContentVC.swift
//  NewUITest
//
//  Created by 0000 on 2024/2/14.
//

import UIKit

class ContentVC: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemCyan
    }
    @IBAction func tapAA(_ sender: Any) {
        let vc = MainVC.instantiate(storyboardName: "Main", storyboardID: "MainVC")
        let nav = UINavigationController(rootViewController: vc)
        nav.modalPresentationStyle = .overCurrentContext
        present(nav, animated: true)
    }
}

extension UIViewController {
   static func instantiate(storyboardName: String? = nil, storyboardID: String? = nil) -> Self {
      switch (storyboardName, storyboardID) {
      case (.some(let name), .some(let id)):
         return UIStoryboard(name: name, bundle: .main).instantiateViewController(withIdentifier: id) as! Self
      case (.some(let name), .none):
         return UIStoryboard(name: name, bundle: .main).instantiateViewController(withIdentifier: String(describing: Self.self)) as! Self
      case (.none, .some(let id)):
         return UIStoryboard(name: String(describing: Self.self), bundle: .main).instantiateViewController(withIdentifier: id) as! Self
      case (.none, .none):
         return UIStoryboard(name: String(describing: Self.self), bundle: .main).instantiateInitialViewController() as! Self
      }
   }
}
