//
//  HeroesRouter.swift
//  Dota2Heroes
//
//  Created by Sayyid Maulana Khakul Yakin on 29/06/23.
//

import Foundation
import UIKit

protocol RouteModuleProtocol {
    static func route() -> UIViewController
    init(viewController: HeroesViewController)
    func pushToDetail(hero: HeroesViewModel.Cell)
}

class HeroesRouter: RouteModuleProtocol {
    
    static func route() -> UIViewController {
        let viewController = HeroesViewController()
        let interactor = HeroesInteractor()
        let presenter = HeroesPresenter()
        let router = HeroesRouter(viewController: viewController)
        
        viewController.presenter = presenter
        
        presenter.view = viewController
        presenter.interactor = interactor
        presenter.router = router
        
        interactor.presenter = presenter
        
        return viewController
    }
    
    unowned let viewController: HeroesViewController
    
    required init(viewController: HeroesViewController) {
        self.viewController = viewController
    }
    
    func pushToDetail(hero: HeroesViewModel.Cell) {
        let detailVC = DetailHeroesViewController()
        detailVC.heroes = hero
        
        viewController.navigationController?.pushViewController(detailVC, animated: true)
    }
    
}
