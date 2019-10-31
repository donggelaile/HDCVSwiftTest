//
//  DemoBaseSectionHeader.swift
//  HDCVSwiftTest_Example
//
//  Created by chenhaodong on 2019/10/30.
//  Copyright © 2019 CocoaPods. All rights reserved.
//

import UIKit

class DemoBaseSectionHeader: HDSectionView {
    var titleL = UILabel.init()
    override init(frame: CGRect) {
        super.init(frame: frame)
        titleL.textAlignment = NSTextAlignment.center
        titleL.numberOfLines = 0
        self.backgroundColor = HDRandomColor()
        self.addSubview(titleL)
        
        titleL.snp.makeConstraints { (maker) in
            maker.edges.equalTo(UIEdgeInsetsMake(0, 0, 0, 0))
        }
        
        let ges = UITapGestureRecognizer(target: self, action: #selector(selfClick))
        self.addGestureRecognizer(ges)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func updateSecVUI(_ model: HDSectionModelProtocol!) {
        if let title = model.headerObj as? String{
            titleL.text = title + "---点击交换cell";
        }
    }
    
    @objc public func selfClick() {
        self.superCollectionV?.hd_changeSectionModel(withKey:self.hdSecModel!.sectionKey , animated: true, changingIn: { (secModel) in
            let newArr:NSMutableArray = []
            
            for obj in secModel.sectionDataArr.shuffled(){
                newArr.add(obj)
            }
            
            secModel.sectionDataArr = newArr
        })
        self.callback(hdSecModel)
    }
    
}
