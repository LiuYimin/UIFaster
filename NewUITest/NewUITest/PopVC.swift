//
//  PopVC.swift
//  NewUITest
//
//  Created by 0000 on 2024/2/14.
//

import UIKit

class PopVC: UIViewController {
    @IBOutlet weak var textLab: UILabel!
    @IBOutlet weak var textF: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let fullText = "Label #45 #67"
        let attributedString = NSMutableAttributedString(string: fullText)

        let regex = try! NSRegularExpression(pattern: "\\s#(\\w+)", options: [])
        let matches = regex.matches(in: fullText, options: [], range: NSRange(location: 0, length: fullText.utf16.count))
        
        for match in matches {
           // 设置匹配到的字符串的样式为红色，并添加链接
           attributedString.addAttribute(.foregroundColor, value: UIColor.red, range: match.range)
//           attributedString.addAttribute(.link, value: attributedString.attributedSubstring(from: match.range), range: match.range)
//           attributedString.addAttribute(.foregroundColor, value: UIColor.red, range: match.range)
        }
        
        textLab.attributedText = attributedString
        
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(handleLabelTap(_:)))
        textLab.addGestureRecognizer(tapGestureRecognizer)
        textLab.isUserInteractionEnabled = true
        
        let view = MonthYearWheelPicker()
        view.onDateSelected = {(month, year) in
            
        }
        textF.inputView = view
    }
    
    @objc func handleLabelTap(_ gestureRecognizer: UITapGestureRecognizer) {
        
        
//       guard let label = gestureRecognizer.view as? UILabel else {
//           return
//       }
//       
//       let location = gestureRecognizer.location(in: label)
//       let textStorage = NSTextStorage(attributedString: label.attributedText!)
//       let layoutManager = NSLayoutManager()
//       textStorage.addLayoutManager(layoutManager)
//       let textContainer = NSTextContainer(size: label.bounds.size)
//       textContainer.lineFragmentPadding = 0
//       textContainer.maximumNumberOfLines = label.numberOfLines
//       textContainer.lineBreakMode = label.lineBreakMode
//       layoutManager.addTextContainer(textContainer)
//       
//       let characterIndex = layoutManager.characterIndex(for: location, in: textContainer, fractionOfDistanceBetweenInsertionPoints: nil)
//       
//       if let url = label.attributedText?.attribute(.link, at: characterIndex, effectiveRange: nil) as? NSAttributedString {
//          let selectedText = url.string
//          if selectedText.count > 0 {
//             print("Clicked: \(selectedText)")
//              
//              
//          }
//       }
//        let vc = ContentVC.instantiate(storyboardName: "Main", storyboardID: "ContentVC")
//        present(vc, animated: true)
   }
}
