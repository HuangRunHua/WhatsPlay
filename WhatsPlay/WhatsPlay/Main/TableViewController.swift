//
//  TableViewController.swift
//  WhatsPlay
//
//  Created by Joker Hook on 2019/3/13.
//  Copyright © 2019 com.icloud@h76joker. All rights reserved.
//

import UIKit
import SafariServices

class TableViewController: UITableViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    
    
    /**
     * 第一部分
     * 在tableViewCell里面添加了一个collectionView，实现了4个collectionCell
     * 每一个cell里面有一个标题，副标题，背景图片以及分类标签
     */
    
    private var images = [imageViewCollection(image: UIImage(named: "1"), title: "狗来了", general: "精选集", subTitle: ""), imageViewCollection(image: UIImage(named: "2"), title: "芒果街上的小屋", general: "晨读",subTitle: "优美纯净的小书"), imageViewCollection(image: UIImage(named: "4"), title: "吹小号的天鹅", general: "睡前故事",subTitle: ""), imageViewCollection(image: UIImage(named: "3"), title: "时代广场的蟋蟀", general: "下午茶",subTitle: "生命之间爱和关怀的故事")]
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return images.count
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as! imageViewCollectionViewCell
        
        cell.imageView.image = images[indexPath.row].image
        cell.generalLabel.text = images[indexPath.row].general
        cell.titleLabel.text = images[indexPath.row].title
        cell.subTitleLabel.text = images[indexPath.row].subTitle
        
        if images[indexPath.row].subTitle == "" {
            cell.subTitleLabel.isHidden = true
            //cell.subTitleLabel.text = "   " // 这样就可以看到美观感
        }
        
        cell.layer.cornerRadius = 10.0
        cell.layer.masksToBounds = true
        
        return cell
    }
    
    @IBOutlet weak var collectionView: UICollectionView! {
        didSet {
            collectionView.backgroundColor = .clear
        }
    }
    
    /* 点击按钮以后出现网页 */
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        switch indexPath.row {
        case 0:
            let privacyPolicyVC = SFSafariViewController(url: URL(string: "https://www.apple.com/cn/")!)
            present(privacyPolicyVC, animated: true,completion: nil)
        case 1:
            let privacyPolicyVC = SFSafariViewController(url: URL(string: "https://leetcode-cn.com")!)
            present(privacyPolicyVC, animated: true,completion: nil)
        case 2:
            let privacyPolicyVC = SFSafariViewController(url: URL(string: "https://developer.apple.com/cn/")!)
            present(privacyPolicyVC, animated: true,completion: nil)
        case 3:
            let privacyPolicyVC = SFSafariViewController(url: URL(string: "https://unsplash.com")!)
            present(privacyPolicyVC, animated: true,completion: nil)
        default:
            break
        }
    }
    
    
    
    // 第二组需要自定义cell，这里使用XIB来完成
    let nib = UINib(nibName: "BookTableViewCell", bundle: nil)
    
    // 第3组也需要自定义cell，这里使用XIB来完成
    let featuredNib = UINib(nibName: "FeaturedTableViewCell", bundle: nil)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // 必须带上这两句话才有数据
        collectionView.delegate = self
        collectionView.dataSource = self
        
        // 需要用代码注册Nib
        self.tableView.register(nib, forCellReuseIdentifier: "TableViewCell")
        self.tableView.register(featuredNib, forCellReuseIdentifier: "FeaturedCell")
        
    }
    
    
    
    /**
     * 这里是第二部分
     * 我想要在 CollectionView 下方展示一系列书籍，使用 TableViewCell 来显示
     * 想要在静态的 cell 里面实现动态的 cell 需要使用 xib 文件
     */
    
    // 这是我将要在 tableViewCell 里面展示给大家的内容
    private var books = [Book(classText: "友谊", title: "塔克的郊外", subTitle: "一只蟋蟀、一只老鼠和一只猫咪的\n童话连续剧。", image: UIImage(named: "5")), Book(classText: "青春", title: "会飞的教室", subTitle: "一部由孩子们自编自演的圣诞情景剧，\n一部浓缩的校园风景录。", image: UIImage(named: "6")), Book(classText: "浪漫", title: "银河铁道之夜", subTitle: "一部未完成的作品\n银河深处，便是那幸福的天堂吗？", image: UIImage(named: "7")), Book(classText: "生命", title: "夏洛的网", subTitle: "世界上有两种人，一种人读过\n《夏洛的网》，另一种人正准备读。", image: UIImage(named: "8")), Book(classText: "冒险", title: "柳林风声", subTitle: "一个适合坐在火炉边，大家一起听的\n故事。", image: UIImage(named: "9"))]

    
    /**
     * 这是第三部分
     * 在这一部分要实现简单的tableViewCell功能
     * 每一个 cell 由一张图片，一个标题构成
     */
    private var featuredBooks = [Featured(image: UIImage(named: "10"), title: "小王子"), Featured(image: UIImage(named: "11"), title: "爱德华的奇妙之旅"), Featured(image: UIImage(named: "12"), title: "窗边的小豆豆"), Featured(image: UIImage(named: "13"), title: "梦书之城"), Featured(image: UIImage(named: "14"), title: "天蓝色的彼岸"), Featured(image: UIImage(named: "15"), title: "看得见风的男孩")]
    

    // 以下代理方法必须实现
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if (indexPath.section == 1) {
            let cell = tableView.dequeueReusableCell(withIdentifier: "TableViewCell") as? TableViewCell
            cell?.classLabel.text = books[indexPath.row].classText
            cell?.titleLabel.text = books[indexPath.row].title
            cell?.subTitle.text = books[indexPath.row].subTitle
            cell?.backgroundImage.image = books[indexPath.row].image
            return cell!
        }
        
        if indexPath.section == 2 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "FeaturedCell") as? FeaturedTableViewCell
            cell?.bookImage.image = featuredBooks[indexPath.row].image
            cell?.bookTitle.text = featuredBooks[indexPath.row].title
            
            return cell!
        }
        
        return super.tableView(tableView, cellForRowAt: indexPath)
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 1 {
            return books.count //这里返回第二组的行数
        }
        if section == 2 {
            return featuredBooks.count
        }
        return super.tableView(tableView, numberOfRowsInSection: section)
    }

    
    override func tableView(_ tableView: UITableView, indentationLevelForRowAt indexPath: IndexPath) -> Int {
        if indexPath.section == 1 {
            return super.tableView(tableView, indentationLevelForRowAt: IndexPath(row: 0, section: 1))
        }
        if indexPath.section == 2 {
            return super.tableView(tableView, indentationLevelForRowAt: IndexPath(row: 0, section: 2))
        }
        return super.tableView(tableView, indentationLevelForRowAt: indexPath)
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.section == 1 {
            return 120
        }
        if indexPath.section == 2 {
            return 80
        }
        return super.tableView(tableView, heightForRowAt: indexPath)
    }
    
    
    
    

}
