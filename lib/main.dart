import 'package:abashop/Aba-Shop/providers/all-product-provider.dart';
import 'package:abashop/Aba-Shop/providers/autumn-provider.dart';
import 'package:abashop/Aba-Shop/providers/collection-provider.dart';
import 'package:abashop/Aba-Shop/providers/dark-theme-provider.dart';
import 'package:abashop/Aba-Shop/providers/kids-provider/children-clothes-provider.dart';
import 'package:abashop/Aba-Shop/providers/kids-provider/children-shoes.dart';
import 'package:abashop/Aba-Shop/providers/men-provider/men-bag-provider.dart';
import 'package:abashop/Aba-Shop/providers/men-provider/men-pant-provider.dart';
import 'package:abashop/Aba-Shop/providers/men-provider/men-sweatshirt-provider.dart';
import 'package:abashop/Aba-Shop/providers/men-provider/men-tshirt-provider.dart';
import 'package:abashop/Aba-Shop/providers/new-season-provider.dart';
import 'package:abashop/Aba-Shop/providers/order-provider.dart';
import 'package:abashop/Aba-Shop/providers/profile-provider.dart';
import 'package:abashop/Aba-Shop/providers/wishList-provider.dart';
import 'package:abashop/Aba-Shop/providers/women-provider/bags-provider/backpack-provider.dart';
import 'package:abashop/Aba-Shop/providers/women-provider/bags-provider/hand-bag-provider.dart';
import 'package:abashop/Aba-Shop/providers/women-provider/bags-provider/shoulder-bag-provider.dart';
import 'package:abashop/Aba-Shop/providers/women-provider/headscarf-provider/bonnet-provider.dart';
import 'package:abashop/Aba-Shop/providers/women-provider/headscarf-provider/combed-cotton-shawl.dart';
import 'package:abashop/Aba-Shop/providers/women-provider/headscarf-provider/cotton-showl-provider.dart';
import 'package:abashop/Aba-Shop/providers/women-provider/headscarf-provider/medine-silk-shawl.dart';
import 'package:abashop/Aba-Shop/providers/women-provider/headscarf-provider/scarf-provider.dart';
import 'package:abashop/Aba-Shop/providers/women-provider/headscarf-provider/shawl-provider.dart';
import 'package:abashop/Aba-Shop/providers/women-provider/headscarf-provider/turban-provider.dart';
import 'package:abashop/Aba-Shop/providers/women-provider/hijab-provider/dress-provider.dart';
import 'package:abashop/Aba-Shop/providers/women-provider/hijab-provider/hijab-provider.dart';
import 'package:abashop/Aba-Shop/providers/women-provider/hijab-provider/hijab-tracksuit-provider.dart';
import 'package:abashop/Aba-Shop/providers/women-provider/hijab-provider/knitwear-provider.dart';
import 'package:abashop/Aba-Shop/providers/women-provider/hijab-provider/skirt-provider.dart';
import 'package:abashop/Aba-Shop/providers/women-provider/hijab-provider/suit-provider.dart';
import 'package:abashop/Aba-Shop/providers/women-provider/hijab-provider/waistcoat-provider.dart';
import 'package:abashop/Aba-Shop/providers/women-provider/outer-clothing-provider/abaya-provider.dart';
import 'package:abashop/Aba-Shop/providers/women-provider/outer-clothing-provider/coat-provider.dart';
import 'package:abashop/Aba-Shop/providers/women-provider/outer-clothing-provider/jacket-provider.dart';
import 'package:abashop/Aba-Shop/providers/women-provider/outer-clothing-provider/kimono-provider.dart';
import 'package:abashop/Aba-Shop/providers/women-provider/outer-clothing-provider/poncho-provider.dart';
import 'package:abashop/Aba-Shop/providers/women-provider/outer-clothing-provider/raincoat-provider.dart';
import 'package:abashop/Aba-Shop/providers/women-provider/shoes-provider/flat-provider.dart';
import 'package:abashop/Aba-Shop/screens/carts/cart-page.dart';
import 'package:abashop/Aba-Shop/screens/new-seasons/new-season-page.dart';
import 'package:abashop/Aba-Shop/screens/profile/profile-page.dart';
import 'package:abashop/Aba-Shop/screens/signin/signin-page.dart';
import 'package:abashop/Aba-Shop/screens/wishList/wishList-page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'Aba-Shop/providers/cart-provider.dart';
import 'Aba-Shop/providers/men-provider/men-shoes-provider.dart';
import 'Aba-Shop/providers/user-provider.dart';
import 'Aba-Shop/providers/women-provider/hijab-provider/pant-provider.dart';
import 'Aba-Shop/providers/women-provider/hijab-provider/tshirt-provider.dart';
import 'Aba-Shop/providers/women-provider/hijab-provider/tunic-provider.dart';
import 'Aba-Shop/providers/women-provider/shoes-provider/sneakers-provider.dart';
import 'Aba-Shop/providers/kids-provider/baby-clothes-provider.dart';
import 'Aba-Shop/screens/all-products/all-product-page.dart';
import 'Aba-Shop/screens/autumn/autumn-page.dart';
import 'Aba-Shop/screens/new-collection/new-collection-page.dart';
import 'Aba-Shop/screens/oder-page/order-page.dart';
import 'Aba-Shop/screens/onboarding/onboarding-page.dart';
import 'Aba-Shop/screens/signup/signup-page.dart';
import 'Aba-Shop/widgets/bottom-app-bar/bottom-nav-bar.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
      name: "abashopdb", options: DefaultFirebaseOptions.currentPlatform);

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<NewSeasonProvider>(
          create: (context) => NewSeasonProvider(),
        ),
        ChangeNotifierProvider<AutumnProvider>(
          create: (context) => AutumnProvider(),
        ),
        ChangeNotifierProvider<CollectionProvider>(
          create: (context) => CollectionProvider(),
        ),
        ChangeNotifierProvider<AllProductProvider>(
          create: (context) => AllProductProvider(),
        ),
        ChangeNotifierProvider<CartProvider>(
          create: (context) => CartProvider(),
        ),
        ChangeNotifierProvider<WishListProvider>(
          create: (context) => WishListProvider(),
        ),
        ChangeNotifierProvider<MenTshirtProvider>(
          create: (context) => MenTshirtProvider(),
        ),
        ChangeNotifierProvider<MenShoesProvider>(
          create: (context) => MenShoesProvider(),
        ),
        ChangeNotifierProvider<MenSweatshirtProvider>(
          create: (context) => MenSweatshirtProvider(),
        ),
        ChangeNotifierProvider<MenPantsProvider>(
          create: (context) => MenPantsProvider(),
        ),
        ChangeNotifierProvider<MenBagProvider>(
          create: (context) => MenBagProvider(),
        ),
        ChangeNotifierProvider<TunicProvider>(
          create: (context) => TunicProvider(),
        ),
        ChangeNotifierProvider<SuitProvider>(
          create: (context) => SuitProvider(),
        ),
        ChangeNotifierProvider<DressProvider>(
          create: (context) => DressProvider(),
        ),
        ChangeNotifierProvider<PantsProvider>(
          create: (context) => PantsProvider(),
        ),
        ChangeNotifierProvider<SkirtProvider>(
          create: (context) => SkirtProvider(),
        ),
        ChangeNotifierProvider<HijabProvider>(
          create: (context) => HijabProvider(),
        ),
        ChangeNotifierProvider<WaistcoatProvider>(
          create: (context) => WaistcoatProvider(),
        ),
        ChangeNotifierProvider<KnitwearProvider>(
          create: (context) => KnitwearProvider(),
        ),
        ChangeNotifierProvider<HijabTracksuitProvider>(
          create: (context) => HijabTracksuitProvider(),
        ),
        ChangeNotifierProvider<TshirtProvider>(
          create: (context) => TshirtProvider(),
        ),
        ChangeNotifierProvider<ShawlProvider>(
          create: (context) => ShawlProvider(),
        ),
        ChangeNotifierProvider<CottonShawlProvider>(
          create: (context) => CottonShawlProvider(),
        ),
        ChangeNotifierProvider<CombedCottonShwalProvider>(
          create: (context) => CombedCottonShwalProvider(),
        ),
        ChangeNotifierProvider<MedineSilkShawlProvider>(
          create: (context) => MedineSilkShawlProvider(),
        ),
        ChangeNotifierProvider<ScarfProvider>(
          create: (context) => ScarfProvider(),
        ),
        ChangeNotifierProvider<TurbanProvider>(
          create: (context) => TurbanProvider(),
        ),
        ChangeNotifierProvider<BonnetProvider>(
          create: (context) => BonnetProvider(),
        ),
        ChangeNotifierProvider<AbayaProvider>(
          create: (context) => AbayaProvider(),
        ),
        ChangeNotifierProvider<KimonoProvider>(
          create: (context) => KimonoProvider(),
        ),
        ChangeNotifierProvider<PonchoProvider>(
          create: (context) => PonchoProvider(),
        ),
        ChangeNotifierProvider<JacketProvider>(
          create: (context) => JacketProvider(),
        ),
        ChangeNotifierProvider<RaincoatProvider>(
          create: (context) => RaincoatProvider(),
        ),
        ChangeNotifierProvider<CoatProvider>(
          create: (context) => CoatProvider(),
        ),
        ChangeNotifierProvider<SneakersProvider>(
          create: (context) => SneakersProvider(),
        ),
        ChangeNotifierProvider<BallerinasProvider>(
          create: (context) => BallerinasProvider(),
        ),
        ChangeNotifierProvider<ShoulderBagProvider>(
          create: (context) => ShoulderBagProvider(),
        ),
        ChangeNotifierProvider<BackpackProvider>(
          create: (context) => BackpackProvider(),
        ),
        ChangeNotifierProvider<HandBagProvider>(
          create: (context) => HandBagProvider(),
        ),
        ChangeNotifierProvider<BabyClothesProvider>(
          create: (context) => BabyClothesProvider(),
        ),
        ChangeNotifierProvider<ChildrenClothesProvider>(
          create: (context) => ChildrenClothesProvider(),
        ),
        ChangeNotifierProvider<ChildrenShoesProvider>(
          create: (context) => ChildrenShoesProvider(),
        ),
        ChangeNotifierProvider<AuthNotifier>(
          create: (context) => AuthNotifier(),
        ),
        ChangeNotifierProvider<DarkThemeProvider>(
          create: (context) => DarkThemeProvider(),
        ),
        ChangeNotifierProvider<OrderProvider>(
          create: (context) => OrderProvider(),
        ),
        ChangeNotifierProvider<ProfileDataProvider>(
          create: (context) => ProfileDataProvider(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: OnboardingScreen(),
        routes: {
          "/signin": (context) => LoginPage(),
          "/signup": (context) => SignupPage(),
          "/home": (context) => BottomNavBar(selectedIndex: 0,),
          "/new-seasons": (context) => NewSeasonPage(),
          "/autumn": (context) => AutumnPage(),
          "/new-collection": (context) => const NewCollectionPage(),
          "/all-product": (context) => AllProductPage(),
          "/cart": (context) => CartPage(isVisible: false),
          "/wishlist": (context) => WishListPage(isVisible: false),
          "/my-order": (context) => OrderPage(),
          "/profile": (context) => ProfilePage(),
        },
      ),
    );
  }
}
