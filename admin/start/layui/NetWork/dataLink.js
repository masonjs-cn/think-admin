//通过fetch获取数据
let JsonToFormdata = (param) => {
	var data = new FormData();
	for (var key in param) {
		var value = param[key];
		data.append(key, value);
	}
	return data;
}
/**
 * GET
 * 参数 - URL上
 * 返回 - String
 */
let dataLinkGetText = (url, callback, err) => {
	fetch(
		url, {
			method: 'GET',
		}
	).then((response) => {
		if (response.ok)
			return response.text();
		else
			err("error");
	}).then((responseText) => {
		callback(responseText)
	}).catch((error) => {
		err(error);
	}).done();;
}
/**
 * GET
 * 参数 - URL上
 * 返回 - Json
 */
let dataLinkGetJson = (url, callback, err) => {
	fetch(
		url, {
			method: 'GET',
			headers: { //这一段headers也许不要，要了可能出错或者要改成别的
				'Accept': 'application/json',
			},
		}
	).then((response) => {
		if (response.ok)
			return response.json();
		else
			err("error");
	}).then((responseJson) => {
		callback(responseJson);
	}).catch((error) => {
		err(error);
	}).done();
}
/**
 * POST
 * 参数 - Json
 * 返回 - String
 */
let dataLinkPostText = (url, params, callback, err) => {
	fetch(
		url, {
			method: 'POST',
			headers: { //这一段headers也许不要，要了可能出错或者要改成别的
				'Accept': '*/*',
				'encoding': 'UTF-8',
				'Content-Type': 'application/x-www-form-urlencoded'
			},
			body: this.JsonToFormdata(params)
		}
	).then((response) => {
		if (response.ok)
			return response.text();
		else
			console.log("err");
	}).then((responseText) => {
		callback(responseText);
	}).catch((error) => {
		err(error);
	}).done();
}
/**
 * POST
 * 参数 - Json
 * 返回 - Json
 */
let dataLinkPostJson = (url, params, callback, err) => {
	fetch(
		url, {
			method: 'POST',
			body: JsonToFormdata(params)
		}
	).then((response) => {
		if (response.ok)
			return response.json();
		else
			err("error");
	}).then((responseJson) => {
		callback(responseJson);
	}).catch((error) => {
		err(error);
	});
}
