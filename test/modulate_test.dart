import 'package:test/test.dart';

import 'package:modulate/modulate.dart';

void main() {

  //"Test" in each base encoding, 2-10
  String B2 = "01010100011001010111001101110100";
  String B3 = "010010010202011021011022";
  String B4 = "1110121113031310";
  String B5 = "11424101421211";
  String B6 = "03143142430000000312";
  String B7 = "150203223224";
  String B8 = "2506256300000164";
  String B9 = "1136008000000138";
  String B10 = "2160529556";


  group('modulate_StringInOut', ()
  {
    test('modulate_Base3_StringInOut', () {
      expect(modulate(input: B2, base: 3, width: 6), B3);
    });
    test('modulate_Base4_StringInOut', () {
      expect(modulate(input: B2, base: 4, width: 4), B4);
    });
    test('modulate_Base5_StringInOut', () {
      expect(modulate(input: B2, base: 5, width: 7), B5);
    });
    test('modulate_Base6_StringInOut', () {
      expect(modulate(input: B2, base: 6, width: 10), B6);
    });
    test('modulate_Base7_StringInOut', () {
      expect(modulate(input: B2, base: 7, width: 3), B7);
    });
    test('modulate_Base8_StringInOut', () {
      expect(modulate(input: B2, base: 8, width: 8), B8);
    });
    test('modulate_Base9_StringInOut', () {
      expect(modulate(input: B2, base: 9, width: 8), B9);
    });
    test('modulate_Base10_StringInOut', () {
      expect(modulate(input: B2, base: 10, width: 5), B10);
    });
  });


  group('modulate_StringInOut_reverse', ()
  {
    test('modulate_Base3_StringInOut', () {
      expect(modulate(input: B3, base: 3, width: 6, reverse: true), B2);
    });
    test('modulate_Base4_StringInOut', () {
      expect(modulate(input: B4, base: 4, width: 4, reverse: true), B2);
    });
    test('modulate_Base5_StringInOut', () {
      expect(modulate(input: B5, base: 5, width: 7, reverse: true), B2);
    });
    test('modulate_Base6_StringInOut', () {
      expect(modulate(input: B6, base: 6, width: 10, reverse: true), B2);
    });
    test('modulate_Base7_StringInOut', () {
      expect(modulate(input: B7, base: 7, width: 3, reverse: true), B2);
    });
    test('modulate_Base8_StringInOut', () {
      expect(modulate(input: B8, base: 8, width: 8, reverse: true), B2);
    });
    test('modulate_Base9_StringInOut', () {
      expect(modulate(input: B9, base: 9, width: 8, reverse: true), B2);
    });
    test('modulate_Base10_StringInOut', () {
      expect(modulate(input: B10, base: 10, width: 5, reverse: true), B2);
    });
  });





}
