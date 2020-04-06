

class doCusine{

  final String cusineid;
  final String cusinename;
  final String status;

  doCusine({this.cusineid,this.cusinename,this.status});

  doCusine.fromJson(Map<String,dynamic> parsedJson)
    : cusineid = parsedJson['cusineid'],
      cusinename = parsedJson['cusinename'],
        status = parsedJson['status'];
}