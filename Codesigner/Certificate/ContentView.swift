//
//  ContentView.swift
//  Codesigner
//
//  Created by 唐烁 on 2021/10/15.
//

import SwiftUI

struct ContentView: View {
    
    @State var show = false
    @State var viewState = CGSize.zero
    
    var body: some View {
        ZStack {
            
            BlurView(style: .systemMaterial)
            
            TitleView()
                .blur(radius: show ? 20 : 0)
                .animation(.default)
            
            CardBottomView()
                .blur(radius: show ? 20 : 0)
                .animation(.default)
            
            CardView()
                .background(show ? Color.red : Color("background8"))
                .cornerRadius(10.0)
                .shadow(radius: 20)
                .offset(x: 0, y: show ? -400 : -40.0)
                .scaleEffect(0.85)
                .rotationEffect(Angle(degrees: show ? 15.0 : 0))
                .rotation3DEffect(Angle(degrees: show ? 50 : 0), axis: (x: 10.0, y: 10.0, z: 10.0)).animation(Animation.easeInOut(duration: 0.7))
                .offset(x: viewState.width, y: viewState.height)
            
            CardView()
                .background(show ? Color.blue : Color("background9"))
                .cornerRadius(10.0)
                .shadow(radius: 20)
                .offset(x: 0, y: show ? -200 : -20.0)
                .scaleEffect(0.9)
                .rotationEffect(Angle(degrees: show ? 10.0 : 0))
                .rotation3DEffect(Angle(degrees: show ? 40 : 0), axis: (x: 10.0, y: 10.0, z: 10.0))
                .animation(Animation.easeInOut(duration: 0.5))
                .offset(x: viewState.width, y: viewState.height)
            
            LeeView()
                .offset(x: viewState.width, y: viewState.height)
                .scaleEffect(0.95)
                .rotationEffect(Angle(degrees: show ? 5.0 : 0))
                .rotation3DEffect(Angle(degrees: show ? 30 : 0), axis: (x: 10.0, y: 10.0, z: 10.0))
                .animation(.spring())
                .onTapGesture {
                    self.show.toggle()
                }
                .gesture(
                    DragGesture()
                        .onChanged({ (value) in
                            self.viewState = value.translation;
                            self.show = true;
                        })
                        .onEnded({ (value) in
                            self.viewState = CGSize.zero;
                            self.show = false;
                        })
                )
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct CardView: View {
    var body: some View {
        VStack {
            Text("Card")
        }
        .frame(width: 340.0, height: 220.0)
    }
}

struct LeeView: View {
    
    var item = Certificate(title: "Hello World", image: "Background", width: 340.0, height: 220.0)
    
    var body: some View {
        VStack {
            HStack {
                VStack(alignment: .leading) {
                    Text(item.title)
                        .font(.headline)
                        .fontWeight(.bold)
                        .foregroundColor(Color("accent"))
                        .padding(.top)
                    Text("Codesigner")
                        .foregroundColor(Color.white)
                }
                .padding(.leading)
                Spacer()
                Image("Logo")
                    .resizable()
                    .frame(width: 30.0, height: 30.0)
                
            }
            .padding(.horizontal)
            Spacer()
            Image(item.image)
                .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
                .offset(y: 80)
        }
        .frame(width: item.width, height: item.height)
        .background(Color.black)
        .cornerRadius(10.0)
        .shadow(radius: 10.0)
    }
}

struct TitleView: View {
    var body: some View {
        VStack {
            HStack {
                Text("Certificates")
                    .font(.largeTitle)
                    .fontWeight(.heavy)
                Spacer()
            }
            Image("Illustration5")
            Spacer()
        }.padding()
    }
}

struct CardBottomView: View {
    var body: some View {
        VStack(spacing: 20.0) {
            Rectangle()
                .frame(width: 60, height: 6)
                .cornerRadius(3.0)
                .opacity(0.1)
            Text("ad发货地of地方叫都叫欧迪芬恐怕发快递搜房卡是都开发的伤口欧派的疯狂的搜发快递佛龛的是佛防控")
                .font(.body)
                .lineLimit(5)
            Spacer()
        }
        .frame(minWidth:0, maxWidth: .infinity)
        .padding()
        .padding(.horizontal)
        .background(BlurView(style: .systemMaterial))
        .cornerRadius(30)
        .shadow(radius: 20)
        .offset(y: UIScreen.main.bounds.height - 270)
    }
}
