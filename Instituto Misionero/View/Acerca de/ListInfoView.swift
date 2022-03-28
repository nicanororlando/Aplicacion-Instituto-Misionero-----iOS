//
//  ListInfoView.swift
//  Instituto Misionero
//
//  Created by Nicanor Orlando on 07/11/2021.
//  Copyright © 2021 KnorDev. All rights reserved.
//

import SwiftUI

struct ListInfoView: View {
    @ObservedObject var adapted = Adapted()
    @State var navigateToDonaciones = false
    @State var navigateToAcercaDe = false
    var navigateToListInfoView: Binding<Bool>
    
    var body: some View {
        NavigationView{
        ZStack{
        Image("grupo3")
            .resizable()
            .scaledToFill()
            .opacity(0.3)
    	
            VStack(alignment: .leading){
            
            Group(){
            VStack (alignment: .leading){
                Text("Redes sociales")
                    .font(.title)
                    .fontWeight(.light)
                    .padding(.top, 10)
                    .padding(.bottom, -10)
                Divider()
                    .frame(width: 300)
                    .background(Color.black)
            }.padding(.leading, 20)
                
            // Instagram //
            Button(action: {
                let url = URL(string: "http://instagram.com/_u/instituto.misionero")!
                let application = UIApplication.shared
                
                /// Check if the ig App is installed
                if application.canOpenURL(url) {
                    application.open(url)
                } else {
                    /// If ig App is not installed, open Safari with ig Link
                    application.open(URL(string: "http://instagram.com/_u/instituto.misionero")!)
                }
            }) {
                Boton(image: "instagram", title: "Instagram", subTitle: "@instituto.misionero")
            }
                
            // Facebook //
            Button(action: {
                let url = URL(string: "facebook.com/institutomisionero")!
                let application = UIApplication.shared
                
                /// Check if the facebook App is installed
                if application.canOpenURL(url) {
                    application.open(url)
                } else {
                    /// If Facebook App is not installed, open Safari with Facebook Link
                    application.open(URL(string: "facebook.com/institutomisionero")!)
                }
            }) {
                Boton(image: "facebook", title: "Facebook", subTitle: "facebook.com/institutomisionero")
            }
                
            // Youtube //
            Button(action: {
                let url = URL(string: "youtube.com/institutomisionero")!
                let application = UIApplication.shared
                
                /// Check if the yt App is installed
                if application.canOpenURL(url) {
                    application.open(url)
                } else {
                    /// If yt App is not installed, open Safari with yt Link
                    application.open(URL(string: "https://www.youtube.com/user/InstitutoMisionerUAP")!)
                }
            }) {
                Boton(image: "youtube", title: "Youtube", subTitle: "youtube.com/institutomisionero")
            }.padding(.bottom, 15)
            }// --> Group redes sociales
            
            Group(){
            VStack(alignment: .leading){
                Text("Sobre nosotros")
                    .font(.title)
                    .fontWeight(.light)
                    .padding(.top, 10)
                    .padding(.bottom, -10)
                Divider()
                    .frame(width: 300)
                    .background(Color.black)
            }.padding(.leading, 20)
            
            Group(){
                
            // Acerca de //
            NavigationLink(
                destination: AcercaDeLaApp(navigateToAcercaDe: $navigateToAcercaDe),
                isActive: $navigateToAcercaDe,
                label: {
                    Button(action: {
                        self.navigateToAcercaDe = true
                    }) {
                        HStack{
                            Image("informacion")
                  	              .resizable()
                                .frame(width: 40, height: 40, alignment: .center)
                                .foregroundColor(Color(UIColor(named:
                                    "dark-red")!))
                                .padding(.trailing,5)
                            Text("Acerca de esta App")
                                .foregroundColor(Color.black)
                                .font(.title)
                        }
                    }
                    .padding(5)
                    .padding(.top, 7)
                    .padding(.leading, 15)
            })
            
            // Donaciones //
            NavigationLink(
                destination: Donaciones(navigateToDonaciones: $navigateToDonaciones),
                isActive: $navigateToDonaciones,
                label: {
                    Button(action: {
                        self.navigateToDonaciones = true
                    }) {
                        HStack{
                            Image("pago")
                                .resizable()
                                .frame(width: 40, height: 40, alignment: .center)
                                .foregroundColor(Color(UIColor(named: "dark-red")!))
                                .padding(.trailing, 5)
                            Text("Donaciones")
                                .foregroundColor(Color.black)
                                .font(.title)
                        }
                        .padding(5)
                        .padding(.leading, 15)
                    }
            })
                
            }// --> Group sobre nosotros
            .navigationBarBackButtonHidden(true)
            .navigationBarTitle("")
            .navigationBarHidden(true)
                
            }// --> Group potoca
            Spacer()
               
          }// --> VStack potoca
          .navigationBarBackButtonHidden(true)
          .navigationBarTitle("", displayMode: .inline)
          .navigationBarHidden(false)
          .navigationBarItems(leading:
              Button(action: {
              self.navigateToListInfoView.wrappedValue = false
          }) {
              HStack{
                  Image("icons8-atras")
                      .resizable()
                      .frame(width: adapted.adaptedWidth(curWidth: 31), height: adapted.adaptedWidth(curWidth: 31), alignment: .center)
                  Text("im")
                      .font(.system(size: adapted.adaptedWidth(curWidth: 18)))
                      .offset(x: -(adapted.adaptedWidth(curWidth: 15)))
                  Spacer()
              }
              .frame(width: adapted.adaptedWidth(curWidth: 400), height: 60, alignment: .center)
              .foregroundColor(.black)
          }.padding(7))
            
        }// --> ZStack
        }// --> NavigationView
        .navigationBarTitle("")
        .navigationBarBackButtonHidden(true)
        .navigationBarHidden(true)
        
    }// --> body
}

struct Boton: View {
    
    let image: String
    let title: String
    let subTitle: String
    
    var body: some View {
        HStack{
            Image(image)
                .resizable()
                .frame(width: 40, height: 40, alignment: .center)
                .padding(.trailing, 5)
            VStack(alignment: .leading){
                Text(title)
                    .font(.title)
                Text(subTitle)
                    .font(.subheadline)
            }
            Spacer()
        }
        .frame(width: 400, height: 60, alignment: .center)
        .foregroundColor(.black)
        .padding(5)
        .padding(.leading, 15)
    }
}

struct ListInfoView_Previews: PreviewProvider {
    static var previews: some View {
        ListInfoView(navigateToListInfoView: .constant(true))
    }
}

