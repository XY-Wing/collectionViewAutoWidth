//
//  XYCollectionViewCell.swift
//  EscapeClosureTest
//
//  Created by wing on 2017/6/4.
//  Copyright © 2017年 wing. All rights reserved.
//

import UIKit

class XYCollectionViewCell: UICollectionViewCell {
    
    //设置数据源
    var title: String = ""{
        willSet {
            print(newValue)
            textLab?.text = newValue
        }
    }
    
    
    var textLab: UILabel?
//    var bgV: UIView?
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
//        backgroundColor = .red
        setupCellUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    private func setupCellUI() {
        textLab = UILabel()
        textLab!.text = "测试"
        textLab!.textColor = .white
        contentView.addSubview(textLab!)
        textLab!.snp.makeConstraints { (make) in
            make.left.equalTo(5)
            make.top.equalTo(5)
            make.bottom.equalTo(-5)
            make.right.lessThanOrEqualTo(contentView.snp.right).offset(-5)
        }
        
//        bgV = UIView()
//        bgV!.backgroundColor = .blue
//        contentView.addSubview(bgV!)
//        bgV!.snp.makeConstraints { (make) in
//            make.edges.equalTo(textLab!).inset(UIEdgeInsetsMake(-5, -10, -5, -10))
//        }
//        bgV!.layer.cornerRadius = 27 * 0.5
//        bgV!.layer.masksToBounds = true
//        bgV!.isHidden = true
//        contentView.bringSubview(toFront: textLab!)
    }
    
    override func preferredLayoutAttributesFitting(_ layoutAttributes: UICollectionViewLayoutAttributes) -> UICollectionViewLayoutAttributes {

        let size = contentView.systemLayoutSizeFitting(layoutAttributes.size)
        
        var frame = layoutAttributes.frame
        frame.size.width = size.width
        frame.size.height = size.height
        
        layoutAttributes.frame = frame
        
        return layoutAttributes
    }
    

}
