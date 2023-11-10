//
//  Avaliacao.swift
//  TelaConstrucao
//
//  Created by Student05 on 07/11/23.
//

import SwiftUI
struct StartScreenButton2: View {
    var title: String
    var body: some View {
        
        HStack(alignment: .center) {
            Text(title)
                .font(.title)
                .fontWeight(.bold)
        }
        .padding().background(Color(#colorLiteral(red: 0.6039215922, green: 0.4352941215, blue: 0, alpha: 1)))
        
        .foregroundColor(.white)
        .cornerRadius(10)
        .frame(width: 160.0, height: 10.0)
        .shadow(radius: 5)
        .padding([.top, .bottom],   4)
        .font(.caption2)
    }
}
struct SheetView2: View {
    @State private var texto: String = ""
    @Environment(\.dismiss) var dismiss
    @State private var selection = 0
       let colors = [1, 2, 3, 4, 5]
    var body: some View {
        ZStack{
            Rectangle().foregroundColor(Color("azul"))
            
            VStack{
                VStack{
                    
                    Text("Profissional Gabriel").font(.title).fontWeight(.bold).foregroundColor(.white).padding(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
                }
                Spacer()
                                
                VStack {
                    Text("Nota de avaliaçao : ")
                                Picker("Selecione a nota de sua avaliaçåo", selection: $selection) {
                                    ForEach(colors, id: \.self) {
                                        Text("\($0)")
                                    }
                                }.accentColor(.white)
                   
                    if(selection == 1){
                        HStack{ //estrelas
                            ForEach(1...1, id: \.self) { _ in
                                Image(systemName: "star.fill")
                                    .foregroundColor(.yellow)
                            }
                            
                        }
                    }
                    else if(selection == 2){
                        HStack{ //estrelas
                            ForEach(1...2, id: \.self) { _ in
                                Image(systemName: "star.fill")
                                    .foregroundColor(.yellow)
                            }
                            
                        }
                    }
                    else if(selection == 3){
                        HStack{ //estrelas
                            ForEach(1...3, id: \.self) { _ in
                                Image(systemName: "star.fill")
                                    .foregroundColor(.yellow)
                            }
                            
                        }
                    }
                    else if(selection == 4){
                        HStack{ //estrelas
                            ForEach(1...4, id: \.self) { _ in
                                Image(systemName: "star.fill")
                                    .foregroundColor(.yellow)
                            }
                            
                        }
                    }
                    else if(selection == 5){
                        HStack{ //estrelas
                            ForEach(1...5, id: \.self) { _ in
                                Image(systemName: "star.fill")
                                    .foregroundColor(.yellow)
                            }
                            
                        }
                    }
                                
                            }
                .font(.title).fontWeight(.bold).foregroundColor(.white).padding(.bottom,10)
                
                Button("Terminar Avaliaçao")
                {
                    dismiss()
                }.padding().background(Color(#colorLiteral(red: 0.6039215922, green: 0.4352941215, blue: 0, alpha: 1)))
                
                    .foregroundColor(.white)
                    .cornerRadius(10)
                    .shadow(radius: 5)
                    .padding([.top, .bottom],   4)
                    .font(.title2)
                }
            
            VStack{
                Text("Deixe seu comentário:").font(.title).fontWeight(.black).foregroundColor(.white)
                VStack(alignment: .leading) {
    
                    TextEditor( text: $texto).frame(minHeight:200).padding(.bottom,1).foregroundColor(.black).multilineTextAlignment(.leading)
                       }.frame(width: 300, height: 200)
                    
            }.padding(.bottom,100)
            
                Spacer()
            
            
            }
                
            }
          
           
        }
       

struct Avaliacao: View {
    @State private var showingSheet2 = false
    var body: some View {
        ZStack
        {
            Rectangle().foregroundColor(Color("azul"))
                .ignoresSafeArea(.all)
            VStack{ //vstack principal
                HStack{ //hstack da foto com nome e avaliacao
                    Image("gabriel")
                    Spacer()
                    VStack{ // vstack do nome e as estrelas
                        Text("Avaliaçoes de Gabriel").font(.title).fontWeight(.black).foregroundColor(.white)
                        HStack{ //estrelas
                            ForEach(1...4, id: \.self) { _ in
                                Image(systemName: "star.fill")
                                    .foregroundColor(.yellow)
                            }
                            
                        }
                    }
                }
                .padding(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
                .padding(.top, 60.0)
                Divider().padding(1.0).background(.gray)
                
                HStack{
                    Text("Avaliaçoes por estrela").font(.title3).fontWeight(.black).foregroundColor(.white)
                    Spacer()
                    VStack{
                        Button("Avaliar") {
                            showingSheet2.toggle()
                        }  .sheet(isPresented: $showingSheet2) {
                            SheetView2()
                        }.padding().background(Color(#colorLiteral(red: 0.6039215922, green: 0.4352941215, blue: 0, alpha: 1)))
                        
                            .foregroundColor(.white)
                            .cornerRadius(10)
                            .shadow(radius: 5)
                            .padding([.top, .bottom],   4)
                            .font(.title2)
                            .fontWeight(.black)
                        
                    }
                }
                .padding(/*@START_MENU_TOKEN@*/.all, 10.0/*@END_MENU_TOKEN@*/)
                HStack{
                    VStack(alignment: .leading){
                        Text("5 estrelas(10)").font(.title3).fontWeight(.black).foregroundColor(.white).multilineTextAlignment(.trailing)
                        Text("4 estrelas(9)").font(.title3).fontWeight(.black).foregroundColor(.white)
                        Text("3 estrelas(8)").font(.title3).fontWeight(.black).foregroundColor(.white)
                        Text("2 estrelas(7)").font(.title3).fontWeight(.black).foregroundColor(.white)
                        Text("1 estrelas(6)").font(.title3).fontWeight(.black).foregroundColor(.white)
                    }.padding(.bottom, 300)
                    Spacer()
                    ScrollView{
                        ForEach( 1...5 , id : \.self) { _ in
                            VStack{
                                HStack{
                                    Image(systemName: "person.fill").font(.system(size: 20))
                                    VStack{
                                        Text("Diego").font(.title2).fontWeight(.black)
                                    }
                                    
                                }
                                Spacer()
                                HStack{ //estrelas
                                    ForEach(1...4, id: \.self) { _ in
                                        Image(systemName: "star.fill")
                                            .foregroundColor(.red).font(.system(size: 10))
                                    }
                                    
                                    Text("30/08/2004")
                                    
                                }
                                Spacer()
                                Text("Nåo veio o o pedido")
                                
                                Spacer()
                                
                            }.frame(width: 200, height: 100)
                                .background()
                        }
                    }
                    
                }
                .padding(.leading, 10.0)
    
            }
            
        }
    }
}

struct Avaliacao_Previews: PreviewProvider {
    static var previews: some View {
        Avaliacao()
    }
}
