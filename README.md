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
음원 댓글 감정 분석: 사용자 댓글을 통해 음원의 감정을 분석하고, 이를 바탕으로 투자 추천을 제공.
음원 동향 분석: 최근 음원의 인기도 및 동향을 분석하여 제공.
맞춤형 추천: 사용자 취향과 감정 분석 결과를 기반으로 맞춤형 음악저작권 투자 상품 추천.
데이터 시각화: 음원 동향 및 감정 분석 결과를 시각화하여 사용자에게 제공.

## 기술스택
프론트엔드: React.js, HTML, CSS, JavaScript
백엔드: Python, Flask, Java
데이터베이스: MySQL, Oracle
데이터 분석 및 머신러닝: TensorFlow, Keras, Pandas, NumPy
기타 도구: Git, Jupyter Notebook, Pycham, myBatis, 전자정부프레임워크

## 시스템 아키텍처


## 서비스 흐름도 및 SW유스케이스


## ER다이어그램


## 화면구성
홈 화면: 최신 음원 동향 및 인기 음원 표시
검색 화면: 사용자가 원하는 음원 검색 및 댓글 조회
감정 분석 결과 화면: 음원 댓글의 감정 분석 결과 제공
추천 화면: 맞춤형 음악저작권 투자 상품 추천

## 트러블슈팅
문제 1: 데이터 크롤링 중 중복 요소 선택 문제
원인: 일부 페이지에 중복되는 요소 ID 및 CLASS명이 존재하여 잘못된 요소가 선택됨
해결: CSS_SELECTOR 대신 XPATH를 사용하여 정확한 요소를 선택하여 크롤링 진행

문제 2: GRU 모델 테스트 시 메모리 부족 현상
원인: 모델 테스트를 진행 중 메모리 부족으로 인해 브라우저가 다운되거나 Colab의 연결이 끊김
해결: Batch Size를 기존 64에서 1000으로 변경하여 과도한 메모리 사용을 방지하고 테스트 시간을 단축
```
# 토크나이저 및 모델 로드
with open('/content/drive/MyDrive/2024_딥러닝/최종프로젝트/현식_모델링/token/tokenizer_GRU(6_10).pickle', 'rb') as handle:
    loaded_tokenizer = pickle.load(handle)

max_len = 221

model_path = '/content/drive/MyDrive/2024_딥러닝/최종프로젝트/현식_모델링/model/best_model_GRU(6_10).h5'
model = load_model(model_path)

def preprocess_text(sentence):
    if not isinstance(sentence, str):
        return ''

    text = re.sub(r'[^가-힣\s]', '', sentence)
    morphs = okt.morphs(text)
    return ' '.join(word for word in morphs if word not in stopwords)

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

for start in tqdm(range(0, len(sample))):
    end = start + batch_size
    batch_reviews = test_data_reivew[start:end]
    batch_results = [predict_function(review) for review in batch_reviews]
    df.loc[start:end-1, '긍/부정'] = batch_results
```
## 팀원 역할 및 느낀점





