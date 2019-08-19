import 'package:flutter_tools/pages/game_page/src/shared_state/game/company.dart';
import 'package:flutter_tools/pages/game_page/src/widgets/app_bar/stat_badge.dart';

/// Visually indicates the amount of capital the [Company] has amassed for this
/// game session.
class CoinBadge extends StatBadge<int> {
  CoinBadge(StatValue<int> statValue, {double scale = 1, bool isWide = false})
      : super('资金', statValue,
            flare: 'assets/flare/Coin.flr', scale: scale, isWide: isWide);

  /// Play the indicator animation after this value changes by at least 5 coins.
  @override
  int get celebrateAfter => 5;
}
