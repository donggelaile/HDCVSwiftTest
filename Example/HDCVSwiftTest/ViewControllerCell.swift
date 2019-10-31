//
//  ViewControllerCell.swift
//  HDCVSwiftTest_Example
//
//  Created by chenhaodong on 2019/10/29.
//  Copyright © 2019 CocoaPods. All rights reserved.
//

import UIKit

class ViewControllerCell: HDCollectionCell {
    let titleL = UILabel.init()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        titleL.textAlignment = NSTextAlignment.center
        contentView.backgroundColor = UIColor.init(red: CGFloat((Float(arc4random()%255))/255.0), green: CGFloat((Float(arc4random()%255))/255.0), blue: CGFloat((Float(arc4random()%255))/255.0), alpha: 1.0)
        contentView.addSubview(titleL);
        
        let ges = UITapGestureRecognizer(target: self, action: #selector(selfClick))
        contentView.addGestureRecognizer(ges)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func cacheSubviewsFrameBySetLayout(withCellModel cellModel: HDCellModelProtocol!) {
        titleL.snp.makeConstraints { (make) in
            make.edges.equalTo(UIEdgeInsetsMake(0, 0, 0, 0))
        }
    }
    
    override func updateCellUI(_ model: HDCellModelProtocol!) {
        titleL.text = model.orgData as? String
    }
    override func hdSizeThatFits(_ size: CGSize) -> CGSize {
        let maxWidth = (UIApplication.shared.keyWindow?.frame.size.width ?? 0) - 30.0;
        let newSize = titleL.sizeThatFits(CGSize(width: maxWidth, height: size.height))
        return CGSize(width: newSize.width+20, height: size.height)
    }
    
    @objc func selfClick() {
        let vcClass = swiftClassFromString(className: "Demo" + String(((hdModel?.indexP!.item)!)+1))
        guard let typeClass = vcClass as? UIViewController.Type else {
            return
        }
        let vcIns = typeClass.init()
        currentViewController()?.navigationController?.pushViewController(vcIns , animated: true)

    }
}

