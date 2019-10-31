//
//  Demo2.swift
//  HDCVSwiftTest_Example
//
//  Created by chenhaodong on 2019/10/31.
//  Copyright © 2019 CocoaPods. All rights reserved.
//

import UIKit

class Demo2: DemobaseVC {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    override func getDemoSecArr() -> [HDSectionModel] {
        var secArr = [HDSectionModel]()
        for _ in 0..<100 {
            secArr.append(randomAlignSec())
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
        
        let secModel = HDSectionModel();
        secModel.headerObj = "这是段头"
        secModel.footerObj = "这是段尾"
        secModel.sectionHeaderClassStr = "DemoBaseSectionHeader"
        secModel.sectionFooterClassStr = "DemoBaseSectionFooter"
        secModel.headerTopStopType = HDHeaderStopOnTopType.normal
        secModel.isNeedCacheSubviewsFrame = false
        secModel.isNeedAutoCountCellHW = false
        secModel.layout = layout;
        secModel.sectionDataArr = cellModelArr
        
        return secModel
    }

}
