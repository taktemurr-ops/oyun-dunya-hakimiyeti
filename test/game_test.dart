import 'package:flutter_test/flutter_test.dart';
import 'package:oyun_dunya_hakimiyeti/oyun_dunya_hakimiyeti.dart';
import 'package:studio_core/core/level_plan.dart';

void main() {
  test('33 dilde ad ve anlatım', () {
    expect(dunyaConfig.title.length, 33);
    expect(dunyaConfig.tagline.length, 33);
    for (final s in dunyaConfig.tutorial) {
      expect(s.text.length, 33);
    }
  });

  test('bölümler çözülebilir', () {
    final planner = LevelPlanner(gameId: dunyaId, optionalMechanics: const []);
    for (final lv in [1, 77, 1500, 33333, 49999]) {
      final gl = dunyaRules.build(planner.spec(lv));
      expect(gl.validation.ok, isTrue, reason: 'bölüm $lv');
    }
  });
}
