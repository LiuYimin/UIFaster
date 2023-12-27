//
//  ImageBrowser.swift
//  ArtisseAI
//
//  Created by 0000 on 2023/12/15.
//

import UIKit
import RxSwift
import RxCocoa

public let ScreenW = UIScreen.main.bounds.width
public let ScreenH = UIScreen.main.bounds.height

class ImageBrowser: UIViewController {
    static func showImage(image: UIImage, begingView: UIView?, currentVC: UIViewController) {
        let vc = ImageBrowser.instantiate()
        vc.modalPresentationStyle = .overFullScreen
        vc.modalPresentationCapturesStatusBarAppearance = true
        vc.showImage = image
        if let begingView {
            vc.begainFrame = begingView.convert(begingView.bounds, to: ImageBrowser.keywindow())
        }
        currentVC.present(vc, animated: false)
    }
    
    
    static func keywindow() -> UIWindow? {
        return UIApplication
            .shared
            .connectedScenes
            .compactMap { $0 as? UIWindowScene }
            .flatMap { $0.windows }
            .last { $0.isKeyWindow }
    }
    
    
    var showImage: UIImage?
    var begainFrame: CGRect?
    
    @IBOutlet weak var bgView: UIVisualEffectView!
    @IBOutlet weak var closeBtn: UIButton!
    var showImageView = UIImageView()
    let disposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        bgView.alpha = 0
        closeBtn.alpha = 0
        
        showImageView.contentMode = .scaleAspectFill
        showImageView.clipsToBounds = true
        showImageView.backgroundColor = .white
        view.addSubview(showImageView)
        
        closeBtn.rx
            .tap
            .throttle(.seconds(2), latest: false, scheduler: MainScheduler.instance).subscribe(with: self) { owner, _ in
            owner.hideAnimation()
        }.disposed(by: disposeBag)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        showAnimation()
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    func showAnimation() {
        guard let showImage else {
            dismiss(animated: false)
            return
        }
        let begainFrame = begainFrame ?? CGRect.init(origin: view.center, size: .zero)
        
        let itemW = ScreenW - 40.0
        let endFrame = CGRect.init(origin: CGPoint(x: 20.0, y: (ScreenH - itemW)/2.0), size: CGSize(width: itemW, height: itemW))
        
        showImageView.layer.cornerRadius = itemW/2.0
        view.bringSubviewToFront(showImageView)
        showImageView.frame = begainFrame
        showImageView.image = showImage
        var scale = itemW
        if begainFrame.width > 0 {
            scale = itemW/begainFrame.width
        }
        UIView.animate(withDuration: 0.3) {[weak self] in
            guard let self else { return }
            
            self.showImageView.transform = CGAffineTransform(scaleX: scale, y: scale)
            self.showImageView.center = CGPoint(x: endFrame.midX, y: endFrame.midY)
            self.bgView.alpha = 1.0
        } completion: {[weak self] complete in
            self?.closeBtn.alpha = 1
            self?.showImageView.transform = CGAffineTransformIdentity
            self?.showImageView.frame = endFrame
        }
        CATransaction.commit()
    }
    
    func hideAnimation() {
        closeBtn.alpha = 0
        UIView.animate(withDuration: 0.3) {[weak self] in
            guard let self else { return }
            self.showImageView.frame = self.begainFrame ?? CGRect.init(origin: self.view.center, size: .zero)
            self.showImageView.layer.cornerRadius = self.showImageView.frame.width/2.0
            self.bgView.alpha = 0.0
            self.view.layoutIfNeeded()
        } completion: {[weak self] complete in
            self?.dismiss(animated: false)
        }
    }
}

class ImageBrowserBgView: UIView {
    var blurView: UIVisualEffectView = {
        let blur = UIBlurEffect(style: .light)
        let blurView = UIVisualEffectView(effect: blur)
        return blurView
    }()
    
    var closeBtn: UIButton = {
        let btn = UIButton(type: .custom)
        
        return btn
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupViews()
    }
    
    func setupViews() {
        
    }
}

//extension UIViewController {
//    static func instantiate(storyboardName: String? = nil, storyboardID: String? = nil) -> Self {
//        switch (storyboardName, storyboardID) {
//        case (.some(let name), .some(let id)):
//            return UIStoryboard(name: name, bundle: .main).instantiateViewController(withIdentifier: id) as! Self
//        case (.some(let name), .none):
//            return UIStoryboard(name: name, bundle: .main).instantiateViewController(withIdentifier: String(describing: Self.self)) as! Self
//        case (.none, .some(let id)):
//            return UIStoryboard(name: String(describing: Self.self), bundle: .main).instantiateViewController(withIdentifier: id) as! Self
//        case (.none, .none):
//            return UIStoryboard(name: String(describing: Self.self), bundle: .main).instantiateInitialViewController() as! Self
//        }
//    }
//}
