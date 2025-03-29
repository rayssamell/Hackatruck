//
//  Model.swift
//  E_commerce
//
//  Created by Turma01-26 on 29/03/25.
//

import Foundation

struct Loja: Codable, Hashable {
    let nome: String?
    let preco: Double?
    let categoria: String?
    let descricao: String?
    let image: String?
    let disponivel: Bool?
    let vendedor: String?
}
