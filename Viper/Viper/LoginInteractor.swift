//
//  LoginInteractor.swift
//  Viper
//
//  Created by Shyam Kumar on 10/18/20.
//

import Foundation
import UIKit

class LoginInteractor: PresenterToInteractorProtocol {
   
    
    
    
    
    var presenter: InteractorToPresenterProtocol?
    var db = DatabaseHelper()
    
    func fetchDb() {
        let abc = db.fetch(MobNo.self)
        
        if abc.count > 0 {
            self.presenter?.DataFetchedSuccess(mobNos: abc)
        }else {
            self.presenter?.DataFetchFailed()
            
        }
    }
    
    func saveDb(mobNo: MobNo) {
        db.save()
        let abc = db.fetch(MobNo.self)

        self.presenter?.DataFetchedSuccess(mobNos: abc)
    }
    
    
}
