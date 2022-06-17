# A반_202016019_전희나_깃허브
제출. ch.12~16까지의 내용과, 기말고사제출코드내용을 파일에 첨부하였습니다. 

## ch.12 테이블 뷰 컨트롤러 이용해 할 일 목록 만들기
###### Table View Controller는 사용자에게 목록 형태의 정보르 제공하고 목록의 특정 항목을 선택하여 세부 사항을 표시할 때 유용합니다. 테이브 뷰 컨트롤러를 이용해 "할 일 목록 앱"을 만들어 보았습니다.

## ch.13 음악 재생하고 녹음하기
###### AVAudioPlayer는 오디오 재생하는 방법 중 가장 쉬운 방법으로, 다양한 오디오 포맷 및 코덱을 지원합니다. 이 장에서는 기본적인 기능을 수행하는 형태의 앱을 만듭니다. "오디오 재생 및 녹음 앱"을 만들었습니다.

## ch.14 비디오 재생 앱 만들기
###### AVPlayerViewController를 이용하여 앱 내부 저장된 비디오 파일을 재생하는 앱을 만들었습니다. 

## ch.15 카메라와 포토 라이브러리에서 미디어 가져오기
###### UIImagePickerController클래스를 이용하여 카메라를 사용하고 포토 라이브러리 미디어를 가져오는 앱을 만들었습니다.

## ch.16 코어 그래픽스로 화면에 그림 그리기 
###### 코어 그래픽스라는 그래픽 라이브러리를 사용하여 그림을 그리는 앱을 만들었습니다. 코어 그래픽스는 도형을 그리거나 도형의 색을 채우는 다양한 기능을 합니다.

## FINAL TEST. 사진보면서 그림그리기

#### 기말고사 설명.
- "페이지 컨트롤러" 와 "스케치 앱 만들기"를 혼합하여 만든 앱입니다.
- 필자는 애니메이션 포켓몬 사진을 보면서 그림을 그리는 앱으로 만들었습니다. 추가 세부적인 설명은 파일 코드 안에 주석으로 달아두었습니다.

#### 핵심 3가지.
1. 이미지 뷰 2개 설정 (1개는 사진을 넣는 이미지뷰 : 페이지컨트롤러)(1개는 그림그리는 이미지뷰)
2. 각 이미지 뷰에 맞는 레이블 2개 만들기
3. 그림 그린 것을 지우는 Clear버튼 만들기

> 스케치 앱으로 그림 그릴 수 있는 환경 조성하기
1. 변수 추가
```
var lastPoint: CGPoint! //바로 전에 터치하거나 이동한 위치
var lineSize:CGFloat = 2.0 //선의 두께
var lineColor = UIColor.black.cgColor //선의 색상
```
2. 터치 이벤트 메서드 재정의
```
override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) //사용자가 화면을 터치하면 스케치를 시작하도록 하는 메서드
override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) //사용자가 터치한 손가락을 움직이면 스케치도 따라서 움직이도록 하는 메서드
override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) //사용자가 손가락을 떼었을 때 스케치도 끝나도록 하는 메서드
```

> 페이지 컨트롤러 이용해서 여러 장의 사진 올리기
1. 변수 추가
```
var images = ["피카츄.jpeg", "꼬부기.jpeg", "이상해씨.jpeg", "파이리.jpeg", "잠만보.jpeg", "푸린.jpeg"]
```
2. 페이지 변경 시 동작할 함수 pageChange함수 코딩
```
@IBAction func pageChange(_ sender: UIPageControl) {
picView.image = UIImage(named: images[pageControl.currentPage])
}
```
3. 앱 시작 시 수행할 내용 코딩 viewDidLoad함수
```
override func viewDidLoad()
  super.viewDidLoad()
  pageControl.numberOfPages = images.count
  pageControl.currentPage = 0
  pageControl.pageIndicatorTintColor = UIColor.green
  pageControl.currentPageIndicatorTintColor = UIColor.blue
  picView.image = UIImage(named: images[0])
}
```
###### 앱을 실행하시면, 화면의 반은 포켓몬사진으로 되어있고, 나머지 반은 그림을 그릴 수 있는 스케치 부분이 있습니다. 포켓몬 사진은 총 6장으로, 페이지컨트롤러를 이용하여 원하는 포켓몬을 고를 수 있게 됩니다. 원하는 사진을 골라서 아래 스케치를 자유롭게 하시고, 다른 사진을 그리고 싶으시다면 clear버튼을 이용하여 기존에 그린 그림을 지우고 다시 새로운 그림을 그리면 됩니다. 감사합니다^^
