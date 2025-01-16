class Model {
  String apikey;
  List<Datum> data;
  String status;
  Info info;

  Model({
    required this.apikey,
    required this.data,
    required this.status,
    required this.info,
  });

  // Factory constructor to  JSON response to Model 
  factory Model.fromJson(Map<String, dynamic> json) {
    return Model(
      apikey: json['apikey'],
      data: List<Datum>.from(json['data'].map((x) => Datum.fromJson(x))),
      status: json['status'],
      info: Info.fromJson(json['info']),
    );
  }
}

class Datum {
  String id;
  String name;
  String matchType;
  String status;
  String venue;
  DateTime date;
  DateTime dateTimeGmt;
  List<String> teams;
  List<Score> score;
  String seriesId;
  bool fantasyEnabled;
  bool bbbEnabled;
  bool hasSquad;
  bool matchStarted;
  bool matchEnded;
  List<TeamInfo>? teamInfo;

  Datum({
    required this.id,
    required this.name,
    required this.matchType,
    required this.status,
    required this.venue,
    required this.date,
    required this.dateTimeGmt,
    required this.teams,
    required this.score,
    required this.seriesId,
    required this.fantasyEnabled,
    required this.bbbEnabled,
    required this.hasSquad,
    required this.matchStarted,
    required this.matchEnded,
    this.teamInfo,
  });

  // Factory constructor to map Datum data
  factory Datum.fromJson(Map<String, dynamic> json) {
    return Datum(
      id: json['id'],
      name: json['name'],
      matchType: json['matchType'],
      status: json['status'],
      venue: json['venue'],
      date: DateTime.parse(json['date']),
      dateTimeGmt: DateTime.parse(json['dateTimeGMT']),
      teams: List<String>.from(json['teams']),
      score: List<Score>.from(json['score'].map((x) => Score.fromJson(x))),
      seriesId: json['series_id'],
      fantasyEnabled: json['fantasyEnabled'],
      bbbEnabled: json['bbbEnabled'],
      hasSquad: json['hasSquad'],
      matchStarted: json['matchStarted'],
      matchEnded: json['matchEnded'],
      teamInfo: json['teamInfo'] != null
          ? List<TeamInfo>.from(
              json['teamInfo'].map((x) => TeamInfo.fromJson(x)))
          : null,
    );
  }
}

class Score {
  int r;
  int w;
  double o;
  String inning;

  Score({
    required this.r,
    required this.w,
    required this.o,
    required this.inning,
  });

  // Factory constructor to map Score data
  factory Score.fromJson(Map<String, dynamic> json) {
    return Score(
      r: json['r'],
      w: json['w'],
      o: json['o'].toDouble(),
      inning: json['inning'],
    );
  }
}

class TeamInfo {
  String name;
  String shortname;
  String img;

  TeamInfo({
    required this.name,
    required this.shortname,
    required this.img,
  });

  // Factory constructor to map TeamInfo data
  factory TeamInfo.fromJson(Map<String, dynamic> json) {
    return TeamInfo(
      name: json['name'],
      shortname: json['shortname'],
      img: json['img'],
    );
  }
}

class Info {
  int hitsToday;
  int hitsUsed;
  int hitsLimit;
  int credits;
  int server;
  int offsetRows;
  int totalRows;
  double queryTime;
  int s;
  int cache;

  Info({
    required this.hitsToday,
    required this.hitsUsed,
    required this.hitsLimit,
    required this.credits,
    required this.server,
    required this.offsetRows,
    required this.totalRows,
    required this.queryTime,
    required this.s,
    required this.cache,
  });

  // Factory constructor to map Info data
  factory Info.fromJson(Map<String, dynamic> json) {
    return Info(
      hitsToday: json['hitsToday'],
      hitsUsed: json['hitsUsed'],
      hitsLimit: json['hitsLimit'],
      credits: json['credits'],
      server: json['server'],
      offsetRows: json['offsetRows'],
      totalRows: json['totalRows'],
      queryTime: json['queryTime'],
      s: json['s'],
      cache: json['cache'],
    );
  }
}
