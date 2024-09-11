class PlayData {
  final List<String> _watchList = ["직관", "집관"];
  final List<String> _stardiumList = [
    "서울종합운동장 야구장",
    "고척 스카이돔",
    "인천 SSG 랜더스필드",
    "수원 KT 위즈파크",
    "대전 한화 이글스 파크",
    "광주 KIA 챔피언스 필드",
    "대구 삼성 라이온즈 파크",
    "창원 NC 파크",
    "사직 야구장"
  ];
  final List<String> _teamList = [
    "두산 베어스",
    "LG 트윈스",
    "키움 히어로즈",
    "SSG 랜더스",
    "KT 위즈",
    "한화 이글스",
    "KIA 타이거즈",
    "삼성 라이온즈",
    "NC 다이노스",
    "롯데 자이언츠"
  ];

  PlayData();

  List<String> getWatchList() {
    return _watchList;
  }

  List<String> getStardiumList() {
    return _stardiumList;
  }

  List<String> getTeamList() {
    return _teamList;
  }
}
