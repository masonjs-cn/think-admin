//获取新闻列表数据
function QueryField(params, getdata) {
	// params.classid = sysClassid.sysClassid.newsClassid;
	QueryFieldDo(params, (res) => {
		if (res.flag != 1) {
			getdata("获取数据失败");
		};
		let Jsondata = res.infos;
		getdata(Jsondata);
	}, (err) => {
		getdata("获取数据失败");
	}, )
}

