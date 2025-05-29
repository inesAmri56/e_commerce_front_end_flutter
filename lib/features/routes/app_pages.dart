import 'package:get/get.dart';
import '../../widgets/appbuttom_navigationbar.dart';
import '../modules/auth/bindings/auth_binding.dart';
import '../modules/auth/views/auth_view.dart';
import '../modules/cardscreen/bindings/cardscreen_binding.dart';
import '../modules/cardscreen/views/cardscreen_view.dart';
import '../modules/checkout/bindings/checkout_binding.dart';
import '../modules/checkout/views/checkout_view.dart';
import '../modules/favorites/bindings/favorites_binding.dart';
import '../modules/favorites/views/favorites_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/login/bindings/login_binding.dart';
import '../modules/login/views/login_view.dart';
import '../modules/paymentmethod/bindings/paymentmethod_binding.dart';
import '../modules/paymentmethod/views/paymentmethod_view.dart';
import '../modules/profile/bindings/profile_binding.dart';
import '../modules/profile/views/profile_view.dart';
import '../modules/sigup/bindings/sigup_binding.dart';
import '../modules/sigup/views/sigup_view.dart';
import '../orderconfirmation/bindings/orderconfirmation_binding.dart';
import '../orderconfirmation/views/orderconfirmation_view.dart';
import '../welcome/bindings/welcome_binding.dart';
import '../welcome/views/welcome_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.WELCOME;
  static final routes = [
    GetPage(
      name: _Paths.NAVBAR,
      page: () => AppButtomNavigationBar(),
    ),
    GetPage(
      name: _Paths.CARDSCREEN,
      page: () => CardscreenView(),
      binding: CardscreenBinding(),
    ),
    GetPage(
      name: _Paths.HOME,
      page: () => HomeView(),
      binding: HomeBinding(),

    ),
    GetPage(
      name: _Paths.PROFILE,
      page: () => ProfileView(),
      binding: ProfileBinding(),
    ),
    GetPage(
      name: _Paths.LOGIN,
      page: () => LoginView(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: _Paths.SIGUP,
      page: () => const SigupView(),
      binding: SigupBinding(),
    ),
    GetPage(
      name: _Paths.AUTH,
      page: () => const AuthView(),
      binding: AuthBinding(),
    ),
    GetPage(
      name: _Paths.FAVORITES,
      page: () => FavoritesView(),
      binding: FavoritesBinding(),
    ),
    GetPage(
      name: _Paths.PAYMENTMETHOD,
      page: () => PaymentmethodView(),
      binding: PaymentmethodBinding(),
    ),
    GetPage(
      name: _Paths.CHECKOUT,
      page: () => const CheckoutView(),
      binding: CheckoutBinding(),
    ),
    GetPage(
      name: _Paths.WELCOME,
      page: () => const WelcomeView(),
      binding: WelcomeBinding(),
    ),
    GetPage(
      name: _Paths.ORDERCONFIRMATION,
      page: () => const OrderconfirmationView(),
      binding: OrderconfirmationBinding(),
    ),
  ];
}
