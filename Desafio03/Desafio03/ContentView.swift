//
//  ContentView.swift
//  Desafio03
//
//  Created by Turma01-26 on 20/03/25.
//

import SwiftUI

struct ContentView: View {
    @State private var dist: Double = 0
    @State private var tempo: Double = 0
    @State private var showDetails = false
    @State private var km: Double = 0.0
    
    func cor() -> Color {
        switch km {
        case 1...9.99:
            return Color.greenlight
        case 10...29.9:
            return Color.lightblue
        case 30...69.9:
            return Color.lightorange
        case 70...89.9:
            return Color.lightyellow
        case 90...130:
            return Color.lightred
        default:
            return Color.gray
        }
    }
    
    var body: some View {
        ZStack()
        {
            Color(cor()).ignoresSafeArea()
            
            VStack{
                VStack{
                    Text("Digite a distância (km):").bold()
                    TextField("Digite a distância (km):",
                              value: $dist, format: .number)
                    .keyboardType(.decimalPad)
                    .textContentType(.oneTimeCode)
                    .multilineTextAlignment(.center)
                    .textFieldStyle(.roundedBorder)
                    .cornerRadius(15)
                    .frame(width: 200)
                    
                    Text("Digite o tempo (h):").bold()
                    TextField("Digite o tempo (h):",
                              value: $tempo, format: .number)
                    .keyboardType(.decimalPad)
                    .textContentType(.oneTimeCode)
                    .multilineTextAlignment(.center)
                    .textFieldStyle(.roundedBorder)
                    .cornerRadius(15)
                    .frame(width: 200)
                    
                    VStack{
                        Button("Calcular") {
                            km = dist / tempo
                        }
                        .font(.title)
                        .foregroundColor(.orange)
                        .background(.black)
                        .clipShape(Capsule())
                        .padding()
                        
                        Text("\(km, specifier: "%.2f") km/h")
                            .font(.title)
                        
                        VStack{
                            switch km {
                            case 1...9.99:
                                VStack{
                                    Image("tartaruga")
                                        .resizable()
                                        .scaledToFit()
                                        .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
                                }
                                
                            case 10...29.9:
                                VStack{
                                    Image("elefante")
                                        .resizable()
                                        .scaledToFit()
                                        .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
                                }
                            case 30...69.9:
                                VStack{
                                    Image("avestruz")
                                        .resizable()
                                        .scaledToFit()
                                        .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
                                }
                            case 70...89.9:
                                VStack{
                                    Image("leao")
                                        .resizable()
                                        .scaledToFit()
                                        .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
                                }
                            case 90...130:
                                VStack{
                                    Image("guepardo")
                                        .resizable()
                                        .scaledToFit()
                                        .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
                                }
                            default:
                                VStack{
                                    Image("foto")
                                        .resizable()
                                        .scaledToFit()
                                        .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
                                }
                            }
                        }
                    }
                }
                Spacer()
                
                HStack{
                    VStack {
                        Text("TARTARUGA (0 - 9.9km/h)")
                        Text("ELEFANTE (10 - 29.9km/h)")
                        Text("AVESTRUZ (30 - 69.9km/h)")
                        Text("LEAO (70 - 9.9km/h)")
                        Text("GUEPARDO (90 - 130km/h)")
                    }
                    .foregroundColor(.white)
                    
                    VStack{
                        Circle().foregroundColor(Color.greenlight)
                        Circle().foregroundColor(Color.lightblue)
                        Circle().foregroundColor(Color.lightorange)
                        Circle().foregroundColor(Color.lightyellow)
                        Circle().foregroundColor(Color.lightred)
                    }
                }
                .frame(width: 300, height: 120)
                .background(Color.black)
                .cornerRadius(10)
                .padding(.horizontal, 10)
                
                Spacer()
            }
        }
        
    }
}

#Preview {
    ContentView()
}
