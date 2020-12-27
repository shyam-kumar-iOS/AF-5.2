//
//  LoginPresenter.swift
//  Viper
//
//  Created by Shyam Kumar on 10/18/20.
//

import Foundation
import UIKit

class LoginPresenter: ViewToPresenterProtocol {
    
    
   
    
   
    
    var view: PresenterToViewProtocol?
    
    var interactor: PresenterToInteractorProtocol?
    
    var router: PresenterToRouterProtocol?
    
    func startFetchingDb() {
        interactor?.fetchDb()
    }
    
    func saveDb(mobNo: MobNo) {
        interactor?.saveDb(mobNo: mobNo)
    }
    
}


extension LoginPresenter: InteractorToPresenterProtocol{
    func DataFetchedSuccess(mobNos: Array<MobNo>) {
        view?.getData(mobNos: mobNos)
    }
    
    func DataFetchFailed() {
        view?.showError()
    }
    
    

    
    
}
