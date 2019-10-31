//
//  DemobaseSectionDecoration.swift
//  HDCVSwiftTest_Example
//
//  Created by chenhaodong on 2019/10/31.
//  Copyright © 2019 CocoaPods. All rights reserved.
//

import UIKit

class DemobaseSectionDecoration: HDSectionView {
    var borderV = UIView.init()
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.addSubview(borderV)
        
        borderV.layer.borderColor = HDRandomColor().cgColor
        borderV.layer.cornerRadius = 5
        borderV.layer.borderWidth = 1
        
        borderV.snp.makeConstraints { (maker) in
            maker.edges.equalTo(UIEdgeInsets.init())
        }
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override func updateSecVUI(_ model: HDSectionModelProtocol!) {
        //othter diy
        //model.decorationObj
    }
}
