//
//  CalculatorText.swift
//  Codesigner
//
//  Created by admin on 2021/11/27.
//

import SwiftUI

struct CalculatorTextHome: View{
    @State var page = 0
    var body: some View {
        VStack{
            GeometryReader{g in
                Carousel(width: 700, page: self.$page, height: g.frame(in: .global).height)
                
            }
        }
    }
}
struct CalculatorText: View {
    var body: some View {
        HStack(spacing: 0){
            ForEach(data){ i in
                Card(width: 700, data: i)
            }
        }
    }
}

@available(iOS 15.0, *)
struct CalculatorText_Previews: PreviewProvider {
    static var previews: some View {
        CalculatorTextHome()
.previewInterfaceOrientation(.landscapeLeft)
    }
}


struct Card : View{
    var width: CGFloat
    var data : description
    var body: some View{
        VStack{
            VStack{
                Text(self.data.functionName)
                    .font(.title)
                    .fontWeight(.bold)
                    .padding(.top,-10)
                
                Spacer(minLength: 0)
                
                Image(self.data.description)
                    .resizable()
                    .frame(width: self.width-200, height: 630)
                    .cornerRadius(20)
                Button(action:{
                    
                }){
                    Text("Zoom Up")
                        .foregroundColor(.black)
                        .padding(.vertical,10)
                        .padding(.horizontal,30)
                }
                .background(Color("shadow4"))
                .clipShape(Capsule())
                .padding(.top,2)
                
                
                Spacer(minLength: 0)
            }
            .padding(.horizontal,20)
            .padding(.vertical,25)
            .background(Color.white)
            .cornerRadius(20)
            .padding(.top,20)
        }
        .frame(width: self.width)
    }
}
struct Carousel: UIViewRepresentable {
    
    
    var width: CGFloat
    @Binding var page: Int
    var height: CGFloat
    func makeUIView(context: Context) -> UIScrollView {
        let total = width * CGFloat(data.count)
        let view = UIScrollView()
        view.isPagingEnabled = true
        view.contentSize = CGSize(width: total, height: 1.0)
        view.bounces = true
        view.showsVerticalScrollIndicator = false
        view.showsHorizontalScrollIndicator = false
        
        let view1 = UIHostingController(rootView: CalculatorText())
        view1.view.frame = CGRect(x: 0, y: 0, width: total, height: self.height)
        view1.view.backgroundColor = .clear
        
        view.addSubview(view1.view)
        return view
    }
    func updateUIView(_ uiView: UIScrollView, context: Context) {
    }
}

struct description: Identifiable{
    var id : Int
    var functionName : String
    var description : String
}
var data = [
    description(id: 0, functionName: "Sort operators by priority", description: "Sortoperatorsbypriority"),
    description(id: 1, functionName: "Evaluate postfix expression", description: "Evaluatepostfixexpression"),
    description(id: 2, functionName: "Infix suffix expression", description: "Infixsuffixexpression"),
    description(id: 3, functionName: "Converts input to a valid string", description: "Convertsinputtoavalidstring"),
    description(id: 4, functionName: "Stack function", description: "Stackfunction")
]
