//
//  XYTestCollectionViewCell.swift
//  EscapeClosureTest
//
//  Created by wing on 2017/6/10.
//  Copyright © 2017年 wing. All rights reserved.
//

import UIKit

class XYTestCollectionViewCell: UICollectionViewCell {
    //模型
    var str: String? {
        willSet{
            articleLab.text = newValue
        }
    }
    //MARK: - 属性
    //头像背景view
    fileprivate var avatarBgV: UIView!
    //名字lab
    fileprivate var nameLab: UILabel!
    //头像图片
    fileprivate var avatarImgV: UIImageView!
    //标题lab
    fileprivate var articleLab: UILabel!
    //内容lab
    fileprivate var contentLab: UILabel!
    
    //MARK: - 构造方法
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupTestCollectionViewCellUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupTestCollectionViewCellUI() {
        //头像背景View
        avatarBgV = UIView()
        avatarBgV.backgroundColor = .white
        let avatarBgVWH: CGFloat =  50
        avatarBgV.layer.cornerRadius = avatarBgVWH * 0.5
        avatarBgV.layer.masksToBounds = true
        contentView.addSubview(avatarBgV)
        avatarBgV.snp.makeConstraints { (make) in
            make.top.left.equalTo(15)
            make.width.height.equalTo(avatarBgVWH)
        }
        //名字lab
        nameLab = UILabel()
        nameLab.text = "薛扬"
        nameLab.textColor = .black
        nameLab.textAlignment = .center
        avatarBgV.addSubview(nameLab)
        nameLab.snp.makeConstraints { (make) in
            make.edges.equalToSuperview()
        }
        //头像图片
        //标题lab
        articleLab = UILabel()
        articleLab.text = "标题：这是一个标题！！！这是一个标题！！！这是一个标题！！！"
        articleLab.textColor = .black
        articleLab.numberOfLines = 0
        contentView.addSubview(articleLab)
        articleLab.snp.makeConstraints { (make) in
            make.top.equalTo(avatarBgV.snp.centerY).offset(-10)
            make.left.equalTo(avatarBgV.snp.right).offset(8)
            make.right.equalTo(-10)
        }
        //内容lab
        contentLab = UILabel()
        contentLab.text = "详情：这是一个详情！！！这是一个详情！！！这是一个详情！！！这是一个详情！！！这是一个详情！！！这是一个详情！！！"
        contentLab.textColor = .black
        contentLab.numberOfLines = 0
        contentView.addSubview(contentLab)
        contentLab.snp.makeConstraints { (make) in
            make.top.equalTo(articleLab.snp.bottom).offset(5)
            make.leading.equalTo(articleLab)
            make.right.equalTo(-10)
            make.bottom.lessThanOrEqualTo(contentView.snp.bottom).offset(-5)
        }
        
    }
    
    override func preferredLayoutAttributesFitting(_ layoutAttributes: UICollectionViewLayoutAttributes) -> UICollectionViewLayoutAttributes {
        setNeedsLayout()
        layoutIfNeeded()
        let size = contentView.systemLayoutSizeFitting(layoutAttributes.size)
        var frame = layoutAttributes.frame
        frame.size.height = size.height
        layoutAttributes.frame = frame
        return layoutAttributes
    }
}
