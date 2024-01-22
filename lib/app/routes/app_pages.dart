import 'package:get/get.dart';
import '../modules/add_a_product/bindings/add_a_product_binding.dart';
import '../modules/add_a_product/views/add_a_product_view.dart';
import '../modules/add_to_cart/bindings/add_to_cart_binding.dart';
import '../modules/add_to_cart/views/add_to_cart_view.dart';
import '../modules/checkout_screen/bindings/checkout_screen_binding.dart';
import '../modules/checkout_screen/views/checkout_screen_view.dart';
import '../modules/delete_a_product/bindings/delete_a_product_binding.dart';
import '../modules/delete_a_product/views/delete_a_product_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/login/bindings/login_binding.dart';
import '../modules/login/views/login_view.dart';
import '../modules/product_detail/bindings/product_detail_binding.dart';
import '../modules/product_detail/views/product_detail_view.dart';
import '../modules/sign_up/bindings/sign_up_binding.dart';
import '../modules/sign_up/views/sign_up_view.dart';
import '../modules/splash_screen/bindings/splash_screen_binding.dart';
import '../modules/splash_screen/views/splash_screen_view.dart';
import '../modules/update_a_product/bindings/update_a_product_binding.dart';
import '../modules/update_a_product/views/update_a_product_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();
  static const INITIAL = Routes.HOME;
  static final routes = [
    GetPage(
      name: _Paths.LOGIN,
      page: () => const LoginView(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: _Paths.HOME,
      page: () => const HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.SPLASH_SCREEN,
      page: () => const SplashScreenView(),
      binding: SplashScreenBinding(),
    ),
    GetPage(
      name: _Paths.PRODUCT_DETAIL,
      page: () => const ProductDetailView(),
      binding: ProductDetailBinding(),
    ),
    GetPage(
      name: _Paths.ADD_A_PRODUCT,
      page: () => const AddAProductView(),
      binding: AddAProductBinding(),
    ),
    GetPage(
      name: _Paths.UPDATE_A_PRODUCT,
      page: () => const UpdateAProductView(),
      binding: UpdateAProductBinding(),
    ),
    GetPage(
      name: _Paths.DELETE_A_PRODUCT,
      page: () => const DeleteAProductView(),
      binding: DeleteAProductBinding(),
    ),
    GetPage(
      name: _Paths.ADD_TO_CART,
      page: () => const AddToCartView(),
      binding: AddToCartBinding(),
    ),
    GetPage(
      name: _Paths.CHECKOUT_SCREEN,
      page: () => const CheckoutScreenView(),
      binding: CheckoutScreenBinding(),
    ),
    GetPage(
      name: _Paths.SIGN_UP,
      page: () => const SignUpView(),
      binding: SignUpBinding(),
    ),
  ];
}
