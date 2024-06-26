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
## 기술스택
## 시스템 아키텍처
## 서비스 흐름도 및 SW유스케이스
## ER다이어그램
## 화면구성
## 트러블슈팅
## 팀원 역할 및 느낀점





감정 분류 모델 프로젝트
이 프로젝트는 한국어 감정 분석을 위한 LSTM 및 GRU 모델을 구축하고 평가하는 것을 목표로 합니다.

목차
소개
데이터셋
모델 구성
LSTM 모델
GRU 모델
모델 학습 및 평가
예측 함수
데이터베이스 백업 트리거
참조
소개
이 프로젝트는 한국어 텍스트 데이터를 이용해 감정을 분류하는 딥러닝 모델을 개발하는 것을 목적으로 합니다. 주로 LSTM과 GRU 아키텍처를 사용하여 감정 분석의 정확도를 높이는 것에 중점을 두고 있습니다.

데이터셋
Korean Hate Speech Dataset: 187,143 문장
Kaggle 링크
한국어 감정 정보가 포함된 단발성 대화 데이터셋: 38,594 문장
AI Hub 링크
모델 구성
LSTM 모델
python
코드 복사
from tensorflow.keras.layers import Embedding, Dense, LSTM, Dropout
from tensorflow.keras.models import Sequential
from tensorflow.keras.callbacks import EarlyStopping, ModelCheckpoint

embedding_dim = 80
vocab_size = len(tokenizer.word_index) + 1

LSTM_model = Sequential()
LSTM_model.add(Embedding(vocab_size, embedding_dim))
LSTM_model.add(LSTM(128, return_sequences=True))
LSTM_model.add(Dropout(0.5))
LSTM_model.add(LSTM(64))
LSTM_model.add(Dense(1, activation='sigmoid'))

es = EarlyStopping(monitor='val_loss', patience=5)
mc = ModelCheckpoint('/content/drive/MyDrive/model/LSTMshort3_model80.h5', monitor='val_loss', save_best_only=True)

LSTM_model.compile(optimizer='adam', loss='binary_crossentropy', metrics=['acc'])
LSTM_model.fit(train_X, train_y, epochs=20, batch_size=64, validation_data=(val_X, val_y), callbacks=[es, mc])
GRU 모델
python
코드 복사
from tensorflow.keras.models import Sequential
from tensorflow.keras.layers import Embedding, GRU, Dense, Dropout

model = Sequential()
model.add(Embedding(len(tokenizer.word_index) + 1, 128, input_length=max_len))
model.add(GRU(128, return_sequences=True))
model.add(Dropout(0.5))
model.add(GRU(64, return_sequences=True))
model.add(Dropout(0.5))
model.add(GRU(32))
model.add(Dense(1, activation='sigmoid'))

model.compile(optimizer='adam', loss='binary_crossentropy', metrics=['accuracy'])

early_stopping = EarlyStopping(monitor='val_loss', patience=10)
model_checkpoint = ModelCheckpoint('/content/drive/MyDrive/model/best_model_GRU.h5', monitor='val_loss', save_best_only=True)

model.fit(X_train, Y_train, epochs=30, batch_size=64, validation_data=(X_test, Y_test), callbacks=[early_stopping, model_checkpoint])
모델 학습 및 평가
모델은 주어진 학습 데이터를 통해 학습되며, 검증 데이터를 통해 평가됩니다. 조기 종료(Early Stopping)와 모델 체크포인트(Model Checkpoint)를 사용하여 최적의 모델을 저장합니다.

예측 함수
python
코드 복사
import re
from tensorflow.keras.preprocessing.sequence import pad_sequences

stopwords = ['의', '가', '이', '은', '들', '는', '좀', '잘', '걍', '과', '도', '를', '으로', '자', '에', '와', '한', '멜론', '지니', '벅스']
mecab = Mecab()

def predict_function(sentence):
    if not isinstance(sentence, str):
        return None

    predict_sentence = re.sub(r'[^ㄱ-ㅎㅏ-ㅣ가-힇 ]', '', sentence)
    morphs = mecab.morphs(predict_sentence)
    filtered_sentence = ' '.join(word for word in morphs if word not in stopwords)
    encode = tokenizer.texts_to_sequences([filtered_sentence])
    pad_new = pad_sequences(encode, maxlen=80)
    score = LSTM_model.predict(pad_new)
    return '긍정' if score > 0.5 else '부정'
데이터베이스 백업 트리거
sql
코드 복사
CREATE DEFINER=`sc_21K_bigdata11_p3_2`@`%` TRIGGER `backup_news_info` AFTER INSERT ON `news_info`
FOR EACH ROW
BEGIN
    IF NOT EXISTS (SELECT 1 FROM news_backup WHERE news_title = NEW.news_title) THEN
        INSERT INTO news_backup (news_title, news_content, news_thumb, news_maker, pressed_at)
        VALUES (NEW.news_title, NEW.news_content, NEW.news_thumb, NEW.news_maker, NEW.pressed_at);
    END IF;
END
