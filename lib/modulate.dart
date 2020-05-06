library modulate;

import 'dart:io';
import 'dart:math';
import 'dart:typed_data';

import 'package:baseconvert/baseconvert.dart';



List<int> bytesToBase(Uint8List bytes){
  //Convert base 10 to base 2.
  //Add together
  //Convert back to base 10.
  //Convert to target base

}






//---------  Public Methods  ---------

String modulatePSK({
  String input,
  int outBase,
  int outWidth
}){
  //Find how many binary bytes can fit into a baseX byte
  int factor = -1;
  while(true){
    if(pow(outBase, outWidth) >= pow(256, factor+1)){
      factor+=1;
    } else {
      if(factor == 0){
        throw Exception("BAD BASE/WIDTH");
      }
      break;
    }
  }

  BaseConverter bc = BaseConverter(2, outBase, string: true);
  String output = "";
  for(int i=0; i<input.length; i+= 8*factor){
    int endIndex = i+(8*factor);
    if(endIndex > input.length) endIndex = input.length;
    String outSeg = bc.convert(input.substring(i, endIndex));
    outSeg = outSeg.padLeft(outWidth, "0");
    if(outSeg.length > outWidth){
      throw Exception("BAD BASE/WIDTH");
    }
    output = output + outSeg;
  }
  return output;
}

String demodulatePSK({
  String input,
  int inBase,
  int inWidth
}){

  //Find how many binary bytes can fit into a baseX byte
  int factor = -1;
  while(true){
    if(pow(inBase, inWidth) >= pow(256, factor+1)){
      factor+=1;
    } else {
      if(factor == 0){
        throw Exception("BAD BASE/WIDTH");
      }
      break;
    }
  }

  BaseConverter bc = BaseConverter(inBase, 2, string: true);
  String output = "";
  for(int i=0; i<input.length; i+= inWidth){
    int endIndex = i + inWidth;
    if(endIndex > input.length) endIndex = input.length;
    String outSeg = bc.convert(input.substring(i, endIndex));
    if(outSeg.length % (8*factor) != 0){
      outSeg = outSeg.padLeft(outSeg.length + (8-(outSeg.length % 8)), "0");
    }
    output = output + outSeg;
  }
  return output;
}








String modulateFilePSK({
  File file,
  int base,
  int width,
}){

  Uint8List bytes = file.readAsBytesSync();

  //return modulatePSK(input: bytes, outBase: base, outWidth: width);
}












//TODO implement
//Take in either string or filename
//return bytes only when requested.
//return as string or as stream
class ModulateStream {

}
