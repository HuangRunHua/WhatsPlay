//
//  TableViewController.swift
//  WhatsPlay
//
//  Created by Joker Hook on 2019/3/13.
//  Copyright © 2019 com.icloud@h76joker. All rights reserved.
//

import UIKit

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
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 必须带上这两句话才有数据
        collectionView.delegate = self
        collectionView.dataSource = self
    }

    // MARK: - Table view data source

    /*
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)

        // Configure the cell...

        return cell
    }
    */

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
