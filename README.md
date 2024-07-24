# **졸업 과제(캡스톤, 첫 팀 프로젝트)**

## **1. 주제**
### **사과 등급 판별**
  
    단순한 객체 인식보단 기왕 하는 프로젝트인데
    객체 분류를 하는것이 앞으로의 나에게도 더 큰 도움이 될거라 판단했다.
    
  
## **2. 시스템 설계**

    언어는 머신러닝이다 보니 당연하게도 Python을 사용했고 웹 프레임워크는 FastAPI를 프런트는 Flutter를 통해 Web View를 하는것으로 정했다.
    개발한 백엔드는 AWS에 업로드하여 배포를 하였으며 AWS의 라우팅 53 서비스를 사용하여 SSL을 구축하였다.


## **3. 데이터셋**

    학습에 사용할 데이터는 Ai HUB에 업로드 된 공공데이터 중 농산물 품질(QC) 이미지 중 양광, 후지 품종의 사과데이터를 사용하였다.
    원본 데이터는 양광, 후지 품종별로 A,B,C 등급으로 라벨링 되어있으며, 
    등급당 약 3800장 정도의 TRAIN SET 약 500장 정도의 TEST SET으로 이루어져 총 25000장 정도의 데이터로 이루어져 있습니다. 
    이러한 데이터를 양광과 후지종의 절반씩 샘플링하여 A,B,C등급으로 합쳐 재 라벨링하였습니다.
    학습시엔 train_test_split 함수를 이용하여 train set의 일부를 valid set으로 재설정하여 학습을 진행하였습니다.

## **4. 모델**

    모델은 Huggingface의 swin transformer v2-small-patch4-window8-256를 다운로드하여 전이학습을 시켰다.
    처음에는 Vit를 사용하였으나 생각보다 저조한 정확도와 학습속도떄문에 transformer 계열 중 이미지 swint가 vit보다
    학습속도에 유리하다고 하여 swint로 변경하였다. 이후 모델의 크기를 변경하여 학습하다가 제일 좋은 정확도를 보이는
    petch4-window8-256 버전을 사용하기로 결정하였다.


## **5. 학습결과**



## **6. 웹페이지**

### **웹 프레임워크**
    웹 프레임워크로는 FastAPI를 선택했는데 최근에는 기업에서 Django는 안쓰고 간단한 작업의 경우 Flask를 그 외의 경우에는 속도가 우수한
    FastAPI가 좋다는 소문?을 들어서 이번 프로젝트의 경우에는 FastAPI를 사용하기로 했다. 

### **API**
    이번 프로젝트를 통해서 사실상 처음으로 소켓통신을 해보는데 구글링을 할떄는 함수명 앞에 async가 붙어있는데 이게 비동기 함수라고
    성능이 더 좋다고는 하는데 이것이 구체적으로 어떻게 동작하는지는 아직 모르겠다... 우선은 문제가 되지 않는 선에서 사용하는것으로 결정했다.

    Restful API라는것도 이번에 알았는데 약속을 통해 정해진 형태로 주고받는 API를 RestfulAPI라고 하는것 같다. 

    본 프로젝트에서는 구조상 서버에 사진을 업로드하는 API하나가 필요하고(1), 서버상에서 머신러닝을 수행한뒤 결과값을 보내줄 API(2) 이렇게 2가지가 필요하다.

### **사진 업로드**
    첫 API구현이라 열심히 구글링을 했었다... 처음에 발견한 방법은 db를 구축하여 사진을 서버에 성공적으로 업로드하고 나면 db에 사진의 경로를 저장하여 
    db를 통해 사진에 접근하는 방식이었는데 이 방법은 막상 사진을 서버에 업로드하는 것에서 막혀서 시도조차 하지 못했다...
    이를 해결하기 위해 웹사이트에서 파일을 전송해야 하는데 이떄 처음으로 소켓통신의 개념을 공부했다. html지식이 거의 전무해서 사이트 대충 구현하고 
    API 작성까지만 며칠 걸린거 같다. 그 다음에 이제 API 구현을 시작하는데 처음에는 구글링한 예제가 다른곳에 올려진 사진의 링크를 받아오는 형식으로 
    되어있어서 해당링크를 Jupyter를 통해 테스트하여 성공했다. 하지만 결국 해야될것은 파일을 주고 받아야한다. 웹을 통해서 사진을 서버에 전송해야 하고
    이를 위해선 blob이나 form객체에 데이터를 담아 서버로 전송해야한다. 서버로 업로드가 완료되면 서버에서는 웹으로 저장된 파일의 이름을 반환한다.
    
### **머신러닝 결과**

    
