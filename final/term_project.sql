-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- 主機： 127.0.0.1
-- 產生時間： 2023-06-14 09:44:24
-- 伺服器版本： 10.4.28-MariaDB
-- PHP 版本： 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- 資料庫： `term_project`
--

-- --------------------------------------------------------

--
-- 資料表結構 `ask`
--

CREATE TABLE `ask` (
  `ask_id` int(10) NOT NULL,
  `member_id` int(100) NOT NULL,
  `ask_name` varchar(50) NOT NULL,
  `ask_date` date NOT NULL,
  `ask_time` varchar(50) NOT NULL,
  `ask_number` int(10) NOT NULL,
  `ask_total` int(10) NOT NULL,
  `ask_state` int(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- 傾印資料表的資料 `ask`
--

INSERT INTO `ask` (`ask_id`, `member_id`, `ask_name`, `ask_date`, `ask_time`, `ask_number`, `ask_total`, `ask_state`) VALUES
(15, 4, ' 黃宏一', '2023-06-22', '下半場', 3, 1800, 1),
(16, 4, ' 溫先生', '2023-06-29', '上半場(19:00 - 20:00)', 2, 1200, 1),
(17, 7, ' 賴小瑜', '2023-06-21', '下半場(20:00 - 21:00)', 2, 1200, 1),
(18, 4, ' 黃宏一', '2023-06-23', '下半場', 1, 600, 2),
(19, 8, ' 賴小瑜', '2023-06-14', '下半場', 3, 1800, 2);

-- --------------------------------------------------------

--
-- 資料表結構 `blessing`
--

CREATE TABLE `blessing` (
  `blessing_id` int(10) NOT NULL,
  `blessing_name` varchar(10) NOT NULL,
  `blessing_content` varchar(255) NOT NULL,
  `blesiing_date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- 傾印資料表的資料 `blessing`
--

INSERT INTO `blessing` (`blessing_id`, `blessing_name`, `blessing_content`, `blesiing_date`) VALUES
(86, '溫政瑋', '向您發送此祈禱，我希望能得到最真誠的祝福。 你的生活充滿無限可能和歡樂，每一天都充滿陽光和溫暖。 希望你有堅定的意志和勇氣，面對生活中的挑戰，從中等到高等。 願你的心充滿喜悅。', '2023-06-14'),
(87, '黃宏一', '在這個特殊的時刻，祝我好運。 生活一樣美麗多彩，每一天都充滿了快樂和幸福。 願心充滿愛與慰藉，與伴侶分享美好時光，帶來溫暖與慰藉。 充滿勇氣和冒險精神。', '2023-06-14'),
(88, '鄭湘禾', '祝您每天生活健康、充滿活力，充分享受生活的美好與樂趣。 願你和你愛的人共同創造美好的回憶，共同建立一個溫馨幸福的家庭。 願你內心永遠安寧祥和，無論外在世界如何變化，你依然有能力保持', '2023-06-14'),
(89, '邱楷仁', '祝清朝萬事如意，定能給自己的心帶來慰藉和安寧。 無論挑戰多麼艱難，相互信任必將戰勝無限的潛能和能力。', '2023-06-14'),
(90, '陳湘宇', '祝福在人生的旅途中，在人生的開始，希望，口美，為自己創造美好的未來。', '2023-06-14'),
(91, '陳紘淵', '祝生活充實、幸福、成功，每一天都是快樂的開始。 祝福你健康、快樂、愛情和美好時光。', '2023-06-14'),
(92, '賴小瑜', '身體健康平安哈哈哈', '2023-06-14');

-- --------------------------------------------------------

--
-- 資料表結構 `cart_main`
--

CREATE TABLE `cart_main` (
  `cart_id` int(10) NOT NULL,
  `member_id` int(10) NOT NULL,
  `ship_charge` int(10) NOT NULL,
  `cart_address` varchar(255) NOT NULL,
  `cart_total` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- 傾印資料表的資料 `cart_main`
--

INSERT INTO `cart_main` (`cart_id`, `member_id`, `ship_charge`, `cart_address`, `cart_total`) VALUES
(27, 4, 100, '屏東縣', 9100),
(28, 4, 100, '屏東縣', 1000),
(29, 4, 100, '屏東縣內埔鄉學府路1', 2500),
(30, 4, 100, '屏東縣', 7900),
(34, 7, 100, '屏東縣內埔鄉學府路1', 6100),
(35, 4, 100, '屏東縣內埔鄉學府路1', 700),
(36, 4, 100, '屏東縣內埔鄉學府路1', 900),
(37, 4, 100, '屏東縣內埔鄉學府路1', 900),
(38, 8, 100, '屏東縣內埔鄉學府路1號', 6690);

-- --------------------------------------------------------

--
-- 資料表結構 `cart_secondary`
--

CREATE TABLE `cart_secondary` (
  `cart_secondary_id` int(10) NOT NULL,
  `cart_id` int(10) NOT NULL,
  `product_id` int(10) NOT NULL,
  `product_num` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- 傾印資料表的資料 `cart_secondary`
--

INSERT INTO `cart_secondary` (`cart_secondary_id`, `cart_id`, `product_id`, `product_num`) VALUES
(32, 27, 8, 3),
(33, 28, 6, 3),
(34, 29, 7, 8),
(35, 30, 6, 2),
(36, 30, 8, 2),
(37, 30, 3, 1),
(39, 34, 8, 2),
(40, 35, 6, 2),
(41, 36, 6, 1),
(42, 37, 6, 1),
(43, 38, 6, 1),
(44, 38, 8, 2);

-- --------------------------------------------------------

--
-- 資料表結構 `donation`
--

CREATE TABLE `donation` (
  `donation_id` int(10) NOT NULL,
  `member_id` int(11) NOT NULL,
  `donation_name` varchar(10) NOT NULL,
  `donation_price` int(10) NOT NULL,
  `donation_content` varchar(255) NOT NULL,
  `donation_date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- 傾印資料表的資料 `donation`
--

INSERT INTO `donation` (`donation_id`, `member_id`, `donation_name`, `donation_price`, `donation_content`, `donation_date`) VALUES
(1, 4, '黃宏一', 300, '123', '2023-06-11'),
(2, 4, '溫先生', 1000000, '想發財', '2023-06-11'),
(3, 7, '賴小瑜', 1000000, '全班 ALL PASS', '2023-06-13'),
(4, 8, '賴小瑜', 2000000, '祈求平安', '2023-06-14');

-- --------------------------------------------------------

--
-- 資料表結構 `draw_lots`
--

CREATE TABLE `draw_lots` (
  `draw_id` int(10) NOT NULL,
  `draw_no` varchar(10) NOT NULL,
  `draw_content` varchar(255) NOT NULL,
  `draw_luck` varchar(255) NOT NULL,
  `draw_translate` varchar(255) NOT NULL,
  `draw_means` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- 傾印資料表的資料 `draw_lots`
--

INSERT INTO `draw_lots` (`draw_id`, `draw_no`, `draw_content`, `draw_luck`, `draw_translate`, `draw_means`) VALUES
(1, '第一籤', '佳偶耶？神仙美眷也。\r\n夫復何求?', '籤王', '對對佳偶.神仙美眷.百年偕老.無須再覓良緣。', '人的禍福.延自祖先的福報，因祖先庇佑，得遇佳偶,是個歡樂而美滿的良緣，而且好”因緣”也會延須至下一代，是個上上大吉籤，求得此籤目前福緣俱足，和合常樂，兒孫滿堂，更宜多種福田，問緣份，大吉。問婚姻，可合和圓滿。'),
(2, '第二籤   ', '落霞與孤鶩齊飛，\r\n秋水共長天一色。', '中', '落霞與孤鶩齊飛，秋水共長天一色.落霞與孤鶩。均是寂寞。寥落之象也。於落霞之中。單象影隻之鶩飛行者。予人深感秋盡冬之來。旺盛蕃衍之夏季已過。秋已盡。如此際遇之時。君汝宜樂善不倦積德當先。待時之時。自有合成之時。', '再等一段時間 ，自然會有屬於自己的緣分出現，求得此籤目前福緣不足，難免失意，懊悔，宜多種福田，問緣份，難成。問婚姻，難和諧。'),
(3, '第三籤 ', '宗廟享之，子孫保之。', '上上大吉', '上一代之福延於子孫。禍亦同也。福之延於吾一代。其惠愛之情。當不可須臾忘之。享自上一代。吾當設法延於下一代。事事如此之時。一代延下一代。皆可享用不竭。汝懷念祖先。子孫亦同之。', '很多事有因而有果，如同上一代祖先積福而讓下一代子孫享福，因此，子孫享福的同時，也應該繼續行善造福，讓自己的下一代亦有福蔭之庇佑。'),
(4, '第四籤    ', '斯人也，而有斯疾也；斯人也，而有斯疾也。', '中', '一個人皆有疾。毛病。癖之所成。連聖賢在修養到家之前也是如此。毛病與過失。皆不能免。古訓曰：知過能改，善莫大焉。猶如人若有疾病而不忌醫。將獲痊癒。', '目前福緣不佳，猜疑口舌鬥爭難免，宜多種福田，問緣份，不吉。問婚姻，防口舌。'),
(5, '第五籤', '逾東家牆而摟其處子，則得妻。不摟，則不得妻。', '上', '如在偶然之機會。或相處已久。視伊人為終身可許之者。應採取行動。不宜逸失機會。姻緣之至也。必須勇往邁進。', '求得此簽目前福緣平平，須小孩來牽成，宜多種福田，問緣份，成則吉，問婚姻，孕更吉。'),
(6, '第六籤', '風弄竹聲，只道金佩響；月移花影，疑是玉人來。', '上吉', '風弄竹聲，只道金佩響；月移花影，疑是玉人來。春風一動。竹葉之搖晃。沙沙作響。啻可聽道金佩在響。月日一日日地去耶。花影見了。心底下。疑玉人來。繇此可知。君之好事已近。', '目前福緣佳，可享魚水歡，更宜種福接福問緣份，成者大吉。問婚姻，合和,須防外遇。'),
(7, '第七籤    ', '斯是陋室，唯吾德馨。', '上', '雖居於簡陋之閨房。唯一己之德俱備時。自有它馨香之處。易言之。一己。居於極陋之室中。如德。智皆備之時。天自有賜良緣之時。不必自卑自棄耶。', '目前福緣欠佳，難免落寞失意，宜多種福田增福，問緣份，不急且修心。問婚姻，難諧。'),
(8, '第八籤   ', '期我乎桑中，要我乎上宮，送我乎淇之上也。', '中上', '男女之婚姻是終身大事。是決定人生一生幸福之大事。爰之。不得以逾越。不正。強行等。手段行之。必須以正當方式取得對方之芳心。兩相情願之下完成。如違反上述原則行之時。雖結合。惟兩者之間。貌合神離。不得行之。否則良緣亦為此破壞無遺。', '目前福緣不佳，分分合合，宜多種福田增福，問緣份，勿強求。問婚姻，貌合神離。'),
(9, '第九籤', '則父母國人皆賤之。', '上', '則父母。亦即使君爾之椿萱也。皆輕視君汝之意。繇此可之。為人子弟者。為合受父母疏遠。唾棄。賤之。原因多矣。最大之原因。不出不慎交友。如一己之不慎。一失足成千古恨之時。後果堪虞者。爰之。必須慎行之。婚姻同之。終生之伴侶。必須慎擇之。', '目前福緣不足，須得神佛及貴人之助方能圓滿，為人子女者，需謹慎交友，聽從父母及長輩或貴人的意見，不可一意孤行'),
(10, '第十籤', '有道是養兒防老，積穀防饑。', '下', '自古以來有兩大古訓。養兒為了一己之防老。老了以後。可繇伊等侍奉。貽娛老年。平素則省吃儉用。積穀可防饑。尤其是養兒耶。必須善教之。婚事同之。結髮成伉儷之後。老境亦能相互照顧也。', '目前福緣俱足，奉”子”之助更加圓滿，種福田積後福，問緣份，得貴助。問婚姻，伉儷情深。'),
(11, '第十一籤   ', '自剪芭蕉寫佛經，金蓮無複印中庭。\r\n清風明月長相憶，玉管朱弦可要聽，\r\n多病不勝衣更薄，宿妝猶在酒初醒。\r\n衛星年違別成何事臥看牽牛織女星。', '中平', '前之一句則是自剪芭蕉之葉。寫佛經。清風明月耶長相憶。亦即是清風中之明月。緬懷已往之歲月。往事。一面幻想著自己之前途。皆無補於事者。此景猶如多病之人。衣薄，宿粧又如酒初醒之時。不如現在耶。皆意養吾身。有了健全之身。自有健全之志隨之。唯有如此。方有新之機會可逢遇。', '不要眷戀或悔恨過去，再怎麼眷戀或悔恨也是枉然，應該懂得珍惜，過去的已成過去，要開心振作精神，才能迎接新的機緣到來目前福緣已盡,情緒反覆,患得患失.宜多自省修福. 問緣份，去舊迎新方為福。'),
(12, '第十二籤', '一則以喜，一則以懼。', '中', '此塵世之事。無以兩全其美者。甚至有人曰。世人之事耶。十之八九不如意。如此反覆不以之世景下。吾人該以如何面對。啻好面對現實。就事情分析。研判。取捨之。不宜奢求之。但亦不必為小挫而氣餒歟。', '當下雖不能兩全其美，但只要面對現實，就事情分析及研判而取捨之，終能突破萬難，求得此籤目前福緣不足，有得必有失，反覆循環求得此籤，目前福緣不足,有得必有失,反覆循環.宜多種福田.問緣份，憂喜參半。問婚姻，先否後泰。'),
(13, '第十三籤   ', '山窮水盡疑無路，柳暗花明又一村。', '上', '前面一片重重疊疊之山嶺。已經覺得自己再業沒路可行之際。忽爾又出現一村子來。在心灰意懶。萬念俱灰之時。峰迴路轉。來了一線生機。為君帶來莫大希望。是人之命運也。汝已入佳境。必有佳遇耶。', '看似沒有希望的戀情，也有復合的可能，若再婚的話，或許會得到幸福，但要靠媒妁之言來進行婚事的成功，會因此而浪費過多的時間，目前福緣平平。'),
(14, '第十四籤', '誰謂荼苦，其甘如薺。\r\n宴爾新婚，如史如弟。', '上上', '一己之先入觀念。對某物有喜愛。讚賞有加。愛屋及烏。如苦瓜。苦茶。雖是有苦味。但喜愛之人食之必言其美味且甘耶。伴侶之選擇復之如是。以愛為出發。自無貴賤之分。愛之有加。', '對感情不要有先入為主的成見，愛一個人就要不分貧富貴賤，階級長幼，高下，身份，目前福緣俱足,平安穩健，更宜多種福田 延續 問緣份，大吉。問婚姻，合和穩定 無須憂心。'),
(15, '第十五籤 ', '君子審禮，不呆誣以奸詐。', '中', '君子之為人也。必須注重禮節。凡是明知言行之失去禮節者。皆守正。絕不入不正之途，思想高超。格調要高。如冰清玉潔。必受人歡迎。且他人亦無有可乘之地。無法藉詞加以誣蔑者也。', '行為舉止不可忘形輕佻及逾越禮節守正之矩，目前福緣不佳,不可有欺凌詐騙之念，否則必有報應，目前福緣不佳,不可有欺凌詐騙之念.否則必有報應.宜多種福增福.問緣份，不佳,宜保持距離。問婚姻，防私情.外遇。'),
(16, '第十六籤  ', '意中人，人中意，則那些無情花鳥也情凝，\r\n一般的解結枝頭學並棲。', '上上', '一己之心。盡了人事。必有精賬。易言之。意中人。人中意。真情表露時。連那些不能言語之花鳥亦可致意者。意。情之到也。緣份附之。必有時機之來到。', '情侶之間，夫妻間則有”誤會冰釋”之暗示，往後更能圓融幸福，求得此籤目前福緣豐厚，只要同心皆可逢凶化吉，更宜多作福增福。求得此籤目前福緣豐厚,只要同心皆可逢凶化吉，更宜多作福增福，問緣份，得貴人助，合和圓滿，問婚姻，先否後泰，合和圓滿。'),
(17, '第十七籤 ', '德者本也，財者未也。', '中', '古人曰。一人之於世。最要者立德。立言。立功三者。有德者輕財。具有德而重財者。德隨之墮之。惟財者人生必要之身外物。取之有道。非秤義之財勿取。爰之。由此可知選婿選妻。亦須根據此原則。婿擇良人。妻求之淑女。千萬不可重財輕德。否則後果堪虞也。', '此籤談感情宜暫時擱下，等待機緣成熟再說也不遲，目前先維持你君子風度，若貿然談感情，反而給對方負面形象看法，造成品格上缺失。目前福緣不足，不可高攀貪圖富貴，而種下禍因.應多作福增福來改變福報，問緣份，宜謹慎擇偶，問婚姻，以德相扶，才能共患難。'),
(18, '第十八籤  ', '非獨內德茂也，蓋亦以外感之助焉', '上', '雄鷹藏爪。同樣道理。具有才能之人。因書讀多。品德。學識俱豐。不願將自己之才華露於外。惟婚姻獨有不同。如心中喜歡。可將一己之力。作適度之顯示。予以激發對之。引起對方之信賴是心要者。秘而不宜。伊人。無從所得。必有所礙。甚至一走了之。', '具有才能之人學識修養俱佳，不願才華露於外，但婚姻不同，不可靦腆秘而不宣，將愛慕及想法，作適度之表達，求得此簽目前福緣俱足，平安穩健， 問緣份，勇敢表白.大吉。問婚姻，誠意溝通.可免憂心。'),
(19, '第十九籤', '或十年，或七八年、或五六年，或三四年。', '上', '或五六年，或三四年皆以年月示之。君汝與她之緣之成也。或費三。四年補六年。或七八年。甚至十年亦不一定.當提起之後。或因時。空。事業之學業。關係分東。有了某種契機。有急驟轉變之者。速即恐有變。須耐心待之。', '因為人、事、地，等時機不對，目前雖有了某種契機，但時機仍不對，須耐心等待之，目前福緣不足，易受家人或環境之影響，暫時無法突破困境。'),
(20, '第二十籤    ', '何如，子曰,可也。', '上', '如有人問。如此問題該何如解決。曰：可也。即可以進行之。問之何人。即是就放於我之師長。伊等之告之於君。可也。汝可抱為南針。毅然行之。婚姻同之。目下君所交之伊人。可與否。還是請教長輩。伊人之眼光中。可者可取之。', '凡事立即可下定決心進行，無須憂慮，求得此簽目前福緣平平，最好多問神佛長輩再擬行動，求得此籤目前福緣平平，最好多問神佛長輩再擬行動，問緣份，可者成者大吉。問婚姻，可者，可速進取之。'),
(21, '第二十一籤 ', '十畝之間兮，桑者閒閒兮。', '上上', '曾是五畝田之家。植之桑麻。家人即可三餐得溫飽者。今之也。已有十畝之地可植桑麻。自然更寬裕之。生活穩定。名利該薄之。淡於名利。生活則樂之。 否則天譴之。', '求得此籤目前福緣天賜已足,雖然目前還有不順及機緣不足.只要安份守舊可保順遂圓滿.不可惑於美色或名利.而見異思遷.貪求無厭.否則必招天譴破敗無疑.問緣份，天賜良緣。問婚姻， 惜福惜緣.樂天知命. 百年好合。\r\n\r\n'),
(22, '第二十二籤', '久旱逢甘雨，他鄉遇故知，洞房花燭夜，金榜掛名時。', '上上大吉', '大吉大利之象，平常所謂雙喜臨門，已是罕見，如今四喜臨門，真是人間少有. 五福臨門 世上無雙。', '整支籤詩是提醒你，與對方緣分不佳，另有其他姻緣而，非此段感情得以復合 ，此籤若是沒有交往者，四喜臨門，愛情順利，喜事連連 。'),
(23, '第二十三籤', '山只一點故情留，直似春蠶到老，尚把絲抽。', '中', '伊人作情。汝為其情所迷。如春蠶之蛹。固執之。一個人之情。卻未必如此癡之。凡事者。中庸之道守之。未必死心塌地之境地。不可不知者。宜自重之。', '這段感情完全是你一人的單相思，對方不一定對你有有厭惡之感，但卻對你毫無感情。目前福緣不足,最好多求神作福.不可癡心絕對.否則大錯特錯.問緣份，此情可待成追憶。問婚姻，若心已似鐵. 強求何益?'),
(24, '第二十四籤', '他思已窮，恨不窮，是為嬌鸞鶵鳳失雌雄。', '中', '他思之己窮。表明伊也對爾已無愛情可言。不僅無愛情可言。且恨汝入骨之境。原因何在。她尚在孤單一人。是為嬌鸞鶵鳳。失雌雄。易言之。如有子女。恐怕不與伊人在一起度此生.宜求神解之。', '目前對你的愛意可全是全無，且恨之入骨，恨你不代表另有新歡，而是另外的原因，若有子女，恐怕不易與之一同相處，目前福緣不佳，切莫等閒視之。'),
(25, '第二十五籤', '可妻也。\r\n', '上\r\n', '可妻也。伊人是好伴侶。可娶嫁之。惟目前尚有若幹問題之存在。均是瑣碎不必彈慮者。既成好事也。將來必永浴愛河。白頭偕老。', '對方是個很好的對象，你們之間尚有許多問題存在，但也無須過慮，不管遇到什麼問題，都不要太過急，平靜的去處理，目前福緣 平平,若能再多禮佛修福, 熱心公益. 累積善因善心,姻緣自有更多的福報，自然會有神佛及貴人幫助你加速成功圓滿順遂。'),
(26, '第二十六籤 ', '維熊維罷，男子之祥。維虺維蛇，女子之祥。', '上上', '男性夢中見熊。羆等物也。吉祥也。將有飛黃騰達之一日。女性之夢中見虺。蛇之屬。亦是祥兆也。本首之詩文告之於君。生男者可成莫雄。生女者為淑媛也。', '其實緣份這種事還蠻玄的，該是您的，絕對跑不掉 ，假如那位對象是真心守侯您的 ，相信就算是大水來沖也沖不掉 ，如果想要突破必須有所成長。目前福緣圓滿,若能再多 作公益. 累積善因善心,自有更多的福報庇蔭子孫，成功圓滿順遂。問緣份，有懷孕之兆。問婚姻，生兒育女\r\n百子千孫 吉祥之兆。'),
(27, '第二十七籤 ', '有宗室之美。', '上平', '君爾該知，不能仗己為貴族之出。時局已變遷。已無五爵之分。世人皆平等。人生而平等。並無天子。赤子之分也。爰之。君汝為尋佳偶時。必須從平常人尋找去。門當戶對。或古人之訓也。惟世人之視覺自不同於曩息。宜以愛心與緣份為重可也', '人都是平等的沒有貴賤之分，必須要從平常人之中去找，重要的是你要有那個愛心和緣分，目前福緣平平，不可貪求富貴而自尋煩惱。求得此籤目前福緣平平,不可貪求富貴而自尋煩惱，問。問婚姻，惜福惜緣，百年好合。'),
(28, '第二十八籤', '夫婦也,昆弟也。', '上', '一生結為夫妻。為伉儷。必須如昆弟。亦即是如同手足情深之親兄弟。相敬如賓。決心結為連理之枝。飛於天空之比翼鳥。終生得幸福矣。', '夫妻一生一世要永結同心，以此為信念相互扶持，愛護並尊重及容忍彼此所有的一切，必得幸福，目前福緣圓滿，更宜多求神造福延續福報。問緣份，大吉。問婚姻，惜福惜緣，百年好合。'),
(29, '第二十九籤', '有意栽花花不發，無心插柳柳成蔭。', '中平', '悉心照顧花兒。惟為何。明明作對之。中途夭折。話說回來。簡單之插下池邊之柳枝卻蓬勃發芽。婚姻又如此。本是有意甲家之女。卻娶上乙家之女。是非常美妙之事耶。', '目前所問對象與您不會有結果，反倒是其他人會與您有結果，但無法看出此人是否已出現。'),
(30, '第三十籤', '話別無長夜,相思又此春。\n瑤姬不可見,巫峽更何人。\n運石疑填海,乘槎欲問津。\n瑤情每未注,誰共爾為鄰？', '中', '時為話別之時。恨時間太短。想思於此。皆空思幻想矣。並無濟於事。瑤姬。巫峽。皆不可見之地。於渺茫之地。唯事必須重實際。實事求是。才有收穫之時。見茫霧之境。皆無益者。', '凡目前與此對像緣份不足，這只是一段鏡花水月的緣份，處在相思的痛苦中，一切卻如雲雨巫山一樣的渺茫，只能在短暫的私會或在夢中求得一些感覺和安慰。'),
(31, '第三十一籤', '設虛，夜靜水寒，魚不餌。笑滿船空載明月。', '中平', '萬籟俱靜。水深又冷之時。魚兒不得餌。出獵去之時。又逢空手回之。船隻載明月上歸途也。可知君目下之運也。宜重實際。不宜作虛幻之事。實事求是。否則事事落空。無一所成耶。', '專心在生活上對他就好了 ，否則事事落空無一所成， 目前緣份不足，時機不對，妄想自生災，宜多求神作公益廣結善緣。'),
(32, '第三十二籤', '因荷而得藕，有杏不須梅。', '上', '此詩文者以同音諧之。因荷「何」而得藕「偶」。有杏「幸」不須梅「媒」者。君汝可知道。因荷之生方得蓮藕。為何我能得偶。我亦不得而知。爾是杏「幸」運之人也。自然不需「梅」。媒來妁之。君之鴻運。無人可與倫比也。', '求得此籤乃”緣訂三世”，只需機緣成熟，自然相聚圓滿，更宜多求神造福延續福報。'),
(33, '第三十三籤 ', '可以托六尺之孤，可以寄百里之命。', '上上', '君汝如能逢遇鮑叔牙耶。可全心誠意之對付之。伊人也。是貴人也。伊之黼增華之時。君汝亦必有大成之時。爰之。一人之希望。可托於伊之身上。', '你可望遇貴人、知音，交至友，得生死相許之配偶，可以全心誠意交付對象，目前福緣圓滿，你們的姻緣一定會有美好的結局，目前福緣圓滿,有了月下老人的幫忙，你們的姻緣一定會有美好的結局，更宜多求神造福延續福報，問緣份，月老牽成。問婚姻，可依附一生的天作之合。'),
(34, '第三十四籤', '仍舊貫，如之何？何必改作？', '中平', '君爾目下雖處在逆境。唯必須持之。不宜變之。見之狀。為己周章。則愈形愈挫。不宜見異思遷。堅守舊之況。必有機緣之來。不可慌耶。', '雖然目前是處在逆境、感情不順時期，但你必須保持現狀，先冷靜觀察理解目前的感情困境，不畏挫敗努力去突破，不可見異思遷。'),
(35, '第三十五籤', '遇人之不淑矣。', '下', '今之所逢遇耶。伊人是害人之人也。明知不可交。宜速止之。另擇佳偶去可也。', '今之所逢遇耶。伊人是害人之人也。明知不可交。宜速止之。另擇佳偶去可也。'),
(36, '第三十六籤', '投我以木桃，報之以瓊瑤。\r\n', '上', '我之友予我木桃。如野人之獻芹者。吾感激之。必報以瓊瑤之玉也。世人曰吃人斤量也。必報以兩。今之食兩。還斤。易言之。一己之待人以誠。將得善果者無疑。必守之人之守則也。', '待人誠心，付出多，必有好結果，倘若有對象必能持守，沒有對象誠摯待人也必有好姻緣。\r\n\r\n'),
(37, '第三十七籤', '求則得之，捨則失之。                                                      ', '中', '若得機會之時。必須把握之。一有機會。君偶目下逢之際遇也。是紅之運。求之則得之。捨其機會則棄之。無法再追者。既有機會。千萬不可捨之。', '你目前所得到的機會，必須真正的把握，目前你的氣運正當紅，此次機會難得，千萬不要猶豫 ，如果失去此機會，還能不能再遇上，也就是說氣運了。'),
(38, '第三十八籤 ', '妻焉者，親之主也。', '上吉', '妻者。除椿萱。兄弟之外最親密者。爰之對妻之態度。必須如對己之親人父母。重視之。平等對待之。', '對象有沒有希望從籤詩上來看，是建議你對對方應該如同對待親人一般，適時關懷，給與支持與鼓勵，也許會有不錯的回應。'),
(39, '第三十九籤', '不得乎親，不可以為人。      \n不順乎親，不可以為子。', '上', '一人如失去父母之心。何以為人乎。失去親人之心。同時將失去朋友。友朋已失。一切皆去耶。宜知孝敬父母。悌其兄弟及友。方能得於世人之心。', '要你等待時機，不要心急，不要衝動，否則連普通朋友都做不成，要你順其自然，此話暗示有兩種:一是要你順其自然，二是表示很難成為夫妻。'),
(40, '第四十籤', '踏破鐵鞋無覓處，得來全不費功夫。', '中', '為了成一事。穿上鐵鞋奮鬥不懈。費心費力。皆無所獲。了然了然耶兩手到頭來皆空空。', '之前過程一路走來辛苦，但是如果願意放手，看的開一點，或許會有貴人出現或者突然就有意想不到的結果也是得來不費功夫。'),
(41, '第四十一籤', '良人者，所仰望而終身也，今若此。', '上平', '一人之善惡。必須終身能堅守為要件。本心為假冒。狐皮覆之。狐假虎威。終能露出馬腳之時。如得知其人之底心露者。立即取消之。漸其疏遠之。甚至斷之。否則有悔不當初之時也。', '問感情或交友狀況，那麼可得小心了，倘若你現在的朋友是虛有其表，你要懸崖勒馬，逐漸地斷絕交往的意思，因為他不是你未來的正緣，而且會讓你後悔不已。'),
(42, '第四十二籤', '重重疊疊上瑤台，幾度呼童掃不開，            剛被太陽收拾去，卻教明月送將來。', '中', '雲霧瀰漫於瑤臺之上。呼叫小童來掃開它。亦毫無任何效果。所幸強烈陽光將其驅送。迨至皎潔之明月出之。如是難通之運亦由伊帶光明來。含之義也。汝今雖有意外之損失。但亦將有意外之收 獲。時間不至於久耶。', '這支籤詩是注定你跟對方是，已注定，雖然中間幾度小波哲卻依然是你的。'),
(43, '第四十三籤', '君子有援勤之桃，淑女無投梭之拒', '上吉', '身為君子之伊也。有援琴之桃時。淑取自無投梭而拒君於千里之外者。易言之。如男之汝。有意接納時。淑女之爾。自無拒於千里之外之理由耶。', '即使兩方相隔千里之外,只要你有恆心持續感情,對方不會拒絕你。'),
(44, '第四十四籤  ', '遐邇一體，率賓舊王。', '上', '遐也遠。邇亦瑤之遠也。自古以來有千古不易之理。不論古今之時。東西之地。新人不如舊雨。新土亦不如舊主者也。伊人之關乎微至。', '如果是男女剛分手，趕快冰釋前嫌，如果是單身已久，新戀情可能是你身邊的朋友，或你在乎的人，此簽，意味著，可別太粗心而錯過美好姻緣。'),
(45, '第四十五籤 ', '後生可畏，焉知來者之不如今也。', '上', '君爾目下之人。本是可心滿意足之人。焉知後來之人。一個比一個更美好。就此環境下。只好願君作選擇矣。慎選之。品、學，兼豐而體能慎之。', '姻緣在後不可操之過急，過程中許多姻緣讓你動心，但是隨後而來的一切，卻又讓你難做選擇 ，需要等待，好酒沉甕底。'),
(46, '第四十六籤', '不愧於天，不怍於人。', '中上', '一人之言行方正之時也。對天而不愧。對地而不昧。視人生之財也。如浮雲之所以。心之守正。半夜有人敲門。心自不驚。為人之守則。必須守之。', '不管自己再做什麼事，都能光明正的大對得起對方，無論私底下的行事作風，自己也都了然於心，而無欺滿，必須坦承已對，方能長久。'),
(47, '第四十七籤', '害女紅者也。', '中', '所謂女紅者，為人繡羅衣之人也。此埋頭苦幹。為人刺繡者。厭其羅衣者居多。因女紅辛苦繡之。並不能享用其物而慨歎之。為人作燈泡。牽線是已。', '過份的追求，反會加重他人負擔，所以追求要適可而止。'),
(48, '第四十八籤 ', '五百英雄都在此，不知誰是狀元郎？', '上吉', '今日在君眼前者。皆為一時之選。人才濟濟。各有千秋。人人之狀元之郎君也。必須慎選。選如意郎君之原則也。品德為首。學識次之。門之當。戶又對乎。千萬叵重人之財。門閥。否則悔之已晚之時。', '請觀察她的品性與操守，別以物質與外貌為優先考量。'),
(49, '第四十九籤', '故好而知其惡，惡而知其美者。', '上平\r\n', '友朋交上以後。由衷喜歡伊人。唯時間一久。不知不覺發現其缺者。相反之。交上心坎裡不太喜歡之人。唯久而久之。反而發現其美之所在。是何者該密交捨之宜疏遠之人。宜自行審慎斷之。取捨小心可也。', '兩人因時間的相處，合者走的下去、不合者則開始思考分開，要合要分最好自己要想清楚。'),
(50, '第五十籤', '兩世一身，形單影支。', '中', '兩世之一身也。指君汝之單身漢渡世之主義。光棍。將形成形單影隻。何苦後。男大當婚。女大當嫁。是千古不易之理也。為調節生活之枯燥。宜棄之所謂王老五主義。宜談婚嫁也。', '意思就是在說你不想結婚的主意，之後就會一直找不到另外一半，孤單一人，何苦要讓自己以後變成這樣，代表現在適合談婚嫁的意思。'),
(51, '第五十一籤', '雖有善者，亦無如之何矣。', '上', '目下，君之緣份已有定終身之誼。忽爾出現比今更理想。令人可圈可點之人。皆已無益者。啻好皆認命。終生以伊為伴侶可也。勿必左思右想。舉棋不定。三心兩意。皆於事無益者。', '未來與你廝守一生的人已經確定了，雖然他的資質與條件不是很好，但命中註定就是他，你就不要猶豫再三了。'),
(52, '第五十二籤', '雲從龍,風從虎，聖人作而萬，君萬事皆可成也！', '上上大吉', '目下君爾之運也。雲之從龍。風之從虎之運。龍蟠虎踞之勢。風雲際會。際遇非常之時。君汝必能功成名遂之時。事事能稱心者耶。', '此刻您做任何事都很如意，氣勢達到高點，朝氣有活力，此緣份就像龍驣虎躍的氣勢，緣份已降臨妳的身上，而且一帆風順，沒有阻礙，凡事稱心如意。'),
(53, '第五十三籤', '其所厚者薄，而其所薄者厚。', '上上', '世人之現象。出乎人之意料者多。如其某君之於汝。曾施予恩。報之也薄。又對某兄施與之薄。君卻以厚禮還之。古人曰。施恩勿念。受惠勿忘。行善者。不必以報為念。上蒼知之即足矣。唯本籤之意即是。君汝之婚姻復如是。君汝之婚姻復如是。必能有意外之好姻緣來結合耶。', '秉持為善的心情去看待你的情感，對方必有感觸而回應你，就像婚姻也是這般的經營，往往在你真心付出後，對帶給你意想不到的好緣份 。');

-- --------------------------------------------------------

--
-- 資料表結構 `fortune`
--

CREATE TABLE `fortune` (
  `fortune_id` int(10) NOT NULL,
  `fortune_zodiac_animal` varchar(10) NOT NULL,
  `fortune_content` varchar(255) NOT NULL,
  `fortune_date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- 資料表結構 `joss`
--

CREATE TABLE `joss` (
  `joss_Id` int(10) NOT NULL,
  `joss_Name` varchar(10) NOT NULL,
  `joss_lacation` varchar(10) NOT NULL,
  `joss_date` date NOT NULL COMMENT '迎神日期',
  `step` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- 傾印資料表的資料 `joss`
--

INSERT INTO `joss` (`joss_Id`, `joss_Name`, `joss_lacation`, `joss_date`, `step`) VALUES
(3, '月老', '1廳主神龕', '2014-12-17', 'test'),
(5, '太歲星君', '1廳龍邊', '2015-05-14', 'test'),
(6, '文昌帝君', '2廳主神龕', '2014-05-13', 'test');

-- --------------------------------------------------------

--
-- 資料表結構 `joss_money`
--

CREATE TABLE `joss_money` (
  `joss_id` int(10) NOT NULL,
  `member_id` int(10) NOT NULL,
  `joss_user` varchar(50) NOT NULL,
  `joss_name` varchar(255) NOT NULL,
  `joss_date` date NOT NULL,
  `joss_price` int(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- 傾印資料表的資料 `joss_money`
--

INSERT INTO `joss_money` (`joss_id`, `member_id`, `joss_user`, `joss_name`, `joss_date`, `joss_price`) VALUES
(5, 4, '黃宏一', '太歲星君', '2023-06-10', 100),
(6, 4, '黃宏一', '月下老人', '2023-06-10', 100),
(7, 4, '溫先生', '文昌帝君', '2023-06-30', 200),
(8, 7, '溫先生', '月下老人', '2023-06-14', 3800),
(9, 8, '賴小瑜', '太歲星君', '2023-06-14', 200);

-- --------------------------------------------------------

--
-- 資料表結構 `light_record`
--

CREATE TABLE `light_record` (
  `light_record_id` int(10) NOT NULL,
  `light_id` int(10) NOT NULL,
  `member_id` int(10) DEFAULT NULL,
  `light_record_name` varchar(10) NOT NULL,
  `light_record_time` varchar(10) NOT NULL COMMENT '生辰八字',
  `light_record_birthday` date NOT NULL,
  `light_record_address` varchar(11) NOT NULL,
  `light_record_date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- 傾印資料表的資料 `light_record`
--

INSERT INTO `light_record` (`light_record_id`, `light_id`, `member_id`, `light_record_name`, `light_record_time`, `light_record_birthday`, `light_record_address`, `light_record_date`) VALUES
(30, 6, 4, '溫先生', '壬午 戊申 丙子 壬', '2023-06-24', '屏東縣', '2023-06-11'),
(31, 6, 7, '賴小瑜', '壬午 戊申 丙子 壬', '2014-03-19', '屏東縣內埔鄉學府路1', '2023-06-13'),
(32, 8, 8, '賴', '壬午 戊申 丙子 壬', '2023-06-06', '屏東縣內埔鄉學府路1號', '2023-06-14');

-- --------------------------------------------------------

--
-- 資料表結構 `light_up`
--

CREATE TABLE `light_up` (
  `light_id` int(10) NOT NULL,
  `joss_Id` int(11) NOT NULL,
  `light_name` varchar(255) NOT NULL,
  `light_description` varchar(255) NOT NULL,
  `light_picture` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- 傾印資料表的資料 `light_up`
--

INSERT INTO `light_up` (`light_id`, `joss_Id`, `light_name`, `light_description`, `light_picture`) VALUES
(6, 5, '太歲燈', '本命生肖與值年太歲相沖或對沖、偏沖， 因此需安太歲， 以祈求流年平安、諸事順遂', 'image/tai.png'),
(7, 3, '姻緣燈', '千里姻緣、一線牽成， 除了招桃花外， 已婚夫妻也可促進感情升溫、恩愛合和。', 'image/love.png'),
(8, 6, '光明燈', '象徵[元神]，內親光明，智慧如光，因而點亮光明燈及寓意點亮元辰，並祈求平安。', 'image/light.png');

-- --------------------------------------------------------

--
-- 資料表結構 `member`
--

CREATE TABLE `member` (
  `member_id` int(10) NOT NULL,
  `member_account` varchar(255) NOT NULL,
  `member_password` varchar(255) NOT NULL,
  `member_name` varchar(10) NOT NULL,
  `member_phone` varchar(10) NOT NULL,
  `member_mail` varchar(255) NOT NULL,
  `member_gender` varchar(1) NOT NULL,
  `member_birthday` date NOT NULL,
  `member_position` int(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- 傾印資料表的資料 `member`
--

INSERT INTO `member` (`member_id`, `member_account`, `member_password`, `member_name`, `member_phone`, `member_mail`, `member_gender`, `member_birthday`, `member_position`) VALUES
(4, 'asdfgh@gmail.com', '1234567', 'test123', '0900000000', 'asdfgh@gmail.com', '男', '2013-01-09', 0),
(5, 'manager@gmail.com', '7654321', 'manager', '0900000000', 'manager@gmail.com', '男', '2002-06-08', 1),
(6, 'test@gmail.com', '123', '黃宏一', '0900000000', 'test@gmail.com', '男', '2023-06-22', -1),
(7, '123@gmail.com', '1111', '溫鄭邱', '0912345678', '123@gmail.com', '男', '2014-02-13', 0),
(8, 'jiayu123@gmail.com', '12345', '賴小瑜', '0912345678', 'jiayu123@gmail.com', '女', '1996-06-06', 0);

-- --------------------------------------------------------

--
-- 資料表結構 `order_record`
--

CREATE TABLE `order_record` (
  `order_id` int(10) NOT NULL,
  `member_id` int(10) NOT NULL,
  `cart_id` int(11) NOT NULL,
  `total` int(10) NOT NULL,
  `address` varchar(100) NOT NULL,
  `order_state` int(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- 傾印資料表的資料 `order_record`
--

INSERT INTO `order_record` (`order_id`, `member_id`, `cart_id`, `total`, `address`, `order_state`) VALUES
(18, 4, 27, 9100, '屏東縣', 3),
(19, 4, 28, 1000, '屏東縣', 3),
(20, 4, 29, 2500, '屏東縣內埔鄉學府路1號', 2),
(21, 4, 30, 7900, '屏東縣', 2),
(22, 7, 34, 6100, '屏東縣內埔鄉學府路1', 2),
(23, 4, 35, 700, '屏東縣內埔鄉學府路1', 3),
(24, 4, 36, 900, '屏東縣內埔鄉學府路1', 1),
(25, 4, 37, 900, '屏東縣內埔鄉學府路1', 1),
(26, 8, 38, 6690, '屏東縣內埔鄉學府路1號', 1);

-- --------------------------------------------------------

--
-- 資料表結構 `product`
--

CREATE TABLE `product` (
  `product_id` int(10) NOT NULL,
  `product_name` varchar(255) NOT NULL,
  `product_price` int(10) NOT NULL,
  `product_stocks` int(10) NOT NULL,
  `product_information` varchar(255) NOT NULL,
  `product_description` varchar(255) DEFAULT NULL,
  `product_ship` varchar(255) DEFAULT NULL,
  `product_picture` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- 傾印資料表的資料 `product`
--

INSERT INTO `product` (`product_id`, `product_name`, `product_price`, `product_stocks`, `product_information`, `product_description`, `product_ship`, `product_picture`) VALUES
(3, '鹿港天后宮聯名｜祈願 月老姻緣香・養護組#好運招財迎桃花', 1200, 103, '商品材質:\r\n\r\n《 祈願 • 月老姻緣香 • 純銀手鍊 》:蠟繩/低敏925純銀製品/淡水珍珠\r\n\r\n《 祈願 • 月老姻緣香 》手鍊護養袋:外袋绒面超纖/内卡羊皮绒\r\n\r\n《 祈願 • 愛情丹 • 月老姻緣香 》:玻璃瓶\r\n\r\n商品規格:三件販售\r\n\r\n商品尺寸:\r\n\r\n禮盒:28x14.1x5.1cm\r\n\r\n《 祈願 • 月老姻緣香 • 純銀手鍊 》:淡水珍珠，形狀大小皆不同(±1.5mm)，細微坑洞及凹痕為天然形成非屬瑕疵\r\n\r\n《 祈願 • 月老姻緣香 》手鍊護養袋:7.3x7.3cm(內附項鍊', '123商品材質:\r\n\r\n《 祈願．月老姻緣香．純銀手鍊 》: 蠟繩/低敏925純銀製品/淡水珍珠\r\n\r\n《祈願．月老姻緣香．手鍊養護袋》: 外袋绒面超纖/内卡羊皮绒\r\n\r\n《 祈願．愛情丹．月老姻緣香 》: 玻璃瓶\r\n\r\n商品規格: 三件販售\r\n\r\n商品尺寸: \r\n\r\n禮盒: 28x14.1x5.1cm\r\n\r\n《 祈願．月老姻緣香．純銀手鍊 》: 淡水珍珠，形狀大小皆不同(±1.5mm)，細微坑洞及凹痕為天然形成非屬瑕疵\r\n\r\n《 祈願．月老姻緣香 》手鍊護養袋: 7.3x7.3cm(內附項鍊卡)\r\n\r\n', '這是個運送政策，適合加入與運送方法、包裝和費用相關的資訊。撰寫政策時，請盡量開門見山，以便建立互信，讓顧客有信心購買您的產品。\r\n                                ', 'uploads/P9.png'),
(4, '月老星君加持月皮製御守', 700, 100, '????月老星君加持月皮製御守\r\n旗山天后宮【#月老星君】賜福\r\n\r\n富貴良緣御守+符紋一卡通\r\n帶在身上\r\n感情穩定\r\n有情人終成眷屬 \r\n良緣早顯  辛福美滿  比翼雙飛\r\n事業上讓你招來貴人\r\n人緣桃花運朵朵開????????????', '????款式一\r\n御守裡放「符紙」\r\n\r\n????款式二\r\n御守裡放「一卡通功能符紙」', '這是個運送政策，適合加入與運送方法、包裝和費用相關的資訊。撰寫政策時，請盡量開門見山，以便建立互信，讓顧客有信心購買您的產品。\r\n                                ', 'uploads/P1.png'),
(6, '愛情能量水晶', 590, 77, '愛情，它不是生活的重心\r\n\r\n但是，它是點亮生活的那顆星\r\n\r\n⭐️⭐️⭐️⭐️⭐️⭐️\r\n\r\n願大家，找到點亮生活的那顆星\r\n\r\n也願生活的灰暗，有光明的一處????\r\n\r\n\r\n\r\n❤️❤️有新增綠草莓晶款喔～❤️❤️（水晶效果都一樣呦）\r\n\r\n⚠️綠水晶最近較大顆一些，在意大小顆一致的，要想好再下單嘿⚠️\r\n\r\n⚠️草莓晶最近較大顆一點，在意大小顆一致的，要想好再下單嘿⚠️\r\n\r\n\r\n\r\n月老爺爺牽線～\r\n\r\n愛情降臨～❤️❤️❤️', '信者恆信～大家還是要理智消費呦～\r\n\r\n不要想說帶上去妳/你就無敵了～????????????????????\r\n\r\n沒有這樣啦～????自己還是要努力啦～\r\n\r\n無論是走出舒適圈多方認識，或是給自己機會多多交友，不是要妳/你去亂認識嘿～\r\n\r\n或是暗戀的誰希望更近一步，或是情侶/夫妻之間想要更加美好\r\n\r\n都需要你釋放訊息或動作對方才會知道呀～對吧～\r\n\r\n然後不要粉紅泡泡想像嘿～那是偶像劇～????\r\n\r\n然後很多其實互相都不適合的，妳/你就真的不要再自己騙自己了\r\n\r\n妳/你要懂的心疼自己，別一直讓', '這是個運送政策，適合加入與運送方法、包裝和費用相關的資訊。撰寫政策時，請盡量開門見山，以便建立互信，讓顧客有信心購買您的產品。\r\n                                ', 'uploads/P6.png'),
(7, '月老手鍊 已過爐 桃花 姻緣 人緣 愛情 復合 情侶手鍊 手鍊', 300, 92, '✅每一條手鍊手圍約15～20公分，長度可以自行調整！\r\n\r\n\r\n\r\n✅手鍊不方便戴在手上的話，也可以放在隨身包包、錢包裡面，不會影響效用！\r\n\r\n\r\n\r\n✅ 佩戴上沒有禁忌，手鏈是防水的，可以直接戴著洗澡！', '????「異性戀、同性戀都可以戴」\r\n\r\n\r\n\r\n????紅色款和 ⚫️黑色款的功效是一樣的！！！男生和女生紅色或黑色都可以戴！！！情侶、夫妻買給另一半戴也很適合！！！\r\n\r\n\r\n\r\n????「府城四大月老手鍊」介紹????\r\n\r\n男女感情之事變化萬千，分別由府城四大月老公對症下藥，然而外面所販售的月老紅繩皆是單一一間廟過爐加持，戴那麼多條紅繩在手上一來不好看，二來穿戴不便、容易弄丟。這一條經過「四種」加持的「府城四大月老手鍊」，能夠替佩戴的人全方位加持府城四大月老公分別處理的專門事項！！！', '這是個運送政策，適合加入與運送方法、包裝和費用相關的資訊。撰寫政策時，請盡量開門見山，以便建立互信，讓顧客有信心購買您的產品。\r\n                                ', 'uploads/P4.png'),
(8, '甜作之盒', 3000, 41, '一年一度七夕情人節又要來啦～看著身邊朋友過得甜甜蜜蜜，身為單身狗的你們是不是狗糧都快吃飽啦？而且疫情期間還無法親自拜月老，今年七夕看來只能繼續躲在家裡防疫了⋯⋯別擔心！妞妞們的心聲月老都聽到啦～廟方在今年特別與森永牛奶糖合作，推出「甜作之盒」禮盒組，只要在7月21日以前訂購，霞海城隍廟就會親自幫各位祈福喔', '單身的妞妞們趕快豎起耳朵，這款「甜作之盒」將會是各位今年的救星！因為疫情的關係，廟宇都紛紛關閉，大家也無法到現場參拜求姻緣，但各位不用擔心，你們的網路月老已經上線啦～讓「甜作之盒」裡的豐富愛情信仰小物，完整你今年的七夕吧。', '這是個運送政策，適合加入與運送方法、包裝和費用相關的資訊。撰寫政策時，請盡量開門見山，以便建立互信，讓顧客有信心購買您的產品。\r\n                                ', 'uploads/P7.jpeg'),
(11, '????桃花滿滿????爆花晶狐仙桃花手串', 350, 100, '????樂成宮月老廟加持????桃花滿滿????爆花晶狐仙桃花手串✨招桃花、好人緣、遇貴人\r\n\r\n\r\n\r\n????小眾新款????爆花晶狐仙桃花手串✨招桃花、好人緣、遇貴人\r\n\r\n\r\n\r\n✔️兩種款式\r\n\r\n\r\n\r\n✨純淨優雅款\r\n\r\n✨絢彩秘境款\r\n\r\n\r\n\r\n☑️賣場全館100%實拍\r\n\r\n☑️珠徑約為8mm\r\n\r\n☑️招桃花、好人緣、遇貴人\r\n\r\n☑️小眾ins風格氣質????️????️\r\n\r\n\r\n\r\n⚠️狐狸的風水作用\r\n\r\n\r\n\r\n1，增加異性緣。若有情侶者，可以改善你與另一半的感情，帶給你愉', '❤️日常使用與保養小知識\r\n\r\n1.避免長時間在陽光下曝曬\r\n\r\n2.避免沾染化學物質，游泳、泡溫泉記得取下唷！\r\n\r\n3.有些水晶寶石硬度較低，需避免大力碰撞\r\n\r\n4.若有純銀、14K、18K金配飾，盡量避免碰水保持乾燥，日常使用拭銀布擦去表面氧化物，可延長配飾使用時間唷！\r\n\r\n\r\n\r\n✨所有天然水晶礦石類商品皆親自祈福淨化\r\n\r\n✨賣場所有商品均是現貨販售無需預購等待', '這是個運送政策，適合加入與運送方法、包裝和費用相關的資訊。撰寫政策時，請盡量開門見山，以便建立互信，讓顧客有信心購買您的產品。\r\n                                ', 'uploads/P5.png'),
(12, '御守月下老人姻緣御守', 250, 100, '位於迪化街的台北霞海城隍廟\r\n是網友公認台灣最靈驗月老廟之一????✨\r\n\r\n讓月老能更順利幫你牽線 ????\r\n請放心\r\n全部香火袋❤️????都有放在供桌\r\n並且跟月下老人以及城隍爺稟報????????\r\n\r\n祝福收到的人有情人終成眷屬❤️❤️❤️\r\n\r\n靈驗台北3大月老廟，求紅線、桃花\r\n????????龍山寺跟霞海都是蠻靈驗❤️\r\n推薦給大家????', '台北霞海城隍廟御守 護身符 ✨\r\n\r\n全部都有統一稟報過火????\r\n❤️每一個御守\r\n加贈送廟方的平安卡！\r\n✨都會美美包好請放心❤️會在有可愛袋子\r\n????????獨家贈手寫小卡一張\r\n\r\n\r\n也歡迎加購明信片或卡片代寫祝福㊗️\r\n\r\n????❤️送禮自用兩相宜！\r\n\r\n御守真的超級漂亮❤️????\r\n\r\n祈福????????', '這是個運送政策，適合加入與運送方法、包裝和費用相關的資訊。撰寫政策時，請盡量開門見山，以便建立互信，讓顧客有信心購買您的產品。\r\n                                ', 'uploads/P8.png'),
(13, '1尺3 植髮 活眼 月老星君 安金 按金 月老 月下老人', 25000, 10, '品名：植髮活眼月老星君\r\n尺寸：1尺3\r\n材質：江西樟\r\n\r\n附開光筆開光鏡  \r\n可找老師代為開光(可錄影)\r\n開光紅包另計', '購賣商品後，關注我們賣場✅，再幫我們商品點個❤️，享小禮物乙個唷！????????????\r\n\r\n#月老星君\r\n#月下老人\r\n#月老', '這是個運送政策，適合加入與運送方法、包裝和費用相關的資訊。撰寫政策時，請盡量開門見山，以便建立互信，讓顧客有信心購買您的產品。\r\n                                ', 'uploads/P2.png');

-- --------------------------------------------------------

--
-- 資料表結構 `service`
--

CREATE TABLE `service` (
  `service_id` int(10) NOT NULL,
  `service_title` varchar(255) NOT NULL,
  `service_content` varchar(255) NOT NULL,
  `service_image` varchar(255) NOT NULL,
  `service_date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- 資料表結構 `temple`
--

CREATE TABLE `temple` (
  `temple_id` int(10) NOT NULL,
  `temple_account` varchar(255) NOT NULL,
  `temple_password` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- 已傾印資料表的索引
--

--
-- 資料表索引 `ask`
--
ALTER TABLE `ask`
  ADD PRIMARY KEY (`ask_id`),
  ADD KEY `member_id` (`member_id`);

--
-- 資料表索引 `blessing`
--
ALTER TABLE `blessing`
  ADD PRIMARY KEY (`blessing_id`);

--
-- 資料表索引 `cart_main`
--
ALTER TABLE `cart_main`
  ADD PRIMARY KEY (`cart_id`),
  ADD KEY `member_id` (`member_id`);

--
-- 資料表索引 `cart_secondary`
--
ALTER TABLE `cart_secondary`
  ADD PRIMARY KEY (`cart_secondary_id`),
  ADD KEY `cart_id` (`cart_id`),
  ADD KEY `product_id` (`product_id`);

--
-- 資料表索引 `donation`
--
ALTER TABLE `donation`
  ADD PRIMARY KEY (`donation_id`),
  ADD KEY `member_id` (`member_id`);

--
-- 資料表索引 `draw_lots`
--
ALTER TABLE `draw_lots`
  ADD PRIMARY KEY (`draw_id`);

--
-- 資料表索引 `fortune`
--
ALTER TABLE `fortune`
  ADD PRIMARY KEY (`fortune_id`);

--
-- 資料表索引 `joss`
--
ALTER TABLE `joss`
  ADD PRIMARY KEY (`joss_Id`);

--
-- 資料表索引 `joss_money`
--
ALTER TABLE `joss_money`
  ADD PRIMARY KEY (`joss_id`),
  ADD KEY `member_id` (`member_id`);

--
-- 資料表索引 `light_record`
--
ALTER TABLE `light_record`
  ADD PRIMARY KEY (`light_record_id`),
  ADD KEY `light_id` (`light_id`),
  ADD KEY `member_id` (`member_id`);

--
-- 資料表索引 `light_up`
--
ALTER TABLE `light_up`
  ADD PRIMARY KEY (`light_id`),
  ADD KEY `light_up_ibfk_1` (`joss_Id`);

--
-- 資料表索引 `member`
--
ALTER TABLE `member`
  ADD PRIMARY KEY (`member_id`);

--
-- 資料表索引 `order_record`
--
ALTER TABLE `order_record`
  ADD PRIMARY KEY (`order_id`),
  ADD KEY `member_id` (`member_id`),
  ADD KEY `cart_id` (`cart_id`);

--
-- 資料表索引 `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`product_id`);

--
-- 資料表索引 `service`
--
ALTER TABLE `service`
  ADD PRIMARY KEY (`service_id`);

--
-- 資料表索引 `temple`
--
ALTER TABLE `temple`
  ADD PRIMARY KEY (`temple_id`);

--
-- 在傾印的資料表使用自動遞增(AUTO_INCREMENT)
--

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `ask`
--
ALTER TABLE `ask`
  MODIFY `ask_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `blessing`
--
ALTER TABLE `blessing`
  MODIFY `blessing_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=93;

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `cart_main`
--
ALTER TABLE `cart_main`
  MODIFY `cart_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=39;

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `cart_secondary`
--
ALTER TABLE `cart_secondary`
  MODIFY `cart_secondary_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=45;

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `donation`
--
ALTER TABLE `donation`
  MODIFY `donation_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `draw_lots`
--
ALTER TABLE `draw_lots`
  MODIFY `draw_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=54;

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `fortune`
--
ALTER TABLE `fortune`
  MODIFY `fortune_id` int(10) NOT NULL AUTO_INCREMENT;

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `joss`
--
ALTER TABLE `joss`
  MODIFY `joss_Id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `joss_money`
--
ALTER TABLE `joss_money`
  MODIFY `joss_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `light_record`
--
ALTER TABLE `light_record`
  MODIFY `light_record_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `light_up`
--
ALTER TABLE `light_up`
  MODIFY `light_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `member`
--
ALTER TABLE `member`
  MODIFY `member_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `order_record`
--
ALTER TABLE `order_record`
  MODIFY `order_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `product`
--
ALTER TABLE `product`
  MODIFY `product_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `service`
--
ALTER TABLE `service`
  MODIFY `service_id` int(10) NOT NULL AUTO_INCREMENT;

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `temple`
--
ALTER TABLE `temple`
  MODIFY `temple_id` int(10) NOT NULL AUTO_INCREMENT;

--
-- 已傾印資料表的限制式
--

--
-- 資料表的限制式 `ask`
--
ALTER TABLE `ask`
  ADD CONSTRAINT `ask_ibfk_1` FOREIGN KEY (`member_id`) REFERENCES `member` (`member_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- 資料表的限制式 `cart_main`
--
ALTER TABLE `cart_main`
  ADD CONSTRAINT `cart_main_ibfk_1` FOREIGN KEY (`member_id`) REFERENCES `member` (`member_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- 資料表的限制式 `cart_secondary`
--
ALTER TABLE `cart_secondary`
  ADD CONSTRAINT `cart_secondary_ibfk_1` FOREIGN KEY (`cart_id`) REFERENCES `cart_main` (`cart_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `cart_secondary_ibfk_2` FOREIGN KEY (`product_id`) REFERENCES `product` (`product_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- 資料表的限制式 `donation`
--
ALTER TABLE `donation`
  ADD CONSTRAINT `donation_ibfk_1` FOREIGN KEY (`member_id`) REFERENCES `member` (`member_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- 資料表的限制式 `joss_money`
--
ALTER TABLE `joss_money`
  ADD CONSTRAINT `joss_money_ibfk_1` FOREIGN KEY (`member_id`) REFERENCES `member` (`member_id`);

--
-- 資料表的限制式 `light_record`
--
ALTER TABLE `light_record`
  ADD CONSTRAINT `light_record_ibfk_2` FOREIGN KEY (`light_id`) REFERENCES `light_up` (`light_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `light_record_ibfk_3` FOREIGN KEY (`member_id`) REFERENCES `member` (`member_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- 資料表的限制式 `light_up`
--
ALTER TABLE `light_up`
  ADD CONSTRAINT `light_up_ibfk_1` FOREIGN KEY (`joss_Id`) REFERENCES `joss` (`joss_Id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- 資料表的限制式 `order_record`
--
ALTER TABLE `order_record`
  ADD CONSTRAINT `order_record_ibfk_1` FOREIGN KEY (`member_id`) REFERENCES `member` (`member_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `order_record_ibfk_2` FOREIGN KEY (`cart_id`) REFERENCES `cart_main` (`cart_id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
