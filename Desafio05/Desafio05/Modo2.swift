//
//  Modo2.swift
//  Desafio05
//
//  Created by Turma01-26 on 21/03/25.
//

import SwiftUI

struct Modo2: View {
    @State private var nome: String = ""
    @State private var sobrenome: String = ""
    @State private var toggle = false
    var body: some View {
        NavigationStack{
            ZStack{
                Color.azulescuro.ignoresSafeArea()
                Spacer()
                VStack(alignment:.center){
                    HStack {
                        Text("")
                        TextField(
                            "Nome",
                            text: $nome
                        )
                    }.multilineTextAlignment(.center)
                    
                    HStack {
                        Text("Bem vindo, \(nome)")
                    }
                    .padding(30)
                    
                    
                    
                    NavigationLink(destination: tela(nome: $nome)){
                        
                        Text("Acessar Tela")
                            .background(.blue)
                            .clipShape(Rectangle())
                            .cornerRadius(10)
                        
                        
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
}

#Preview {
    Modo2()
}
