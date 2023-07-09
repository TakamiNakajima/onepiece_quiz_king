import 'package:onepiece_quiz_king/utils/enum.dart';
import 'home_selected_q_text.dart';

SelectedSeriesText({required SERIES selectedSeries}) {
  switch (selectedSeries) {
    case SERIES.ALL:
      return SelectedQText(text: 'すべての問題');
    case SERIES.EASTBLUE:
      return SelectedQText(text: 'ｲｰｽﾄﾌﾞﾙｰ編');
    case SERIES.ALABASTA:
      return SelectedQText(text: 'ｱﾗﾊﾞｽﾀ編');
    case SERIES.SKYISLAND:
      return SelectedQText(text: 'ﾜﾉ&空島編');
    case SERIES.WATERSEVEN:
      return SelectedQText(text: 'ｳｫｰﾀｰｾﾌﾞﾝ&ｴﾆｴｽﾛﾋﾞｰ編');
    case SERIES.THRILLERBARK:
      return SelectedQText(text: 'ｽﾘﾗｰﾊﾞｰｸ&ｼｬﾎﾞﾝﾃﾞｨ諸島編');
    case SERIES.IMPELDOWN:
      return SelectedQText(text: 'ｲﾝﾍﾟﾙﾀﾞｳﾝ&ﾏﾘﾝﾌｫｰﾄﾞ編');
    case SERIES.FISHMANISLAND:
      return SelectedQText(text: '魚人島&ﾊﾟﾝｸﾊｻﾞｰﾄﾞ編');
    case SERIES.DRESSROSA:
      return SelectedQText(text: 'ﾄﾞﾚｽﾛｰｻﾞ編');
    case SERIES.WHOLECAKEISLAND:
      return SelectedQText(text: 'ｿﾞｳ&ﾎｰﾙｹｰｷｱｲﾗﾝﾄﾞ編');
    case SERIES.WANOKUNI:
      return SelectedQText(text: 'ﾜﾉ国編');
  }
}
