//
//  AlamofireAndSwiftyJSONViewController.swift
//  LoginAppS
//
//  Created by Alejandra Casuscelli on 12/02/2020.
//  Copyright © 2020 Alejandra Casuscelli. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class AlamofireAndSwiftyJSONViewController: UIViewController {

    @IBOutlet weak var clickButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func clickButtonClicked(_ sender: Any) {
         
        AF.request("https://codewithchris.com/code/afsample.json").responseJSON { response in
            if let value = try? response.result.get(){
                var data = response.data
                var js = JSON(data)
                debugPrint(js["firstkey"].stringValue)
                debugPrint(js["secondkey"].arrayValue)
            }else{
                debugPrint("es null")
            }
        }
        
        //Pruebo pegandole a provincia
        var headers: HTTPHeaders = [
                   .accept("application/json")
               ]
        headers.add(name: "aplicacionOrigen", value: "postman")
        headers.add(name: "Content-Type", value: "application/json")
        headers.add(name: "traza", value: "333")
        
               AF.request("ReemplazarPorUrlEnMail", headers: headers).responseJSON { response in
                   debugPrint(response)
               }
    }
    
}

//class HeaderGlobons: Header {
//    init() {
//    }
//    let traza:String?
//
//}
