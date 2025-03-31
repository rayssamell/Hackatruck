//
//  ContentView.swift
//  E_commerce
//
//  Created by Turma01-26 on 29/03/25.
//

import SwiftUI


struct ContentView: View {
    @StateObject var viewModel = ViewModel()
    @State var scrollPosition: Int?
    private let pageWidth: CGFloat = 250
    private let pageHeight: CGFloat = 350
    @State var categoria: [String] = ["Todas", "Iluminação", "Cama, Mesa e Banho", "Acessórios", "Calças", "Vestido", "Beleza"]
    @State var categoriaSelecionada: String = "Todas"
    
    
    var body: some View {
        NavigationStack{
            ZStack {
                LinearGradient(gradient: Gradient(colors: [.black, .purple]), startPoint: .bottomTrailing, endPoint: .center)
                    .ignoresSafeArea()
                
                VStack{
                    HStack{
                        AsyncImage(url: URL(string: "https://www.neobyte.com.br/wp-content/uploads/2020/09/sites-ecommerce.png.webp")) { image in
                            image.resizable()
                        } placeholder: {
                            Color.red
                        }
                        .frame(width: 350, height: 200)
                        
                    }
                    Spacer()
                    
                    
                    Picker("Categoria", selection:$categoriaSelecionada){
                        ForEach(categoria, id: \.self) { index in
                            Text(index)
                        }
                        
                    }
                    .tint(.white)
                    .bold()
                    .clipShape(Rectangle())
                    .background(.black)
                    .onAppear() {
                        viewModel.fetch()
                    }
                    .onChange(of: categoriaSelecionada){
                        
                    }

                    
                    ScrollView(.vertical) {
                        VStack{
                            LazyVGrid(columns: Array(repeating: GridItem(spacing:.zero), count: 2), spacing: .zero){
                                ForEach(viewModel.produtos, id: \.self){ produto in
                                    
                                    if produto.categoria == categoriaSelecionada || categoriaSelecionada == "Todas" {
                                      
                                            VStack{
                                                NavigationLink(destination: Page(p: produto)){
                                                    AsyncImage(url: URL(string: produto.image!)) { image in
                                                        image.resizable()
                                                    } placeholder: {
                                                        Color.red
                                                    }
                                                    .frame(width: 140, height: 140)
                                                    .clipShape(Rectangle())
                                                }
                                                
                                                VStack(alignment:.leading){
                                                    Text(produto.nome!)
                                                    Text("R$ \(produto.preco!, specifier: "%.2f")")
                                                        .foregroundStyle(.orange)
                                                }
                                                .foregroundStyle(.white)
                                                .font(.subheadline)
                                                .bold()
                                            }
                                            
                                        .padding()
                                    }
                                }
                            }
                        }
                        .padding(.bottom)
                        
                    }
                    .scrollPosition(id: $scrollPosition)
                    .scrollIndicators(.hidden)
                    .scrollTargetBehavior(.paging)
                    
                    
                    .onAppear() {
                        viewModel.fetch()
                    }
                    
                }
                
            }
            
        }
        
    }
}

#Preview {
    ContentView()
}
