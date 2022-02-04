//
//  AcercaDeLaApp.swift
//  Instituto Misionero
//
//  Created by Nicanor Orlando on 22/11/2021.
//  Copyright © 2021 KnorDev. All rights reserved.
//

import SwiftUI

struct AcercaDeLaApp: View {
    var body: some View {
        
        VStack{
            Image("im")
            HStack{
                Text("Instituto")
                    //.foregroundColor(.init(red: 33, green: 23, blue: 12))
                    .fontWeight(.bold)
                    .font(.largeTitle)
                Text("Misionero")
                    .foregroundColor(.gray)
                    .fontWeight(.bold)
                    .font(.largeTitle)
            }
            Text("")
            VStack{
                Text("Desarrolado por: ")
                Button(action: {
                    let url = URL(string: "mailto:nicanororlando@gmail.com?subject=Consulta - Aplicacion IM")!
                    let application = UIApplication.shared
                    application.open(url)
                }) {
                Text("nicanororlando@gmail.com")
                }
            }
            Text("")
            VStack{
                Text("Todos los recursos (Canciones, imagenes y")
                Text("textos) pertenecen a sus respectivos autores.")
                Text("Esta aplicacion no tiene responsabilidad")
                Text("alguna ni lucro sobre los mismos")
            }
            Text("")
            VStack{
                Text("¡Si tenes alguna problema o duda no ")
                Text("dudes en contactarnos!")
                Text("")
                Button(action: {
                    let url = URL(string: "mailto:institutomisionero2021@gmail.com?subject=Consulta - Aplicacion IM")!
                    let application = UIApplication.shared
                    application.open(url)
                }) {                Text("institutomisionero2021@gmail.com")
                }
            }
            Text("")
            Button(action: {
                let url = URL(string: "market://details?id=")!
                let application = UIApplication.shared
                application.open(url)
            }) {
            Text("¡Califica esta App!")
            }
        }
    }
}

struct AcercaDeLaApp_Previews: PreviewProvider {
    static var previews: some View {
        AcercaDeLaApp()
    }
}
