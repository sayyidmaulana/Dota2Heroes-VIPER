//
//  HeroesCell.swift
//  Dota2Heroes
//
//  Created by Sayyid Maulana Khakul Yakin on 29/06/23.
//

import UIKit

protocol HeroesCellViewModel {
    var image: String { get }
    var title: String { get }
}

class HeroesCell: UICollectionViewCell {
    
    static let cellID = "HeroesCell"
    
    private lazy var imgView: UIImageView = {
        let img = UIImageView()
        img.contentMode = .scaleAspectFill
        return img
    }()
    
    private let labelView: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.numberOfLines = 3
        label.font = .systemFont(ofSize: 10)
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupView() {
        addSubview(imgView)
        addSubview(labelView)
        imgView.setAnchor(top: topAnchor, left: leadingAnchor, bottom: nil, right: trailingAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: UIScreen.main.bounds.width / 3 - 25, height: 90)
        labelView.setAnchor(top: nil, left: leadingAnchor, bottom: bottomAnchor, right: trailingAnchor, paddingTop: 0, paddingLeft: 10, paddingBottom: 0, paddingRight: 10)
    }
    
    func set(viewModel: HeroesCellViewModel) {
        imgView.loadImage(from: viewModel.image)
        labelView.text = viewModel.title
    }
    
}
