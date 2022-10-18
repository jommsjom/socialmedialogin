//
//  ViewController.swift
//  Social_medialogin
//
//  Created by Jomms on 14/10/22.
//

import UIKit
import FBSDKLoginKit


class ViewController: UIViewController, LoginButtonDelegate {
    
    func loginButtonDidLogOut(_ loginButton: FBSDKLoginKit.FBLoginButton) {
        
    }
    
    func loginButton(_ loginButton: FBLoginButton, didCompleteWith result: LoginManagerLoginResult?, error: Error?) {
        
        /*    let token = result?.token?.tokenString
         let request = GraphRequest(graphPath:"me", parameters:["fields":"email,name"], tokenString:token, version: nil, httpMethod: .get)
         request.add(graphRequest, completionHandler: { (connection, result, error) in
         
         
         */ //})
        let graphRequest = GraphRequest(graphPath: "me", parameters: ["fields" : "email"])
        let connection = GraphRequestConnection()
        connection.add(graphRequest, completion: { (connection, result, error) in
            
            if error != nil {
                
                //do something with error
                
            } else {
                
                print("error")
                
            }
            
        })
        
        connection.start()
        
        
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let token = AccessToken.current,
           !token.isExpired {
            
            /*   let token = token.tokenString
             let request = FBSDKLoginKit.GraphRequest(graphPath:"me", parameters:["fields":"email,name"], tokenString:token, version: nil, httpMethod: .get)
             request.start(completionHandler:{connection,request,error in
             print("\(token)")
             })
             */
            let graphRequest = GraphRequest(graphPath: "me", parameters: ["fields" : "email"])
            let connection = GraphRequestConnection()
            connection.add(graphRequest, completion: { (connection, result, error) in
                
                if error != nil {
                    
                    //do something with error
                    
                } else {
                    
                    //do something with result
                    
                }
                
            })
            
            connection.start()
        }else{
            
            
            
            let loginButton = FBLoginButton()
            loginButton.center = view.center
            loginButton.delegate = self
            loginButton.permissions = ["public_profile,email"]
            view.addSubview(loginButton)
        }
    }
    
    
}
