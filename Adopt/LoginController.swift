//
//  LoginController.swift
//  Adopt
//
//  Created by ESPRIT on 07/11/2018.
//  Copyright © 2018 ESPRIT. All rights reserved.
//

import UIKit
import Alamofire
import AlamofireObjectMapper
import SwiftyJSON

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
    
    @IBOutlet weak var passwordOutlet: UITextField!
    @IBOutlet weak var emailOutlet: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    
    public static var token: String?
    @IBAction func loginAction(_ sender: Any) {
        let email:String = emailOutlet.text!
        let password:String = passwordOutlet.text!
        
        //alamofire login request
        let parameters: Parameters = [
            "email": email,
            "password": password
        ]
        
        let headers = [
            "Content-Type": "application/x-www-form-urlencoded"
        ]
        
        let url = "http://192.168.1.7:3000/login"
        Alamofire.request(url, method:.post, parameters:parameters, headers:headers).responseObject { (response: DataResponse<UserResponse>) in
            switch response.result {
            case .success(let data):
                //debugPrint(response)
                let json = JSON(data)
                //LoginController.token = json["token"].stringValue
                //print("-------------------------------------------------------------------")
                let userResponse = response.result.value
                
                //UserDefaults.standard.set(true, forKey: “userlogin”)
                //print(userResponse!.user?.firstName)
                
                //print("Token fel login "+LoginController.token!)
                //print(token)
                
                
            case .failure(let error):
                print(error)
            }
            
            

        }
        
        
        Alamofire.request(url, method:.post, parameters:parameters, headers:headers).responseJSON { response in
            switch response.result {
            case .success(let data):
                debugPrint(response)
                let json = JSON(data)
                LoginController.token = json["token"].stringValue
                //print("Token fel login "+LoginController.token!)
                //print(token)


            case .failure(let error):
                print(error)
            }

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
