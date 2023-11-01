//
//  PinturaHome.swift
//  iHome
//
//  Created by Student07 on 30/10/23.
//

import SwiftUI

struct SubcategoryPintura {
    var name: String
    var imageName: String
}

struct PinturaHome: View {
    @State var category = ""
    
    @State var subcategories: [SubcategoryPintura] = [
        SubcategoryPintura(name: "Paredes", imageName: "pinturadeparede"),
        SubcategoryPintura(name: "Pisos", imageName: "pisos"),
        SubcategoryPintura(name: "Móveis", imageName: "moveis"),
        SubcategoryPintura(name: "Envernizar", imageName: "envernizamento"),
        SubcategoryPintura(name: "Grafites", imageName: "grafite")
    ]
    
    
    var body: some View {
        NavigationStack{
            ZStack{
                LinearGradient(gradient: Gradient(colors: [Color("azul"), Color("azul")]), startPoint: .top, endPoint: .center)
                    .frame(width: .infinity, height: .infinity).ignoresSafeArea(.all)
                
                
                ScrollView{
                    VStack{
                        HStack{
                            TextField("Tipos de Limpeza", text: $category).frame(width: 220.0, height: 40.0).background(.white).multilineTextAlignment(.center).cornerRadius(7)
                            Image(systemName: "magnifyingglass").frame(width: 40.0, height: 39.0).background(.white).cornerRadius(10)
                        }
                    }.padding(.trailing, 120.0)
                    
                    
                    ForEach(subcategories, id: \.name) { item in
                        VStack{
                            
                            NavigationLink(destination: ConstrucaoHome()){
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
                }.background(Color("azul"))            }
            
        }
        
    }
}

struct PinturaHome_Previews: PreviewProvider {
    static var previews: some View {
        PinturaHome()
    }
}
