import '../../models/data/series.dart';
import 'home_selected_q_text.dart';

SelectedSeriesText({required SERIES selectedSeries}) {
  switch (selectedSeries) {
    case SERIES.ALL:
      return SelectedQText(text: 'すべての問題');
    case SERIES.LEVEL1:
      return SelectedQText(text: '初級');
    case SERIES.LEVEL2:
      return SelectedQText(text: '中級');
    case SERIES.LEVEL3:
      return SelectedQText(text: '上級');
    case SERIES.LEVEL4:
      return SelectedQText(text: '鬼');
    case SERIES.EASTBLUE:
      return SelectedQText(text: 'イーストブルー編');
    case SERIES.ALABASTA:
      return SelectedQText(text: 'アラバスタ編');
    case SERIES.SKYISLAND:
      return SelectedQText(text: 'ジャヤ&空島編');
    case SERIES.WATERSEVEN:
      return SelectedQText(text: 'ウォーターセブン&エニエスロビー編');
    case SERIES.THRILLERBARK:
      return SelectedQText(text: 'スリラーバーク&シャボンディ諸島編');
    case SERIES.IMPELDOWN:
      return SelectedQText(text: 'インペルダウン&マリンフォード編');
    case SERIES.FISHMANISLAND:
      return SelectedQText(text: '魚人島&パンクハザード編');
    case SERIES.DRESSROSA:
      return SelectedQText(text: 'ドレスローザ編');
    case SERIES.WHOLECAKEISLAND:
      return SelectedQText(text: 'ゾウ&ホールケーキアイランド編');
    case SERIES.WANOKUNI:
      return SelectedQText(text: 'ワノ国編');
  }
}
