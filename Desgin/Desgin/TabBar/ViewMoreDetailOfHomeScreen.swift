//
//  ViewMoreDetailOfHomeScreen.swift
//  Desgin
//
//  Created by Demo 01 on 17/04/23.
//  Copyright © 2023 scs. All rights reserved.
//

import UIKit

class ViewMoreDetailOfHomeScreen: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!
    
    var arrImage = [ "b", "c",  "d", "p", "s", "tp", "pt", "sa", "hb","greenNoodles"]
    //var arrImage2 = ["b", "c",  "d", "p", "s", "t", "pt", "sa", "hb" ]
    
    var arrLbl = ["Burger", "Chinsefood",  "Dosa", "Pasta", "Sandwitch", "ThaiPizza", "Paneer tikka", "Salad", "HurtBurger","Noodles"]

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    


}


extension ViewMoreDetailOfHomeScreen:UICollectionViewDataSource,UICollectionViewDelegate
{
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 4
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return arrImage.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! ViewMoreCollectionViewCell
        cell.image.image = UIImage(named: arrImage[indexPath.row])
        cell.lbl.text = arrLbl[indexPath.row]
        return cell
    }
    
    
}
