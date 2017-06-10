//
//  XYViewController.swift
//  EscapeClosureTest
//
//  Created by wing on 2017/6/10.
//  Copyright © 2017年 wing. All rights reserved.
//

import UIKit

class XYViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        view.addSubview(collectionV)
        collectionV.snp.makeConstraints { (make) in
            make.edges.equalToSuperview()
        }
        
    }
    
    //MARK: - *********************懒加载属性*********************
    
    //collectionV
    fileprivate lazy var collectionV: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.estimatedItemSize = CGSize(width: UIScreen.main.bounds.size.width, height: 100)
//        layout.itemSize = CGSize(width: screenW, height:150)
        let collectionV = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionV.register(XYTestCollectionViewCell.self, forCellWithReuseIdentifier: "XYTestCollectionViewCell")
        collectionV.delegate = self
        collectionV.dataSource = self
        collectionV.backgroundColor = .white
        collectionV.alwaysBounceVertical = true
        return collectionV
    }()
    //模型
    fileprivate lazy var modelArr: [String] = {
        let arr = ["标题：这","标题：这是一个标题！！！这是一个标题！","标题：这是一个标题！！！这是一个标题！！！这是一个标题！！！","标题：这是一个标题！！！","标题：这是一个标题！！！这是一个标题！！！这是一个标题！！！","标题：这","标题：这是一个标题！！！这是一个标题！","标题：这是一个标题！！！这是一个标题！！！这是一个标题！！！","标题：这是一个标题！！！","标题：这是一个标题！！！这是一个标题！！！这是一个标题！！！这是一个标题！！！这是一个标题！！！这是一个标题！！！这是一个标题！！！这是一个标题！！！这是一个标题！！！这是一个标题！！！这是一个标题！！！这是一个标题！！！这是一个标题！！！这是一个标题！！！"]
        return arr
    }()
}

extension XYViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 1
    }
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 10
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "XYTestCollectionViewCell", for: indexPath) as! XYTestCollectionViewCell
        cell.backgroundColor = .red
        cell.str = modelArr[indexPath.section]
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 0, bottom: 10, right: 0)
    }
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
//        return 10
//    }
}
