//
//  LoginProtocols.swift
//  Viper
//
//  Created by Shyam Kumar on 10/18/20.
//

import Foundation
import UIKit


protocol ViewToPresenterProtocol: class{
    
    var view: PresenterToViewProtocol? {get set}
    var interactor: PresenterToInteractorProtocol? {get set}
    var router: PresenterToRouterProtocol? {get set}
    func startFetchingDb()
    func saveDb(mobNo: MobNo)
    func getWalletBalance()
    
   // func showMovieController(navigationController:UINavigationController)

}

protocol PresenterToViewProtocol: class{
    func getData(mobNos:Array<MobNo>)
    func showError()
}

protocol PresenterToRouterProtocol: class {
    static func createModule()-> ViewController
  //  func pushToMovieScreen(navigationConroller:UINavigationController)
}

protocol PresenterToInteractorProtocol: class {
    var presenter:InteractorToPresenterProtocol? {get set}
    func fetchDb()
    func saveDb(mobNo: MobNo)
    
    
}

protocol InteractorToPresenterProtocol: class {
    func DataFetchedSuccess(mobNos:Array<MobNo>)
    func DataFetchFailed()
    
}
