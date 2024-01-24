//
//  AnimateVC.swift
//  UIFaster
//
//  Created by 0000 on 2024/1/17.
//

import UIKit

class AnimateVC: UIViewController {
    @IBOutlet weak var animateLab: UILabel!
    
    let textFont = UIFont.systemFont(ofSize: 32, weight: .bold)
    
    var replaceLabel: UILabel = UILabel.init()
    var scrollTextView: LMTextScrollView = LMTextScrollView.init(frame: .zero)
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        animateLab.font = textFont
        animateLab.text = "IMAGINE YOURSELF IN DIVERSE HAIRSTYLES"
//        replaceLabel.font = animateLab.font
//        replaceLabel.textColor = animateLab.textColor
        view.addSubview(replaceLabel)
        view.addSubview(scrollTextView)
        scrollTextView.labelOne.font = textFont
        scrollTextView.labelTwo.font = textFont
        
        let attributedString = NSMutableAttributedString(string: animateLab.text!)
        
        // 寻找目标文字的范围
        if let range = attributedString.string.range(of: "HAIRSTYLES") {
            let nsRange = NSRange(range, in: attributedString.string)
            
            // 设置目标文字的颜色
            attributedString.addAttribute(NSAttributedString.Key.foregroundColor, value: UIColor.clear, range: nsRange)
        }
        
        // 将富文本应用到UILabel
        animateLab.attributedText = attributedString
    }
    
    @IBAction func onChangeAction(_ sender: Any) {
        scrollTextView.startChange("BODYSIZE")
    }
    
    @IBAction func onTapAction(_ sender: Any) {
//        UIView.animate(withDuration: 2) {[weak self] in
//            self?.animateLab.text = "IMAGINE YOURSELF IN DIVERSE             HAIRSTYLES"
//        }
//        let transition = CATransition()
//        transition.type = CATransitionType.push
//        transition.subtype = CATransitionSubtype.fromTop
//        transition.duration = 0.5
//        
//        // 在动画过程中修改文本
//        CATransaction.begin()
//        CATransaction.setCompletionBlock {
//            self.animateLab.text = "IMAGINE YOURSELF IN DIVERSE AAAAA"
//        }
        
        // 应用动画
//        animateLab.layer.add(transition, forKey: kCATransition)
//        CATransaction.commit()
        
        findTextFrame(for: "HAIRSTYLES", label: animateLab)
    }
    
    func findTextFrame(for targetText: String, label: UILabel) {
        guard let labelText = label.text else {
            return
        }
        
        let attributedText = NSAttributedString(string: labelText, attributes: [NSAttributedString.Key.font: label.font!])
        
        // 创建一个文本容器
        let textContainer = NSTextContainer(size: label.bounds.size)
        textContainer.lineFragmentPadding = 0.0
        
        // 创建一个布局管理器
        let layoutManager = NSLayoutManager()
        layoutManager.addTextContainer(textContainer)
        
        // 将文本添加到布局管理器
        let textStorage = NSTextStorage(attributedString: attributedText)
        textStorage.addLayoutManager(layoutManager)
        
        // 寻找目标文字的范围
        if let range = labelText.range(of: targetText) {
            let nsRange = NSRange(range, in: labelText)
            
            // 计算文字的边界框
            let glyphRange = layoutManager.glyphRange(forCharacterRange: nsRange, actualCharacterRange: nil)
            var textBoundingBox = layoutManager.boundingRect(forGlyphRange: glyphRange, in: textContainer)
            
            // 转换为UILabel的坐标系
            textBoundingBox.origin.x += label.frame.origin.x
            textBoundingBox.origin.y += label.frame.origin.y
            
            // 在控制台打印文字的边界框
            print("Text Frame: \(textBoundingBox)")
            
//            replaceLabel.frame = textBoundingBox
//            replaceLabel.text = targetText
            scrollTextView.labelOne.text = targetText
            scrollTextView.frame = textBoundingBox
        }
    }
}


class LMTextScrollView: UIView {
    var labelOne: UILabel = {
        let lab = UILabel.init()
        return lab
    }()
    var labelTwo: UILabel = {
        let lab = UILabel.init()
        return lab
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupViews() {
        backgroundColor = .white
        clipsToBounds = true
        addSubview(labelOne)
        addSubview(labelTwo)
    }
    
    
    override func layoutSubviews() {
        super.layoutSubviews()
        if bounds.width != labelOne.bounds.width {
            labelOne.frame = bounds
            labelTwo.frame = CGRect.init(x: 0, y: labelOne.frame.height, width: bounds.width, height: bounds.height)
        }
    }
    
    func startChange(_ text: String) {
        labelTwo.text = text
        
        var frame1 = labelOne.frame
        var frame2 = labelOne.frame
        frame1.origin.y = -frame1.height
        UIView.animate(withDuration: 0.5) { [weak self] in
            self?.labelOne.frame = frame1
            self?.labelTwo.frame = frame2
        } completion: { finish in
            self.labelOne.text = text
            self.labelOne.frame = frame2
            frame2.origin.y = frame2.height
            self.labelTwo.frame = frame2
        }
        
//        let transition = CATransition()
//        transition.type = CATransitionType.push
//        transition.subtype = CATransitionSubtype.fromTop
//        transition.duration = 0.5
//        
//        // 在动画过程中修改文本
//        CATransaction.begin()
//        CATransaction.setCompletionBlock {[weak self] in
//            self?.labelOne.text = text
//        }
//        
//        //应用动画
//        labelOne.layer.add(transition, forKey: kCATransition)
//        labelTwo.layer.add(transition, forKey: kCATransition)
//        CATransaction.commit()
    }
}
