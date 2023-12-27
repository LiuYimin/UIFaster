//
//  LMSearchManager.swift
//  UIFaster
//
//  Created by 0000 on 2023/12/26.
//

import Foundation
import RxSwift
import RxCocoa

enum LMSearchManagerState {
    case pre, ing, post
}

class LMSearchManager {
    let disposeBag = DisposeBag()
    let maxLength = 15
    let state = BehaviorRelay<LMSearchManagerState>(value: .pre)
    let selectedKey = PublishSubject<String>()
    let openMoreHistory = PublishSubject<Any>()
    let trendingNowList = BehaviorRelay<[String]>(value: [])
    let suggestedKeys = BehaviorRelay<[String]>(value: [])
    
    static let shared = LMSearchManager()
    
    var historyKeyList = BehaviorRelay<[String]>(value: [])
    
    @UserDefault("cacheSearchHistory", defaultValue: [])
    var cacheSearchHistory: [String]?
    
    private init() {
        // 初始化的时候加载 cache
        if let cache = cacheSearchHistory {
            historyKeyList.accept(cache)
        }
        
        historyKeyList.subscribe(with: self) { owner, list in
            owner.cacheSearchHistory = list
        }.disposed(by: disposeBag)
    }
    
    func saveSearchText(_ key: String) {
        guard key.count > 0 else { return }
        var list = historyKeyList.value
        if let idx = list.firstIndex(of: key) {
            list.remove(at: idx)
        }
        list.insert(key, at: 0)
        let maxL = Array(list.prefix(maxLength))
        historyKeyList.accept(maxL)
    }
    
    func deleteAllHistory() {
        historyKeyList.accept([])
    }
    
    func deleteSingleHistory(_ key: String) {
        var list = historyKeyList.value
        if let idx = list.firstIndex(of: key) {
            list.remove(at: idx)
        }
        historyKeyList.accept(list)
    }
}

extension LMSearchManager {
    func fetchTrendingData() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 2, execute: DispatchWorkItem(block: {[weak self] in
            self?.trendingNowList.accept(["Amalfi coast", "Dispatch", "Work", "Item", "Nows", "Not work", "Good", "Test", "Heihei", "Good", "Girl", "LiLi"])
        }))
    }
    
    func fetchSearchResult(_ key: String) {
        DispatchQueue.main.asyncAfter(deadline: .now() + 3) {[weak self] in
            self?.state.accept(.post)
        }
    }
    
    func fetchSuggestKeys(_ key: String) {
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {[weak self] in
            self?.suggestedKeys.accept(["AAA", "Akk", "Aji", "Aweak", "BSelf", "BBB", "AAA", "SSS", "DDD"])
        }
    }
}
