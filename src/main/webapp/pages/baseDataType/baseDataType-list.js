window.bestMeet.baseDataType = function() {
	var pageData = page.pageParams;
	var listUrl = 'baseDataType/pageJson.do';
	var _from = $("#baseDataTypeForm");
	var windowWidth = 350;
	var windowHeight = 280;
	var hasCheckbox = true;
	var BaseDataTypeGrid = null;
	var initGrid = function() {
		var columns = [
				{
					name : '编号',
					renderer : function(data) {
						return '<a id="view">' + data.code + '</a>';
					},
					rendererCall : function(obj) {
						if ("view" === obj.id) {
							showBaseDataTypeInfo(obj.data.id);
						}
					}
				},
				{
					name : '名称',
					width : '50%',
					dataIndex : 'name'
				},
				{
					name : '操作',
					renderer : function(data) {
						if (data.status == '1') {
							return '<a id="update">修改</a>&nbsp;&nbsp;&nbsp;<a id="invalid">作废</a>';
						} else {
							return '<a id="update">修改</a>&nbsp;&nbsp;&nbsp;<a id="valid">恢复使用</a>';
						}

					},
					rendererCall : function(obj) {
						if (obj.id == 'update') {
							updateBaseDataType(obj.data.id);
						}
						if (obj.id == 'invalid') {
							modifyStatus(obj.data.id, 0);
						}
						if (obj.id == 'valid') {
							modifyStatus(obj.data.id, 1);
						}

					}
				} ];

		BaseDataTypeGrid = grid({
			renderTo : 'baseDataType_List_grid',
			prefix : 'baseDataType',
			columns : columns
		});
		BaseDataTypeGrid.init();
	};

	var modifyStatus = function(id, status) {
		util.bestMeetAjax({
			url : "baseDataType/modifyStatus/" + id + "-" + status + ".do",
			succFun : function(json) {
				if (json.errorMsg) {
					$.Prompt(json.errorMsg);
					return;
				}
				if (json.status == 'success') {
					loadData(pageData.page, pageData.pageSize);// 重新加载
				}
			}
		});
	}

	var pageTool = page({
		renderTo : "baseDataType_list_pagetool",
		pageSize : pageData.pageSize,
		subHandler : function(data) {
			pageData.page = data.currNo;
			pageData.pageSize = data.pageSize;
			loadData(data.currNo, data.pageSize);
		}
	});

	var loadData = function(page, pageSize) {
		var _data = $.extend(util.serializeJson(_from), {
			'page' : page,
			'pageSize' : pageSize
		});
		util.bestMeetAjax({
			url : listUrl,
			data : _data,
			succFun : function(json) {
				if (json.errorMsg) {
					$.Prompt(json.errorMsg);
					return;
				}
				BaseDataTypeGrid.addDatas({
					rowDatas : json.dataList
				});
				pageTool.render(json.total, page);
			}
		});
	};

	var uiInit = function() {
		initGrid();
		pageTool.init();
	};

	var showBaseDataTypeInfo = function(id) {
		var viewBaseDataTypeMsgBox = msgBox({
			title : '查看基本数据信息',
			width : windowWidth,
			height : windowHeight,
			url : "baseDataType/list/baseDataType-saveOrUpdate.do"
		});
		viewBaseDataTypeMsgBox.show();
		getBaseDataType(id);
		//查看禁用下拉列表与文本框
		util.disabledElement($("#baseDataType_box"));
	};

	var addBaseDataType = function() {
		var addBaseDataTypeMsgBox = msgBox({
			title : '新增基本数据',
			width : windowWidth,
			height : windowHeight,
			url : "baseDataType/list/baseDataType-saveOrUpdate.do",
			Btn : true,
			middleBtn : true,
			btnName : [ "确定", "取消" ],
			okHandle : function() {
				if (!Validator.Validate($("#baseDataType_box")[0], 3))
					return;
				var uObj = util.serializeJson($("#baseDataType_box"));
				util.bestMeetAjax({
					url : 'baseDataType/add.do',
					data : uObj,
					succFun : function(json) {
						if (json.errorMsg) {
							$.Prompt(json.errorMsg);
							return;
						}
						if (json != null && json.status == 'success') {
							$.Prompt("新增成功！");
							addBaseDataTypeMsgBox.close();
							loadData(pageData.page, pageData.pageSize);// 重新加载
						}
					}
				});
			}
		});
		addBaseDataTypeMsgBox.show();
	};

	var updateBaseDataType = function(id) {
		var updateBaseDataTypeMsgBox = msgBox({
			title : '修改基本数据信息',
			width : windowWidth,
			height : windowHeight,
			url : "baseDataType/list/baseDataType-saveOrUpdate.do",
			Btn : true,
			middleBtn : true,
			btnName : [ "确定", "取消" ],
			okHandle : function() {
				if (!Validator.Validate($("#baseDataType_box")[0], 3))
					return;
				util.bestMeetAjax({
					url : 'baseDataType/update.do',
					data : util.serializeJson($("#baseDataType_box")),
					succFun : function(json) {
						if (json.errorMsg) {
							$.Prompt(json.errorMsg);
							return;
						}
						if (json.status == 'success') {
							$.Prompt("修改成功！");
							updateBaseDataTypeMsgBox.close();
							loadData(pageData.page, pageData.pageSize);// 重新加载
						}
					}
				});
			}
		});
		updateBaseDataTypeMsgBox.show();
		getBaseDataType(id);
	};

	var getBaseDataType = function(id) {
		util.bestMeetAjax({
			url : "baseDataType/get/" + id + ".do",
			succFun : function(json) {
				if(json.errorMsg){
					$.Prompt(json.errorMsg);return;
				}
				if (json.data == null) {
					$.Prompt("获取基本数据信息失败！");
					return;
				}
				for ( var index in json.data) {
					$("#baseDataType_" + index).val(json.data[index]);
				}
			}
		});
	};

	var bindEvent = function() {
		// 查询
		$('#baseDataType_list_select').click(function() {
			pageData.page = 1;
			loadData(pageData.page, pageData.pageSize);
		});

		// 新增
		$('#baseDataType_add').click(function() {
			addBaseDataType();
		});

	};

	var queryDataInit = function() {
		// 下拉初始化
		util.bestMeetAjax({
			url : 'select/baseDataType.do',
			async : false,
			succFun : function(json) {
				var domMsgs = [ {
					domId : 'baseDataType',
					jsonObj : 'dataList',
					key : 'code',
					value : 'name'
				} ];
				util.selectPadData(domMsgs, json);
			}
		});
	};

	var init = function() {
		uiInit();
		bindEvent();
		queryDataInit();
	};

	return {
		init : init,
		load : loadData
	};
};
