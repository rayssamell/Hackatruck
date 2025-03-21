//
//  ContentView.swift
//  desafio2
//
//  Created by Turma01-26 on 19/03/25.
//

import SwiftUI


struct ContentView: View {
    @State private var nome: String = ""
    @State private var showingAlert = false
    
    var body: some View {
        VStack{
            HStack {
                Text("Bem vinda, ")
                TextField(
                    "Seu nome",
                    text: $nome
                )
            }
            .font(.largeTitle)
            .multilineTextAlignment(.center)
            .padding()
            
            if(!nome.isEmpty){
                Text("\(nome)")
            }
            
            Spacer()
            
            ZStack{
                VStack{
                    Image("logo")
                        .resizable()
                        .frame(width: 260, height: 160)
                    Image("foto2")
                        .resizable()
                        .frame(width: 290, height: 190)
                }.padding()
                VStack{
                    Image("foto")
                        .scaledToFit()
                        .opacity(0.2)
                }.padding()
            }
            Spacer()
            Button("Entrar") {
                showingAlert = true
            }
            .alert("ALERTA ! \n Você irá iniciar o desafio da aula agora ", isPresented: $showingAlert) {
                    Button("Vamos lá!", role: .cancel) {}
            }
        }
    }
}

#Preview {
    ContentView()
}
