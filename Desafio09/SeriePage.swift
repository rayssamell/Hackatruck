//
//  SeriePage.swift
//  Desafio09
//
//  Created by Turma01-26 on 27/03/25.
//

import SwiftUI

struct SeriePage: View {
    @State var s: Series
    var body: some View {
        ZStack{
            LinearGradient(gradient: Gradient(colors: [.red, .black]), startPoint: .bottomTrailing, endPoint: .center)
                .ignoresSafeArea()
            ScrollView(.vertical) {
                VStack{
                    VStack{
                        AsyncImage(url: URL(string: s.image!)) { image in
                            image.resizable()
                        } placeholder: {
                            Color.red
                        }
                        .frame(width: 300, height: 300)
                        .clipShape(Rectangle())
                        
                        Spacer()
                    }
                    
                    VStack{
                        Text(s.nome!)
                            .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                            .padding(30)
                        
                        Text("Emissora: \(s.emissora!)")
                            .font(.subheadline)
                        Text("Ano de Lancamento: \(s.anoLancamento!)")
                            .font(.subheadline)
                        
                        Text(s.adaptacao! ? "Adaptacao Literaria":"")
                            .padding(5)
                        Text("Quantidade de Temporadas: \(s.quantTemporadas!)")
                            .font(.subheadline)
                        
                        ForEach(s.atores_principais!, id: \.self){ i in
                            
                            Text("Atores Principais:")
                            Text(i)
                            
                            
                        }
                        
                        
                    }
                    .bold()
                    .foregroundStyle(.white)
                }
            }
        }
    }
}
