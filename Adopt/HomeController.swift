//
//  HomeController.swift
//  Adopt
//
//  Created by ESPRIT on 07/11/2018.
//  Copyright © 2018 ESPRIT. All rights reserved.
//

import UIKit
import Alamofire
import AlamofireImage

class HomeController: UIViewController,UICollectionViewDelegate,UICollectionViewDataSource  {
    
    
    @IBOutlet weak var collectionViewd: UICollectionView!
    @IBOutlet weak var collectionViewc: UICollectionView!
    @IBOutlet weak var collectionView: UICollectionView!
    var photoThumbnail: UIImage!
    var iconName = NSString()
    var id = Int()
    
    
    var imageArray = ["1","2","3","4"]
    var ima = [UIImage(named : "1"),UIImage(named : "2"),UIImage(named : "3"),UIImage(named : "4")]
    let url = "http://192.168.43.5:3000/getpets"
    
    var movieId:Int?
    
    var petShows : NSArray = []
    var cats :[Dictionary<String,Any>] = []
    var dogs :[Dictionary<String,Any>] = []
    var others :[Dictionary<String,Any>] = []


    
    
   

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        
        if collectionView == self.collectionView {
            return cats.count

            
        }
        else if
            collectionView == self.collectionViewc {
            return dogs.count
            
            
        }
        
        return others.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
          let cellule = collectionView.dequeueReusableCell(withReuseIdentifier: "celu", for: indexPath)  as! FirstCellController
       if (collectionView == self.collectionView)
       {
      
        
        //cellule.imageView.image = (imageArray [indexPath.row])
        let tvshow  = cats[ indexPath.item]
        let imageDict = tvshow["photo"] as! String
        let name = tvshow["name"] as! String
      
        let img = cellule.imageView
       
       
        img?.af_setImage(withURL: URL(string: imageDict)!)
        cellule.title.text = name
        
 
        //let iconName = imageArray[indexPath.row]
        //cellule.imageView?.image = UIImage(named: iconName)
        
     
        return cellule
        }
        else if collectionView == self.collectionViewc
        {
       
        
        //cellule.imageView.image = (imageArray [indexPath.row])
        let tvshow  = dogs[ indexPath.item]
        let imageDict = tvshow["photo"] as! String
        let name = tvshow["name"] as! String
        
        let img = cellule.imageView
        
        
        img?.af_setImage(withURL: URL(string: imageDict)!)
        cellule.title.text = name
        
        
        //let iconName = imageArray[indexPath.row]
        //cellule.imageView?.image = UIImage(named: iconName)
        
        
      
        }
       else if collectionView == self.collectionViewd
       {
        
        
        //cellule.imageView.image = (imageArray [indexPath.row])
        let tvshow  = others[ indexPath.item]
        let imageDict = tvshow["photo"] as! String
        let name = tvshow["name"] as! String
        
        let img = cellule.imageView
        
        
        img?.af_setImage(withURL: URL(string: imageDict)!)
        cellule.title.text = name
        
        
        //let iconName = imageArray[indexPath.row]
        //cellule.imageView?.image = UIImage(named: iconName)
        
        
        
        }
        return cellule
   
        
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        let cell = collectionView.cellForItem(at: indexPath) as! FirstCellController
        
        
         if collectionView == self.collectionView
        {
        
        let pet  = cats[ indexPath.item]
        id = pet["id"] as! Int
         }
            else if collectionView == self.collectionViewc
            {
                
                let pet  = dogs[ indexPath.item]
                id = pet["id"] as! Int
        }
         else if collectionView == self.collectionViewd
         {
            
            let pet  = others[ indexPath.item] 
            id = pet["id"] as! Int
        }
       
       
        
         
            performSegue(withIdentifier: "toDetails", sender: self)
        }
    
override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    
    if segue.identifier == "toDetails"{
    

    if let destViewController : DetailsController = segue.destination as! DetailsController
    {
//    destViewController.labelText = "test"  //**** this works
//        destViewController.petImg = iconName  //**** this doesnt
        destViewController.id = id
        
    }
    }
        
}
    
    
  
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
         FetchData()
      
        
        // Do any additional setup after loading the view.
    }
    
    
    
    func FetchData() {
        
        Alamofire.request(url).responseJSON{
            
            response in
            
            //print(response)
            

                let array = response.result.value as! [[String: Any]]
            

            
            
            for json in array {
                let image = json["type"] as! String
                if (image == "chat")
                {
                self.cats.append(json )
                }
                else if (image == "dog")
                {
                    self.dogs.append(json )
                }
                else
                {
                    self.others.append(json )
                }
                
            }
            
            self.petShows = response.result.value as! NSArray
            
            self.collectionView.reloadData()
            self.collectionViewc.reloadData()
            self.collectionViewd.reloadData()
            
            
        }
        
    }
}
