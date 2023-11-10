//
//  Servicos.swift
//  iHome
//
//  Created by Student07 on 06/11/23.
//

import SwiftUI

struct Servicos: View {
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
        SubcategoryConstrucao(name: "Estruturas Hidráulica", imageName: "encanamento"),
        SubcategoryConstrucao(name: "Estruturas Elétricas", imageName: "estruturaeletrica")
    ]
    
    var body: some View {
        ZStack{
            LinearGradient(gradient: Gradient(colors: [Color("azul"), Color("azul")]), startPoint: .top, endPoint: .center)
                .frame(width: .infinity, height: .infinity).ignoresSafeArea(.all)
            VStack(alignment: .leading){
                HStack{
                    Image("gabriel")
                        .frame(width: 250.0, height: 210)
                    
                    VStack(alignment: .leading){
                        VStack(alignment: .leading){
                            Text("Serviços de Pintura de Gabriel").font(.body).fontWeight(.black).foregroundColor(Color("azul")).multilineTextAlignment(.center).padding(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/).frame(width: 150.0).background(.white).cornerRadius(10)
                            
                        }
                    }
                    
                }
                
                VStack(alignment: .leading){
                    
                    ScrollView{
                        ForEach(subcategories, id: \.name) { item in
                            VStack{
                                NavigationLink(destination: ConstrucaoHome()){
                                    VStack{
                                        HStack(alignment: .top){
                                            Image(item.imageName).resizable().frame(width: 150.0, height: 140.0).scaledToFit()
                                            
                                            Spacer()
                                            
                                            VStack(alignment: .center){
                                                Text(item.name).font(.callout).fontWeight(.black).foregroundColor(Color("azul")).multilineTextAlignment(.leading).padding(.vertical, 5.0)
                                                VStack(alignment: .leading){
                                                    VStack(alignment: .leading){
                                                        Text("R$ 400").font(.footnote).fontWeight(.black).multilineTextAlignment(.leading).foregroundColor(.white).frame(width: 90.0, height: 20.0) .background(Color(red: 0x00/255, green: 0x3F/255, blue: 0x06/255).opacity(0.86)).cornerRadius(2)
                                                        
                                                        Text("Método").font(.footnote).fontWeight(.black).multilineTextAlignment(.leading).foregroundColor(.white).frame(width: 90.0, height: 20.0)   .background(Color(red: 0x57/255, green: 0x3F/255, blue: 0x24/255)).cornerRadius(2)

                                                        
                                                    }
                                                   
                                                    
                                                }
                                                
                                            }.padding(.trailing, 10.0)
                                            
                                            VStack{
                                                MetodScreenButton(title: "Mudar Metodo")
                                                    .padding(.top, 14.0)
                                                EditScreenButton(title: "Editar Valor")
                                                
                                                DeleteScreenButton(title: "Excluir         ")
                                            }
                                        }
                                    }.background(.white).padding(.top, 2)
                                    
                                }
                                
                                // HStack{
                                //     EditScreenButton(title: "Editar")
                                //     EditScreenButton(title: "Excluir")
                                // }
                                //.padding(.leading, 180.0)
                                //.padding(.bottom, 14)
                                   
                            }
                        }
                        Button("Criar Novo") {
                            /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Action@*/ /*@END_MENU_TOKEN@*/
                        }
                        .padding()
                        .background(Color(#colorLiteral(red: 0.2431372549, green: 0.4549019608, blue: 0.1450980392, alpha: 0.8)))
                        .foregroundColor(.white)
                        .cornerRadius(10)
                        .frame(width: 320.0, height: 20.0)
                        .shadow(radius: 5)
                        .padding(.top, 25.0)
                        .font(.title3)
                        .fontWeight(.black)
                    }
                    
                }
                .padding(.leading, 20.0)
                
            }
        }
        
        
    }
}

struct MetodScreenButton: View {
    var title: String
    
    var body: some View {
        HStack(alignment: .center) {
            Text(title)
                .font(.caption)
                .fontWeight(.bold)
        }
        .padding()
        .frame(height: 30.0)
        .background(Color(red: 0x57/255, green: 0x3F/255, blue: 0x24/255))
        .foregroundColor(.white)
        .cornerRadius(10)
        .shadow(radius: 5)
        .font(.caption2)
    }
}


struct Servicos_Previews: PreviewProvider {
    static var previews: some View {
        Servicos()
    }
}
