//
//  ContentView.swift
//  Desafio07
//
//  Created by Turma01-26 on 25/03/25.
//

import SwiftUI
import MapKit

struct Location: Hashable {
    let nome: String
    let foto: String
    let description: String
    let latitude: Double
    let longitude: Double
}

struct ContentView: View {
    @State var position = MapCameraPosition.region (MKCoordinateRegion(
        center: CLLocationCoordinate2D(latitude: -14.2350, longitude: -51.9253),
        span: MKCoordinateSpan(latitudeDelta: 20, longitudeDelta: 20)
    ))
    @State var shouldPresentSheet = false
    @State private var pos =  Location(nome: "Cristo Redentor, Brasil", foto: "https://www.civitatis.com/blog/wp-content/uploads/2024/04/shutterstock_45681094-2048x1539.jpg", description: "Localizada no topo do Morro do Corcovado, no Rio de Janeiro, esta icônica estátua retrata Jesus Cristo com os braços abertos em um gesto de boas-vindas e proteção. É uma figura de 38 metros de altura construída entre 1922 e 1931 em concreto armado e pedra-sabão. Tanto a majestosidade da escultura quanto a profunda sensação de paz que ela expressa lhe atribuíram a designação de maravilha do mundo moderno.",
        latitude: -22.951804,longitude:-43.210760)
    
