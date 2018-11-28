//
//  DetailsController.swift
//  Adopt
//
//  Created by SouhailKr on 11/13/18.
//  Copyright © 2018 ESPRIT. All rights reserved.
//

import UIKit
import CoreData

class DetailsController: UIViewController {

    @IBOutlet weak var detailTitle: UILabel!
    @IBOutlet weak var detailImage: UIImageView!
    var labelText = String()
    var myImage: UIImage!
    var petImg = String()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        detailTitle.text = labelText
        detailImage.image = UIImage(named: petImg)
    }
    
    @IBAction func addFavourite(_ sender: Any) {
        let appDelegate = UIApplication.shared.delegate as? AppDelegate
        let persistantContainer = appDelegate?.persistentContainer
        let managedContext = persistantContainer?.viewContext
        let entity = NSEntityDescription.entity(forEntityName: "Pet", in: managedContext!)
        let movie = NSManagedObject(entity : entity!, insertInto: managedContext!)
        movie.setValue(petImg , forKey: "petImage")
        movie.setValue(labelText, forKey: "petName")
        do{
            try managedContext?.save()
            print("pet saved")
        }
        catch let error as NSError
        {
            
            print(error.userInfo)
        }
    }
    
    
    
   
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
