//
//  DemoBaseCell.swift
//  HDCVSwiftTest_Example
//
//  Created by chenhaodong on 2019/10/30.
//  Copyright © 2019 CocoaPods. All rights reserved.
//

import UIKit

class DemoBaseCell: HDCollectionCell {
    let titleL = UILabel.init()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        titleL.textAlignment = NSTextAlignment.center
        contentView.addSubview(titleL);
        
        titleL.snp.makeConstraints { (make) in
            make.edges.equalTo(UIEdgeInsetsMake(0, 0, 0, 0))
        }
        
        let ges = UITapGestureRecognizer(target: self, action: #selector(selfClick))
        contentView.addGestureRecognizer(ges)
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func updateCellUI(_ model: HDCellModelProtocol!) {
        
        if let model = model as? DemoBaseCellModel {
            titleL.text = model.orgData as? String
            contentView.backgroundColor = model.cellBgColor
        }

    }
    
    @objc public func selfClick() {
        self.superCollectionV?.hd_changeSectionModel(withKey: (self.hdModel?.secModel?.sectionKey), animated: true, changingIn: { (secModel) in
            secModel.sectionDataArr.remove(self.hdModel!)
        })
        
        //回调到VC
        self.callback(hdModel)
    }
}
