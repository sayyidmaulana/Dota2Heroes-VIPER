//
//  DetailHeroesViewController.swift
//  Dota2Heroes
//
//  Created by Sayyid Maulana Khakul Yakin on 10/07/23.
//

import UIKit

class DetailHeroesViewController: UIViewController {
    
    var heroes: HeroesViewModel.Cell = HeroesViewModel.Cell(image: "", title: "")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemBackground
        title = heroes.title
    }
    
}
