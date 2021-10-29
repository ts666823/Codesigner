////
////  WalkThroughView.swift
////  Codesigner
////
////  Created by admin on 2021/10/21.
////
//
//import SwiftUI
//
//struct WalkThroughView: View {
//    @EnvironmentObject var vm: ViewModel
//    var body: some View {
//        VStack(spacing:100){
//            Image("Codesigner")
//                .resizable()
//                .frame(width: 200, height: 200)
//                .cornerRadius(20)
//                
//            Button(action: {
//                vm.Apps_firstLaunch = false
//            },label:{
//                Text("Begin the Code Trip")
//                    .font(.largeTitle)
//                    .fontWeight(.bold)
//                    .foregroundColor(.purple.opacity(0.6))
//            })
//        }
//    }
//}
//
//struct WalkThroughView_Previews: PreviewProvider {
//    static var previews: some View {
//        WalkThroughView()
//    }
//}
