//
//  Demo3.swift
//  HDCVSwiftTest_Example
//
//  Created by chenhaodong on 2019/10/31.
//  Copyright © 2019 CocoaPods. All rights reserved.
//

import UIKit

class Demo3: DemobaseVC {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        weak var weakSelf = self
        hdcv.collectionV.mj_footer = MJRefreshAutoNormalFooter.init(refreshingBlock: {
            weakSelf?.footerRefreshBegin()
        })
        // Do any additional setup after loading the view.
    }
    
    func footerRefreshBegin() {
        DispatchQueue.main.asyncAfter(deadline: .now()+0.5) {
            self.hdcv.hd_appendData(withSecModel: self.randomTextSec(), animated: true)
            self.hdcv.collectionV.mj_footer.endRefreshing()
        }
        
    }

    override func getDemoSecArr() -> [HDSectionModel] {
        var secArr = [HDSectionModel]()
        for _ in 0..<1 {
            secArr.append(randomTextSec())
        }
        return secArr
    }
    
    func randomTextSec() -> HDSectionModel{
        let cellModelArr = NSMutableArray.init()
        let cellCount = 10
        for _ in 0..<cellCount {
            let cellModel = DemoBaseCellModel();
            let orgStr = "滑动列表在移动端开发中占据着举足轻重的位置，大多数页面都由滑动列表来构建。新学一门语言我们往往也是从滑动列表开始，iOS之于UITableView/UICollectionView，RN之于FlatList/SectionList，flutter之于ListView/GridView。学会了这些列表的搭建，可以说是在UI上简单入了门。在日常的工作中，我们基本是在创建新的滑动列表，维护已有的滑动列表，无论是新建还是修改，对滑动列表的操作可以说是非常频繁。那么，高效的搭建及更改滑动列表就对工作效率的提高有着至关重要的作用。本文要说的则是如何用原生语言来更加高效的构建滑动列表"
            let indexM = orgStr.index(orgStr.startIndex, offsetBy: arc4random()%UInt32(orgStr.count))
            cellModel.orgData = orgStr.substring(to: indexM)
            cellModel.cellSize = CGSize.init(width: HDScreenWidth, height: 0)//isNeedAutoCountCellHW为YES，会自动算高
            cellModel.cellClassStr = "Demo3Cell"
            cellModelArr.add(cellModel)
        }
        
        let layout = HDYogaFlowLayout()
        layout.secInset = UIEdgeInsetsMake(0, 0, 0, 0)
        layout.verticalGap = 0
        layout.horizontalGap = 0
        layout.justify = YGJustify.flexStart

        let secModel = HDSectionModel();
        secModel.headerTopStopType = HDHeaderStopOnTopType.normal
        //开启自动算高
        secModel.isNeedAutoCountCellHW = true
        //开启缓存所有子view的frame(仅在isNeedAutoCountCellHW为true时生效)
        secModel.isNeedCacheSubviewsFrame = true
        secModel.layout = layout;
        secModel.sectionDataArr = cellModelArr
        
        return secModel
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
