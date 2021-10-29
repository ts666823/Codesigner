//
//  SocialHome.swift
//  UIKitinSwiftUI
//
//  Created by admin on 2021/10/16.
//

import SwiftUI

@available(iOS 15.0, *)
struct SocialHome: View {
    @State var offset: CGFloat = 0
    
    var body: some View {
        ZStack(alignment: .top){
            ZStack{
                Image("pic")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: getScreenBound().width, height: 300,alignment: .bottom)
                    .clipShape(
                        CustomCorner(corners: [.bottomLeft,.bottomRight], radius: getCornerRadius())
                    )
                
                CustomCorner(corners: [.bottomLeft,.bottomRight], radius: getCornerRadius())
                    .opacity(0.1)
                let progress = -getProgress() < 0.4 ? getProgress() : 0.4
                VStack( ){

                    Image("default_image")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 100, height: 100)
                        .clipShape(Circle())
                        .scaleEffect(0.9 + progress * 1.3,anchor: .bottomLeading)
                        
                    Text("User Name")
                        .font(.title.bold())
                        .foregroundColor(.white)
                        .scaleEffect(1 + progress ,anchor: .topTrailing)
                        .offset(x: progress * 100)
                }
                .padding(10)
                .padding(.bottom,1)
                .frame(maxWidth:.infinity,maxHeight: .infinity,alignment: .bottomLeading)
                .offset(y: progress * 10)
            }
            .frame(height:300)
            .offset(y: getOffset())
            .zIndex(1)
            
            ScroolRefreshable(title: "Pull to Refresh", tintColor: .primary){
        
                    VStack(spacing: 15){
                        ForEach(1...6,id:\.self){index in
                            ZStack{
                                Image("pic\(index)")
                                    .resizable()
                                    .aspectRatio(contentMode: .fill)
                                    .frame(width: getScreenBound().width - 30 , height: 500)
                                    .cornerRadius(30)
                                
                                VStack(alignment: .leading, spacing: 15){
                                    HStack{
                                    Image("default_image")
                                        .resizable()
                                        .aspectRatio(contentMode: .fill)
                                        .frame(width: 100, height: 100)
                                        .clipShape(Circle())
                                    Text("Description:......................................................................................................................................................................................................")
                                        .font(.title.bold())
                                        .foregroundColor(.white)
                                    }
                                    Text("User\(index)")
                                        .font(.title.bold())
                                        .foregroundColor(.white)
                                    
                                }
                                .padding(15)
                                .padding(.bottom,30)
                                .frame(maxWidth:.infinity,maxHeight: .infinity,alignment: .bottomLeading)
                            }
                            
                        }
                    }
                    .padding(.top,230)
                    .padding(.top, -getSafeArea().top)
                    .modifier(OffsetModifier(offset: $offset))
            }onRefresh: {
                await Task.sleep(2_000_000_000)
            }
        }
        .ignoresSafeArea(.container,edges: .top)
    }
    func getOffset()->CGFloat{
        let checkSize = -offset < (150 - getSafeArea().top) ? offset : -(150 - getSafeArea().top)
        return offset < 0 ? checkSize : 0
    }
    func getProgress()->CGFloat{
        let topheight = (350-getSafeArea().top)
        let progress = getOffset() / topheight
        
        return progress
    }
    func getCornerRadius()->CGFloat{
        let radius = getProgress() * 45
        return 45 + radius
    }
}

@available(iOS 15.0, *)
struct SocialHome_Previews: PreviewProvider {
    static var previews: some View {
        SocialHome()
.previewInterfaceOrientation(.landscapeLeft)
    }
}
extension View{
    func getScreenBound()->CGRect{
        return UIScreen.main.bounds
    }
    
    func getSafeArea()->UIEdgeInsets{
        let null = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        
        guard let screen = UIApplication.shared.connectedScenes.first as? UIWindowScene else{
            return null
        }
        guard let safeArea = screen.windows.first?.safeAreaInsets else{
            return null
        }
        return safeArea
    }
}
