//
//  Demo4.swift
//  HDCVSwiftTest_Example
//
//  Created by chenhaodong on 2019/10/31.
//  Copyright © 2019 CocoaPods. All rights reserved.
//

import UIKit

class Demo4: DemobaseVC {
    override func getDemoSecArr() -> [HDSectionModel] {
        var secArr = [HDSectionModel]()
        for idx in 0..<20 {
            if idx%2 == 0 {
                secArr.append(randomAlignSec())
            }else{
                secArr.append(wtaterFlowSec())
            }
        }
        return secArr
    }
    
    func randomAlignSec() -> HDSectionModel{
        let cellModelArr = NSMutableArray.init()
        let cellCount = 10
        for idx in 0..<cellCount {
            let cellModel = DemoBaseCellModel();
            cellModel.orgData = String(idx)
            cellModel.cellSize = CGSize.init(width: Int(arc4random()%UInt32(HDScreenWidth)), height: 40)
            cellModel.cellClassStr = "DemoBaseCell"
            cellModelArr.add(cellModel)
        }
        
        let layout = HDYogaFlowLayout()
        layout.secInset = UIEdgeInsetsMake(10, 10, 10, 10)
        layout.verticalGap = 10
        layout.horizontalGap = 10
        layout.justify = YGJustify(rawValue: Int32(arc4random()%UInt32(YGJustifyCount)))!
        layout.headerSize = CGSize(width: HDScreenWidth, height: 50)
        layout.footerSize = CGSize(width: HDScreenWidth, height: 50)
        layout.decorationMargin = UIEdgeInsetsMake(5, 5, 5, 5)
        
        let secModel = HDSectionModel();
        secModel.headerObj = "这是段头"
        secModel.footerObj = "这是段尾"
        secModel.sectionHeaderClassStr = "DemoBaseSectionHeader"
        secModel.sectionFooterClassStr = "DemoBaseSectionFooter"
        secModel.decorationClassStr = "DemobaseSectionDecoration"
        secModel.headerTopStopType = HDHeaderStopOnTopType.normal
        secModel.isNeedCacheSubviewsFrame = false
        secModel.isNeedAutoCountCellHW = false
        secModel.layout = layout;
        secModel.sectionDataArr = cellModelArr
        
        return secModel
    }
    
    func wtaterFlowSec() -> HDSectionModel{
        let cellModelArr = NSMutableArray.init()
        let cellCount = 15
        for idx in 0..<cellCount {
            let cellModel = DemoBaseCellModel();
            cellModel.orgData = String(idx)
            cellModel.cellSize = CGSize.init(width: 0, height: Int(arc4random()%UInt32(150)+40))//纵向瀑布流width无需设置，内部根据columnRatioArr、horizontalGap、secInset自动计算
            cellModel.cellClassStr = "DemoBaseCell"
            cellModelArr.add(cellModel)
        }
        
        let layout = HDWaterFlowLayout()
        layout.secInset = UIEdgeInsetsMake(10, 10, 10, 10)
        layout.verticalGap = 10
        layout.horizontalGap = 10
        layout.headerSize = CGSize(width: HDScreenWidth, height: 50)
        layout.footerSize = CGSize(width: HDScreenWidth, height: 50)
        layout.columnRatioArr = [NSNumber(value: 1),NSNumber(value: 1),NSNumber(value: 1)]
        layout.decorationMargin = UIEdgeInsetsMake(5, 5, 5, 5)
        
        let secModel = HDSectionModel();
        secModel.headerObj = "这是段头"
        secModel.footerObj = "这是段尾"
        secModel.sectionHeaderClassStr = "DemoBaseSectionHeader"
        secModel.sectionFooterClassStr = "DemoBaseSectionFooter"
        secModel.decorationClassStr = "DemobaseSectionDecoration"
        secModel.headerTopStopType = HDHeaderStopOnTopType.normal
        secModel.isNeedCacheSubviewsFrame = false
        secModel.isNeedAutoCountCellHW = false
        secModel.layout = layout;
        secModel.sectionDataArr = cellModelArr
        
        return secModel
    }


}
