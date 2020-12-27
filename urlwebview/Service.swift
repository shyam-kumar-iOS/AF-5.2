//
//  Service.swift
//  urlwebview
//
//  Created by Shyam Kumar on 8/18/20.
//  Copyright © 2020 Shyam Kumar. All rights reserved.
//

import Foundation
import Alamofire

struct Service {
    
    static func getResponse(url: String, params : [String : AnyObject], success: @escaping (_ dic : NSDictionary, _ err : Error?) -> Void, failure: @escaping (Error) -> Void){
        

        let headersss : HTTPHeaders = ["Authorization" : "Basic c2h5YW0ua3VtYXJAbGV0emNvbm5lY3QuY29tOjEyMzQ1Njc4"]
        
        AF.request(url, method: .post, parameters: params, encoding: JSONEncoding.default, headers: headersss).responseJSON { (responseObj) -> Void in

            switch responseObj.result {
                
            case .success(let value):
                
                if let dic = value as? NSDictionary {
                    success(dic, nil)
                }
                
            case .failure(let error):
                
                failure(error)
                
            }
        }
    }


    static func getResponseData(url: String, params: [String : AnyObject], success: @escaping (_ data: Any, _ err: Error?) -> Void, failure: @escaping (_ error: Error) -> Void) {
        
        let headersss : HTTPHeaders = ["Authorization" : "Basic c2h5YW0ua3VtYXJAbGV0emNvbm5lY3QuY29tOjEyMzQ1Njc4"]
        
        AF.request(url, method: .post, parameters: params, encoding: JSONEncoding.default, headers: headersss).responseJSON { (resData) -> Void in
            
            switch resData.result {
            
            case .success(let value):
              
             //   if let data = value as? Data {
                success(value, nil)
           //     }
            
             case .failure(let error):
                    
                    failure(error)
        }
        
    }

}


   static func performRequest<T:Decodable>(route:URLConvertible, decoder: JSONDecoder = JSONDecoder(), completion:@escaping (Result<T, AFError>)->Void) -> DataRequest {
          return AF.request(route)
                          .responseDecodable (decoder: decoder){ (response: DataResponse<T, AFError>) in
                              completion(response.result)
          }
      }




}
