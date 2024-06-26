# SongCredit(팀명 : 식스)
## 서비스 개요
* 서비스명 : 딥러닝을 활용한 음원 동향 분석 서비스
  
## <서비스 설명>
* 다양한 증권상품이 발매하고 예금과 적금보다는 투자가 유행이고 필수인 요즘 세대에 STO중 하나인 음악저작권의 투자를 유도하는 음원 댓글 감정분석 기반 추천 서비스
<br>

## 프로젝트 기간
2024.04.22 ~ 2024.06.18(8주)
<br>

## 주요기능
#### 음원 댓글 감정 분석: 사용자 댓글을 통해 음원의 감정을 분석하고, 이를 바탕으로 투자 추천을 제공.
#### 음원 동향 분석: 최근 음원의 인기도 및 동향을 분석하여 제공.
#### 맞춤형 추천: 사용자 취향과 감정 분석 결과를 기반으로 맞춤형 음악저작권 투자 상품 추천.
#### 데이터 시각화: 음원 동향 및 감정 분석 결과를 시각화하여 사용자에게 제공.

## 기술스택
### 프론트엔드
![Node.js](https://img.shields.io/badge/Node.js-339933?logo=node.js&logoColor=white)
![React](https://img.shields.io/badge/React-61DAFB?logo=react&logoColor=white)
![HTML](https://img.shields.io/badge/HTML5-E34F26?logo=html5&logoColor=white)
![CSS](https://img.shields.io/badge/CSS3-1572B6?logo=css3&logoColor=white)
![JavaScript](https://img.shields.io/badge/JavaScript-F7DF1E?logo=javascript&logoColor=black)

### 백엔드
![Python](https://img.shields.io/badge/Python-3776AB?logo=python&logoColor=white)
![Flask](https://img.shields.io/badge/Flask-000000?logo=flask&logoColor=white)
![Java](https://img.shields.io/badge/Java-007396?logo=java&logoColor=white)

### 데이터베이스
![MySQL](https://img.shields.io/badge/MySQL-4479A1?logo=mysql&logoColor=white)
![Oracle](https://img.shields.io/badge/Oracle-F80000?logo=oracle&logoColor=white)

### 데이터 분석 및 머신러닝
![TensorFlow](https://img.shields.io/badge/TensorFlow-FF6F00?logo=tensorflow&logoColor=white)
![Keras](https://img.shields.io/badge/Keras-D00000?logo=keras&logoColor=white)
![Pandas](https://img.shields.io/badge/Pandas-150458?logo=pandas&logoColor=white)
![NumPy](https://img.shields.io/badge/NumPy-013243?logo=numpy&logoColor=white)

### 기타 도구
![Git](https://img.shields.io/badge/Git-F05032?logo=git&logoColor=white)
![Jupyter Notebook](https://img.shields.io/badge/Jupyter-F37626?logo=jupyter&logoColor=white)
![PyCharm](https://img.shields.io/badge/PyCharm-000000?logo=pycharm&logoColor=white)
![myBatis](https://img.shields.io/badge/myBatis-E63228?logo=mybatis&logoColor=white)
![전자정부프레임워크](https://img.shields.io/badge/전자정부프레임워크-0054A6?logoColor=white)

## 시스템 아키텍처


## 서비스 흐름도 및 SW유스케이스


## ER다이어그램


## 화면구성
#### 홈 화면: 최신 음원 동향 및 인기 음원 표시
#### 검색 화면: 사용자가 원하는 음원 검색 및 댓글 조회
#### 감정 분석 결과 화면: 음원 댓글의 감정 분석 결과 제공
#### 추천 화면: 맞춤형 음악저작권 투자 상품 추천

## 트러블슈팅
### 1. MySQL 트리거 이슈: 자동 업데이트 문제
#### 문제: MySQL은 재귀 함수 및 트리거를 지원하지 않아 한 테이블을 자동으로 업데이트 시키지 못함.
#### 해결: BACKUP 테이블을 생성하여 기존 테이블의 데이터를 하루 간격으로 백업 테이블로 옮기고 삭제. 트리거가 적용된 테이블의 변화가 생기면 데이터가 백업 테이블에 적재됨.

## SQL 트리거: `backup_news_info`

이 트리거는 `news_info` 테이블에 새 레코드가 삽입될 때마다 실행됩니다. 새 레코드의 `news_title`이 `news_backup` 테이블에 존재하지 않는 경우, 해당 레코드를 `news_backup` 테이블에 삽입합니다.

```sql
CREATE DEFINER=`sc_21K_bigdata11_p3_2`@`%` TRIGGER `backup_news_info`
AFTER INSERT ON `news_info`
FOR EACH ROW
BEGIN
  -- 트리거 시 실행되는 코드
  IF NOT EXISTS (
      SELECT 1
      FROM news_backup WHERE news_title = NEW.news_title
  ) THEN
    INSERT INTO
    news_backup (news_title, news_content, news_thumb, news_maker, pressed_at)
    VALUES
    (NEW.news_title, NEW.news_content, NEW.news_thumb, NEW.news_maker, NEW.pressed_at);
  END IF;
END;
```

### 2. 데이터 크롤링 중 중복 요소 선택 문제
#### 문제: 일부 페이지에 중복되는 요소 ID 및 CLASS명이 존재하여 잘못된 요소가 선택됨
#### 해결: CSS_SELECTOR 대신 XPATH를 사용하여 정확한 요소를 선택하여 크롤링 진행

이 코드는 웹 드라이버를 사용하여 특정 범위의 노래와 아티스트를 검색하고, 결과를 클릭하여 세부 정보를 수집하는 크롤링 작업을 수행합니다.

```python
# 필요한 라이브러리 임포트
from selenium import webdriver
from selenium.webdriver.common.by import By
from selenium.webdriver.common.keys import Keys
import time
from tqdm import tqdm as tq

# 크롤링 코드 예시
for i in tq(range(int(len(songs_with_artists) / 5), int(len(songs_with_artists) / 5 * 2))):
    search = driver.find_element(By.ID, 'keyword')
    search.send_keys(songs_with_artists[i])
    search.send_keys(Keys.ENTER)

    cycle = driver.find_elements(By.CSS_SELECTOR, 'strong.title')

    if len(cycle) > 2:
        for j in range(1, len(cycle) - 1):
            time.sleep(5)
            click_title = driver.find_element(By.XPATH, f'//*[@id="market_list"]/div[2]/a[{j}]/div[2]/strong')
            click_title.click()
            canvas()
            driver.back()
    else:
        click_title = driver.find_element(By.XPATH, f'//*[@id="market_list"]/div[2]/a[1]/div[2]/strong')
        click_title.click()
        canvas()
        driver.back()
```


### 3. GRU 모델 테스트 시 메모리 부족 현상
#### 문제: 모델 테스트를 진행 중 메모리 부족으로 인해 브라우저가 다운되거나 Colab의 연결이 끊김
#### 해결: Batch Size를 기존 64에서 1000으로 변경하여 과도한 메모리 사용을 방지하고 테스트 시간을 단축

이 코드는 토크나이저와 모델을 로드하고, 텍스트 전처리 및 예측을 수행하여 결과를 데이터프레임에 저장하는 과정을 다룹니다.

```python
# 필요한 라이브러리 임포트
import pickle
import re
import pandas as pd
from keras.models import load_model
from keras.preprocessing.sequence import pad_sequences
from tqdm import tqdm
from konlpy.tag import Okt

# 토크나이저 및 모델 로드
with open('/content/drive/MyDrive/2024_딥러닝/최종프로젝트/현식_모델링/token/tokenizer_GRU(6_10).pickle', 'rb') as handle:
    loaded_tokenizer = pickle.load(handle)

max_len = 221

model_path = '/content/drive/MyDrive/2024_딥러닝/최종프로젝트/현식_모델링/model/best_model_GRU(6_10).h5'
model = load_model(model_path)

# 텍스트 전처리 함수
okt = Okt()
stopwords = ['의', '가', '이', '은', '들', '는', '좀', '잘', '걍', '과', '도', '를', '으로', '자', '에', '와', '한', '하다']

def preprocess_text(sentence):
    if not isinstance(sentence, str):
        return ''

    text = re.sub(r'[^가-힣\s]', '', sentence)
    morphs = okt.morphs(text)
    return ' '.join(word for word in morphs if word not in stopwords)

# 예측 함수
def predict_function(sentence):
    preprocessed_text = preprocess_text(sentence)
    if not preprocessed_text:
        return 0

    encode = loaded_tokenizer.texts_to_sequences([preprocessed_text])
    pad_new = pad_sequences(encode, maxlen=max_len)

    score = model.predict(pad_new)[0][0]
    return 1 if score > 0.5 else 0

# 데이터 로드
test_data = pd.read_csv('/content/drive/MyDrive/2024_딥러닝/최종프로젝트/현식_모델링/뮤직카우(멜론)_리뷰.csv')
test_data_reivew = test_data['리뷰'].astype(str)  # 모든 값을 문자열로 변환

# 결과 저장할 DataFrame
df = test_data.copy()

# 일괄 처리
batch_size = 1000  # 한 번에 처리할 데이터 수

for start in tqdm(range(0, len(test_data_reivew), batch_size)):
    end = start + batch_size
    batch_reviews = test_data_reivew[start:end]
    batch_results = [predict_function(review) for review in batch_reviews]
    df.loc[start:end-1, '긍/부정'] = batch_results
```

### 4. LSTM 모델 입력값 검증 및 메모리 사용 최적화
#### 문제: 입력값이 문자열이 아니어도 테스트에 포함되는 경우가 발생하고, 소요 시간이 오래 걸리며 과도한 메모리 점유가 발생
#### 해결: 입력값 검증 코드를 추가하고 불필요한 재학습 코드를 제거

이 코드는 텍스트 전처리 및 예측을 수행하는 함수를 정의합니다.

```python
import re
from konlpy.tag import Mecab
from keras.preprocessing.sequence import pad_sequences

# 불용어 목록
stopwords = ['의', '가', '이', '은', '들', '는', '좀', '잘', '걍', '과', '도', '를', '으로', '자', '에', '와', '한', '멜론', '지니', '벅스']

# Mecab 객체 생성
mecab = Mecab()

# 예측 함수
def predict_function(sentence):
    if not isinstance(sentence, str):
        return None
    
    # 특수 문자 제거
    predict_sentence = re.sub(r'[^ㄱ-ㅎㅏ-ㅣ가-힇 ]', '', sentence)
    
    # 형태소 분석 및 불용어 제거
    morphs = mecab.morphs(predict_sentence)
    filtered_sentence = ' '.join(word for word in morphs if word not in stopwords)
    
    # 인코딩
    encode = tokenizer.texts_to_sequences([filtered_sentence])
    
    # 패딩 80
    pad_new = pad_sequences(encode, maxlen=80)
    
    # 예측
    score = LSTM_model.predict(pad_new)
    
    # 기준점: 0.5
    return score > 0.5
```

## 팀원 역할 및 느낀점





