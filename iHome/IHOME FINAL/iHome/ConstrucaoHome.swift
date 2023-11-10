//
//  ConstrucaoHome.swift
//  iHome
//
//  Created by Student07 on 30/10/23.
//

import SwiftUI

struct SubcategoryConstrucao {
    var name: String
    var imageName: String
}

struct ConstrucaoHome: View {
    @State var category = ""
    
    @State var subcategories: [SubcategoryConstrucao] = [
        SubcategoryConstrucao(name: "Alvenarias", imageName: "alvenaria"),
        SubcategoryConstrucao(name: "Torneiras", imageName: "torneira"),
        SubcategoryConstrucao(name: "Chuveiros", imageName: "chuveiro"),
        SubcategoryConstrucao(name: "Tomadas", imageName: "tomada"),
        SubcategoryConstrucao(name: "Ponto de Luz", imageName: "pontodeluz"),
        SubcategoryConstrucao(name: "Forros", imageName: "forro"),
        SubcategoryConstrucao(name: "Rebocos", imageName: "reboco"),
        SubcategoryConstrucao(name: "Ceramica", imageName: "ceramica"),
        SubcategoryConstrucao(name: "Portas", imageName: "porta"),
        SubcategoryConstrucao(name: "Estruturas Hidráulicas", imageName: "encanamento"),
        SubcategoryConstrucao(name: "Estruturas Elétricas", imageName: "estruturaeletrica")
    ]
    
    var body: some View {
        NavigationStack{
            ZStack{
                LinearGradient(gradient: Gradient(colors: [Color("azul"), Color("azul")]), startPoint: .top, endPoint: .center)
                    .frame(width: .infinity, height: .infinity).ignoresSafeArea(.all)
                
                
                ScrollView{
                    VStack{
                        HStack{
                            TextField("Pesquise Tipo de Construção", text: $category).frame(width: 220.0, height: 40.0).background(.white).multilineTextAlignment(.center).cornerRadius(7)
                            Image(systemName: "magnifyingglass").frame(width: 40.0, height: 39.0).background(.white).cornerRadius(10)
                        }
                    }.padding(.trailing, 120.0)
                    
                        
                        ForEach(subcategories, id: \.name) { item in
                            VStack{
                                
                                NavigationLink(destination: ContratacoesHome(category: item.name)){
                                    VStack{
                                        HStack(alignment: .top){
                                            Image(item.imageName).resizable().frame(width: 190.0, height: 130.0).scaledToFit()
                                            
                                            Spacer()
                                            
                                            VStack(alignment: .center){
                                                Text(item.name).font(.title2).fontWeight(.black).foregroundColor(Color("azul")).multilineTextAlignment(.center).padding(.top, 30.0)
                                                Text("R$ 5 - R$ 100").font(.subheadline).fontWeight(.bold).padding(.top, -5.0).foregroundColor(Color("azul"))
                                                
                                            }
                                            .padding(.trailing, 50.0)
                                            
                                        }
                                    }.background(.white).padding(.top, 2)
                                }
                                
                                
                                
                            }
                        }
                    }.background(Color("azul"))
                    
                }
                
            }
            
        }
    }
    
    struct ConstucaoHome_Previews: PreviewProvider {
        static var previews: some View {
            ConstrucaoHome()
        }
    }
