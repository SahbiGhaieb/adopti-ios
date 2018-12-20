//
//  DetailsController.swift
//  Adopt
//
//  Created by SouhailKr on 11/13/18.
//  Copyright © 2018 ESPRIT. All rights reserved.
//

import UIKit
import CoreData
<<<<<<< HEAD
import Alamofire
import AlamofireImage

class DetailsController: UIViewController {
    
    
    
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var desc: UILabel!
    @IBOutlet weak var breed: UILabel!
    @IBOutlet weak var gender: UILabel!
    @IBOutlet weak var age: UILabel!
    @IBOutlet weak var size: UILabel!
=======

class DetailsController: UIViewController {

>>>>>>> 0aca2924fc81e86baaa438c90b6dcffa517124a3
    @IBOutlet weak var detailTitle: UILabel!
    @IBOutlet weak var detailImage: UIImageView!
    var labelText = String()
    var myImage: UIImage!
<<<<<<< HEAD
    var imageDict = String()
    var petDetails : NSArray = []
    var id = Int()
    let url = "http://192.168.43.5:3000/getpet/"
    var pet : NSArray = []

    

    
    override func viewDidLoad() {
        super.viewDidLoad()
        print(id)
        FetchData()
        
       
//
        
        
        //detailTitle.text = labelText
        //detailImage.image = UIImage(named: petImg)
=======
    var petImg = String()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        detailTitle.text = labelText
        detailImage.image = UIImage(named: petImg)
>>>>>>> 0aca2924fc81e86baaa438c90b6dcffa517124a3
    }
    
    @IBAction func addFavourite(_ sender: Any) {
        let appDelegate = UIApplication.shared.delegate as? AppDelegate
        let persistantContainer = appDelegate?.persistentContainer
        let managedContext = persistantContainer?.viewContext
        let entity = NSEntityDescription.entity(forEntityName: "Pet", in: managedContext!)
        let movie = NSManagedObject(entity : entity!, insertInto: managedContext!)
<<<<<<< HEAD
        movie.setValue(imageDict , forKey: "petImage")
        movie.setValue(name.text, forKey: "petName")
        do{
            try managedContext?.save()
            print("pet saved")
            
            
            let alertController = UIAlertController(title: "Information Alert", message:
                "Pet saved in your favourites", preferredStyle: UIAlertController.Style.alert)
            alertController.addAction(UIAlertAction(title: "Dismiss", style: UIAlertAction.Style.default,handler: nil))
            
            self.present(alertController, animated: true, completion: nil)
=======
        movie.setValue(petImg , forKey: "petImage")
        movie.setValue(labelText, forKey: "petName")
        do{
            try managedContext?.save()
            print("pet saved")
>>>>>>> 0aca2924fc81e86baaa438c90b6dcffa517124a3
        }
        catch let error as NSError
        {
            
            print(error.userInfo)
        }
    }
    
    
<<<<<<< HEAD
    func FetchData() {
        let sa = String(id)
        Alamofire.request(url+sa).responseJSON{

            response in

            //print(response)

            //print(response.result.value)

            self.pet = response.result.value as! NSArray
            
            let tvshow  = self.pet[0] as! Dictionary<String,Any>
            self.imageDict = tvshow["photo"] as! String
            self.detailImage.af_setImage(withURL: URL(string: self.imageDict)!)
            self.name.text = tvshow["name"] as? String
            self.desc.text = tvshow["description"] as? String
            self.breed.text = tvshow["breed"] as? String
            self.size.text = tvshow["size"] as? String
            self.gender.text = tvshow["sexe"] as? String
            let age = tvshow["age"] as! Int
            self.age.text = String(age)+" Months"







        }
    }
        
    
    
    
    
=======
>>>>>>> 0aca2924fc81e86baaa438c90b6dcffa517124a3
    
   
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
