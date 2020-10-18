class Course{
  int _id, _categoryid, _categorysortorder, _showgrades, _newsitems, _startdate, _enddate, _numsections, _maxbytes, _showreports, _visible;
  int _hiddensections, _groupmode, _groupmodeforce, _defaultgroupingid, _timecreated, _timemodified, _enablecompletion, _completionnotify, _summaryformat;
  String _shortname, _fullname, _displayname, _idnumber, _summary, _format, _lang, _forcetheme;
  //List<Courseformatoptions> courseformatoptions;
  //List<Customfields> customfields;
  /*Course(this._id,  this._shortname,  this._categoryid,  this._categorysortorder,  this._fullname,  this._displayname,  this._idnumber,  this._summary,  this._summaryformat,  
  this._format,  this._showgrades,  this._newsitems,  this._startdate,  this._enddate,  this._numsections,  this._maxbytes,  this._showreports,  this._visible,  
  this._hiddensections,  this._groupmode,  this._groupmodeforce,  this._defaultgroupingid,  this._timecreated,  this._timemodified,  this._enablecompletion,  
  this._completionnotify,  this._lang,  this._forcetheme);*/

  Course(this._id, this._categoryid, this._shortname, this._fullname, this._summary, this._format);

	int get id => _id;
	String get shortname => _shortname;
	int get categoryid => _categoryid;
	int get categorysortorder => _categorysortorder;
	String get fullname => _fullname;
	String get displayname => _displayname;
	String get idnumber => _idnumber;
	String get summary => _summary;
	int get summaryformat => _summaryformat;
	String get format => _format;
	int get showgrades => _showgrades;
	int get newsitems => _newsitems;
	int get startdate => _startdate;
	int get enddate => _enddate;
	int get numsections => _numsections;
	int get maxbytes => _maxbytes;
	int get showreports => _showreports;
	int get visible => _visible;
	int get hiddensections => _hiddensections;
	int get groupmode => _groupmode;
	int get groupmodeforce => _groupmodeforce;
	int get defaultgroupingid => _defaultgroupingid;
	int get timecreated => _timecreated;
	int get timemodified => _timemodified;
	int get enablecompletion => _enablecompletion;
	int get completionnotify => _completionnotify;
	String get lang => _lang;
	String get forcetheme => _forcetheme;
  
	set idnumber(String isIdnumber) {
		this._idnumber = isIdnumber;
	}

	set shortname(String isShortname) {
		this._shortname = isShortname;
	}

	set categoryid(int isCategoryid) {
		this._categoryid = isCategoryid;
	}

	set categorysortorder(int isCategorysortorder) {
		this._categorysortorder = isCategorysortorder;
	}

	set fullname(String isFullname) {
		this._fullname = isFullname;
	}

	set displayname(String isDisplayname) {
		this._displayname = isDisplayname;
	}

	set summary(String isSummary) {
		this._summary = isSummary;
	}

	set summaryformat(int isSummaryformat) {
		this._summaryformat = isSummaryformat;
	}

	set format(String isFormat) {
		this._format = isFormat;
	}

	set showgrades(int isShowgrades) {
		this._showgrades = isShowgrades;
	}

	set newsitems(int isNewsitems) {
		this._newsitems = isNewsitems;
	}

	set startdate(int isStartdate) {
		this._startdate = isStartdate;
	}

	set enddate(int isEnddate) {
		this._enddate = isEnddate;
	}

	set numsections(int isNumsections) {
		this._numsections = isNumsections;
	}

	set maxbytes(int isMaxbytes) {
		this._maxbytes = isMaxbytes;
	}

	set showreports(int isShowreports) {
		this._showreports = isShowreports;
	}

	set visible(int isVisible) {
		this._visible = isVisible;
	}

	set hiddensections(int isHiddensections) {
		this._hiddensections = isHiddensections;
	}

	set groupmode(int isGroupmode) {
		this._groupmode = isGroupmode;
	}

	set groupmodeforce(int isGroupmodeforce) {
		this._groupmodeforce = isGroupmodeforce;
	}

	set defaultgroupingid(int isDefaultgroupingid) {
		this._defaultgroupingid = isDefaultgroupingid;
	}

	set timecreated(int isTimecreated) {
		this._timecreated = isTimecreated;
	}

	set enablecompletion(int isEnablecompletion) {
		this._enablecompletion = isEnablecompletion;
	}

	set completionnotify(int isCompletionnotify) {
		this._completionnotify = isCompletionnotify;
	}

	set lang(String isLang) {
		this._lang = isLang;
	}

	set forcetheme(String isForcetheme) {
		this._forcetheme = isForcetheme;
	}

	// Convert a Note object into a Map object
	Map<String, dynamic> toMap() {
		var map = Map<String, dynamic>();
    map['id'] = _id;
    map['shortname'] = _shortname;
    map['categoryid'] = _categoryid;
    map['categorysortorder'] = _categorysortorder;
    map['fullname'] = _fullname;
    map['displayname'] = _displayname;
    map['idnumber'] = _idnumber;
    map['summary'] = _summary;
    map['summaryformat'] = _summaryformat;
    map['format'] = _format;
    map['showgrades'] = _showgrades;
    map['newsitems'] = _newsitems;
    map['startdate'] = _startdate;
    map['enddate'] = _enddate;
    map['numsections'] = _numsections;
    map['maxbytes'] = _maxbytes;
    map['showreports'] = _showreports;
    map['visible'] = _visible;
    map['hiddensections'] = _hiddensections;
    map['groupmode'] = _groupmode;
    map['groupmodeforce'] = _groupmodeforce;
    map['defaultgroupingid'] = _defaultgroupingid;
    map['timecreated'] = _timecreated;
    map['timemodified'] = _timemodified;
    map['enablecompletion'] = _enablecompletion;
    map['completionnotify'] = _completionnotify;
    map['lang'] = _lang;
    map['forcetheme'] = _forcetheme;
    return map;
  }

  // Extract a Note object from a Map object
  Course.fromMapObject(Map<String, dynamic> map) {
    this._id = map['id'];
    this._shortname = map['shortname'];
    this._categoryid = map['categoryid'];
    this._categorysortorder = map['categorysortorder'];
    this._fullname = map['fullname'];
    this._displayname = map['displayname'];
    this._idnumber = map['idnumber'];
    this._summary = map['summary'];
    this._summaryformat = map['summaryformat'];
    this._format = map['format'];
    this._showgrades = map['showgrades'];
    this._newsitems = map['newsitems'];
    this._startdate = map['startdate'];
    this._enddate = map['enddate'];
    this._numsections = map['numsections'];
    this._maxbytes = map['maxbytes'];
    this._showreports = map['showreports'];
    this._visible = map['visible'];
    this._hiddensections = map['hiddensections'];
    this._groupmode = map['groupmode'];
    this._groupmodeforce = map['groupmodeforce'];
    this._defaultgroupingid = map['defaultgroupingid'];
    this._timecreated = map['timecreated'];
    this._timemodified = map['timemodified'];
    this._enablecompletion = map['enablecompletion'];
    this._completionnotify = map['completionnotify'];
    this._lang = map['lang'];
    this._forcetheme = map['forcetheme'];
  }

}