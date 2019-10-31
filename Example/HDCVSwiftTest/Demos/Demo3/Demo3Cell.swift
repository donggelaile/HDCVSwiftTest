//
//  Demo3Cell.swift
//  HDCVSwiftTest_Example
//
//  Created by chenhaodong on 2019/10/31.
//  Copyright © 2019 CocoaPods. All rights reserved.
//

import UIKit

class Demo3Cell: HDCollectionCell {
    //1、当该cell所在sectionModel开启自动算高时，Demo3Cell未实现 hdSizeThatFits 时，将使用autoLayout计算合适高度
    //2、当该cell所在sectionModel开启 isNeedCacheSubviewsFrame 时，此时该cell需要实现 cacheSubviewsFrameBySetLayout 函数来进行布局,需要注意的是。此时cell其他函数中不要进行约束的添加，比如init中
    
    let titleL = UILabel.init()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        titleL.textAlignment = NSTextAlignment.center
        titleL.numberOfLines = 0
        contentView.addSubview(titleL);
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
    

    override func cacheSubviewsFrameBySetLayout(withCellModel cellModel: HDCellModelProtocol!) {
        //开启isNeedCacheSubviewsFrame后，所有的约束都放到这里
        titleL.snp.makeConstraints { (make) in
            make.edges.equalTo(UIEdgeInsetsMake(10, 10, 10, 10))
        }
        //最终实现的效果为，通过autoLayout计算所有子view的frame,实际布局展示出来的cell没有约束，是纯frame布局
        //这样可以避免滑动过程中autolayout需要重复计算子view frame的额外性能消耗,因为所有子view的frame已被缓存。无需计算
        //需要注意的是这里缓存的并不仅仅是cell整体的宽高，而是包含了其所有子view的frame的缓存
    }
    //实现 hdSizeThatFits将使用该函数内部返回的大小
    /*
    override func hdSizeThatFits(_ size: CGSize) -> CGSize {
        //此时内部已经可以拿到数据了
        可根据 hdModel 做计算
    }
     */
}
