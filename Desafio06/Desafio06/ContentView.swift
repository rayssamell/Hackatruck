//
//  ContentView.swift
//  Desafio06
//
//  Created by Turma01-26 on 24/03/25.
//

import SwiftUI

struct Song: Identifiable {
    var id: Int
    var name: String
    var artist: String
    var capa: String
}

struct ContentView: View {
    
    @State var arrayMusicas = [
        Song(id: 1, name: "Brightside", artist: "The Lumineers", capa: "https://upload.wikimedia.org/wikipedia/en/3/34/The_Lumineers_-_Brightside.png"),
        Song(id: 2, name: "Wildest Dreams", artist: "Taylor Swift", capa: "https://portalpopline.com.br/wp-content/uploads/2021/09/Taylor-Swift-lanca-nova-versao-do-hit-Wildest-Dreams.jpg"),
        Song(id: 3, name: "Creep", artist: "RADIOHEAD", capa: "https://www.urgesite.com.br/wp-content/uploads/2023/02/Radiohead-Pablo-Honey-e1676930196261.jpg"),
        Song(id: 4, name: "Lover", artist: "Taylor Swift", capa: "https://www.vagalume.com.br/taylor-swift/discografia/lover.webp"),
        Song(id: 5, name: "OK Computer", artist: "RADIOHEAD", capa: "https://encurtador.com.br/nt6NU"),
        Song(id: 6, name: "Ho Hey", artist: "The Lumineers", capa: "https://upload.wikimedia.org/wikipedia/pt/4/49/The_Lumineers_-_Ho_Hey.jpg?20130130204620")
    ]
    
    var body: some View {
        NavigationStack{
            ZStack(){
                LinearGradient(gradient: Gradient(colors: [.blue, .black]), startPoint: .top, endPoint: .center).ignoresSafeArea()
                
                ScrollView(.vertical) {
                    VStack(){
                        AsyncImage(url: URL(string: "https://ugc.production.linktr.ee/a6TYiIpSZGyAACrAnjIV_B86u5cUn52u1TE4G?io=true&size=avatar-v3_0")) { image in
                            image.resizable()
                        } placeholder: {
                            Color.red
                        }
                        .frame(width: 200, height: 200)
                        .clipShape(Rectangle())
                        
                        VStack{
                            Text("HackaFM")
                                .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                                .foregroundColor(.white)
                                .bold()
                            
                            HStack{
                                AsyncImage(url: URL(string: "https://ugc.production.linktr.ee/a6TYiIpSZGyAACrAnjIV_B86u5cUn52u1TE4G?io=true&size=avatar-v3_0")) { image in
                                    image.resizable()
                                } placeholder: {
                                    Color.red
                                }
                                .frame(width: 30, height: 30)
                                .clipShape(Rectangle())
                                Text("HackaSong")
                                    .foregroundColor(.white)
                                    .bold()
                            }
                        }
                        .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, alignment: .leading)
                        .padding()
                        
                        VStack{
                            VStack{
                                ForEach(arrayMusicas) { item in
                                    NavigationLink(destination: Musica(m:item)){
                                        HStack{
                                            AsyncImage(url: URL(string: item.capa)) { image in
                                                image.resizable()
                                            } placeholder: {
                                                Color.red
                                            }
                                            .frame(width: 50, height: 50)
                                            .clipShape(Rectangle())
                                            
                                            VStack{
                                                Text(item.name)
                                                    .foregroundColor(.white)
                                                Text(item.artist)
                                                    .foregroundColor(.white)
                                                    .font(.subheadline)
                                            }
                                            Spacer()
                                            Image(systemName: "ellipsis")
                                                .foregroundColor(.white)
                                        }
                                    }
                                }
                                .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, alignment: .leading)
                                .padding(.horizontal)
                                
                            }
                        }
                    }
                    .padding()
                    VStack(alignment: .leading){
                        Text("Sugeridos")
                            .foregroundColor(.white)
                            .multilineTextAlignment(/*@START_MENU_TOKEN@*/.leading/*@END_MENU_TOKEN@*/)
                            .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                        ScrollView(.horizontal) {
                            HStack(spacing: 10) {
                                ForEach(1..<4) {
                                   
                                    AsyncImage(url: URL(string: "https://m.media-amazon.com/images/I/911224fr8eL._AC_SX679_.jpg")) { image in
                                        image.resizable()
                                    } placeholder: {
                                        Color.red
                                    }
                                    .frame(width: 150, height: 150)
                                    .clipShape(Rectangle())
                                    Text("Item \($0)")
                                    
                                }
                            }
                        }.padding()
                    }
                }
            }
        }
    }
}



#Preview {
    ContentView()
}
