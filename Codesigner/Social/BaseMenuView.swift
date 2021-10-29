//
//  BaseMenuView.swift
//  testSwiftUI
//
//  Created by admin on 2021/10/17.
//

import SwiftUI

@available(iOS 15.0, *)
struct BaseMenuView: View {
//    @Binding var showMenu: Bool
    @State var present = false
    @State var presentAll = false
    var body: some View {
        NavigationView {
            VStack(alignment: .leading, spacing: 0){
                VStack(alignment: .leading, spacing: 15){
                    Image("default_image")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 65, height: 65)
                        .clipShape(Circle())
                    Text("User Name")
                        .font(.title2.bold())
                    Text("Signature:......")
                        .font(.callout)
                    HStack(spacing: 12){
                        Button{
                            
                        }label: {
                            Label{
                                Text("Followers")
                            }icon: {
                                Text("190")
                                    .fontWeight(.bold)
                            }
                        }
                        Button{
                            
                        }label: {
                            Label{
                                Text("Following")
                            }icon: {
                                Text("1.2M")
                                    .fontWeight(.bold)
                            }
                        }
                    }
                    .foregroundColor(.primary)
                }
                .padding(.horizontal)
                .padding(.leading)
                
                ScrollView(.vertical,showsIndicators: false){
                    VStack{
                        VStack(alignment: .leading, spacing: 45)
                        {
                            NavigationLink(destination: SocialHome(),isActive: $present){
                                TabButton(title: "Community", image: "person.and.person")
                            }
                            
                            TabButton(title: "Personal center", image: "person")
                            TabButton(title: "My collection", image: "heart")
                            TabButton(title: "My message", image: "envelope")
                            TabButton(title: "My share", image: "square.and.arrow.up")
                            TabButton(title: "Recently deleted", image: "trash")
                            TabButton(title: "The blacklist", image: "person.crop.circle.badge.xmark.fill")
                        }
                        .padding()
                        .padding(.leading)
                        .padding(.top,35)
                        Divider()
                        VStack(alignment:.leading,spacing:30){
                            Button("Help Center"){
                                
                            }
                            .font(.largeTitle.bold())
                            .foregroundColor(Color.purple)
                        }
                    }
                }
                VStack(spacing:0){
                    Divider()
                    HStack{
                        Button{
                            
                        }label: {
                            Image(systemName: "light.max")

                                .resizable()
                                .renderingMode(.template)
                                .aspectRatio(contentMode:.fill)
                                .frame(width: 30, height: 30)
                        }
                        Spacer()
                        Button{
                            
                        }label: {
                            Image(systemName: "qrcode")

                                .resizable()
                                .renderingMode(.template)
                                .aspectRatio(contentMode:.fill)
                                .frame(width: 30, height: 30)
                        }
                    }
                    .padding([.horizontal,.top],15)
                }
            }
            .padding(.vertical)
            .frame(maxWidth: .infinity,alignment: .leading)
    //        .frame(width: UIScreen.main.bounds.width - 700)
            .frame(maxHeight: .infinity)
            .background(
                Color.primary.opacity(0.04)
                    .ignoresSafeArea(.container,edges: .vertical)
            )
            .frame(maxWidth:.infinity,alignment: .leading)
        }
    }
        @ViewBuilder
    func TabButton(title:String,image:String)->some View{
        Button{
            present = true
        }label: {
            HStack(spacing:14){
                Image(systemName: image)

                    .resizable()
                    .renderingMode(.template)
                    .aspectRatio(contentMode:.fill)
                    .frame(width: 30, height: 30)
                Text(title)
                    .font(.title2.bold())
            }
            .foregroundColor(.primary)
            .frame(maxWidth:.infinity,alignment: .leading)
        }
    }
}

@available(iOS 15.0, *)
struct BaseMenuView_Previews: PreviewProvider {
    static var previews: some View {
        SocialContentView()
    }
}
