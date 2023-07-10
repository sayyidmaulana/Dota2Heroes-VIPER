//
//  HeroesPresenter.swift
//  Dota2Heroes
//
//  Created by Sayyid Maulana Khakul Yakin on 29/06/23.
//

import Foundation

protocol HeroesPresenterInput: AnyObject {
    func fetchHeroes()
    func numberOfRowsInSection() -> Int
    func viewModel(at indexPath: IndexPath) -> HeroesViewModel.Cell
    func pushHero(at indexPath: IndexPath)
}

protocol HeroesPresenterOutput: AnyObject {
    func presentHero(data: HeroesViewModel)
    func presentError(message: String)
    func presentToDetail(_ hero: HeroesViewModel.Cell)
}

class HeroesPresenter: HeroesPresenterInput {
    
    weak var view: HeroesViewProcotol!
    var interactor: HeroesInteractorProtocol!
    var router: RouteModuleProtocol!
    
    func fetchHeroes() {
        interactor.getHeroesData()
    }
    
    func numberOfRowsInSection() -> Int {
        interactor.numberOfSection()
    }
    
    func viewModel(at indexPath: IndexPath) -> HeroesViewModel.Cell {
        interactor.cellViewModel(at: indexPath)
    }
    
    func pushHero(at indexPath: IndexPath) {
        interactor.didSelectHeroes(at: indexPath)
    }
    
}

extension HeroesPresenter: HeroesPresenterOutput {
    
    func presentHero(data: HeroesViewModel) {
        view.reloadHeroes()
    }
    
    func presentError(message: String) {
        view.displayError(message: message)
    }
    
    func presentToDetail(_ hero: HeroesViewModel.Cell) {
        router.pushToDetail(hero: hero)
    }
    
}
