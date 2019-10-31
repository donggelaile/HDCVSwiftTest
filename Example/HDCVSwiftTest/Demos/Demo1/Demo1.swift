//
//  Demo1.swift
//  HDCVSwiftTest_Example
//
//  Created by chenhaodong on 2019/10/30.
//  Copyright © 2019 CocoaPods. All rights reserved.
//

import UIKit

class Demo1: DemobaseVC {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    override func getDemoSecArr() -> [HDSectionModel] {
        let cellModelArr = NSMutableArray.init()
        let cellCount = 10
        for idx in 0..<cellCount {
            let cellModel = DemoBaseCellModel();
            cellModel.orgData = String(idx)
            cellModel.cellSize = CGSize.init(width: UIScreen.main.bounds.size.width/2, height: 50)
            cellModel.cellClassStr = "DemoBaseCell"
            cellModelArr.add(cellModel)
        }
        
        let layout = HDYogaFlowLayout()
        layout.secInset = UIEdgeInsetsMake(0, 0, 50, 0)
        layout.verticalGap = 0
        layout.horizontalGap = 0
        layout.justify = YGJustify.spaceBetween
        layout.headerSize = CGSize(width: HDScreenWidth, height: 100)
        
        let secModel = HDSectionModel();
        secModel.headerObj = "这是段头"
        secModel.sectionHeaderClassStr = "DemoBaseSectionHeader"
        secModel.headerTopStopType = HDHeaderStopOnTopType.normal
        secModel.isNeedCacheSubviewsFrame = false
        secModel.isNeedAutoCountCellHW = false
        secModel.layout = layout;
        secModel.sectionDataArr = cellModelArr
        
        return [secModel];
    }

}
