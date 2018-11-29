//
//  LoginController.swift
//  Adopt
//
//  Created by ESPRIT on 07/11/2018.
//  Copyright © 2018 ESPRIT. All rights reserved.
//

import UIKit
import FBSDKLoginKit
import FacebookLogin
import FacebookCore



class LoginController: UIViewController {
    /*
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if(segue.identifier == "toSignUp"){
            performSegue(withIdentifier: "toSignUp", sender: self)
        }else if(segue.identifier == "toHome"){
            //performSegue(withIdentifier: "toHome", sender: self)
            print("test affichage **********************")
        }
    }
    */
    
   
    
    var dict : [String : AnyObject]!

    override func viewDidLoad() {
        super.viewDidLoad()
        
       
        
      
        
    }
    
    
    @IBAction func Auth(_ sender: Any) {
        let loginManager = LoginManager()
        loginManager.logIn(readPermissions: [.publicProfile], viewController : self) { loginResult in
            
            switch loginResult {
            case .failed(let error):
                print(error)
            case .cancelled:
                print("User cancelled login.")
            case .success(let grantedPermissions, let declinedPermissions, let accessToken):
                print("Logged in!")
                  self.getFBUserData()
            }
        }
    }
    
    func getFBUserData(){
        if((FBSDKAccessToken.current()) != nil){
            FBSDKGraphRequest(graphPath: "me", parameters: ["fields": "id, name, picture.type(large), email"]).start(completionHandler: { (connection, result, error) -> Void in
                if (error == nil){
                    self.dict = result as! [String : AnyObject]
                    print(result!)
                    print(self.dict)
                    let storyboard = UIStoryboard(name: "LoginController", bundle: nil)
                    let secondView =  storyboard.instantiateViewController(withIdentifier: "HomeController") as UIViewController
                    self.present(secondView, animated: true, completion: nil)
                   
                    
                }
            })
        }
    }
 
    
    //function is fetching the user data
    
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
