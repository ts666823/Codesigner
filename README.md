# CodeSigner项目说明文档

## 算法界面：

用户可以在此浏览数据结构和算法，进入详情界面后，上面会有算法的图示而下方会展示相应的伪代码，用户在学习完相应代码后还可以点击进入学习Swift代码。

### 界面设计：


### 关键代码：

**PageView展示推荐页面**

```swift
ZStack(alignment: .bottomTrailing) {
  					//Page页面
            PageViewController(pages: pages, currentPage: $currentPage)
  					//Page页面下的标识，标识当前为哪一页，三个小圆点
            PageControl(numberOfPages: pages.count, currentPage: $currentPage)
                .frame(width: CGFloat(pages.count * 18))
                .padding(.trailing)
        }
```

**分行算法展示**

```swift
VStack(alignment: .leading) {
            Text(categoryName)
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(alignment: .top, spacing: 0) {
                  	//向HStack中插入Item
                    ForEach(items){algorithm in
                        //切换到详情视图的关联
                        NavigationLink(destination: sortMain()) {
                            AlgorithmItem(algorithm: algorithm)
                        }
                    }
                }
            }
            .frame(height: 185)
        }
//Item 部分由图片及描述组成
VStack(alignment: .leading) {
      algorithm.image
      Text(algorithm.name)
}
```

**算法详情展示**

使用SwiftUI的Path来绘制算法图示（以冒泡排序为例子）

```swift
HStack(alignment: .lastTextBaseline){
                    ForEach(res[index].indices , id: \.self){i in
                        //绘制每个矩形
                        NumRec(startx: i, num: res[index][i],cur:res[index][cur[index]+1], cur1: res[index][cur[index]])
                }
            }
```

**已实现的算法举例**

1. 算法：二叉树展示


   ```swift
   //增加树节点的逻辑。左子树比父节点小，右子树比父节点大
   extension Tree where A == Int {
       mutating func insert(_ number: Int) {
           if number < value {
               if children.count > 0 {
                   children[0].insert(number)
               } else {
                   children.append(Tree(number))
               }
           } else {
               if children.count == 2 {
                   children[1].insert(number)
               } else if children.count == 1, children[0].value > number {
                   children[0].insert(number)
               } else {
                   children.append(Tree(number))
               }
           }
       }
   }
   //构造树
   struct DiagramExample: View {
       @State private var binarytree = Tree<Int>(19, children: [
           Tree<Int>(20, children: [
               Tree(21),
               Tree(22)
           ]),
           Tree<Int>(30, children: [
               Tree(31),
               Tree(32)
           ])
       ])
   //用modifier为每棵树构造相同的形状
       var body: some View {
           VStack {
               Diagram(tree: binarytree, node: { value in
                   Text("\(value)")
                       .modifier(RoundedCircleStyle())
               })
               
               Button("随机插入") {
                   withAnimation {
                       self.binarytree.insert(Int.random(in: 0...100))
                   }
               }
           }
   
       }
   }
   //二叉树节点的结构体
   struct DiagramSample<A, V: View>: View {
       let tree: Tree<A>
       let node: (A) -> V
   
       var body: some View {
           VStack(spacing: 10) {
               node(tree.value)
   
               HStack(alignment: .bottom, spacing: 10) {
                   ForEach(tree.children) { child in
                       DiagramSample(tree: child, node: self.node)
                   }
               }
           }
       }
   }
   //节点及其父节点的连接逻辑
   struct CollectDict<Key: Hashable, Value>: PreferenceKey {
       static var defaultValue: [Key: Value] { [:] }
       static func reduce(value: inout [Key: Value], nextValue: () -> [Key: Value]) {
           value.merge(nextValue(), uniquingKeysWith: { $1 })
       }
   }

2. 数据结构：链表数组


   ```swift
   struct DataStructureMain: View {
       @State var num = 2
       @State var nums = [5,10,21]
       func addNode(){
           if(nums.count+1<5){
               nums.append(Int(arc4random()%UInt32(100)+UInt32(0)))
           }
           else{
           }
       }
       func deleteNode(){
           if(nums.count-1>=0){
               nums.removeLast()
           }
           else{
           }
       }
       func deleteAllNode(){
           nums.removeAll()
       }
       var body: some View {
           VStack(alignment: .center, spacing: 10, content: {
               HStack(alignment: .center, spacing: 0, content: {
                   ForEach(nums.indices, id: \.self){i in
                       node(num: nums[i])
                       if(i != nums.count-1){
                           arrow()
                       }
                   }
               }).frame(width: 400, height: 300, alignment: .center)
               .border(Color.black, width: 5)
               ScrollView{
                   HStack()
                   {
                       Button(action: {addNode()}, label: {
                           Text("Insert Node")
                       })
                       Button(action: {deleteNode()}, label: {
                           Text("Delete Node")
                       })
                       Button(action: {deleteAllNode()}, label: {
                           Text("Delete All Node")
                       })
                   }
               }
           })
       }
   }
   ```

   

## 社群界面：

用户可以在此浏览其他用户创建的UI模版，在打开详情页面时，下方会有代码的讲解，并且可以将自己感兴趣的页面添加到收藏中，在主页面可以选择只展示收藏内容。

### 界面设计：


### 关键代码：

**列表视图代码**

```swift
import SwiftUI
struct labelList: View{
    @State private var showFavoritesOnly = true
    @EnvironmentObject var modelData: ModelData
    var filteredLabel:[Label]{
        modelData.labels.filter{label in
            (!showFavoritesOnly||label.isFavorite)
        }
    }//过滤器，如有需要则过滤出labels中的收藏部分
    
