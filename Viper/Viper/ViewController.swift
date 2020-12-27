//
//  ViewController.swift
//  Viper
//
//  Created by Shyam Kumar on 10/18/20.
//

import UIKit

class ViewController: UIViewController {

    var presenter: ViewToPresenterProtocol?
    
    @IBOutlet weak var mobileTxtF: UITextField!
    
    var db = DatabaseHelper()
    
    var mobNoss: Array<MobNo> = Array()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        presenter?.startFetchingDb()
        
    }

    @IBAction func btnAct(_ sender: UIButton) {
    
        if sender.title(for: .normal) == "Register" {
            
            
               guard let mob = db.add(MobNo.self) else {return}
               
               mob.mobileNo = mobileTxtF.text ?? ""
               
               presenter?.saveDb(mobNo: mob)
               print("registered")
            
        }else {
            presenter?.startFetchingDb()
        
            
            mobNoss.forEach { (i) in
                if i.mobileNo == mobileTxtF.text {
                    print("isLogin")
                }
            }

        }
    
    }
    
}

extension ViewController: PresenterToViewProtocol {
    func getData(mobNos: Array<MobNo>) {
        self.mobNoss = mobNos
    }
    
    func showError() {
        let alert = UIAlertController(title: "Alert", message: "Problem Fetching Notice", preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "Okay", style: UIAlertAction.Style.default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
    
    
}

