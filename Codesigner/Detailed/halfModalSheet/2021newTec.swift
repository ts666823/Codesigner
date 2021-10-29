//
//  2021newTec.swift
//  myspace
//
//  Created by admin on 2021/9/20.
//

import SwiftUI
@available(iOS 15.0, *)
struct newTecView: View {
    var body: some View {
        HStack{
            Home2()
                .padding(.bottom, 300.0)
//                .padding()
            VStack{
                HStack{
                    Spacer()
                Button(action:{
                    
                }){
                    Image(systemName: "star")
                        
                }
                .padding(.trailing)
                }
            newTecTextView()
            }
        }

    }
}
@available(iOS 15.0, *)
struct Home2: View{
    @Environment(\.presentationMode) var presentationMode
    @State var showSheet: Bool = false
    var body: some View{
        VStack{
            HStack{

                Button(action:{
                    presentationMode.wrappedValue.dismiss()
                }){
                    Text("☜Go Back")
                        .foregroundColor(Color.white)
                        .font(.system(size: 20))
                        .fontWeight(.bold)
                        .frame(width: 114,height: 40)
                        
                        .background(Color.blue)
                        .cornerRadius(8)
                }
                .padding(.leading)
                Spacer()
                
            }
            Spacer()
        HStack{
        VStack{
            Text("Half Modal Sheet")
            .font(.largeTitle)
            Button{
                showSheet.toggle()
            }label:{
                Text("Present Sheet")
                    .font(.largeTitle)
            }
            .halfSheet(showSheet: $showSheet){
                ZStack{
                    Color.red
                    VStack{
                        Text("Hello")
                            .font(.title.bold())
                            .foregroundColor(.white)
                        Button{
                            showSheet.toggle()
                        }label:{
                            Text("Close Form Sheet")
                                .foregroundColor(.white)
                        }
                        .padding()
                    }
                }
                .ignoresSafeArea()
            }onEnd: {
                print("dismissed")
            }
        }

        }
    }
    }
}

//custom half sheet Modifier
@available(iOS 15.0, *)
extension View{

    func halfSheet<SheetView: View>(showSheet: Binding<Bool>,@ViewBuilder sheetView:@escaping ()->SheetView,onEnd: @escaping ()->())->some View{
        return self
            .background(
                HalfSheetHelper(onEnd: onEnd, sheetView: sheetView(), showSheet: showSheet)
            )
    }
}

//UIkit Integration
@available(iOS 15.0, *)
struct HalfSheetHelper<SheetView: View>:UIViewControllerRepresentable{
    var onEnd: ()->()
    var sheetView: SheetView
    @Binding var showSheet: Bool
    let controller = UIViewController()
    func makeCoordinator() -> Coordinator {
        return Coordinator(parent: self)
    }
    func makeUIViewController(context: Context) -> UIViewController {
        controller.view.backgroundColor = .clear
        return controller
    }
    func updateUIViewController(_ uiViewController: UIViewController, context: Context) {
        if showSheet{
            //presenting Modal View

            let sheetController = CustomHostingController(rootView: sheetView)
            sheetController.presentationController?.delegate = context.coordinator
            uiViewController.present(sheetController, animated: true)
        }
        else{
            //closing view when showsheet toggled again
            uiViewController.dismiss(animated: true)
        }
    }
    //on dismiss
    class Coordinator:NSObject,UISheetPresentationControllerDelegate{
        var parent:HalfSheetHelper
        init(parent:HalfSheetHelper) {
            self.parent = parent
        }
        func presentationControllerDidDismiss(_ presentationController:UIPresentationController){
            parent.showSheet = false
            parent.onEnd()
        }
    }
}
//Custom UiHostingController for halfSheet...
@available(iOS 15.0, *)
class CustomHostingController<Content:View>:UIHostingController<Content>{
    override func viewDidLoad() {
        view.backgroundColor = .clear
        //setting presentation controller properties
        if let presentationController = presentationController as? UISheetPresentationController{
            presentationController.detents = [
                .medium(),
                .large()
            ]
            //to show grab protion
            presentationController.prefersGrabberVisible = true
        }
    }
}
@available(iOS 15.0, *)
struct newTec_Previews: PreviewProvider {
    static var previews: some View {
        newTecView().previewInterfaceOrientation(.landscapeLeft)
    }
}
