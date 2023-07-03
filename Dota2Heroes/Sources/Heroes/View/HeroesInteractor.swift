//
//  HeroesInteractor.swift
//  Dota2Heroes
//
//  Created by Sayyid Maulana Khakul Yakin on 29/06/23.
//

import Foundation

protocol HeroesInteractorProtocol {
    func getHeroesData()
    func numberOfSection() -> Int
    func cellViewModel(at indexPath: IndexPath) -> HeroesViewModel.Cell
    func didSelectHeroes(at indexPath: IndexPath)
}

class HeroesInteractor: HeroesInteractorProtocol {
    
    weak var presenter: HeroesPresenterOutput!
    
    private var heroesViewModels = HeroesViewModel(cells: [])
    
    private let service = NetworkDataFetcher(service: NetworkService())
    
    func getHeroesData() {
        service.getHeroStats { [weak self] result in
            guard let self else { return }
            switch result {
            case .success(let heroes):
                let heroesItems = heroes.map { self.heroesViewModel(from: $0) }
                let heroesItemViewModel = HeroesViewModel(cells: heroesItems)
                self.heroesViewModels = heroesItemViewModel
                
                self.presenter.presentHero(data: heroesItemViewModel)
            case .failure(let error):
                self.presenter.presentError(message: error.localizedDescription)
                print(error.localizedDescription)
            }
        }
    }
    
    func numberOfSection() -> Int {
        heroesViewModels.cells.count
    }
    
    func cellViewModel(at indexPath: IndexPath) -> HeroesViewModel.Cell {
        heroesViewModels.cells[indexPath.row]
    }
    
    func didSelectHeroes(at indexPath: IndexPath) {
        
    }
    
}

extension HeroesInteractor {
    private func heroesViewModel(from heroItem: DotaHeroStat) -> HeroesViewModel.Cell {
        return HeroesViewModel.Cell(image: "https://api.opendota.com\(heroItem.img ?? "")", title: heroItem.name ?? "")
    }
}
