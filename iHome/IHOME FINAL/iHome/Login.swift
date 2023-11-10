//
//  Login.swift
//  iHome
//
//  Created by Student07 on 06/11/23.
//

import SwiftUI

struct Login: View {
    @State private var cpf = "CPF"
    @State private var senha = "Senha"
    
    var body: some View {
        NavigationStack{
            ZStack{
                LinearGradient(gradient: Gradient(colors: [Color("azul"), Color("azul")]), startPoint: .top, endPoint: .center)
                    .frame(width: .infinity, height: .infinity).ignoresSafeArea(.all)
               
                
                VStack{
                    Image("casa")
                    Text("iHome - Login")
                        .font(.title)
                        .fontWeight(.black)
                        .foregroundColor(.white)
                        .padding(.vertical)
                    
                    TextField("CPF", text: $cpf).padding(.trailing, 210.0).frame(width: 300.0, height: 55.0)  .background(Color(hex: 0x2077C8).opacity(0.46)).foregroundColor(.white).cornerRadius(6).multilineTextAlignment(.center)
                        .padding(.bottom, 13)
                    
                    TextField("SENHA", text: $senha).padding(.trailing, 200.0).frame(width: 300.0, height: 55.0)  .background(Color(hex: 0x2077C8).opacity(0.46)).foregroundColor(.white).cornerRadius(6).multilineTextAlignment(.center)
                    
                    LoginScreenButton(title: "Entrar")
                        .padding(.top)
                    
                    HStack{
                        Text("Não possui conta?").foregroundColor(.white)
                        Text("Cadastre-se").foregroundColor(.blue)
                    }  .padding(.top, 30.0)
                    
                }
                
            }

        }
    }
}

struct LoginScreenButton: View {
    var title: String
    
    var body: some View {
        HStack(alignment: .center) {
            Text(title)
                .font(.title)
                .fontWeight(.bold)
        }
        .frame(width: 200)
        .padding()
        .background(Color(red: 0x00 / 255, green: 0x61 / 255, blue: 0xBA / 255))
        .foregroundColor(.white)
        .cornerRadius(10)
        .shadow(radius: 5)
        .padding(.top, 20.0)
    }
}

struct Login_Previews: PreviewProvider {
    static var previews: some View {
        Login()
    }
}
