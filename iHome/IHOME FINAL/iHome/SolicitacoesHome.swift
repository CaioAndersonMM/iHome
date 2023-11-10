//
//  SolicitacoesHome.swift
//  iHome
//
//  Created by Student on 07/11/23.
//

import SwiftUI

struct SubcategorySolicitacion {
    var name: String
    var imageName: String
}

struct SolicitacoesHome: View {
    @State var vetor = [Servico]()
    @State var servico = "Pinturas"
    
    @State private var selection = ""
    
    let categories = ["Minhas Solicitações", "Meus Contratos"]
    

    @State var subcategories: [SubcategorySolicitacion] = [
        SubcategorySolicitacion(name: "Paredes", imageName: "pinturadeparede"),
        SubcategorySolicitacion(name: "Pisos", imageName: "pisos"),
        SubcategorySolicitacion(name: "Móveis", imageName: "moveis"),
        SubcategorySolicitacion(name: "Envernizar", imageName: "envernizamento"),
        SubcategorySolicitacion(name: "Grafites", imageName: "grafite")
    ]
    
    var body: some View {
        
        
        ZStack{
            LinearGradient(gradient: Gradient(colors: [Color("azul"), Color("azul")]), startPoint: .top, endPoint: .center)
                .frame(width: .infinity, height: .infinity).ignoresSafeArea(.all)
            VStack {
                Spacer()
                Text("Solicitações de Serviço de \(Global.userAtual.nome!)").font(.title3).fontWeight(.black).foregroundColor(.white).multilineTextAlignment(.center).padding([.top, .leading, .trailing], 20.0)
                
                HStack{
                    
                    Picker("Select a Category", selection: $selection) {
                        ForEach(categories, id: \.self) {
                            Text($0)
                        }
                    }.padding(.leading, 190.0).accentColor(.white)
                }
                
                ScrollView {
                    VStack{
                        ForEach(vetor, id: \.self._id)  { sub in
                            VStack{
                                HStack(alignment: .top){
                                    Image("\(sub.servicoPic!)").resizable().frame(width: 190.0, height: 130.0).scaledToFit()
                                    Spacer()
                                    VStack(alignment: .trailing){
                                        Text("\(sub.nome!)").font(.title3).fontWeight(.black).foregroundColor(Color("azul"))
                                        HStack{
                                            
                                            Image(systemName: "eye.fill").foregroundColor(Color("azul"))
                                            Text("Profissional").font(.footnote).fontWeight(.black).foregroundColor(Color("azul")).multilineTextAlignment(.center).padding(/*@START_MENU_TOKEN@*/.vertical, 2.0/*@END_MENU_TOKEN@*/)
                                        }
                                        
                                        HStack{
                                            Text("R$ \(String(format: "%.2f", sub.preco!))").font(.footnote).fontWeight(.black).multilineTextAlignment(.leading).foregroundColor(.white).frame(width: 90.0, height: 20.0) .background(Color(red: 0x00/255, green: 0x3F/255, blue: 0x06/255).opacity(0.86)).cornerRadius(2)
                                            
                                            Text("\(sub.metodo!)").font(.footnote).fontWeight(.black).multilineTextAlignment(.leading).foregroundColor(.white).frame(width: 90.0, height: 20.0)   .background(Color(red: 0x57/255, green: 0x3F/255, blue: 0x24/255)).cornerRadius(2)
                                            
                                        }.padding(.top)
                                        
                                        Spacer()
                                        
                                    }.padding(.trailing, 20.0).padding(.top, 7)
                                }
                                
                            }.background(.white).padding(.top, 2)
                            
                        }
                        .padding(.top)
                        
                    } //ForEach
                }
                
            }
            
        }
        .onAppear() {
            Timer.scheduledTimer(withTimeInterval: 1, repeats: true){ a  in
                if(Global.servicosAtuais != nil){
                    vetor = Global.servicosAtuais
                    a.invalidate()
                }
            }
        }
    }
    
}

struct SolicitacoesHome_Previews: PreviewProvider {
    static var previews: some View {
        SolicitacoesHome()
    }
}
