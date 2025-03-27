//
//  Model.swift
//  Desafio09
//
//  Created by Turma01-26 on 27/03/25.
//

import Foundation

struct Series: Codable, Hashable{
    let nome: String?
    let anoLancamento: Int?
    let quantTemporadas: Int?
    let emissora: String?
    let adaptacao: Bool?
    let atores_principais: [String]?
    let image: String?
}
