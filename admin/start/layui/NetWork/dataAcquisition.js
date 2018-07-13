let QueryFieldInterface = dataUrl + "admin/Program/QueryField"; //前端列表接口地址
let CheckTableInterface = dataUrl + "admin/Column/CheckTable"; //查询表的接口
let NewTableInterface = dataUrl + "admin/Column/newTable"; //新建表接口



//获取前端列表
// let findOrgDataDicList = (params, callback, err) => {
//   dataLink.FetchUtil.dataLinkPostJson(findOrgDataDicListInterface, params, callback, err)
// }

//查询数据
let QueryFieldDo = (params, callback, err) => {
  dataLinkPostJson(QueryFieldInterface, params, callback, err)
}

//新建表
let NewTableDo = (params, callback, err) => {
  dataLinkPostJson(QueryFieldInterface, params, callback, err)
}