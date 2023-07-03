//
//  HeroesBuilder.swift
//  Dota2Heroes
//
//  Created by Sayyid Maulana Khakul Yakin on 29/06/23.
//

import Foundation
import UIKit

protocol BuildModuleProtocol {
    static func build() -> UINavigationController
}

class HeroesBuilder: BuildModuleProtocol {
    
    static func build() -> UINavigationController {
        let viewController = HeroesViewController()
        let interactor = HeroesInteractor()
        let presenter = HeroesPresenter()
        
        viewController.presenter = presenter
        
        presenter.interactor = interactor
        presenter.view = viewController
        
        interactor.presenter = presenter
        
        return UINavigationController(rootViewController: viewController)
    }
    
}
