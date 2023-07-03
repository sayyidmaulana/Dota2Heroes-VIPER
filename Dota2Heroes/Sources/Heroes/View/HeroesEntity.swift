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
    let baseHealth: Int?
    let baseHealthRegen: Double?
    let baseMana: Int?
    let baseManaRegen, baseArmor: Double?
    let baseMr, baseAttackMin, baseAttackMax, baseStr: Int?
    let baseAgi, baseInt: Int?
    let strGain, agiGain, intGain: Double?
    let attackRange, projectileSpeed: Int?
    let attackRate: Double?
    let baseAttackTime: Int?
    let attackPoint: Double?
    let moveSpeed: Int?
    let turnRate: Double?
    let cmEnabled: Bool?
    let legs, dayVision, nightVision, heroID: Int?
    let turboPicks, turboWINS, proBan, proWin: Int?
    let proPick, the1_Pick, the1_Win, the2_Pick: Int?
    let the2_Win, the3_Pick, the3_Win, the4_Pick: Int?
    let the4_Win, the5_Pick, the5_Win, the6_Pick: Int?
    let the6_Win, the7_Pick, the7_Win, the8_Pick: Int?
    let the8_Win, nullPick, nullWin: Int?

    enum CodingKeys: String, CodingKey {
        case id, name
        case localizedName = "localized_name"
        case primaryAttr = "primary_attr"
        case attackType = "attack_type"
        case roles, img, icon
        case baseHealth = "base_health"
        case baseHealthRegen = "base_health_regen"
        case baseMana = "base_mana"
        case baseManaRegen = "base_mana_regen"
        case baseArmor = "base_armor"
        case baseMr = "base_mr"
        case baseAttackMin = "base_attack_min"
        case baseAttackMax = "base_attack_max"
        case baseStr = "base_str"
        case baseAgi = "base_agi"
        case baseInt = "base_int"
        case strGain = "str_gain"
        case agiGain = "agi_gain"
        case intGain = "int_gain"
        case attackRange = "attack_range"
        case projectileSpeed = "projectile_speed"
        case attackRate = "attack_rate"
        case baseAttackTime = "base_attack_time"
        case attackPoint = "attack_point"
        case moveSpeed = "move_speed"
        case turnRate = "turn_rate"
        case cmEnabled = "cm_enabled"
        case legs
        case dayVision = "day_vision"
        case nightVision = "night_vision"
        case heroID = "hero_id"
        case turboPicks = "turbo_picks"
        case turboWINS = "turbo_wins"
        case proBan = "pro_ban"
        case proWin = "pro_win"
        case proPick = "pro_pick"
        case the1_Pick = "1_pick"
        case the1_Win = "1_win"
        case the2_Pick = "2_pick"
        case the2_Win = "2_win"
        case the3_Pick = "3_pick"
        case the3_Win = "3_win"
        case the4_Pick = "4_pick"
        case the4_Win = "4_win"
        case the5_Pick = "5_pick"
        case the5_Win = "5_win"
        case the6_Pick = "6_pick"
        case the6_Win = "6_win"
        case the7_Pick = "7_pick"
        case the7_Win = "7_win"
        case the8_Pick = "8_pick"
        case the8_Win = "8_win"
        case nullPick = "null_pick"
        case nullWin = "null_win"
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
