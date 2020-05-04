library modulate;

import 'dart:math';

import 'package:baseconvert/baseconvert.dart';




modulate({
  String input,
  int base,
  int width,
  bool reverse=false,
}){

  //Find how many binary bytes can fit into a baseX byte
  int factor = -1;
  while(true){
    if(pow(base, width) >= pow(256, factor+1)){
      factor+=1;
    } else {
      if(factor == 0){
        throw Exception("BAD BASE/WIDTH");
      }
      break;
    }
  }


  //Convert
  if(!reverse){
    BaseConverter bc = BaseConverter(2, base, string: true);
    String output = "";
    for(int i=0; i<input.length; i+= 8*factor){
      int endIndex = i+(8*factor);
      if(endIndex > input.length) endIndex = input.length;
      String outSeg = bc.convert(input.substring(i, endIndex));
      outSeg = outSeg.padLeft(width, "0");
      if(outSeg.length > width){
        throw Exception("BAD BASE/WIDTH");
      }
      output = output + outSeg;
    }
    return output;

  } else {
    BaseConverter bc = BaseConverter(base, 2, string: true);
    String output = "";
    for(int i=0; i<input.length; i+= width){
      int endIndex = i + width;
      if(endIndex > input.length) endIndex = input.length;
      String outSeg = bc.convert(input.substring(i, endIndex));
      if(outSeg.length % (8*factor) != 0){
        outSeg = outSeg.padLeft(outSeg.length + (8-(outSeg.length % 8)), "0");
      }
      output = output + outSeg;
    }
    return output;

  }







}












//TODO implement
//Take in either string or filename
//return bytes only when requested.
//return as string or as stream
class ModulateStream {

}
