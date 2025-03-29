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
    @State var categoria: [String] = ["Iluminação", "Cama, Mesa e Banho", "Acessórios", "Calças", "Vestido", "Beleza"]
    
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
                    
                    
                    Picker("Categoria", selection:$viewModel.produtos) {
                        
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
                    
                    
                    ScrollView(.vertical) {
                        VStack{
                            LazyVGrid(columns: Array(repeating: GridItem(spacing:.zero), count: 2), spacing: .zero){
                                ForEach(viewModel.produtos, id: \.self){ produto in
                                    NavigationLink(destination: ContentView()){
                                        VStack{
                                            
                                            AsyncImage(url: URL(string: produto.image!)) { image in
                                                image.resizable()
                                            } placeholder: {
                                                Color.red
                                            }
                                            .frame(width: 140, height: 140)
                                            .clipShape(Rectangle())
                                            
                                            
                                            VStack(alignment:.leading){
                                                Text(produto.nome!)
                                                Text("R$ \(produto.preco!)")
                                                    .foregroundStyle(.orange)
                                            }
                                            .foregroundStyle(.white)
                                            .font(.subheadline)
                                            .bold()
                                        }
                                        
                                    }
                                    .padding()
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
