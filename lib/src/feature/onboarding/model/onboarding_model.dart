import '../../../core/images.dart';

class ItemData {
  final String image;
  final String text1;
  final String text2;

  ItemData(
    this.image,
    this.text1,
    this.text2,
  );
}

List<ItemData> onboardingList = [
  ItemData(
    AppImages.onboarding1,
    "Buy and Sell\nYour Favorite\nCoins.",
    "buy, sell, send, receive and withdraw cryptocurrencieswith ease.",
  ),
  ItemData(
    AppImages.onboarding2,
    "Trade Giftcards\nAnd Get Paid\nIn Minutes",
    "Very low rates when trading your Steam, iTunes, Wallmart, Vanilla, Amex and other giftcards.",
  ),
  ItemData(
    AppImages.onboarding3,
    "Make PayPal\nTransactions\nWith Soft Rates",
    "Very low rates on PayPal transactions.",
  )
];
