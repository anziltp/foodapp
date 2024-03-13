class onBodyContent{
  String image;
  String text;
  onBodyContent({required this.image,required this.text});
}
List<onBodyContent>contents=[
  onBodyContent(image:( "assets/images/firstpageimage.png"),
      text: "Order from your favourite\nstores or vendors"),
      onBodyContent(image: ("assets/images/firstpageimage2.png"), text: "Choose from a wide range of \n delicious meals"),
  onBodyContent(image: ("assets/images/firstpageimage3.png"), text: "Enjoy instant delivery \nand payment")
];