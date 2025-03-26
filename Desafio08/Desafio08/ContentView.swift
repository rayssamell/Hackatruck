//
//  ContentView.swift
//  Desafio08
//
//  Created by Turma01-26 on 26/03/25.
//

import SwiftUI

struct ContentView: View {
    @StateObject var viewModel = ViewModel()
    
    var body: some View {
        NavigationStack{
            ZStack {
                Color(.vinho)
                    .ignoresSafeArea()
                
                ScrollView(.vertical) {
                    VStack{
                        AsyncImage(url: URL(string: "https://tm.ibxk.com.br/2021/04/19/19165615261383.jpg")) { image in
                            image.resizable()
                        } placeholder: {
                            Color.red
                        }
                        .frame(width: 600, height: 270)
                        .clipShape(Rectangle())
                    }
                    
                    Spacer()
                    VStack(alignment: .leading){
                    
                        ForEach(viewModel.personagens, id: \.id){ personagem in
                            NavigationLink(destination: Personagem(p:personagem)){
                                    HStack{
                                        AsyncImage(url: URL(string: personagem.image!)) { image in
                                            image.resizable()
                                        } placeholder: {
                                            Color.red
                                        }
                                        .frame(width: 100, height: 100)
                                        .clipShape(Circle())
                                        Text(personagem.name!)
                                            .foregroundStyle(.white)
                                            .font(.subheadline)
                                            .bold()
                                    }
                                }
                            
                        }
                    }
                    
                }
            }
            .onAppear() {
                viewModel.fetch()
            }
        }
        .ignoresSafeArea()
    }
}

#Preview {
    ContentView()
}
