//
//  ViewController.swift
//  EscapeClosureTest
//
//  Created by wing on 2017/6/4.
//  Copyright © 2017年 wing. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    private let textArr = ["测试","测试测试","测试测试测试","测试测试测试测试","测试测试","测试测试测试测试","测试测试","测试测试测试测试","测","测试测试测试测试测试测试测试测试",]
    
    fileprivate lazy var collectionV: UICollectionView = {
        
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
                
        let collectionV = UICollectionView(frame: .zero, collectionViewLayout: layout)
        
        collectionV.register(XYCollectionViewCell.self, forCellWithReuseIdentifier: "UICollectionViewCell")
        
        collectionV.delegate = self
        collectionV.dataSource = self

        collectionV.backgroundColor = .black
        collectionV.bounces = false
        
        layout.estimatedItemSize = CGSize(width: 10, height: 44)
        
        
        return collectionV
    }()
    
    override func viewDidLoad() {
        view.addSubview(collectionV)
        collectionV.snp.makeConstraints { (make) in
            make.left.right.centerY.equalToSuperview()
            make.height.equalTo(44)
        }
    }
    
    //MARK: - delegates
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return textArr.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "UICollectionViewCell", for: indexPath) as! XYCollectionViewCell
        cell.title = textArr[indexPath.item]
        
        return cell
    }
    
}

