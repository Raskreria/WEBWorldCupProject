-- --------------------------------------------------------
-- 호스트:                          127.0.0.1
-- 서버 버전:                        10.6.7-MariaDB - mariadb.org binary distribution
-- 서버 OS:                        Win64
-- HeidiSQL 버전:                  11.3.0.6295
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- worldcupgame 데이터베이스 구조 내보내기
CREATE DATABASE IF NOT EXISTS `worldcupgame` /*!40100 DEFAULT CHARACTER SET utf8mb3 */;
USE `worldcupgame`;

-- 테이블 worldcupgame.commentinfo 구조 내보내기
CREATE TABLE IF NOT EXISTS `commentinfo` (
  `gameIdx` int(11) NOT NULL COMMENT '게임정보테이블 - 게임번호',
  `name` varchar(20) NOT NULL COMMENT '댓글 단 사용자 이름',
  `comment` varchar(100) NOT NULL COMMENT '댓글',
  `commentDate` datetime NOT NULL COMMENT '댓글 단 날짜',
  `memberIdx` int(11) DEFAULT NULL,
  KEY `FK_gamecomment_gamesinfo` (`gameIdx`),
  KEY `FK_gamecomment_memberinfo` (`memberIdx`),
  CONSTRAINT `FK_gamecomment_gamesinfo` FOREIGN KEY (`gameIdx`) REFERENCES `gameinfo` (`gameIdx`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_gamecomment_memberinfo` FOREIGN KEY (`memberIdx`) REFERENCES `memberinfo` (`memberIdx`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='게임 댓글 테이블\r\n게임별 사용자 댓글';

-- 테이블 데이터 worldcupgame.commentinfo:~4 rows (대략적) 내보내기
/*!40000 ALTER TABLE `commentinfo` DISABLE KEYS */;
REPLACE INTO `commentinfo` (`gameIdx`, `name`, `comment`, `commentDate`, `memberIdx`) VALUES
	(1, '나관리자야', '댓글1', '2022-06-24 04:47:54', NULL),
	(1, '새벽길', '댓글2', '2022-06-24 04:48:50', NULL),
	(1, 'ì ë°', 'ëê¸ì¨ì ¸ë¼ì', '2022-06-24 05:43:48', 1),
	(1, '제발', '댓글써져라얍', '2022-06-24 05:44:30', 1);
/*!40000 ALTER TABLE `commentinfo` ENABLE KEYS */;

-- 테이블 worldcupgame.communityinfo 구조 내보내기
CREATE TABLE IF NOT EXISTS `communityinfo` (
  `communityIdx` int(11) NOT NULL AUTO_INCREMENT COMMENT '커뮤니티 글 번호',
  `memberIdx` int(11) NOT NULL COMMENT '회원정보 테이블 - 회원번호',
  `communityTitle` varchar(30) NOT NULL COMMENT '커뮤니티 글 제목',
  `communityContents` text NOT NULL COMMENT '커뮤니티 글 내용',
  `file` varchar(30) DEFAULT NULL COMMENT '파일 경로',
  `pubDate` datetime NOT NULL COMMENT '게시 날짜',
  `views` int(11) NOT NULL DEFAULT 0 COMMENT '조회수',
  `likes` int(11) NOT NULL DEFAULT 0 COMMENT '좋아요',
  PRIMARY KEY (`communityIdx`),
  KEY `FK_communityinfo_memberinfo` (`memberIdx`),
  CONSTRAINT `FK_communityinfo_memberinfo` FOREIGN KEY (`memberIdx`) REFERENCES `memberinfo` (`memberIdx`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb3 COMMENT='커뮤니티 정보 테이블';

-- 테이블 데이터 worldcupgame.communityinfo:~3 rows (대략적) 내보내기
/*!40000 ALTER TABLE `communityinfo` DISABLE KEYS */;
REPLACE INTO `communityinfo` (`communityIdx`, `memberIdx`, `communityTitle`, `communityContents`, `file`, `pubDate`, `views`, `likes`) VALUES
	(1, 2, '커뮤니티1', '커뮤니티내용1', NULL, '2022-07-05 22:36:20', 7, 1),
	(2, 3, '커뮤니티2', '커뮤니티내용2', NULL, '2022-07-05 22:38:33', 6, 1),
	(3, 1, '커뮤니티에도 글쓴다', '잘써지지?', NULL, '2022-07-06 04:57:45', 5, 0),
	(4, 2, '커뮤니티 글쓰기 재시도', '잘 써지는거지? 혹시 엔터는 안되니?\r\n\r\n??', NULL, '2022-07-07 05:49:10', 5, 2);
/*!40000 ALTER TABLE `communityinfo` ENABLE KEYS */;

-- 테이블 worldcupgame.elementinfo 구조 내보내기
CREATE TABLE IF NOT EXISTS `elementinfo` (
  `gameIdx` int(11) NOT NULL COMMENT '게임정보테이블',
  `elementIdx` int(11) NOT NULL AUTO_INCREMENT COMMENT '요소번호',
  `elementSelectCount` int(11) NOT NULL DEFAULT 0 COMMENT '요소선택횟수',
  `elementWinCount` int(11) NOT NULL DEFAULT 0 COMMENT '요소승리횟수',
  `elementTitle` varchar(20) NOT NULL DEFAULT '테스트를위해기본값설정으로임시설정' COMMENT '요소이름',
  `elementImg` varchar(30) NOT NULL DEFAULT '테스트를위해기본값설정으로임시설정' COMMENT '요소이미지경로',
  PRIMARY KEY (`elementIdx`,`gameIdx`) USING BTREE,
  KEY `FK_gameinfo_gamesinfo` (`gameIdx`),
  CONSTRAINT `FK_gameinfo_gamesinfo` FOREIGN KEY (`gameIdx`) REFERENCES `gameinfo` (`gameIdx`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb3 COMMENT='특정 게임 데이터 테이블';

-- 테이블 데이터 worldcupgame.elementinfo:~17 rows (대략적) 내보내기
/*!40000 ALTER TABLE `elementinfo` DISABLE KEYS */;
REPLACE INTO `elementinfo` (`gameIdx`, `elementIdx`, `elementSelectCount`, `elementWinCount`, `elementTitle`, `elementImg`) VALUES
	(1, 1, 0, 0, '포메라니안', '포메라니안이미지'),
	(1, 2, 1, 0, '비숑', '비숑이미지'),
	(1, 3, 0, 0, '비글', '비글이미지'),
	(1, 4, 2, 0, '푸들', '푸들이미지'),
	(1, 5, 0, 0, '시베리안 허스키', '시베리안 허스키이미지'),
	(1, 6, 1, 0, '골든리트리버', '골든리트리버이미지'),
	(1, 7, 0, 0, '말티즈', '말티즈이미지'),
	(1, 8, 3, 0, '퍼그', '퍼그이미지'),
	(1, 9, 0, 0, '닥스훈트', '닥스훈트이미지'),
	(1, 10, 1, 0, '진돗개', '진돗개이미지'),
	(1, 11, 0, 0, '말라뮤트', '말라뮤트이미지'),
	(1, 12, 2, 0, '보더콜리', '보더콜리이미지'),
	(1, 13, 0, 0, '시츄', '시츄이미지'),
	(1, 14, 1, 0, '시바견', '시바견이미지'),
	(1, 15, 0, 0, '그레이 하운드', '그레이 하운드이미지'),
	(1, 16, 4, 1, '셰퍼드', '셰퍼드이미지'),
	(1, 17, 0, 0, '회색푸들', 'file/game/element/강아지월드컵.jpg');
/*!40000 ALTER TABLE `elementinfo` ENABLE KEYS */;

-- 테이블 worldcupgame.gameinfo 구조 내보내기
CREATE TABLE IF NOT EXISTS `gameinfo` (
  `gameIdx` int(11) NOT NULL AUTO_INCREMENT COMMENT '게임번호',
  `regMemberIdx` int(11) NOT NULL COMMENT '게임등록 사용자 회원정보 ',
  `gameTitle` varchar(20) NOT NULL COMMENT '게임이름',
  `gameImg` varchar(50) NOT NULL COMMENT '게임이미지 경로',
  `regDate` datetime NOT NULL COMMENT '등록날짜',
  PRIMARY KEY (`gameIdx`) USING BTREE,
  KEY `FK_gamesinfo_memberinfo` (`regMemberIdx`),
  CONSTRAINT `FK_gamesinfo_memberinfo` FOREIGN KEY (`regMemberIdx`) REFERENCES `memberinfo` (`memberIdx`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=utf8mb3 COMMENT='게임 썸네일 정보 테이블';

-- 테이블 데이터 worldcupgame.gameinfo:~12 rows (대략적) 내보내기
/*!40000 ALTER TABLE `gameinfo` DISABLE KEYS */;
REPLACE INTO `gameinfo` (`gameIdx`, `regMemberIdx`, `gameTitle`, `gameImg`, `regDate`) VALUES
	(1, 1, '강아지 월드컵', 'file/game/thumbnail/강아지월드컵.jpg', '2022-06-24 01:25:43'),
	(2, 2, '카페 월드컵', 'file/game/thumbnail/카페월드컵.jpg', '2022-06-24 01:33:37'),
	(3, 1, '고양이월드컵', 'file/game/thumbnail/고양이월드컵.jpg', '2022-07-07 04:09:20'),
	(4, 1, '국내영화월드컵', 'file/game/thumbnail/국내영화월드컵.jpg', '2022-07-07 04:09:48'),
	(5, 1, '디저트월드컵', 'file/game/thumbnail/디저트월드컵.jpg', '2022-07-07 04:10:03'),
	(6, 1, '애니캐릭터월드컵', 'file/game/thumbnail/애니캐릭터월드컵.jpg', '2022-07-07 04:10:15'),
	(7, 1, '양식월드컵', 'file/game/thumbnail/양식월드컵.jpg', '2022-07-07 04:10:31'),
	(8, 1, '중식월드컵', 'file/game/thumbnail/중식월드컵.jpg', '2022-07-07 04:10:46'),
	(9, 1, '일식월드컵', 'file/game/thumbnail/일식월드컵.jpg', '2022-07-07 04:11:05'),
	(10, 3, '한식월드컵', 'file/game/thumbnail/한식월드컵.jpg', '2022-07-07 04:11:40'),
	(11, 2, '해외영화월드컵', 'file/game/thumbnail/해외영화월드컵.jpg', '2022-07-07 04:11:58'),
	(12, 2, '롤챔피언웓드컵', 'file/game/thumbnail/롤챔피언월드컵.jpg', '2022-07-07 07:13:16');
/*!40000 ALTER TABLE `gameinfo` ENABLE KEYS */;

-- 테이블 worldcupgame.memberinfo 구조 내보내기
CREATE TABLE IF NOT EXISTS `memberinfo` (
  `memberIdx` int(11) NOT NULL AUTO_INCREMENT COMMENT '회원번호',
  `Id` varchar(10) NOT NULL DEFAULT '' COMMENT '아이디',
  `pw` varchar(16) NOT NULL DEFAULT '' COMMENT '비밀번호',
  `name` varchar(8) NOT NULL DEFAULT '' COMMENT '이름',
  `age` int(11) NOT NULL COMMENT '나이',
  `addr` varchar(20) NOT NULL DEFAULT '' COMMENT '주소',
  `joinDate` datetime NOT NULL COMMENT '가입일',
  PRIMARY KEY (`memberIdx`),
  UNIQUE KEY `Id` (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb3 COMMENT='회원 정보 테이블';

-- 테이블 데이터 worldcupgame.memberinfo:~4 rows (대략적) 내보내기
/*!40000 ALTER TABLE `memberinfo` DISABLE KEYS */;
REPLACE INTO `memberinfo` (`memberIdx`, `Id`, `pw`, `name`, `age`, `addr`, `joinDate`) VALUES
	(1, 'admin', '1234', '관리자', 24, '대전 서구 괴정동 43-36', '2022-06-12 23:52:10'),
	(2, 'a', 'a', '김철수', 23, '서울', '2022-06-24 01:32:53'),
	(3, 'b', 'b', '고영희', 24, '서울', '2022-06-24 01:33:12'),
	(4, 'c', 'c', 'c', 12, '', '2022-07-03 04:11:23');
/*!40000 ALTER TABLE `memberinfo` ENABLE KEYS */;

-- 테이블 worldcupgame.noticeinfo 구조 내보내기
CREATE TABLE IF NOT EXISTS `noticeinfo` (
  `noticeIdx` int(11) NOT NULL AUTO_INCREMENT COMMENT '공지사항번호',
  `memberIdx` int(11) NOT NULL COMMENT '회원정보테이블 - 회원번호',
  `noticeTitle` varchar(30) NOT NULL COMMENT '공지사항 제목',
  `noticeContents` text NOT NULL COMMENT '공지사항 내용',
  `file` varchar(30) DEFAULT NULL COMMENT '파일 경로',
  `pubDate` datetime NOT NULL COMMENT '게시 날짜',
  `views` int(11) NOT NULL DEFAULT 0 COMMENT '조회수',
  `likes` int(11) NOT NULL DEFAULT 0 COMMENT '좋아요',
  PRIMARY KEY (`noticeIdx`),
  KEY `FK_noticeinfo_memberinfo` (`memberIdx`),
  CONSTRAINT `FK_noticeinfo_memberinfo` FOREIGN KEY (`memberIdx`) REFERENCES `memberinfo` (`memberIdx`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8mb3 COMMENT='공지사항 정보 테이블';

-- 테이블 데이터 worldcupgame.noticeinfo:~26 rows (대략적) 내보내기
/*!40000 ALTER TABLE `noticeinfo` DISABLE KEYS */;
REPLACE INTO `noticeinfo` (`noticeIdx`, `memberIdx`, `noticeTitle`, `noticeContents`, `file`, `pubDate`, `views`, `likes`) VALUES
	(1, 1, '첫번째 공지사항', '공지사항1', NULL, '2022-06-12 23:53:18', 2, 1),
	(2, 1, '공지사항1', '공지사항1 내', '/file/board/20220616개발진행도.txt', '2022-06-24 01:24:19', 2, 0),
	(3, 1, '공지사항2', '공지사항2 내용', NULL, '2022-07-02 19:28:12', 0, 0),
	(4, 1, '공지사항2', '공지사항2 내용', NULL, '2022-07-02 19:28:28', 0, 0),
	(5, 1, '공지사항2', '공지사항2 내용', NULL, '2022-07-02 19:29:02', 0, 0),
	(6, 1, '공지사항2', '공지사항2 내용', '/file/board/카페월드컵.jpg', '2022-07-02 19:29:13', 0, 0),
	(7, 1, '공지사항2', '공지사항2 내용', '/file/board/카페월드컵1.jpg', '2022-07-02 19:29:41', 2, 0),
	(8, 1, '공지사항2', '공지사항2 내용', '/file/board/카페월드컵4.jpg', '2022-07-02 19:32:09', 0, 0),
	(9, 1, '공지사항2', '공지사항2 내용', '/file/board/카페월드컵5.jpg', '2022-07-02 19:32:45', 0, 0),
	(10, 1, '공지사항', '공지사항 내용', '/file/board/카페월드컵6.jpg', '2022-07-02 19:34:46', 0, 0),
	(11, 1, '공지사항', '공지사항 내용', '/file/board/카페월드컵7.jpg', '2022-07-02 19:34:47', 0, 0),
	(12, 1, '공지사항', '공지사항 내용', '/file/board/카페월드컵8.jpg', '2022-07-02 19:34:48', 0, 0),
	(13, 1, '공지사항', '공지사항 내용', '/file/board/카페월드컵9.jpg', '2022-07-02 19:34:49', 0, 0),
	(14, 1, '공지사항', '공지사항 내용', '/file/board/카페월드컵10.jpg', '2022-07-02 19:34:50', 0, 0),
	(15, 1, '공지사항', '공지사항 내용', '/file/board/카페월드컵11.jpg', '2022-07-02 19:34:51', 0, 0),
	(16, 1, '공지사항', '공지사항 내용', '/file/board/카페월드컵12.jpg', '2022-07-02 19:34:51', 2, 0),
	(17, 1, '공지사항', '공지사항 내용', '/file/board/카페월드컵13.jpg', '2022-07-02 19:34:52', 0, 0),
	(18, 1, '공지사항', '공지사항 내용', '/file/board/카페월드컵14.jpg', '2022-07-02 19:34:53', 3, 1),
	(19, 1, '공지사항', '공지사항 내용', '/file/board/카페월드컵15.jpg', '2022-07-02 19:34:53', 1, 1),
	(20, 1, '공지사항', '공지사항 내용', '/file/board/카페월드컵16.jpg', '2022-07-02 19:34:54', 2, 0),
	(21, 1, '공지사항', '공지사항 내용', '/file/board/카페월드컵17.jpg', '2022-07-02 19:34:55', 7, 0),
	(22, 1, '공지사항', '공지사항 내용', '/file/board/카페월드컵18.jpg', '2022-07-02 19:34:57', 2, 1),
	(23, 1, '공지사항', '공지사항 내용', '/file/board/카페월드컵19.jpg', '2022-07-02 19:34:58', 6, 0),
	(24, 1, '공지사항', '공지사항 내용', '/file/board/카페월드컵20.jpg', '2022-07-02 19:34:59', 0, 0),
	(28, 3, 'LastNotice', '마지막 공지사항', NULL, '2022-07-06 03:56:25', 5, 0),
	(30, 1, '공지사항 글쓴다', '공지사항이다', 'file/board/고양이2.png', '2022-07-06 04:55:41', 4, 1);
/*!40000 ALTER TABLE `noticeinfo` ENABLE KEYS */;

-- 테이블 worldcupgame.recordinfo 구조 내보내기
CREATE TABLE IF NOT EXISTS `recordinfo` (
  `gameIdx` int(11) NOT NULL COMMENT '게임정보테이블 - 게임번호',
  `playMemberIdx` int(11) NOT NULL COMMENT '회원정보테이블 - 회원번호',
  `gameRecord` text DEFAULT NULL COMMENT '게임기록',
  `playDate` datetime NOT NULL COMMENT '플레이 날짜',
  KEY `FK_usergamerecords_gamesinfo` (`gameIdx`),
  KEY `FK_usergamerecords_memberinfo` (`playMemberIdx`) USING BTREE,
  CONSTRAINT `FK_usergamerecords_gamesinfo` FOREIGN KEY (`gameIdx`) REFERENCES `gameinfo` (`gameIdx`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_usergamerecords_memberinfo` FOREIGN KEY (`playMemberIdx`) REFERENCES `memberinfo` (`memberIdx`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='게임 플레이 데이터 테이블';

-- 테이블 데이터 worldcupgame.recordinfo:~8 rows (대략적) 내보내기
/*!40000 ALTER TABLE `recordinfo` DISABLE KEYS */;
REPLACE INTO `recordinfo` (`gameIdx`, `playMemberIdx`, `gameRecord`, `playDate`) VALUES
	(1, 1, '게임1멤버1', '2022-06-24 01:32:16'),
	(2, 2, '게임2멤버2', '2022-06-24 01:34:14'),
	(1, 3, '게임1멤버3', '2022-06-24 01:34:36'),
	(2, 1, '게임2멤버1', '2022-06-24 04:06:03'),
	(1, 1, 'ê²ì1ë©¤ë²1', '2022-06-24 04:58:25'),
	(1, 1, '게임1멤버1', '2022-06-24 04:59:19'),
	(3, 3, '게임3멤버3', '2022-07-07 04:12:49'),
	(11, 2, '게임12멤버2', '2022-07-07 04:13:20');
/*!40000 ALTER TABLE `recordinfo` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
