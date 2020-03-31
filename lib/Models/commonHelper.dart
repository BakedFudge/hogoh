

//
//color: Color(hexColor('#7bed9f')),
//backgroundColor: Color(hexColor('#F7FFF7')),
/*
* Primary lime Green :Color(hexColor('#2ed573')),
* Secondary green : Color(hexColor('#7bed9f')),
*
*
* */
/*

MAIZE YELLOW : Color(hexColor('#FFE66D')),
PESTEL RED : Color(hexColor('#FF6B6B')),
MINT CREAM : Color(hexColor('#F7FFF7')),
MEDIUM TURQUOISE : Color(hexColor('#4ECDC4')),
ENGLISH GREEN : Color(hexColor('#1A535C')),


*/

/*

light deep sea blue: Color(hexColor('#F6F6FB')),
light Pale : Color(hexColor('#F4CAB4')),
little Darker pale : Color(hexColor('#F2B79C')),

somewhat peach : Color(hexColor('#F07059')),
grayish blue: Color(hexColor('#A6A8C0')),



 deep sea blue: Color(hexColor('#4652B4')),
weed green  : Color(hexColor('#826F4C')),
purple blue: Color(hexColor('#5B68C7')),

*/

hexColor(String colorHexCode){
  String colorNew = '0xff' + colorHexCode;
  colorNew = colorNew.replaceAll('#', '');
  int colorint  = int.parse(colorNew);
  return colorint;
}