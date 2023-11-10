//
//  Home.swift
//  iHome
//
//  Created by Student07 on 30/10/23.
//

import SwiftUI

struct Home: View {
    @State var category = ""
    
    var body: some View {
        NavigationStack{
            ZStack{
                LinearGradient(gradient: Gradient(colors: [Color("azul"), Color("azul")]), startPoint: .top, endPoint: .center)
                    .frame(width: .infinity, height: .infinity).ignoresSafeArea(.all)
               
                ScrollView{
                    VStack{
                        HStack{
                            TextField("Pesquise uma categoria", text: $category).frame(width: 220.0, height: 40.0).background(.white).multilineTextAlignment(.center).cornerRadius(7)
                            Image(systemName: "magnifyingglass").frame(width: 40.0, height: 39.0).background(.white).cornerRadius(10)
                        }
                    }.padding(.trailing, 120.0)
                    
                    VStack{
                        NavigationLink(destination: PinturaHome()){
                        VStack{
                            HStack(alignment: .top){
                                Image("pintura").resizable().frame(width: 190.0, height: 130.0).scaledToFit()
                                
                                Spacer()
                                
                                VStack(alignment: .trailing){
                                    Text("Pinturas").font(.title).fontWeight(.black).foregroundColor(Color("azul"))
                                    Text("• Paredes • Pisos • Móveis       • Envernizamento • Grafite").font(.caption).fontWeight(.bold).multilineTextAlignment(.trailing).padding(.top, -5.0).foregroundColor(Color("azul"))
                                    
                                }
                                .padding(.trailing, 20.0)
                                
                            }
                        }.background(.white).padding(.top, 2)
                        
                        
                        }
                        NavigationLink(destination: ConsertoHome()){
                        VStack{
                            HStack(alignment: .top){
                                Image("conserto").resizable().frame(width:  190.0, height: 130).scaledToFit()
                                
                                Spacer()
                                
                                VStack(alignment: .trailing){
                                    Text("Consertos").font(.title).fontWeight(.black).foregroundColor(Color("azul"))
                                    Text("Móveis • Tetos • Pisos • Portas Torneiras • Chuveiros  Tomadas • Ponto de Luz Encanamentos • Fechaduras").font(.caption2).fontWeight(.bold).multilineTextAlignment(.trailing).padding([.top, .trailing], -5.0).foregroundColor(Color("azul"))
                                    
                                }
                                .padding(.trailing, 20.0)
                                
                            }
                        }.background(.white).padding(.top, 2)
                            
                        }
                        NavigationLink(destination: LimpezaHome()) {
                        VStack{
                            HStack(alignment: .top){
                                Image("limpeza").resizable().frame(width:  190.0, height: 130).scaledToFit()
                                
                                Spacer()
                                
                                VStack(alignment: .trailing){
                                    Text("Limpezas").font(.title).fontWeight(.black).foregroundColor(Color("azul"))
                                    Text("Roupas • Estofados • Vidros • Espaços • Louças • Piscinas").font(.caption).fontWeight(.bold).multilineTextAlignment(.trailing).padding([.top, .trailing], -5.0).foregroundColor(Color("azul"))
                                    
                                }
                                .padding(.trailing, 20.0)
                                
                            }
                        }.background(.white).padding(.top, 2)
                            
                        }
                        
                        NavigationLink(destination: ConstrucaoHome()){
                        VStack{
                            HStack(alignment: .top){
                                Image("construcao").resizable().frame(width:  190.0, height: 130).scaledToFit()
                                
                                Spacer()
                                
                                VStack(alignment: .trailing){
                                    Text("Construções").font(.title2).fontWeight(.black).foregroundColor(Color("azul")).padding(.top, 5.0)
                                    Text("Alvenarias • Torneiras Chuveiros •  Tomadas  Ponto de Luz • Forros • Reboco Ceramica • Portas ").font(.caption).fontWeight(.bold).multilineTextAlignment(.trailing).padding([.top, .trailing], -5.0).foregroundColor(Color("azul"))
                                    
                                }
                                .padding(.trailing, 20.0)
                                
                            }
                        }.background(.white).padding(.top, 2)
                            
                        }
                        
                    }
                    
                    
                }.background(Color("azul"))
            }

        }
        
    }
    
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}
