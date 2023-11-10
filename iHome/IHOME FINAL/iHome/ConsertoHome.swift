//
//  ConsertoHome.swift
//  TelaConstrucao
//
//  Created by Student05 on 01/11/23.
//

import SwiftUI
struct SubcategoryConserto {
    var name : String
    var imageName : String
}
struct ConsertoHome: View {
    @State var subcategories: [SubcategoryConserto] = [
            SubcategoryConserto(name: "Móveis", imageName: "moveis"),
            SubcategoryConserto(name: "Forro", imageName: "forro"),
            SubcategoryConserto(name: "Pisos", imageName: "pisos"),
            SubcategoryConserto(name: "Portas", imageName: "porta"),
            SubcategoryConserto(name: "Torneiras", imageName: "torneira"),
            SubcategoryConserto(name: "Chuveiros", imageName: "chuveiro"),
            SubcategoryConserto(name: "Tomadas", imageName: "tomada"),
            SubcategoryConserto(name: "Ponto De Luz", imageName: "pontodeluz"),
            SubcategoryConserto(name: "Canos", imageName: "encanamento"),
            SubcategoryConserto(name: "Fechaduras", imageName: "fechadura")
           
        ]
    @State var category = " "

    var body: some View {
        NavigationStack{
                   ZStack{
                       LinearGradient(gradient: Gradient(colors: [Color("azul"), Color("azul")]), startPoint: .top, endPoint: .center)
                           .frame(width: .infinity, height: .infinity).ignoresSafeArea(.all)
                       
                       
                       ScrollView{
                           VStack{
                               HStack{
                                   TextField("Pesquise Tipo de Conserto", text: $category).frame(width: 220.0, height: 40.0).background(.white).multilineTextAlignment(.center).cornerRadius(7)
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
                                           }.background(.white).padding([.top, .trailing], 2)
                                       }
                                       
                                       
                                       
                                   }
                               }
                           }.background(Color("azul"))
                           
                       }
                       
                   }
                   
               }
           }


struct ConsertoHome_Previews: PreviewProvider {
    static var previews: some View {
        ConsertoHome()
    }
}
