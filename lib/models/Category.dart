class Category {
  int _id, _parent, _sortorder, _coursecount, _visible, _visibleold, _timemodified, _depth;
  String _name, _idnumber, _description, _descriptionformat, _path, _theme;

	Category(this._id, this._name, this._idnumber, this._description, this._descriptionformat, this._parent, this._sortorder, this._coursecount, this._visible, 
      this._visibleold, this._timemodified, this._depth, this._path, this._theme);
  
	int get id => _id;
	String get name => _name;
	String get idnumber => _idnumber;
	String get description => _description;
	String get descriptionformat => _descriptionformat;
	int get parent => _parent;
	int get sortorder => _sortorder;
	int get coursecount => _coursecount;
	int get visible => _visible;
	int get visibleold => _visibleold;
	int get timemodified => _timemodified;
	int get depth => _depth;
	String get path => _path;
	String get theme => _theme;

	set idnumber(String isIdnumber) {
		this._idnumber = isIdnumber;
	}

	set description(String newDescription) {
		if (newDescription.length <= 10) {
			this._description = newDescription;
		}
	}

	set descriptionformat(String newDescriptionformat) {
		this._descriptionformat = newDescriptionformat;
	}

	set parent(int newParent) {
		this._parent = newParent;
	}

	set sortorder(int newSortorder) {
		this._sortorder = newSortorder;
	}

	set coursecount(int newCoursecount) {
		this._coursecount = newCoursecount;
	}

	set visible(int newVisible) {
		this._visible = newVisible;
	}

	set visibleold(int newVisibleold) {
		this._visibleold = newVisibleold;
	}

	set timemodified(int newTimemodified) {
		this._timemodified = newTimemodified;
	}

	set depth(int newDepth) {
		this._depth = newDepth;
	}

	set path(String newPath) {
		this._path = newPath;
	}

	set theme(String newTheme) {
		this._theme = newTheme;
	}

	// Convert a Note object into a Map object
	Map<String, dynamic> toMap() {

		var map = Map<String, dynamic>();
		map['id'] = _id;
		map['name'] = _name;
		map['idnumber'] = _idnumber;
		map['description'] = _description;
		map['descriptionformat'] = _descriptionformat;
		map['parent'] = _parent;
		map['sortorder'] = _sortorder;
		map['coursecount'] = _coursecount;
		map['visible'] = _visible;
		map['visibleold'] = _visibleold;
		map['timemodified'] = _timemodified;
		map['depth'] = _depth;
		map['path'] = _path;
		map['theme'] = _theme;
		return map;
	}

	// Extract a Note object from a Map object
	Category.fromMapObject(Map<String, dynamic> map) {
		this._id = map['id'];
		this._name = map['name'];
		this._idnumber = map['idnumber'];
		this._description = map['description'];
		this._descriptionformat = map['descriptionformat'];
		this._parent = map['parent'];
		this._sortorder = map['sortorder'];
		this._coursecount = map['coursecount'];
		this._visible = map['visible'];
		this._visibleold = map['visibleold'];
		this._timemodified = map['timemodified'];
		this._depth = map['depth'];
		this._path = map['path'];
		this._theme = map['theme'];
	}
}
