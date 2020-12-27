//
//  SecVC.swift
//  urlwebview
//
//  Created by Shyam Kumar on 8/14/20.
//  Copyright © 2020 Shyam Kumar. All rights reserved.
//

import UIKit
import WebKit

enum mode {
    case webV
    case wkwebV
}

class SecVC: UIViewController {
    
    var mode: mode?

    @IBOutlet weak var webV: UIWebView!
    
    
    @IBOutlet weak var wkWebV: WKWebView!
    
    
    
          let url = "https://letzconnect-dev.s3.ap-south-1.amazonaws.com/1597398204230_Chat-14-Aug-2020%2015%3A13.mpeg?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Credential=AKIAUJ2Y7DIK4XA46KIT%2F20200814%2Fap-south-1%2Fs3%2Faws4_request&X-Amz-Date=20200814T115453Z&X-Amz-Expires=1800&X-Amz-Signature=5efcdae4f7e644fc19bd57ff459a9ef82caa873a8070ff4bdb89e9b7babe24c5&X-Amz-SignedHeaders=host"
    
    override func viewDidLoad() {
        super.viewDidLoad()

       let webConfiguration = WKWebViewConfiguration()
        
        
        
        
        if mode == .webV {
            webV.isHidden = false
                       wkWebV.isHidden = true
            webV.loadRequest(NSURLRequest(url: URL(string: url)!) as URLRequest)
         
           
        } else {
            
            webV.isHidden = true
            wkWebV.isHidden = false
           
            wkWebV.load(NSURLRequest(url: URL(string: url)!) as URLRequest)
        
        webConfiguration.preferences.setValue(true, forKey: "allowFileAccessFromFileURLs")
        
               webConfiguration.allowsInlineMediaPlayback = true
                
                
                
            if #available(iOS 10.0, *) { webConfiguration.mediaTypesRequiringUserActionForPlayback = []
                    
                }
        }
    }


}
