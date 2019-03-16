# iOS App界面制作 — 表格视图的高级特性

![picture made by [Mixoo](https://itunes.apple.com/cn/app/mixoo-美图拼贴-文艺杂志拼图软件/id799442576?mt=8) and [画中画相机](https://itunes.apple.com/cn/app/画中画相机-美图p图软件与美颜美妆神器/id521922264?mt=8)](https://cdn-images-1.medium.com/max/4096/1*6NCSeTpu_2rJqBJ0xCh4Yg.jpeg)

在iPhone和iPad的很多app里面，我们都会看到许多用表格视图和集合视图制作起来的界面，大部分应该是表格视图和集合视图的组合界面。比如我们在app store里面的**游戏栏**或者**App栏**里面会看到由表格视图和集合视图组合而成的漂亮界面。

![App Store里面的UI界面](https://cdn-images-1.medium.com/max/3910/1*vITEp2NkW6tvkxZLbfDndQ.png)

又或者，你也会在[**快捷指令中心**](https://itunes.apple.com/cn/app/捷径/id915249334?mt=8)里面、[**Medium**](https://itunes.apple.com/cn/app/medium/id828256236?mt=8)里面和[**Apple Support**](https://itunes.apple.com/cn/app/apple-支持/id1130498044?mt=8)里面看到相类似的界面。

![捷径、Medium、Apple Support里面的UI](https://cdn-images-1.medium.com/max/4136/1*LZOYm3AhR2xS7sgABpWTDA.png)

仔细分析不难发现这些界面的公共点，一般都是在表格视图里面添加集合视图，但是呢，我们一般学习的表格视图是用来展示一连串具有相同形式的界面的，就比如**邮件**里面你收到的邮件的展示形式，或者**微信**里面的聊天列表。

![一般形式下的表格视图应用](https://cdn-images-1.medium.com/max/3726/1*dgtOAwmXRKsSbucLqkh3ow.png)

于是，我们再看一开始的那一些照片，他们好像找不到什么相同的点，最多就是最上面的集合视图可以找到共同点，但是集合视图下一栏就立刻变成了表格视图，甚至，表格视图也有很多种形式，完全对应不起来呀，哪有什么共同特点？真是让人匪夷所思。为什么可以实现这种界面呢？别担心，接下来就来学学如何制作表格视图和集合视图并存的界面吧。



## 示例模型

我这个界面是模仿**Apple Support**写的，它用三种方式来呈现数据，最开始是集合视图，第二层是一个表格视图，第三层也是一个表格视图，不过这两种表格视图里面的界面布局不太一样。看完我这一篇文章以后，你甚至可以自定义更多的表格视图和集合视图，这完全取决于你的想法。你可以在[**GitHub**](https://github.com/HuangRunHua/WhatsPlay)上面找到完整的模型示例。

![文章示例模型](https://cdn-images-1.medium.com/max/4416/1*Vo8bQXAsu5fZfTlpKR8ShQ.png)

接下来我们就来学习一下吧。



## 制作集合视图

我们首先来制作最开始的集合视图，通过分析图片，我们知道，我们需要自定义我们的集合视图，每一个视图里面包含了一张照片、一个分类标签、一个标题以及一个副标题（副标题可以没有）。

![分析集合视图](https://cdn-images-1.medium.com/max/5376/1*3tEbNHRfIjoyf_o9G3wt8A.png)

### 1. 添加TableViewController

我们先在**storyboard**里面添加一个**TableViewController**，将它设为”**is initial View Controller**”。然后选择**Editor -> Embed in -> Navigation Controller**。

![将新的tableViewController设为Navigation Controller](https://cdn-images-1.medium.com/max/2000/1*W7jgmnDEiJm0_dia_VK8FA.png)

点击**Navigation Controller**, 将标题设为**大标题**，接着点击**tableView Controller**上的**Navigation Item**，修改其标题为**探索**。

![修改标题为探索](https://cdn-images-1.medium.com/max/2000/1*DqjjUYsqXEEA9g3s6K_7hA.png)

接着点击**TableView**的界面，打开**Attributes inspector**界面将**content**参数修改为**Static Cells**，同时将**Section**参数修改为**3**。

![修改参数](https://cdn-images-1.medium.com/max/2000/1*oZLrRwtvDsuHKVrZyD9lPw.png)

我们要使用静态的cell来完成我们的任务，第一步就是在第一个section里面完成集合视图的描绘。

打开第一个**TableView Cell**的**Size inspector**，将**Row height**修改为**230**。

![修改第一个Cell的Row Height](https://cdn-images-1.medium.com/max/2000/1*Skx2pE6MnwaUTXOdrm-Dhw.png)

不要忘记给你的TableView故事面板添加上你的类。我这边用的是TableViewController.swift来进行TableViewController的操作。

![](https://cdn-images-1.medium.com/max/2000/1*XMnmuRO3BDenbGH2fl0RjA.png)

### 2. 给Cell添加View

接着从**Library**里面拖出一个**View**控件，放在第一个**Cell**上面。

![View控件](https://cdn-images-1.medium.com/max/2000/1*GYJesi9zTARQocK16V3S1w.png)

接着给**View**控件添加新的**约束**。

![给View添加约束](https://cdn-images-1.medium.com/max/2000/1*Vm2noiJkdOF0BjrItOSzJQ.png)

### 3. 给Cell添加Collection View

接着，从**Library**里面拖出**Collection View**控件，将它放在**View**上面。

![Collection View控件](https://cdn-images-1.medium.com/max/2000/1*ZKNLeTZqaHvKA-IuqqiiaA.png)

像刚刚View一样设置相同的约束即可，同时我们要将集合视图的滚动方向修改为水平方向的。在**Attributes inspector**里面找到**Scroll Direction**，将它修改为**Horizontal。**

接着在**Size inspector**里面将**Cell size**修改为**Width：290，height：185**。在**Section insets**里面修改**Left为15，right为15**。

![修改Collection View的相关参数](https://cdn-images-1.medium.com/max/2000/1*qoKN0ZJ5525kiHBaOB0OOA.png)

最重要的，点击**Cell**，打开**Attributes inspector**，找到**Collection Reusable View**，在**Identifier**后面写上**Cell。**

![](https://cdn-images-1.medium.com/max/2000/1*OUNXGbUtqd1x4UBP2yujVA.png)

### 4. 添加照片控件

在**Library**里面找到**imageView**，将它拖到**Collection Cell**上面，设置它的约束。

![给imageView添加约束](https://cdn-images-1.medium.com/max/2000/1*C16qgpxMkfnFHXfEbrMihA.png)

### 5. 添加类别标签与主副标题标签

我们先来添加类别标签。从**library**里面拖出来一个**Label**，将它拖到**imageView**上面，修改**Label**的**字体**和**颜色**等相关参数，参考示例图片。

![修改Label的一些参数](https://cdn-images-1.medium.com/max/2000/1*x_XKMkf3YC57AUnowKBBmQ.png)

同样的，给它添加一些约束。

![](https://cdn-images-1.medium.com/max/2000/1*cEUlHJi4qwV8D-TCzRMCTA.png)

此时，要注意，我们为了保证**label**可以随着我们写的字数而有弹性的变化，就需要修改它距离Cell最右侧的距离，我们将它修改为**小于等于**。

![修改Trailing Space to：Cell](https://cdn-images-1.medium.com/max/2000/1*_mIQJ_vZm5QxqTLON2dNiQ.png)

接着是我们的主副标题了。拖动两个label到imageView的**左下角**，将每一个label的颜色修改为白色，同时也根据你的想法修改他们的字体。当然，你也可以参考我的。

![示例模型主标题修改的内容](https://cdn-images-1.medium.com/max/2000/1*N0vkaN7UALlTJlFUhIS1pA.png)

![示例模型副标题修改的内容](https://cdn-images-1.medium.com/max/2000/1*6oWSeSRiipJ7xbncB5JpyA.png)



接着，我们来<u>考虑一个小细节</u>。如果某一个collection cell它没有副标题，那么在iPhone上面展示的时候，副标题那一栏是没有字的，只有主标题有字。在美观方面，没有副标题的那一个Cell，它的主标题离cell的最下方比较远，这样并不适合。我们希望在没有副标题的时候，主标题可以适当地下移几公分，这样会显得比较好看。如图可以看出不同之处。

![](https://cdn-images-1.medium.com/max/2476/1*gYTTaCVGqS48ObGg_q6I6g.png)

![](https://cdn-images-1.medium.com/max/2670/1*IT2nXNn3oRpPXd3E9Hbs8w.png)

为了实现第二张图片的功能，我们可以使用**Stack View**来完成。

按住command按钮，选择主标题label和副标题label，选择embed in -> Stack View。

![将主标题label和副标题label组合](https://cdn-images-1.medium.com/max/2000/1*o4VLmPsWZjouOHnEk0NpAA.png)

选中我们的Stack View，打开**Attributes inspector -> View -> Content Mode -> Scale To Fill**。同时将Spacing修改为1。

![](https://cdn-images-1.medium.com/max/2000/1*qiiOpgj45vEbOhPHgmz10Q.png)

接着我们给它添加约束，只需要添加两个约束就可以了，位置你可以自己选择。

![](https://cdn-images-1.medium.com/max/2000/1*owogussgEDlBSxHPoel8xQ.png)

到此，我们Collection View的界面制作就完成了。此时你的storyboard里面第一个section的界面应该和我的一样。

![第一个Section的界面](https://cdn-images-1.medium.com/max/2000/1*ViR6S29Zk5brO_cww99mzg.png)





## 展示集合视图的数据

下面我们来使用代码实现集合视图。要想实现展示数据的功能，我们需要数据源，其中所使用的图片，你可以从[**Unsplash**](https://unsplash.com/)里面找到。

### 1. 创建集合视图数据源

新建一个Swift文件（command + N即可），选择Swift File，点击Next，给它命名为imageCollection。

打开你刚刚创建的imageCollection.swift文件，往里面添加一个结构体。

```swift
import UIKit

struct imageViewCollection {
    var image: UIImage?
    var title: String = ""
    var general: String = ""
    var subTitle: String = ""
}
```

接着，在你的TableViewController.swift文件里面写上你的数据源：

```swift 
    /**
     * 第一部分
     * 在tableViewCell里面添加了一个collectionView，实现了4个collectionCell
     * 每一个cell里面有一个标题，副标题，背景图片以及分类标签
     */
    
    private var images = [imageViewCollection(image: UIImage(named: "1"), title: "狗来了", general: "精选集", subTitle: ""), imageViewCollection(image: UIImage(named: "2"), title: "芒果街上的小屋", general: "晨读",subTitle: "优美纯净的小书"), imageViewCollection(image: UIImage(named: "4"), title: "吹小号的天鹅", general: "睡前故事",subTitle: ""), imageViewCollection(image: UIImage(named: "3"), title: "时代广场的蟋蟀", general: "下午茶",subTitle: "生命之间爱和关怀的故事")]
```



为了实现展示的功能，你还需要给你的TableViewController添加上collection的父类：UICollectionViewDelegate, UICollectionViewDataSource

```swift
class TableViewController: UITableViewController,  UICollectionViewDelegate, UICollectionViewDataSource {

    ········

}
```

### 2. 添加imageViewController.swift文件

新建一个swift文件，**File -> New -> File**(或者**command + N**)，选择**Cocoa Touch Class**，

![新建imageViewControllerTableViewCell文件](https://cdn-images-1.medium.com/max/2924/1*GouTbLy0EfvX64fVn0UKtg.png)



点击Next，选择以UITableViewCell为父类，新建类的名字为imageViewControllerTableViewCell。

![创建imageViewControllerTableViewCell](https://cdn-images-1.medium.com/max/2928/1*640r0Y_qDX8pvkfhKUdpug.png)



打开刚刚创建的imageViewControllerTableViewCell.swift文件，在里面写上几个变量：

```swift
@IBOutlet weak var imageView: UIImageView! // 背景照片
@IBOutlet weak var generalLabel: UILabel!  // 类别标签
@IBOutlet weak var titleLabel: UILabel!    // 主标题
@IBOutlet weak var subTitleLabel: UILabel! // 副标题
```

同时打开我们的Main.storyboard 和 imageViewControllerTableViewCell.swift文件，按住control，将上述声明的变量和故事面板里的控件一一连线。

![将代码与控件连线](https://cdn-images-1.medium.com/max/4500/1*8cWleS0OAnhIydXSCYXmbg.png)



### 3. 展示我们的数据

我们还需要告诉iPhone我们要展示多少个集合，对此，我们在TableViewController里面添加上：

```swift
func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return images.count
}
    
func numberOfSections(in collectionView: UICollectionView) -> Int {
    return 1
}
```



接着，在TableViewController.swift文件里面声明一个collectionView变量：

```swift
@IBOutlet weak var collectionView: UICollectionView! {
    didSet {
        collectionView.backgroundColor = .clear
    }
}
```

和刚刚的操作一样，将这个变量和故事面板里的CollectionView连线。



为了实现展示数据的功能，我们可以像tableView那样来做，在类方法**collectionView(:cellForItemAt:)**里面进行操作：

```swift
func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as! imageViewCollectionViewCell
        
        cell.imageView.image = images[indexPath.row].image
        cell.generalLabel.text = images[indexPath.row].general
        cell.titleLabel.text = images[indexPath.row].title
        cell.subTitleLabel.text = images[indexPath.row].subTitle
        
        if images[indexPath.row].subTitle == "" {
            cell.subTitleLabel.isHidden = true
            //cell.subTitleLabel.text = "   " // 这样就可以看到美观感
        }
        
        cell.layer.cornerRadius = 10.0
        cell.layer.masksToBounds = true
        
        return cell
    }
```



如果你现在去运行的话，你将不会看到数据，我们还需要指定数据源在哪里。在viewDidLoad()里面加上两句话：

```swift
override func viewDidLoad() {
    super.viewDidLoad()
    collectionView.delegate = self
    collectionView.dataSource = self
}
```

此时，你再去运行，你会发现collectionView可以工作了。



## 添加表格视图

第二部分和第三部分其实思路是一个样子的。都是为了达到 static cell 与 dynamic cell 混合使用的目的。

### 1. storyboard准备工作

打开我们的故事面板，点击一开始创建的三个Section里的第二个section，将它的高度修改为120，然后，给第二组的空白Cell设置identifier值，如图，我将它设为TableViewCell：

![给第二组的空白Cell设置identifier值](https://cdn-images-1.medium.com/max/4512/1*9jpp3kuVSlB0qrLVAoNWSg.png)

同样的，给第三个section写一个**Header**，将它命名为**浏览精选集**，将它的高度修改为60，给第三组的空白Cell设置identifier值，我将它设置为**FeaturedCell**：

![设置第三个section](https://cdn-images-1.medium.com/max/4516/1*hlwSBJLuFHS2DRuK163sqQ.png)



### 2. 创建第二部分的Xib文件

由于第二组和第三组的section需要自定义cell，使用这里使用**XIB**来完成。

我们先来自定义第二组的Cell，使用command + N快捷键，创建一个TableViewCell文件，我将它命名为TableViewCell.swift, 注意要勾选**Also Create XIB file**：

![](https://cdn-images-1.medium.com/max/2920/1*vZ1rY1hayGBb2LOTOOAnWA.png)



打开storyboard，点击第二个section的Cell，在右侧打开identity inspector，将它的继承类修改为刚刚创建的TableViewCell。

现在我们来分析看看我们需要给Cell自定义哪一些控件。如图所示：

![自定义cell](https://cdn-images-1.medium.com/max/5376/1*87d9IHrPW1c5fe1ug10naw.png)

打开我们的Xib文件，它的操作其实和Storyboard一样。你只需要在Library里面将你需要的控件拉到xib文件里面就可以了。布局的相关知识我就不再啰嗦了，只要布局和我的差不多就可以：

![第二个section的xib布局](https://cdn-images-1.medium.com/max/2472/1*sS6yKiDM80nBOnJtZ3Pu3w.png)



### 3. 添加控件代码

接着，打开xib文件对应的TableViewCell文件，我们的是TableViewCell.swift文件。和上述一些步骤一样，先在里面声明一些变量：

```swift
@IBOutlet weak var classLabel: UILabel!  // 类别标签
@IBOutlet weak var titleLabel: UILabel!  // 主标题
@IBOutlet weak var subTitle: UILabel!    // 副标题
@IBOutlet weak var backgroundImage: UIImageView! {
    didSet {
        backgroundImage.layer.cornerRadius = 15.0  // 设置圆角大小
        backgroundImage.layer.masksToBounds = true
    }
} // 配对图片
```

再将它们和xib里面的控件一一连线即可。

接着我们需要在storyboard里面使用这个控件，打开storyboard对应的TableViewController.swift文件，在里面注册一下NIB，如下：

```swift
// 第二组需要自定义cell，这里使用XIB来完成
let nib = UINib(nibName: "TableViewCell", bundle: nil)
```

在你的**ViewDidLoad()**里面添加上代码：

```swift
// 需要用代码注册Nib
self.tableView.register(nib, forCellReuseIdentifier: "TableViewCell")
```

这样子，第二部分的布局就差不多结束了。



### 4. 创建第三部分的xib文件

第三部分和第二部分差不多，无非是控件的布局不一样，创建方式一模一样。

新建一个TableViewCell文件，我将它命名为FeaturedTableViewCell，勾选创建Xib文件的选项。

像第二个Section一样，我们对它进行布局等一系列操作：

![](https://cdn-images-1.medium.com/max/4528/1*eJjV9DrkUBU_Eg6joSpZAA.png)



编写好控件的代码：

![](https://cdn-images-1.medium.com/max/4516/1*oE0AzXWZDOilLf_693prYA.png)



在TableViewController.swift里面注册一下nib：

```swift
    // 第二组需要自定义cell，这里使用XIB来完成
    let nib = UINib(nibName: "BookTableViewCell", bundle: nil)
    
    // 第3组也需要自定义cell，这里使用XIB来完成
    let featuredNib = UINib(nibName: "FeaturedTableViewCell", bundle: nil)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // 必须带上这两句话才有数据
        collectionView.delegate = self
        collectionView.dataSource = self
        
        // 需要用代码注册Nib
        self.tableView.register(nib, forCellReuseIdentifier: "TableViewCell")
        self.tableView.register(featuredNib, forCellReuseIdentifier: "FeaturedCell")
        
    }
```



非常好，我们快要接近成功了，你已经完成了3/4的工作了，我们还需要实现TableView的代理，这个可以实现static cell 与 dynamic cell 混合使用。



## 展示表格视图

这一部分是整片文章的最后一部分，我们用代码形式来完成数据的展示任务。

### 1. 创建数据源

我们先来创建第二个section的数据源，在TableViewController.swift文件里面添上：

```swift
    /**
     * 这里是第二部分
     * 我想要在 CollectionView 下方展示一系列书籍，使用 TableViewCell 来显示
     * 想要在静态的 cell 里面实现动态的 cell 需要使用 xib 文件
     */
    
    // 这是我将要在 tableViewCell 里面展示给大家的内容
    private var books = [Book(classText: "友谊", title: "塔克的郊外", subTitle: "一只蟋蟀、一只老鼠和一只猫咪的\n童话连续剧。", image: UIImage(named: "5")), Book(classText: "青春", title: "会飞的教室", subTitle: "一部由孩子们自编自演的圣诞情景剧，\n一部浓缩的校园风景录。", image: UIImage(named: "6")), Book(classText: "浪漫", title: "银河铁道之夜", subTitle: "一部未完成的作品\n银河深处，便是那幸福的天堂吗？", image: UIImage(named: "7")), Book(classText: "生命", title: "夏洛的网", subTitle: "世界上有两种人，一种人读过\n《夏洛的网》，另一种人正准备读。", image: UIImage(named: "8")), Book(classText: "冒险", title: "柳林风声", subTitle: "一个适合坐在火炉边，大家一起听的\n故事。", image: UIImage(named: "9"))]
```



接着是第三个section的数据源：

```swift
    /**
     * 这是第三部分
     * 在这一部分要实现简单的tableViewCell功能
     * 每一个 cell 由一张图片，一个标题构成
     */
    private var featuredBooks = [Featured(image: UIImage(named: "10"), title: "小王子"), Featured(image: UIImage(named: "11"), title: "爱德华的奇妙之旅"), Featured(image: UIImage(named: "12"), title: "窗边的小豆豆"), Featured(image: UIImage(named: "13"), title: "梦书之城"), Featured(image: UIImage(named: "14"), title: "天蓝色的彼岸"), Featured(image: UIImage(named: "15"), title: "看得见风的男孩")]
```



### 2. 完善表格视图

我们有了数据源以后就要开始将它们写入tableViewCell里面了，说实话，操作和普通的tableViewCell操作一模一样，我们只是多了一个注册nib的环节。

```swift
    // 以下代理方法必须实现
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if (indexPath.section == 1) {
            let cell = tableView.dequeueReusableCell(withIdentifier: "TableViewCell") as? TableViewCell
            cell?.classLabel.text = books[indexPath.row].classText
            cell?.titleLabel.text = books[indexPath.row].title
            cell?.subTitle.text = books[indexPath.row].subTitle
            cell?.backgroundImage.image = books[indexPath.row].image
            return cell!
        }
        
        if indexPath.section == 2 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "FeaturedCell") as? FeaturedTableViewCell
            cell?.bookImage.image = featuredBooks[indexPath.row].image
            cell?.bookTitle.text = featuredBooks[indexPath.row].title
            
            return cell!
        }
        
        return super.tableView(tableView, cellForRowAt: indexPath)
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 1 {
            return books.count //这里返回第二组的行数
        }
        if section == 2 {
            return featuredBooks.count
        }
        return super.tableView(tableView, numberOfRowsInSection: section)
    }

    
    override func tableView(_ tableView: UITableView, indentationLevelForRowAt indexPath: IndexPath) -> Int {
        if indexPath.section == 1 {
            return super.tableView(tableView, indentationLevelForRowAt: IndexPath(row: 0, section: 1))
        }
        if indexPath.section == 2 {
            return super.tableView(tableView, indentationLevelForRowAt: IndexPath(row: 0, section: 2))
        }
        return super.tableView(tableView, indentationLevelForRowAt: indexPath)
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.section == 1 {
            return 120
        }
        if indexPath.section == 2 {
            return 80
        }
        return super.tableView(tableView, heightForRowAt: indexPath)
    }
```





我不解释类方法的含义，这个你可以从[AppCoda](https://www.appcoda.com/)上的[Swift Book](https://www.appcoda.com/swift/)找到你要的知识点。

我解释那几个判断语句。由于我们一共有三个section，每一个section对应的控件不同，就需要有一定的判断功能，注意section是从0开始数的。



## 后记

这是比较简单的模型，你可以发挥自己的想象力创造更多好看的界面。谢谢阅读我的文章。
