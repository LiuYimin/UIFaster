//
//  NestedScrollView.swift
//  ArtisseAI
//
//  Created by 0000 on 2023/10/3.
//

import UIKit

class NestedSyncScrollContext {
   var maxOffsetY: CGFloat = 0 //内层最大的滑动距离
   var outerOffset: CGPoint = CGPoint.zero //内层offset
   var innerOffset: CGPoint = CGPoint.zero //外层offset
   var enableInnerRefresh: Bool = false//开启内层刷新后，外层将无法刷新
}

class OuterNestScrollView: UIScrollView {
   var syncScrollContext: NestedSyncScrollContext?
   override var contentOffset: CGPoint {
      didSet {
         if contentOffset.y != oldValue.y {
            //外层scrollView滑动
            if syncScrollContext?.innerOffset.y ?? 0 > 0 {
               // 内层的scrollView滑动，则外层的scrollView保持最大滑动距离
               contentOffset.y = syncScrollContext?.maxOffsetY ?? 0
            } else {
               //否则，内层不动，外层滑动
            }
            if let enable = syncScrollContext?.enableInnerRefresh, enable {
               contentOffset.y = contentOffset.y >= 0 ? contentOffset.y : 0
            }
            //同步offset到上下文
            syncScrollContext?.outerOffset = contentOffset
         }
      }
   }
}

class OuterNestTableView: UITableView {
   var syncScrollContext: NestedSyncScrollContext?
   override var contentOffset: CGPoint {
      didSet {
         if contentOffset.y != oldValue.y {
            //外层scrollView滑动
            if syncScrollContext?.innerOffset.y ?? 0 > 0 {
               // 内层的scrollView滑动，则外层的scrollView保持最大滑动距离
               contentOffset.y = syncScrollContext?.maxOffsetY ?? 0
            } else {
               //否则，内层不动，外层滑动
            }
            if let enable = syncScrollContext?.enableInnerRefresh, enable {
                contentOffset.y = contentOffset.y >= 0 ? contentOffset.y : 0
            }
            //同步offset到上下文
            syncScrollContext?.outerOffset = contentOffset
         }
      }
   }
}

class OuterNestCollectionView: UICollectionView {
   var syncScrollContext: NestedSyncScrollContext?
   override var contentOffset: CGPoint {
      didSet {
         if contentOffset.y != oldValue.y {
            //外层scrollView滑动
            if syncScrollContext?.innerOffset.y ?? 0 > 0 {
               // 内层的scrollView滑动，则外层的scrollView保持最大滑动距离
               contentOffset.y = syncScrollContext?.maxOffsetY ?? 0
            } else {
               //否则，内层不动，外层滑动
            }
            if let enable = syncScrollContext?.enableInnerRefresh, enable {
                 contentOffset.y = contentOffset.y >= 0 ? contentOffset.y : 0
            }
            //同步offset到上下文
            syncScrollContext?.outerOffset = contentOffset
         }
      }
   }
}


class InnerNestScrollView: UIScrollView, UIGestureRecognizerDelegate {
   var syncScrollContext: NestedSyncScrollContext?
   
   override var contentOffset: CGPoint {
      didSet {
         if contentOffset.y != oldValue.y {
            //内层滑动
            guard let syncScrollContext = syncScrollContext else { return }
            var enable = true
            if syncScrollContext.enableInnerRefresh {
                enable = syncScrollContext.outerOffset.y > 0
            }
            if syncScrollContext.outerOffset.y < syncScrollContext.maxOffsetY && enable {
               //外层的offset < 外层可滑动最大值，说明外层还需要滑动，内层不动offset为0
               contentOffset.y = 0
            }
            //不管怎么样，滑动即同步offset到上下文
            syncScrollContext.innerOffset = contentOffset
         }
      }
   }
   
   func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldRecognizeSimultaneouslyWith otherGestureRecognizer: UIGestureRecognizer) -> Bool {
      return true
   }
}

class InnerNestTableView: UITableView, UIGestureRecognizerDelegate {
   var syncScrollContext: NestedSyncScrollContext?
   
   override var contentOffset: CGPoint {
      didSet {
         if contentOffset.y != oldValue.y {
            //内层滑动
            guard let syncScrollContext = syncScrollContext else { return }
            var enable = true
            if syncScrollContext.enableInnerRefresh {
               enable = syncScrollContext.outerOffset.y > 0
            }
            if syncScrollContext.outerOffset.y < syncScrollContext.maxOffsetY && enable {
               //外层的offset < 外层可滑动最大值，说明外层还需要滑动，内层不动offset为0
               contentOffset.y = 0
            }
            //不管怎么样，滑动即同步offset到上下文
            syncScrollContext.innerOffset = contentOffset
         }
      }
   }
   
   func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldRecognizeSimultaneouslyWith otherGestureRecognizer: UIGestureRecognizer) -> Bool {
      return true
   }
}

class InnerNestCollectionView: UICollectionView, UIGestureRecognizerDelegate {
   var syncScrollContext: NestedSyncScrollContext?
   
   override var contentOffset: CGPoint {
      didSet {
         if contentOffset.y != oldValue.y {
            //内层滑动
            guard let syncScrollContext = syncScrollContext else { return }
            var enable = true
            if syncScrollContext.enableInnerRefresh {
                enable = syncScrollContext.outerOffset.y > 0
            }
            if syncScrollContext.outerOffset.y < syncScrollContext.maxOffsetY && enable {
               //外层的offset < 外层可滑动最大值，说明外层还需要滑动，内层不动offset为0
               contentOffset.y = 0
            }
            //不管怎么样，滑动即同步offset到上下文
            syncScrollContext.innerOffset = contentOffset
         }
      }
   }
   
   func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldRecognizeSimultaneouslyWith otherGestureRecognizer: UIGestureRecognizer) -> Bool {
      return true
   }
}
