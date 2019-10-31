//
//  ViewController.swift
//  HDCVSwiftTest
//
//  Created by chenhaodong on 10/29/2019.
//  Copyright (c) 2019 chenhaodong. All rights reserved.
//

import UIKit
import SnapKit

class ViewController: UIViewController {
    let hdcv:HDCollectionView = HDCollectionView.hd_make { (maker) in
        maker.hd_isNeedTopStop(true).hd_scrollDirection(UICollectionView.ScrollDirection.vertical).hd_endConfig();
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
        setData()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    private func setUI(){
        
        if #available(iOS 11.0, *) {
            hdcv.collectionV.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentBehavior.never
        } else {
            // Fallback on earlier versions
            self.automaticallyAdjustsScrollViewInsets = false
        }
        view.addSubview(hdcv)
        hdcv.snp.makeConstraints { (maker) in
            maker.edges.equalTo(UIEdgeInsetsMake(HDTopSafeHeight+HDNavHeight, 0, 0, 0))
        }
    }
    
    private func setData(){
        hdcv.hd_setAllDataArr([getDemoSec()])
    }
    
    private func getDemoSec() -> HDSectionModel{
        
        let orgDataArr = ["简单使用","多段随机悬浮对齐","自动算高/子view frame缓存","分段布局、装饰view","横向滑动"]
        
        let cellModelArr = NSMutableArray.init()
        let cellCount = orgDataArr.count
        for idx in 0..<cellCount {
            let cellModel = HDCellModel();
            cellModel.orgData = orgDataArr[idx]
            cellModel.cellSize = CGSize.init(width: 0, height: 40)
            cellModel.cellClassStr = "ViewControllerCell"
            cellModelArr.add(cellModel)
        }
        
        let layout = HDYogaFlowLayout()
        layout.secInset = UIEdgeInsetsMake(10, 20, 50, 20)
        layout.verticalGap = 10
        layout.horizontalGap = 10
        layout.justify = YGJustify.spaceBetween
        
        let secModel = HDSectionModel();
        secModel.layout = layout;
        secModel.headerTopStopType = HDHeaderStopOnTopType.always
        secModel.isNeedCacheSubviewsFrame = true
        secModel.isNeedAutoCountCellHW = true
        secModel.sectionDataArr = cellModelArr
        
        return secModel;
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

