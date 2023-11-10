//
//  ContratacoesHome.swift
//  iHome
//
//  Created by Student07 on 01/11/23.
//

import SwiftUI

struct ContratacoesHome: View {
    @StateObject var model = APIViewModel()
    @State var category: String
    @State var valor = 10
    @State var contador = 0
    
    var body: some View {
        NavigationStack{
            ZStack{
                LinearGradient(gradient: Gradient(colors: [Color("azul"), Color("azul")]), startPoint: .top, endPoint: .center)
                    .frame(width: .infinity, height: .infinity).ignoresSafeArea(.all)
                
                ScrollView{
                    VStack(alignment: .leading){
                        HStack{
                            Text("Profissionais").font(.title).fontWeight(.black).foregroundColor(.white).multilineTextAlignment(.leading).padding(.leading)
                            Spacer()
                            
                            Image(systemName: "line.3.horizontal.decrease.circle").frame(width: 50.0, height: 39.0).background(.white).cornerRadius(10)
                        }
                        .padding(.trailing, 30.0)
                        
                    }
                    
                    ForEach(Global.usuariosAtuais, id: \.self._id) { item in
                        
                        VStack(alignment: .trailing){
                            
                            VStack{
                                HStack(alignment: .top){
                                    Image(item.profilePic!).resizable().padding(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/).frame(width: 180.0, height: 180.0).scaledToFit()
                                    
                                    Spacer()
                                    
                                    VStack(alignment: .trailing){
                                        Text(item.nome!).font(.title2).fontWeight(.black).foregroundColor(Color("azul")).multilineTextAlignment(.center).padding(.top, 30.0)
                                        Text(item.descricao!).font(.callout).fontWeight(.medium).foregroundColor(Color("azul")).multilineTextAlignment(.trailing)
                                        
                                        HStack{
                                            
                                            ForEach(1...item.numeroTotaldeAvaliacoes!, id: \.self) { _ in
                                                Image(systemName: "star.fill")
                                                    .foregroundColor(Color("azul"))
                                            }
                                            .padding(.vertical, 5.0)
                                            
                                        }
                                        
                                        Text("R$ \(String(format: "%2.f", item.valor!)) por \(item.metodo!)").font(.title3).fontWeight(.black).foregroundColor(Color("azul")).padding(.top)
                                        
                                    }
                                    .padding(.trailing, 20.0)
                                    
                                }
                            }.background(.white).padding(.top, 2)
                            
                                .padding(.top, 20.0)
                            
                            NavigationLink(destination: Perfil(usuario: item)){
                                StartScreenButton(title: "Escolher")
                            }
                            
                        }
                    }
                    
                }.background(Color("azul"))
                
            }
            
        }
        .onAppear() {
            Global.usuariosAtuais = [User]()
            model.fetchServicosByCategoria(categoria: category)
        }
    }
}

struct StartScreenButton: View {
    var title: String
    
    var body: some View {
        HStack(alignment: .center) {
            Text(title)
                .font(.title)
                .fontWeight(.bold)
            
        }
        .padding()
        .background(Color(#colorLiteral(red: 0.2431372549, green: 0.4549019608, blue: 0.1450980392, alpha: 0.8)))
        .foregroundColor(.white)
        .cornerRadius(10)
        .frame(width: 150.0, height: 20.0)
        .shadow(radius: 5)
        .padding([.top, .bottom], 8)
        .font(.caption2)
    }
}

struct ContratacoesHome_Previews: PreviewProvider {
    static var previews: some View {
        ContratacoesHome(category: "")
    }
}
