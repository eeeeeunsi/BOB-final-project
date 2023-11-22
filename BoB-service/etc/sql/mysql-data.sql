INSERT IGNORE INTO types VALUES (1, '총류');
INSERT IGNORE INTO types VALUES (2, '철학');
INSERT IGNORE INTO types VALUES (3, '종교');
INSERT IGNORE INTO types VALUES (4, '사회과학');
INSERT IGNORE INTO types VALUES (5, '자연과학');
INSERT IGNORE INTO types VALUES (6, '기술과학');
INSERT IGNORE INTO types VALUES (7, '예술');
INSERT IGNORE INTO types VALUES (8, '언어');
INSERT IGNORE INTO types VALUES (9, '문학');
INSERT IGNORE INTO types VALUES (10, '역사');

INSERT IGNORE INTO owners VALUES (1, '길', '은실', '세상 모든 책 다 읽어드림 :)', '은시', '01048794447');
INSERT IGNORE INTO owners VALUES (2, '이', '준호', '책 읽는게 제일 쉬웠어요!', '주노자노', '01018129382');
INSERT IGNORE INTO owners VALUES (3, '노', '우정', '책은 마음의 양식이며 지혜의 샘물입니다', '예스우정', '01049382918');
INSERT IGNORE INTO owners VALUES (4, '김', '경민', '그날 본 책의 이름을 나는 기억하지 못한다', '경미닝', '01022932384');
INSERT IGNORE INTO owners VALUES (5, 'Bespin', 'Global', 'HELPING YOU ADOPT CLOUD', 'BTC', '021113333');
INSERT IGNORE INTO owners VALUES (6, 'BoB', 'Tester', 'Best of Bespin', 'AWS team3', '1126611');
INSERT IGNORE INTO owners VALUES (7, '윤', '대경', '내가 곹 책이다', 'Big경', '01022993388');
INSERT IGNORE INTO owners VALUES (8, '이', '혜경', '내가 그거 읽어보라고 했지?', 'Small경', '01011229933');
INSERT IGNORE INTO owners VALUES (9, '이', '준석', '이 책 안읽으면 사람 아님', '준돌', '01039482948');
INSERT IGNORE INTO owners VALUES (10, '류', '승석 (님)', '오우 멋있네요', 'James', '6085555487');

INSERT IGNORE INTO pets VALUES (1, 'AWS Document', '2020-09-07', 6, 1);
INSERT IGNORE INTO pets VALUES (2, '노인과 바다', '2023-08-06', 9, 7);
INSERT IGNORE INTO pets VALUES (3, '개미', '2011-04-17', 9, 4);
INSERT IGNORE INTO pets VALUES (4, '토지', '2013-03-07', 9, 2);
INSERT IGNORE INTO pets VALUES (5, '모니터링 마스터', '2000-11-30', 6, 3);
INSERT IGNORE INTO pets VALUES (6, 'Bespin Tech Blog', '2000-01-20', 6, 5);
INSERT IGNORE INTO pets VALUES (7, 'AWS란 무엇인가', '1995-09-04', 6, 6);
INSERT IGNORE INTO pets VALUES (8, '신', '1995-09-04', 3, 8);
INSERT IGNORE INTO pets VALUES (9, '인간관계론', '1999-08-06', 4, 9);
INSERT IGNORE INTO pets VALUES (10, '하삼동', '1997-02-24', 10, 8);
INSERT IGNORE INTO pets VALUES (11, '토마호크', '2000-03-09', 7, 2);
INSERT IGNORE INTO pets VALUES (12, 'Network의 모든 것', '2000-06-24', 6, 10);

INSERT IGNORE INTO vets VALUES (1, 'AWS', 'Official');
INSERT IGNORE INTO vets VALUES (2, 'AWS', 'Skill Builder');
INSERT IGNORE INTO vets VALUES (3, 'Bespin', 'Tech Blog');
INSERT IGNORE INTO vets VALUES (4, 'Hello', 'World');
INSERT IGNORE INTO vets VALUES (5, 'OpsNow', 'Solution');
INSERT IGNORE INTO vets VALUES (6, 'AletNow', 'Solution');

INSERT IGNORE INTO specialties VALUES (1, 'AWS Document');
INSERT IGNORE INTO specialties VALUES (2, 'AWS란 무엇인가');
INSERT IGNORE INTO specialties VALUES (3, 'Network의 모든 것');
INSERT IGNORE INTO specialties VALUES (4, 'Basic Coding');
INSERT IGNORE INTO specialties VALUES (5, 'Cloud 운영이란');
INSERT IGNORE INTO specialties VALUES (6, 'Monitoring and Aleting');

INSERT IGNORE INTO vet_specialties VALUES (1, 1);
INSERT IGNORE INTO vet_specialties VALUES (2, 2);
INSERT IGNORE INTO vet_specialties VALUES (3, 3);
INSERT IGNORE INTO vet_specialties VALUES (4, 4);
INSERT IGNORE INTO vet_specialties VALUES (5, 5);
INSERT IGNORE INTO vet_specialties VALUES (6, 6);
