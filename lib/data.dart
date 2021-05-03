class SliderModel{
  String imagePath;
  String title;
  String desc;

  SliderModel({this.imagePath, this.title, this.desc});

  void setImageAssetPath(String getImagePath){
    imagePath = getImagePath;
  }

  void setTitle(String getTile){
    title = getTile;
  }

  void setDesc(String getDesc){
    desc = getDesc;
  }

  String getImageAssetPath(){
    return imagePath;
  }

  String getTitle(){
    return title;
  }

  String getDesc(){
    return desc;
  }

}

List <SliderModel> getSlides(){

  List<SliderModel> slides = new List<SliderModel>();
  SliderModel sliderModel = new SliderModel();

  //1
  sliderModel.setImageAssetPath('images/capture.png');
  sliderModel.setTitle('Capture');
  sliderModel.setDesc('Click a pic to scan the text in the image');
  slides.add(sliderModel);
  sliderModel = new SliderModel();

  //2
  sliderModel.setImageAssetPath('images/upload.png');
  sliderModel.setTitle('Upload');
  sliderModel.setDesc('The pic gets uploaded in the app for scanning.');
  slides.add(sliderModel);
  sliderModel = new SliderModel();

  //3
  sliderModel.setImageAssetPath('images/scan.png');
  sliderModel.setTitle('Scan the pic');
  sliderModel.setDesc('On clicking the scan button, the uploaded pic gets scanned for text recognition');
  slides.add(sliderModel);
  sliderModel = new SliderModel();

  //4
  sliderModel.setImageAssetPath('images/tts.png');
  sliderModel.setTitle('Text to speech');
  sliderModel.setDesc('The text gets recognized and is displayed on the screen. The displayed text is spoken out. ');
  slides.add(sliderModel);
  sliderModel = new SliderModel();

  return slides;

}
