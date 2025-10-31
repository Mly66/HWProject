@Entry
@Component
struct Index {

  images:Resource[]=[$r('app.media.a'),$r('app.media.b'),$r('app.media.c'),$r('app.media.d')]

  build() {
    Swiper(){
      ForEach(this.images,(src:Resource,index:number)=>{
        Image(src)
          .size({width:'100%',height:'100%'})
          .objectFit(ImageFit.Fill)
      })
    }
    .width('90%')
    .height(200)
    .loop(true)
    .autoPlay(true)
    .interval(3000)
    .indicator(true)
    .onChange((index: number) => {
    });

  }
}
