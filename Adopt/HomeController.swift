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
<<<<<<< HEAD

class HomeController: UIViewController,UICollectionViewDelegate,UICollectionViewDataSource  {
    
    
    @IBOutlet weak var collectionViewd: UICollectionView!
    @IBOutlet weak var collectionViewc: UICollectionView!
    @IBOutlet weak var collectionView: UICollectionView!
    var photoThumbnail: UIImage!
    var iconName = NSString()
    var id = Int()
    
    
    var imageArray = ["1","2","3","4"]
    var ima = [UIImage(named : "1"),UIImage(named : "2"),UIImage(named : "3"),UIImage(named : "4")]
    //let url = "http://192.168.43.5:3000/getpets"
    let url = "http://192.168.1.3:3000/showallpets"
    
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
   
        
=======
class HomeController: UIViewController,UICollectionViewDelegate,UICollectionViewDataSource  {
    
    
    
   private var sessionManager: SessionManager?
    
//    private func enableCertificatePinning() {
//        let certificates: [SecCertificate] = []
//        let trustPolicy = ServerTrustPolicy.pinCertificates(
//            certificates: certificates,
//            validateCertificateChain: false,
//            validateHost: false)
//        let trustPolicies = [ "www.apple.com": trustPolicy ]
//        let policyManager =  ServerTrustPolicyManager(policies: trustPolicies)
//        sessionManager = SessionManager(
//            configuration: .default,
//            serverTrustPolicyManager: policyManager)
//    }
    
    
    @IBOutlet weak var collectionView: UICollectionView!
    var photoThumbnail: UIImage!
    var iconName = String()
    
    
    
    
    
    var imageArray = ["1","2","3","4"]
    var ima = [UIImage(named : "1"),UIImage(named : "2"),UIImage(named : "3"),UIImage(named : "4")]
    var pets : NSArray = []

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return pets.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cellule = collectionView.dequeueReusableCell(withReuseIdentifier: "celu", for: indexPath)  as! FirstCellController
        let contentView = cellule.viewWithTag(0)
        
        //let movieImg = contentView?.viewWithTag(1) as! UIImageView
        let petImg = contentView?.viewWithTag(1) as! UIImageView
        let petName = contentView?.viewWithTag(2) as! UILabel
        
        //cellule.imageView.image = (imageArray [indexPath.row])
        //let iconName = imageArray[indexPath.row]
        //let iconName = imageArray[1]
        
        let pet  = pets[ indexPath.item] as! Dictionary<String,Any>
        let petImage = pet["photo"] as! String
        petName.text = pet["name"] as! String
        petImg.af_setImage(withURL: URL(string: petImage)!)
        //cellule.imageView?.image = UIImage(named: petImage)
        print(petImage)
        print(pets.count)
        return cellule
>>>>>>> 0aca2924fc81e86baaa438c90b6dcffa517124a3
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        let cell = collectionView.cellForItem(at: indexPath) as! FirstCellController
        
<<<<<<< HEAD
        
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
       
       
=======
        photoThumbnail = cell.imageView.image
        iconName = imageArray[indexPath.row]
>>>>>>> 0aca2924fc81e86baaa438c90b6dcffa517124a3
        
         
            performSegue(withIdentifier: "toDetails", sender: self)
        }
    
override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    
    if segue.identifier == "toDetails"{
    

    if let destViewController : DetailsController = segue.destination as! DetailsController
    {
<<<<<<< HEAD
//    destViewController.labelText = "test"  //**** this works
//        destViewController.petImg = iconName  //**** this doesnt
        destViewController.id = id
=======
    destViewController.labelText = "test"  //**** this works
        destViewController.petImg = iconName  //**** this doesnt
>>>>>>> 0aca2924fc81e86baaa438c90b6dcffa517124a3
        
    }
    }
        
}
    
    
  
    
<<<<<<< HEAD
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
=======
        
    
        
       
    
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    
    
    //var tokenkey =
    override func viewDidLoad() {
        super.viewDidLoad()
        //print(pets.count)
        FetchData()        // Do any additional setup after loading the view.
        
        print(LoginController.token)
    }
    
    func FetchData() {
        print(pets.count)
//        Alamofire.request(url).responseJSON{
//
//            response in
//
//            //print(response)
//
//            //print(response.result.value)
//
//            self.TvShows = response.result.value as! NSArray
//
//            self.tableView.reloadData()
//
//        }

        
        //let token: String = "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyIjp7ImlkIjoxLCJmaXJzdE5hbWUiOiJzYWhiaSIsImxhc3ROYW1lIjoiZ2hhaWViIiwiZW1haWwiOiJtb2hhbWVkc2FoYmkuZ2hhaWViQGVzcHJpdC50biIsInBob3RvIjoic2FoYmkucG5nIiwibnVtX3RlbCI6IjU4Mjk3NDgwIiwicGFzc3dvcmQiOiIxMjM0NTYiLCJjcmVhdGVkQXQiOiIyMDE4LTExLTI2VDAwOjAwOjAwLjAwMFoiLCJ1cGRhdGVkQXQiOiIyMDE4LTExLTI2VDAwOjAwOjAwLjAwMFoifSwiaWF0IjoxNTQzMzY0NTc0fQ.k0f4PeGd7S1QkT2I8MNVZNF3HbUBxE7ZyFQbBHR43_k"
        
        
        //let url: String = "http://192.168.1.8:3000/showallpets"
        let url: String = "http://192.168.1.7:3000/showallpets"
        
        //turn off SSL
        //enableCertificatePinning()
        
        //let url: String = "https://jsonplaceholder.typicode.com/todos/1"
        let headers = [
            "Authorization": "Bearer \(LoginController.token)",
            "Content-Type": "application/X-Access-Token"
        ]
        //let Auth_header    = [ "Authorization" : token ]
        
        sessionManager?.request(url, headers: headers).responseJSON { response in
            //print(response.result.value)
            self.pets = response.result.value as! NSArray
            self.collectionView.reloadData()
        }
        //self.collectionView.reloadData()
    }
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */
    
>>>>>>> 0aca2924fc81e86baaa438c90b6dcffa517124a3
}
