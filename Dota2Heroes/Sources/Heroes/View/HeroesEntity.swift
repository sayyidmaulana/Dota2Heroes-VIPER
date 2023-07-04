//
//  HeroesEntity.swift
//  Dota2Heroes
//
//  Created by Sayyid Maulana Khakul Yakin on 29/06/23.
//

import Foundation

// MARK: - DotaHeroStat
struct DotaHeroStat: Codable {
    let id: Int?
    let name, localizedName: String?
    let primaryAttr: String?
    let attackType: String?
    let roles: [String]?
    let img, icon: String?

    enum CodingKeys: String, CodingKey {
        case id, name
        case localizedName = "localized_name"
        case primaryAttr = "primary_attr"
        case attackType = "attack_type"
        case roles, img, icon
    }
}

typealias DotaHeroStats = [DotaHeroStat]

struct HeroesViewModel {
    
    struct Cell: HeroesCellViewModel {
        var image: String
        var title: String
    }
    
    let cells: [Cell]
}
