import 'package:flutter/material.dart';

class Test extends StatefulWidget {
  Test({super.key});

  @override
  State<Test> createState() => _TestState();
}

class _TestState extends State<Test> {
  List<String> imageUrls = [
    "https://www.kevserinmutfagi.com/wp-content/uploads/2020/02/kabune3-600x400.jpg",
    "https://cdn.yemek.com/mnresize/1250/833/uploads/2023/01/kusursuz-izmir-kofte-yemekcom.jpg",
    "https://www.kevserinmutfagi.com/wp-content/uploads/2020/02/kabune3-600x400.jpg",
    "https://cdn.yemek.com/mnresize/1250/833/uploads/2016/09/kozalak-manti-asama-10.jpg",
    // Diğer resim URL'leri buraya ekleyin
  ];

  int currentIndex = 0;
  PageController _pageController = PageController();

  void _previousImage() {
    if (currentIndex > 0) {
      _pageController.previousPage(
        duration: Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }
  }

  void _nextImage() {
    if (currentIndex < imageUrls.length - 1) {
      _pageController.nextPage(
        duration: Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Resim Swipe Örneği"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              height: 300, // Resmin yüksekliğini ayarlayın
              child: Stack(
                alignment: Alignment.center,
                children: <Widget>[
                  PageView.builder(
                    itemCount: imageUrls.length,
                    controller: _pageController,
                    onPageChanged: (int index) {
                      setState(() {
                        currentIndex = index;
                      });
                    },
                    itemBuilder: (BuildContext context, int index) {
                      return Image.network(
                        imageUrls[index],
                        fit: BoxFit.cover,
                      );
                    },
                  ),
                  Positioned(
                    left: 16, // Geri butonunun pozisyonunu ayarlayın
                    child: IconButton(
                      icon: Icon(Icons.arrow_back),
                      onPressed: _previousImage,
                      color: Colors.blue,
                    ),
                  ),
                  Positioned(
                    right: 16, // İleri butonunun pozisyonunu ayarlayın
                    child: IconButton(
                      icon: Icon(Icons.arrow_forward),
                      onPressed: _nextImage,
                      color: Colors.blue,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20), // Resim ve küçük resim arasındaki boşluğu ayarlayın
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: imageUrls.map((url) {
                int index = imageUrls.indexOf(url);
                return Container(
                  width: 10,
                  height: 10,
                  margin: EdgeInsets.symmetric(horizontal: 5),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: index == currentIndex ? Colors.blue : Colors.grey,
                  ),
                );
              }).toList(),
            ),
          ],
        ),
      ),
    );
  }
}
