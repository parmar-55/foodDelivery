//
//  HomeScreen.swift
//  Desgin
//
//  Created by Demo 01 on 17/04/23.
//  Copyright © 2023 scs. All rights reserved.
//

import UIKit

class HomeScreen: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    
    @IBOutlet weak var imageAnimation: UIImageView!
    
    
    
    @IBOutlet weak var collectionView1: UICollectionView!
    
   var arrImage1 = [ "b", "c",  "d", "p", "s", "tp", "pt", "sa", "hb"]
//var arrImage2 = ["b", "c",  "d", "p", "s", "t", "pt", "sa", "hb" ]
   
    var arrLbl1 = ["Burger", "Chinsefood",  "Dosa", "Pasta", "Sandwitch", "ThaiPizza", "Paneer tikka", "Salad", "HurtBurger"]
   
    

    
    override func viewDidLoad() {
    super.viewDidLoad()
        collectionView1.delegate = self
        collectionView1.dataSource = self
      imageView.layer.cornerRadius = 40
        
        var imgListArray :NSMutableArray = []
        for countValue in 1...5
        {
            let strImageName : String = "\(countValue)"
            let image = UIImage(named:strImageName) // suggested by Anil
            imgListArray.add(image)
        }
        self.imageAnimation.animationImages = imgListArray as? [UIImage]
        self.imageAnimation.animationDuration = 6.0
        self.imageAnimation.startAnimating()
        
      
    }
}

extension HomeScreen:UICollectionViewDataSource, UICollectionViewDelegate
{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
//        if collectionView  == self.collectionView1{
//            return arrImage1.count
//        }
//      return  arrImage2.count
        return arrImage1.count
}
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
//        if collectionView == self.collectionView1
//        {
        let cellA = collectionView1.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! CollectionViewCell
            cellA.imageColl1.image = (UIImage(named: arrImage1[indexPath.row]))
            cellA.lblColl1.text = arrLbl1[indexPath.row]
           
            return cellA
//        }
//       else
//        {
//            let cellB = collectionVIew2.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! CollectionViewCell
//            cellB.imageColl2.image = (UIImage(named: arrImage2[indexPath.row])!)
//            cellB.labelColl2.text = arrCollBLbl[indexPath.row]
//
//            return cellB
//        }
    }
    
    
}



















extension HomeScreen:UINavigationControllerDelegate,UIImagePickerControllerDelegate
{
    
    @IBAction func openGallery(_ sender: Any) {
        let imagePicker = UIImagePickerController()
        imagePicker.delegate = self
        imagePicker.sourceType = UIImagePickerController.SourceType.photoLibrary
        self.present(imagePicker, animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        imageView.image = info[UIImagePickerController.InfoKey.originalImage] as! UIImage
        
        self.dismiss(animated: true, completion: nil)
    }
}