    @State var local = [
        Location(nome: "Cristo Redentor, Brasil",
                 foto: "https://www.civitatis.com/blog/wp-content/uploads/2024/04/shutterstock_45681094-2048x1539.jpg",
                 description: "Localizada no topo do Morro do Corcovado, no Rio de Janeiro, esta icônica estátua retrata Jesus Cristo com os braços abertos em um gesto de boas-vindas e proteção. É uma figura de 38 metros de altura construída entre 1922 e 1931 em concreto armado e pedra-sabão. Tanto a majestosidade da escultura quanto a profunda sensação de paz que ela expressa lhe atribuíram a designação de maravilha do mundo moderno.",
                 latitude: -22.951804,
                 longitude:-43.210760),
        Location(nome: "Grande Muralha da China, China",
                 foto: "https://www.civitatis.com/blog/wp-content/uploads/2024/04/shutterstock_1092919118-2048x1536.jpg",
                 description: "Esta impressionante estrutura defensiva foi construída em 215 a.C. e foi sendo ampliada durante mais de 200 anos. As muralhas se estendem por mais de 21.000 quilômetros no norte da China. Foi erguida para defender o país dos constantes ataques dos Hsiung Nu, um povo invasor extremamente agressivo.",
                 latitude: 40.431908,
                 longitude:116.570374),
        Location(nome: "Machu Picchu, Peru",
                 foto: "https://www.civitatis.com/blog/wp-content/uploads/2024/04/shutterstock_1387848629-2048x1365.jpg",
                 description: "As ruínas da Cidade Perdida dos Incas, localizado entre dois picos nos Andes peruanos, foram descobertas em 1911. Este lugar representa um exemplo extraordinário de arquitetura e engenharia, já que foi construído no século XV a uma altitude de mais de 2.000 metros sem o uso de rodas ou animais de carga e de tração.",
                 latitude:  -13.163068,
                 longitude: -72.545128 ),
        Location(nome: "Petra, Jordânia",
                 foto: "https://www.civitatis.com/blog/wp-content/uploads/2024/04/shutterstock_1030695895-2048x1365.jpg",
                 description: "Petra foi a capital do reino nabateu e foi totalmente esculpida em uma rocha rosada no deserto da Jordânia. Quando a cidade foi fundada, por volta de 500 a.C., tornou-se imediatamente um ponto essencial de comércio, o que a tornou rica e próspera. Hoje, podemos perceber seu antigo esplendor através das impressionantes fachadas dos palácios que surgem da pedra. Entre eles, destaca-se o Al Khazneh, o Tesouro do Faraó, um monumento ricamente ornamentado ",
                 latitude: 30.328960,
                 longitude:35.444832),
        Location(nome: "Coliseu de Roma, Itália",
                 foto: "https://www.civitatis.com/blog/wp-content/uploads/2024/04/shutterstock_301179038-2048x1251.jpg",
                 description: "O Coliseu é o símbolo por excelência de Roma e está localizado no coração da capital italiana. Além disso, também é um dos ícones do antigo Império Romano e um dos monumentos mais visitados do mundo.Construído entre os anos 70 e 80 a.C., e famoso por ser o cenário de inúmeros filmes, o Coliseu continua sendo, acima de tudo, uma testemunha da incrível capacidade daqueles que o construíram.",
                 latitude: 41.890209,
                 longitude:12.492231),
        Location(nome: "Taj Mahal, Índia",
                 foto: "https://www.civitatis.com/blog/wp-content/uploads/2024/04/shutterstock_2387591325-2048x1365.jpg",
                 description: "Esse maravilhoso mausoléu feito de mármore branco, localizado na cidade de Agra, foi construído no século XVII pelo imperador Shah Jahan em memória de sua amada esposa Mumtaz Mahal, e é considerado uma das obras-primas da arquitetura Mogol. Dizem que os dois melhores momentos para admirar o mausoléu, que também é Patrimônio da Humanidade da UNESCO, são ao nascer e ao pôr do sol, quando o branco de seus mármores parece brilhar com mais intensidade.",
                 latitude:  27.175015,
                 longitude:78.042155),
        Location(nome: "Chichén Itzá, México",
                 foto: "https://www.civitatis.com/blog/wp-content/uploads/2024/04/shutterstock_2307055235-2048x1368.jpg",
                 description: "Esse antigo sítio arqueológico maia, localizado na península de Yucatán, no México, é famoso por sua pirâmide de Kukulkan. Esse monumento tem um formato peculiar, em degraus, e produz um fenômeno de luz único que acontece durante os equinócios. Fundade entre os séculos V e VI, Chichén Itzá foi um importante centro político e religioso, e é possível observar sua majestosidade nos diversos monumentos do sítio arqueológico, como o Templo dos Guerreiros, o Campo de Jogo de Bola mesoamericano e o Observatório El Caracol, que destaca o conhecimento astronômicos dos maias. Definitivamente, é um importante testemunho da cultura e da arquitetura maia!",
                 latitude: 20.68306,
                 longitude:-88.56861)
    ]
    var body: some View {
        ZStack {
            Map(position: $position){
                ForEach(local, id: \.self){ item in
                    Annotation(item.nome, coordinate: CLLocationCoordinate2D(latitude: item.latitude, longitude: item.longitude)) {
                        Button {
                            shouldPresentSheet.toggle()
                        } label: {
                            Image(systemName: "mappin.circle")
                                .background(.black)
                                .foregroundColor(.white)
                                .cornerRadius(15)
                        }
                        .sheet(isPresented: $shouldPresentSheet) {
                            print("Sheet dismissed!")
                            
                        } content: {
                            Maravilha(m:item)
                        }
                    }
                }
                
            }
            .ignoresSafeArea()
            
            VStack{
                Picker(selection: $pos, label: Text("Selecione a Maravilha:")) {
                    ForEach(local, id: \.self){ index in
                        Text(index.nome)
                        
                    }
                }
                .tint(.black)
                .bold()
                .onChange(of: pos)
                {
                    position = MapCameraPosition.region (MKCoordinateRegion(
                        center: CLLocationCoordinate2D(latitude: pos.latitude, longitude: pos.longitude),
                        span: MKCoordinateSpan(latitudeDelta: 20, longitudeDelta: 20)
                    ))
                }
                .clipShape(Rectangle())
                .background(.yellow)
                
                Spacer()
                
                VStack{
                    Text("Maravilhas do Mundo Moderno")
                        .foregroundColor(.black)
                }
                .frame(width: 250, height: 50)
                .clipShape(Rectangle())
                .background(.yellow)
                .cornerRadius(15)
            }
            .padding()
        }
    }
}

#Preview {
    ContentView()
}
