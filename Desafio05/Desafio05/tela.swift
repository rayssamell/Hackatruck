//
//  tela.swift
//  Desafio05
//
//  Created by Turma01-26 on 21/03/25.
//

import SwiftUI

struct tela: View {
    @Binding var nome: String
    var body: some View {
        ZStack{
            Color.azulescuro.ignoresSafeArea()
            Text("Volte, \(nome)!!")
                .frame(width: 300, height: 200)
                .background(Color.pink)
                .clipShape(Rectangle())
                .cornerRadius(15)
                .foregroundColor(.white)
                .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
        }
    }
}

