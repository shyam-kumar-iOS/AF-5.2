//
//  LoginRouter.swift
//  Viper
//
//  Created by Shyam Kumar on 10/18/20.
//

import Foundation
import UIKit

class LoginRouter: PresenterToRouterProtocol  {
    
   static var storyboard: UIStoryboard {
        return UIStoryboard(name: "Main", bundle: Bundle.main)
    }
    
    static func createModule() -> ViewController {
        let view = storyboard.instantiateViewController(withIdentifier: "ViewController") as! ViewController
        
        let presenter: ViewToPresenterProtocol & InteractorToPresenterProtocol = LoginPresenter()
        let interactor: PresenterToInteractorProtocol = LoginInteractor()
        let router:PresenterToRouterProtocol = LoginRouter()
        
        view.presenter = presenter
        presenter.view = view
        presenter.router = router
        presenter.interactor = interactor
        interactor.presenter = presenter
        
        return view
    }
    
    
    
    
}
