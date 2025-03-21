//
//  Modo3.swift
//  Desafio05
//
//  Created by Turma01-26 on 21/03/25.
//

import SwiftUI

struct Modo3: View {
    @State private var mostrarSheet = false
    @State private var nome: String = ""
    @State private var sobrenome: String = ""
    
    var body: some View {
        ZStack{
            Color.azulescuro.ignoresSafeArea()
        Button("Sheet View") {
                mostrarSheet = true

        }.sheet(isPresented: $mostrarSheet) {
            ZStack {
                Color.azulescuro.ignoresSafeArea()
                VStack{
                    HStack {
                        Text("Nome:")
                        TextField(
                            "Nome",
                            text: $nome
                        )
                    }.font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                    
                    HStack {
                        Text("Sobrenome:")
                        TextField(
                            "Sobrenome",
                            text: $sobrenome
                        )
                    } .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                    VStack{
                        Button("Dispensar Tela") {
                            mostrarSheet = false
                        }
                    }
                }
                .frame(width: 300, height: 200)
                .background(Color.pink)
                .clipShape(Rectangle())
                .cornerRadius(15)
                .foregroundColor(.white)
                .padding()
                
                
            }
        }
            }
    }
}

#Preview {
    Modo3()
}
