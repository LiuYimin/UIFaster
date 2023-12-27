//
//  LMSearchVC.swift
//  UIFaster
//
//  Created by 0000 on 2023/12/13.
//

import UIKit
import RxSwift
import RxCocoa
import RxRelay

class LMSearchVC: UIViewController {
    let disposeBag = DisposeBag()
    
    let preView = LMPreSearchView()
    let ingView = LMSearchingView()
    let postView = LMPostSearchView()
    
    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var searchTf: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        setupBind()
        LMSearchManager.shared.fetchTrendingData()
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .darkContent
    }
    
    private func setupViews() {
        containerView.addSubview(preView)
        containerView.addSubview(ingView)
        containerView.addSubview(postView)
        preView.snp.makeConstraints { make in
            make.top.right.left.bottom.equalToSuperview()
        }
        ingView.snp.makeConstraints { make in
            make.top.right.left.bottom.equalToSuperview()
        }
        postView.snp.makeConstraints { make in
            make.top.right.left.bottom.equalToSuperview()
        }
    }
    
    private func setupBind() {
        LMSearchManager.shared.state.subscribe(with: self) { owner, state in
            owner.preView.isHidden = (state != .pre)
            owner.ingView.isHidden = (state != .ing || LMSearchManager.shared.suggestedKeys.value.count == 0)
            owner.postView.isHidden = (state != .post)
        }.disposed(by: disposeBag)
        
        LMSearchManager.shared.selectedKey.subscribe(with: self) { owner, text in
            owner.searchTf.text = text
            //请求
            LMSearchManager.shared.fetchSearchResult(text)
        }.disposed(by: disposeBag)
        
        searchTf.rx.text.throttle(.seconds(1), scheduler: MainScheduler.instance).distinctUntilChanged().subscribe(with: self, onNext: { owner, text in
           if let txt = text {
//              owner.clearBtn.isHidden = (txt.count == 0)
              if txt.count == 0 {
                  LMSearchManager.shared.state.accept(.pre)
              } else {
                  LMSearchManager.shared.state.accept(.ing)
                  LMSearchManager.shared.fetchSuggestKeys(txt)
              }
           }
        }).disposed(by: disposeBag)
              
        searchTf.rx.controlEvent(.editingDidBegin).subscribe(with: self) { owner, _ in
//           owner.searchIcon.image = RImage.v2_black_search()
        }.disposed(by: disposeBag)
        searchTf.rx.controlEvent(.editingDidEnd).subscribe(with: self) { owner, _ in
//           owner.searchIcon.image = RImage.v2_gray_search()
        }.disposed(by: disposeBag)
        searchTf.rx.controlEvent(.editingDidEndOnExit).subscribe(with: self) { owner, _ in
           //点击了搜索按钮
            LMSearchManager.shared.saveSearchText(owner.searchTf.text!)
//           Manager.shared.searchData(owner.searchTxtf.text!, page: 1)
            LMSearchManager.shared.state.accept(.post)
        }.disposed(by: disposeBag)

    }
    
    private func setupStyle() {
        
    }
}