    var body: some View{
        NavigationView{
            List{
                Toggle(isOn: $showFavoritesOnly)//与showFavoritesOnly的状态绑定,按钮关上为false，打开为true
                {
                    Text("显示收藏：")
                }
                
                ForEach(filteredLabel){label in
                    NavigationLink(destination: shareDetail(label: label)){
                        LabelRow(label: label)
                    }
                }//实现导航栏功能
                .navigationTitle("社区")
            }
        }
    
    }
}
struct labelList_Previews: PreviewProvider {
    static var previews: some View {
        labelList()
            .environmentObject(ModelData())
    }
}
```

**详情视图代码**

```swift
import SwiftUI
struct shareDetail: View{
    @EnvironmentObject var modelData: ModelData
    var label:Label
    var labelmarkIndex: Int{
        modelData.labels.firstIndex(where: {$0.id == label.id})!
    }
    var body: some View{
        VStack{
            image(image: label.image)
//                .aspectRatio(contentMode: /*@START_MENU_TOKEN@*/.fit/*@END_MENU_TOKEN@*/)
            VStack (alignment:.leading){
                
                HStack{
                    Text(label.name)
                        .font(.largeTitle)
                        .foregroundColor(.primary)
                    FavoriteButton(isSet: $modelData.labels[labelmarkIndex].isFavorite)//将收藏按钮状态与每个列表项的isFavorite相连
                }
                    
                HStack{
                    Text(label.masterpiece+"Description:")
                        .font(.title2)
                        .foregroundColor(.secondary)
                    Spacer()
                }
                Divider()
                Text(label.description)
            }
        }
        .padding(.top,-200)
    }
    
}
```

## UI学习界面：

### 界面设计（由Figma完成制作）：


### 技术特色：

**技术**

**设计稿到界面的转换——缩放：**

给设计稿一个约定的大小，如750px，先选定iPhoneX设备宽度375px做量取值；做适配时，可利用js计算当前设备宽度的fontSize，然后计算缩放比例。

 

**实现：“design to code”的前置优化**：

为了方便地实现转换，在转换前可以先对设计稿中的布局进行优化，这需要将layer节点转换为虚拟的AltNode。转换过程中，把用于做某些items的背景的矩形转换为一个Frame，那些以它为背景的items成为它的孩子；对于竖直或水平排列的items，将他们转换为autolayout；设计中的group不支持背景色和autolayout，所以也要转换为frame。

 ![截屏2021-07-26 15.51.34](/Users/admin/Library/Application Support/typora-user-images/截屏2021-07-26 15.51.34.png)

