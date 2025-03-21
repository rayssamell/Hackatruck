//
//  Modo1.swift
//  Desafio05
//
//  Created by Turma01-26 on 21/03/25.
//

import SwiftUI

struct Modo1: View {
    @State private var nome: String = ""
    @State private var sobrenome: String = ""
    
    var body: some View {
        ZStack{
            Color.azulescuro.ignoresSafeArea()
            VStack{
                Text("Modo 1")
                    .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
            }
            Spacer()
            VStack(alignment:.center){
                HStack {
                    Text("Nome:")
                    TextField(
                        "Nome",
                        text: $nome
                    )
                }
                
                HStack {
                    Text("Sobrenome:")
                    TextField(
                        "Sobrenome",
                        text: $sobrenome
                    )
                }
            }
            .frame(width: 300, height: 200)
            .background(Color.pink)
            .clipShape(Rectangle())
            .cornerRadius(15)
            .foregroundColor(.white)
            .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
        }
    }
}

#Preview {
    Modo1()
}
