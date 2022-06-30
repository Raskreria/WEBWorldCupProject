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
  `communityIdx` int(11) NOT NULL COMMENT '커뮤니티 글 번호',
  `memberIdx` int(11) NOT NULL COMMENT '회원정보 테이블 - 회원번호',
  `communityTitle` varchar(30) NOT NULL COMMENT '커뮤니티 글 제목',
  `communityContents` text NOT NULL COMMENT '커뮤니티 글 내용',
  `file` varchar(30) DEFAULT NULL COMMENT '파일 경로',
  `pubDate` datetime NOT NULL COMMENT '게시 날짜',
  PRIMARY KEY (`communityIdx`),
  KEY `FK_communityinfo_memberinfo` (`memberIdx`),
  CONSTRAINT `FK_communityinfo_memberinfo` FOREIGN KEY (`memberIdx`) REFERENCES `memberinfo` (`memberIdx`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='커뮤니티 정보 테이블';

-- 테이블 데이터 worldcupgame.communityinfo:~0 rows (대략적) 내보내기
/*!40000 ALTER TABLE `communityinfo` DISABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb3 COMMENT='특정 게임 데이터 테이블';

-- 테이블 데이터 worldcupgame.elementinfo:~16 rows (대략적) 내보내기
/*!40000 ALTER TABLE `elementinfo` DISABLE KEYS */;
REPLACE INTO `elementinfo` (`gameIdx`, `elementIdx`, `elementSelectCount`, `elementWinCount`, `elementTitle`, `elementImg`) VALUES
	(1, 1, 0, 0, '게임요소이름1', '게임요소이미지2'),
	(1, 2, 1, 0, '게임요소이름2', '게임요소이미지3'),
	(1, 3, 0, 0, '게임요소이름3', '게임요소이미지3'),
	(1, 4, 2, 0, '테스트를위해기본값설정으로임시설정', '테스트를위해기본값설정으로임시설정'),
	(1, 5, 0, 0, '테스트를위해기본값설정으로임시설정', '테스트를위해기본값설정으로임시설정'),
	(1, 6, 1, 0, '테스트를위해기본값설정으로임시설정', '테스트를위해기본값설정으로임시설정'),
	(1, 7, 0, 0, '테스트를위해기본값설정으로임시설정', '테스트를위해기본값설정으로임시설정'),
	(1, 8, 3, 0, '테스트를위해기본값설정으로임시설정', '테스트를위해기본값설정으로임시설정'),
	(1, 9, 0, 0, '테스트를위해기본값설정으로임시설정', '테스트를위해기본값설정으로임시설정'),
	(1, 10, 1, 0, '테스트를위해기본값설정으로임시설정', '테스트를위해기본값설정으로임시설정'),
	(1, 11, 0, 0, '테스트를위해기본값설정으로임시설정', '테스트를위해기본값설정으로임시설정'),
	(1, 12, 2, 0, '테스트를위해기본값설정으로임시설정', '테스트를위해기본값설정으로임시설정'),
	(1, 13, 0, 0, '테스트를위해기본값설정으로임시설정', '테스트를위해기본값설정으로임시설정'),
	(1, 14, 1, 0, '테스트를위해기본값설정으로임시설정', '테스트를위해기본값설정으로임시설정'),
	(1, 15, 0, 0, '테스트를위해기본값설정으로임시설정', '테스트를위해기본값설정으로임시설정'),
	(1, 16, 4, 1, '테스트를위해기본값설정으로임시설정', '테스트를위해기본값설정으로임시설정');
/*!40000 ALTER TABLE `elementinfo` ENABLE KEYS */;

-- 테이블 worldcupgame.gameinfo 구조 내보내기
CREATE TABLE IF NOT EXISTS `gameinfo` (
  `gameIdx` int(11) NOT NULL AUTO_INCREMENT COMMENT '게임번호',
  `regMemberIdx` int(11) NOT NULL COMMENT '게임등록 사용자 회원정보 ',
  `gameTitle` varchar(20) NOT NULL COMMENT '게임이름',
  `gameImg` varchar(30) NOT NULL COMMENT '게임이미지 경로',
  `regDate` datetime NOT NULL COMMENT '등록날짜',
  PRIMARY KEY (`gameIdx`) USING BTREE,
  KEY `FK_gamesinfo_memberinfo` (`regMemberIdx`),
  CONSTRAINT `FK_gamesinfo_memberinfo` FOREIGN KEY (`regMemberIdx`) REFERENCES `memberinfo` (`memberIdx`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb3 COMMENT='게임 썸네일 정보 테이블';

-- 테이블 데이터 worldcupgame.gameinfo:~13 rows (대략적) 내보내기
/*!40000 ALTER TABLE `gameinfo` DISABLE KEYS */;
REPLACE INTO `gameinfo` (`gameIdx`, `regMemberIdx`, `gameTitle`, `gameImg`, `regDate`) VALUES
	(1, 1, '게임1', '게임이미지1', '2022-06-24 01:25:43'),
	(2, 2, '게임2', '게임이미지2', '2022-06-24 01:33:37'),
	(3, 3, '게임3', '게임이미지3', '2022-06-24 01:33:56'),
	(4, 2, '게임4', '게임이미지4', '2022-06-30 14:56:23'),
	(5, 2, '게임5', '게임이미지5', '2022-06-30 14:56:54'),
	(6, 1, '게임6', '게임이미지6', '0000-00-00 00:00:00'),
	(7, 2, '게임7', '게임이미지7', '0000-00-00 00:00:00'),
	(8, 1, '게임8', '게임이미지8', '0000-00-00 00:00:00'),
	(9, 1, '게임9', '게임이미지9', '2022-06-30 14:58:14'),
	(10, 1, '게임10', '게임이미지10', '2022-06-30 14:58:26'),
	(11, 1, '게임11', '게임이미지11', '0000-00-00 00:00:00'),
	(12, 3, '게임12', '게임이미지12', '0000-00-00 00:00:00'),
	(13, 3, '게임13', '게임이미지13', '2022-06-30 14:59:09');
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
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb3 COMMENT='회원 정보 테이블';

-- 테이블 데이터 worldcupgame.memberinfo:~3 rows (대략적) 내보내기
/*!40000 ALTER TABLE `memberinfo` DISABLE KEYS */;
REPLACE INTO `memberinfo` (`memberIdx`, `Id`, `pw`, `name`, `age`, `addr`, `joinDate`) VALUES
	(1, 'admin', 'admin', '관리자', 25, '대전광역시', '2022-06-12 23:52:10'),
	(2, 'a', 'a', '김철수', 23, '서울', '2022-06-24 01:32:53'),
	(3, 'b', 'b', '고영희', 24, '서울', '2022-06-24 01:33:12');
/*!40000 ALTER TABLE `memberinfo` ENABLE KEYS */;

-- 테이블 worldcupgame.noticeinfo 구조 내보내기
CREATE TABLE IF NOT EXISTS `noticeinfo` (
  `noticeIdx` int(11) NOT NULL AUTO_INCREMENT COMMENT '공지사항번호',
  `memberIdx` int(11) NOT NULL COMMENT '회원정보테이블 - 회원번호',
  `noticeTitle` varchar(30) NOT NULL COMMENT '공지사항 제목',
  `noticeContents` text NOT NULL COMMENT '공지사항 내용',
  `file` varchar(30) DEFAULT NULL COMMENT '파일 경로',
  `pubDate` datetime NOT NULL COMMENT '게시 날짜',
  PRIMARY KEY (`noticeIdx`),
  KEY `FK_noticeinfo_memberinfo` (`memberIdx`),
  CONSTRAINT `FK_noticeinfo_memberinfo` FOREIGN KEY (`memberIdx`) REFERENCES `memberinfo` (`memberIdx`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb3 COMMENT='공지사항 정보 테이블';

-- 테이블 데이터 worldcupgame.noticeinfo:~2 rows (대략적) 내보내기
/*!40000 ALTER TABLE `noticeinfo` DISABLE KEYS */;
REPLACE INTO `noticeinfo` (`noticeIdx`, `memberIdx`, `noticeTitle`, `noticeContents`, `file`, `pubDate`) VALUES
	(1, 1, '첫번째 공지사항', '공지사항1', NULL, '2022-06-12 23:53:18'),
	(2, 1, '공지사항1', '공지사항1 내', '/file/board/20220616개발진행도.txt', '2022-06-24 01:24:19');
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

-- 테이블 데이터 worldcupgame.recordinfo:~6 rows (대략적) 내보내기
/*!40000 ALTER TABLE `recordinfo` DISABLE KEYS */;
REPLACE INTO `recordinfo` (`gameIdx`, `playMemberIdx`, `gameRecord`, `playDate`) VALUES
	(1, 1, '게임1멤버1', '2022-06-24 01:32:16'),
	(2, 2, '게임2멤버2', '2022-06-24 01:34:14'),
	(1, 3, '게임1멤버3', '2022-06-24 01:34:36'),
	(2, 1, '게임2멤버1', '2022-06-24 04:06:03'),
	(1, 1, 'ê²ì1ë©¤ë²1', '2022-06-24 04:58:25'),
	(1, 1, '게임1멤버1', '2022-06-24 04:59:19');
/*!40000 ALTER TABLE `recordinfo` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
