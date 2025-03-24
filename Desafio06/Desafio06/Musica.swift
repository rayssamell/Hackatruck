//
//  Musica.swift
//  Desafio06
//
//  Created by Turma01-26 on 24/03/25.
//

import SwiftUI

struct Musica: View {
    @State var m:Song
    var body: some View {
        ZStack(){
            LinearGradient(gradient: Gradient(colors: [.blue, .black]), startPoint: .top, endPoint: .center).ignoresSafeArea()
            VStack{
                VStack(){
                    AsyncImage(url: URL(string: m.capa)) { image in
                        image.resizable()
                    } placeholder: {
                        Color.red
                    }
                    .frame(width: 300, height: 300)
                    .clipShape(Rectangle())
                    
                    VStack(alignment: .center){
                        Text(m.name)
                            .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                            .foregroundColor(.white)
                            .bold()
                            .multilineTextAlignment(.center)
                        Text(m.artist)
                            .font(.subheadline)
                            .foregroundColor(.white)
                            .bold()
                            .multilineTextAlignment(.center)
                        
                    }
                }
                .padding(100)
                VStack{
                    HStack(spacing: 20){
                        Image(systemName: "shuffle").resizable()
                        Image(systemName: "backward.end.fill").resizable()
                        Image(systemName: "play.fill").resizable()
                        Image(systemName: "forward.end.fill").resizable()
                        Image(systemName: "repeat").resizable()
                    }
                    .frame(width:250, height: 30)
                    .foregroundColor(.white)
                   
                }
            }
        }
    }
}

#Preview {
    Musica(m:Song(id:1, name:"", artist:"", capa: "https://ugc.production.linktr.ee/a6TYiIpSZGyAACrAnjIV_B86u5cUn52u1TE4G?io=true&size=avatar-v3_0"))
}
