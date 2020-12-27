//
//  ViewController.swift
//  urlwebview
//
//  Created by Shyam Kumar on 8/14/20.
//  Copyright © 2020 Shyam Kumar. All rights reserved.
//

import UIKit
import CoreAudioKit
import Alamofire


class ViewController: UIViewController {

   // var model : Model?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    
//        apiCall(dic: { data in
//             data.forEach { res in
//                   print(res.completed ?? false)
//
//                                }
//        })
        
        dataCall{ result in
            switch result {
            case .success(let articles):
                print("_____________________________")
                print(articles)
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    
    }


    @IBAction func Act(_ sender: UIButton) {
    
        if sender.tag == 0 {
            
            let sb = UIStoryboard.init(name: "Main", bundle: nil)
            
            let vc = sb.instantiateViewController(identifier: "SecVC") as! SecVC
            
            vc.mode = .webV
            self.navigationController?.pushViewController(vc, animated: true)
        } else {
            let sb = UIStoryboard.init(name: "Main", bundle: nil)
                       
            let vc = sb.instantiateViewController(identifier: "SecVC") as! SecVC
                       
            vc.mode = .wkwebV
            self.navigationController?.pushViewController(vc, animated: true)
        }
    
    }
    
    
    func dataCall(completion : @escaping (Result<[Model], AFError>)->Void) {
        let jsonDecoder = JSONDecoder()
         Service.performRequest(route: "https://jsonplaceholder.typicode.com/todos", decoder: jsonDecoder, completion: completion)
            
        }
    
    
    func apiCall(dic: @escaping (_ resDic :[Model]) -> Void) {
       
        AF.request("https://jsonplaceholder.typicode.com/todos").responseJSON { (resData) in
           
            print("sdfsd", resData)
            
            switch resData.result {
                
            case .success(let value):
                
                let jsonencode = JSONDecoder()
                   do {
                    let data = try jsonencode.decode([Model].self, from: resData.data ?? Data())
                    print("bhbhbh", data)
                    dic(data)
                   
                   } catch let err {
                            print(err)
             }

            case .failure(let error):
                print(error)
                
            }
        }
        
//        Service.getResponseData(url: "https://jsonplaceholder.typicode.com/todos", params: [String : AnyObject], success: { (response, error) in
//
//
//
//               let jsonencode = JSONDecoder()
//                   do {
//                   let data = try jsonencode.decode(Model.self, from: response as? Data ?? Data())
//                       print("bhbhbh", data.id ?? "fefaul")
//                   } catch let err {
//                       print(err)
//                   }
//
//
//               }, failure: { (err) in
//
//                       print("werwerror", err)
//                   })
        
        
//       Service.getResponse(url: "https://api.letzconnect.com/mobileapi/get_all_notification", params: ["user_id":"210713","limit":15,"start":0,"_v":3] as [String : AnyObject], success: { (response, error) in
//
//            print("ddfvf", response)
//        }, failure: { (error) in
//
//
//            print("error", error)
//
//        })

        
//    Service.getResponseData(url: "https://api.letzconnect.com/mobileapi/get_all_notification", params: ["user_id":"210713","limit":15,"start":0,"_v":3] as [String : AnyObject], success: { (response, error) in
//
//
//
//        let jsonencode = JSONDecoder()
//            do {
//            let data = try jsonencode.decode(Model.self, from: response as? Data ?? Data())
//                print("bhbhbh", data.id ?? "fefaul")
//            } catch let err {
//                print(err)
//            }
//
//
//        }, failure: { (err) in
//
//                print("werwerror", err)
//            })
      }
    
 }

 
