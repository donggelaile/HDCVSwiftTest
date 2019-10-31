//
//  DemobaseVC.swift
//  HDCVSwiftTest_Example
//
//  Created by chenhaodong on 2019/10/30.
//  Copyright © 2019 CocoaPods. All rights reserved.
//

import UIKit

class DemobaseVC: UIViewController {

    var hdcv:HDCollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
        hdcv.hd_setAllDataArr(self.getDemoSecArr())
        //接受来自各个view的回调
        hdcv.hd_setAllEventCallBack { (backModel, type) in
            
            if type == HDCallBackType.cellCallBack{
                print("点击了cell")
            }else if type == HDCallBackType.sectionHeaderCallBack{
                print("点击了header")
            }else if type == HDCallBackType.sectionFooterCallBack{
                print("点击了footer")
            }else if type == HDCallBackType.decorationCallBack{
                print("点击了decoration")
            }else{
                
            }
        
        }
        
        // Do any additional setup after loading the view, typically from a nib.
    }
    public func makeHDCollectionView() -> HDCollectionView{
        return HDCollectionView.hd_make { (maker) in
                maker
                .hd_isNeedTopStop(true)
                .hd_scrollDirection(UICollectionView.ScrollDirection.vertical)
                .hd_endConfig();
           }
    }
    private func setUI(){
        hdcv = makeHDCollectionView()
        if #available(iOS 11.0, *) {
            hdcv.collectionV.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentBehavior.never
        } else {
            // Fallback on earlier versions
            self.automaticallyAdjustsScrollViewInsets = false
        }
        view.addSubview(hdcv)
        view.backgroundColor = UIColor.white
        if hdcv.frame.size.height == 0 {
                hdcv.snp.makeConstraints { (maker) in
                maker.edges.equalTo(UIEdgeInsetsMake(HDTopSafeHeight+HDNavHeight, 0, 0, 0))
            }
        }
    }
    public func getDemoSecArr() -> [HDSectionModel]{
        return []
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
