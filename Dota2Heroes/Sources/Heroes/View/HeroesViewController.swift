//
//  HeroesViewController.swift
//  Dota2Heroes
//
//  Created by Sayyid Maulana Khakul Yakin on 28/06/23.
//

import UIKit

protocol HeroesViewProcotol: AnyObject {
    func reloadHeroes()
    func displayError(message: String)
}

class HeroesViewController: UIViewController {
    
    var presenter: HeroesPresenterInput!
    
    private let containerView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        return view
    }()
    
    fileprivate let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.backgroundColor = .white
        cv.isScrollEnabled = true
        return cv
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        title = "Heroes Stats"
        navigationController?.navigationBar.prefersLargeTitles = true
        
        setupCollection()
        
        presenter.fetchHeroes()
    }
    
    private func setupCollection() {
        containerView.backgroundColor = .white
        collectionView.backgroundColor = .white
        
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(HeroesCell.self, forCellWithReuseIdentifier: HeroesCell.cellID)
        
        view.addSubview(containerView)
        containerView.addSubview(collectionView)
        
        containerView.setAnchor(top: view.safeAreaLayoutGuide.topAnchor, left: view.leadingAnchor, bottom: view.safeAreaLayoutGuide.bottomAnchor, right: view.trailingAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0)
        collectionView.setAnchor(top: containerView.topAnchor, left: containerView.leadingAnchor, bottom: containerView.bottomAnchor, right: containerView.trailingAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0)
    }
    
}

extension HeroesViewController: HeroesViewProcotol {
    
    func reloadHeroes() {
        collectionView.reloadData()
    }
    
    func displayError(message: String) {
        print(message)
    }
    
}

extension HeroesViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return presenter.numberOfRowsInSection()
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: HeroesCell.cellID, for: indexPath) as? HeroesCell else { return UICollectionViewCell() }
        let viewModel = presenter.viewModel(at: indexPath)
        
        cell.set(viewModel: viewModel)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: UIScreen.main.bounds.width / 3 - 25, height: 120)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        presenter.pushHero(at: indexPath)
        collectionView.deselectItem(at: indexPath, animated: true)
    }
    
}
