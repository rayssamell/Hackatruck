//
//  ContentView.swift
//  Desafio09
//
//  Created by Turma01-26 on 27/03/25.
//

import SwiftUI

fileprivate enum Colors: String, CaseIterable, Identifiable {
    case red
    case blue
    case orange
    case purple
    
    var id: UUID { UUID() }
    
    var color: Color {
        switch self {
        case .red:
            Color.red
        case .blue:
            Color.blue
        case .orange:
            Color.orange
        case .purple:
            Color.purple
        }
    }
}

struct ContentView: View {
    @StateObject var viewModel = ViewModel()
    @State var scrollPosition: Int?
    private let pageWidth: CGFloat = 250
    private let pageHeight: CGFloat = 350
    private let colors = Colors.allCases
    
    var body: some View {
        NavigationStack{
            ZStack{
                LinearGradient(gradient: Gradient(colors: [.red, .black]), startPoint: .bottomTrailing, endPoint: .center)
                    .ignoresSafeArea()
                ScrollView(.horizontal) {
                    HStack(spacing: 0) {
                        ForEach(viewModel.series, id: \.self){ serie in
                            VStack{
                                Text(serie.nome!)
                                    .foregroundStyle(.white)
                                    .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                                    .bold()
                                NavigationLink(destination: SeriePage(s:serie)){
                                    AsyncImage(url: URL(string: serie.image!)) { image in
                                        image.resizable()
                                    } placeholder: {
                                        Color.red
                                    }
                                    .frame(width: pageWidth, height: 300)
                                    .padding(.horizontal, (UIScreen.main.bounds.width - pageWidth)/2)
                                }
                            }

                        }
                    }
                    .scrollTargetLayout()
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

#Preview {
    ContentView()
}
