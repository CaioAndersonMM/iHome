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
                    VStack{
                        HStack(alignment: .top){
                            Image("pintura").resizable().frame(width: 190.0, height: 125.0).scaledToFit()
                            
                            Spacer()
                            
                            VStack(alignment: .trailing){
                                Text("Pinturas").font(.title).fontWeight(.black).foregroundColor(Color("azul"))
                                Text("Pintura Pintura Pintura Pintura Pintura Pinturar").font(.caption).padding(.top, -5.0)
                                
                            }
                            .padding(.trailing, 20.0)
                            
                        }
                    }.background(.white).padding(.top, 2)
                    
                    
                    
                    VStack{
                        HStack(alignment: .top){
                            Image("pintura").resizable().frame(width:  190.0, height: 125.0).scaledToFit()
                            
                            Spacer()
                            
                            VStack(alignment: .trailing){
                                Text("Pinturas").font(.title).fontWeight(.black).foregroundColor(Color("azul"))
                                Text("Pintura Pintura Pintura Pintura Pintura Pinturar").font(.caption).padding(.top, -5.0)
                                
                            }
                            .padding(.trailing, 20.0)
                            
                        }
                    }.background(.white).padding(.top, 2)
                    
                    
                    VStack{
                        HStack(alignment: .top){
                            Image("pintura").resizable().frame(width:  190.0, height: 125.0).scaledToFit()
                            
                            Spacer()
                            
                            VStack(alignment: .trailing){
                                Text("Pinturas").font(.title).fontWeight(.black).foregroundColor(Color("azul"))
                                Text("Pintura Pintura Pintura Pintura Pintura Pinturar").font(.caption).padding(.top, -5.0)
                                
                            }
                            .padding(.trailing, 20.0)
                            
                        }
                    }.background(.white).padding(.top, 2)
                    
                    VStack{
                        HStack(alignment: .top){
                            Image("pintura").resizable().frame(width:  190.0, height: 125.0).scaledToFit()
                            
                            Spacer()
                            
                            VStack(alignment: .trailing){
                                Text("Pinturas").font(.title).fontWeight(.black).foregroundColor(Color("azul"))
                                Text("Pintura Pintura Pintura Pintura Pintura Pinturar").font(.caption).padding(.top, -5.0)
                                
                            }
                            .padding(.trailing, 20.0)
                            
                        }
                    }.background(.white).padding(.top, 2)
                    
                    
                }
                
                
            }.background(Color("azul"))
        }
    }
    
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}
