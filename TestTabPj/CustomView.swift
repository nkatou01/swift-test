//
//  CustomView.swift
//  TestTabPj
//
//  Created by n.katou on 2015/12/04.
//  Copyright © 2015年 n.katou. All rights reserved.
//

import UIKit

class CustomView: UIView {
    
    @IBOutlet var contentView: UIView!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        // xibファイル読み込み
        NSBundle.mainBundle().loadNibNamed("CustomView", owner: self, options: nil)
        
        // Viewの大きさを定義
        bounds = CGRectMake(0, 0, UIScreen.mainScreen().bounds.width, 44)
        
        // xibファイルのViewをカスタムViewクラスに追加する
        addSubview(contentView)
        
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
