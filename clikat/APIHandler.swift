//
//  APIHandler.swift
//  clikat
//
//  Created by Sierra 4 on 09/03/17.
//  Copyright © 2017 codebrew. All rights reserved.
//

import Foundation
import Alamofire

class ApiHandler {
    
    class func fetchData(parameters:[String:Any], completionHandler: @escaping (Any?) -> ())  {
        
        
        Alamofire.request("https://appbean.clikat.com/get_all_category", method: .post, parameters: parameters, encoding: JSONEncoding.default, headers: nil).responseJSON { (response:DataResponse<Any>) in
            
            switch(response.result) {
            case .success(_):
                if response.result.value != nil{
                    do{
                        let json : Any! = try JSONSerialization.jsonObject(with: response.data!, options: JSONSerialization.ReadingOptions.mutableContainers)
                        
                        
                        completionHandler(json)
                    }
                    catch {
                        print("error occured")
                    }
                }
                break
                
            case .failure(_):
                print(response.result.error ?? "error")
                break
                
            }
        }
}
}
