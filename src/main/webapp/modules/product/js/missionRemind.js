/**
 * Created by Seymour on 2016/10/26.
 */
//新增
function addMissionRemind() {
    var array = new Array();
    var date = $("#dateValues")[0];
    var temp = date.value.split("");
    var flag = true;
    temp.forEach(function (c) {
        if (c == ',' && temp.length > 2 && flag){
            flag = false;
        }else if (c != ',' && temp.length <= 2 && flag){
            flag = false;
        }
    });
    if (flag) {
        // alert("您输入的时间间隔值格式错误，正确格式为:1,2,3,.....");
        layer.alert('您输入的时间间隔值格式错误，正确格式为:1,2,3,.....', {
            skin: 'layui-layer-lan'
            ,closeBtn: 0
            ,shift: 4 //动画类型
        });
        return;
    }else {
        // if (confirm("请确认是否添加此次任务提醒?")) {
        layer.confirm('请确认是否添加此次任务提醒?', {
            skin: 'layui-layer-lan'
            , closeBtn: 0
            , shift: 4 //动画类型
        }, function temp() {
            var type = document.getElementById("taskType").value;
            var code = document.getElementById("taskCode").value;
            var wd = document.getElementById("wd").value;
            var dateValues = document.getElementById("dateValues").value;
            var weeks = document.getElementsByName("week");
            for (var i = 0; i < weeks.length; ++i) {
                if (weeks[i].checked) {
                    array.push(weeks[i].value);
                }
            }
            if (type == '') {
                // alert("请选择任务类别！");
                layer.alert('请选择任务类别！', {
                    skin: 'layui-layer-lan'
                    , closeBtn: 0
                    , shift: 4 //动画类型
                });
                return;
            }
            if (code == '') {
                // alert("请选择任务项！");
                layer.alert('请选择任务项！', {
                    skin: 'layui-layer-lan'
                    , closeBtn: 0
                    , shift: 4 //动画类型
                });
                return;
            } else {
                $.ajax({
                    url: path + "/product/saveAdd",
                    data: {
                        "taskType": type,
                        "taskCode": code,
                        "taskWD": wd,
                        "dateValues": dateValues,
                        "weeks": array.toString()
                    },
                    dataType: "json",
                    success: function (result) {
                        if (result.msg == '1') {
                            // alert("保存成功!");
                            layer.alert('保存成功！', {
                                skin: 'layui-layer-lan'
                                , closeBtn: 0
                                , shift: 4 //动画类型
                            });
                            var list = result.obj;
                            var taskObj = document.getElementsByName("taskId");
                            $("#formData tr:not(:first-child)").remove();
                            for (var i = 0; i < list.length; ++i) {
                                var str = "<tr name='taskId'><td><input type='checkbox' value='" + list[i]["id"] + "'/></td><td><p>" + list[i]["id"]
                                    + "</p></td><td><p>" + list[i]["taskType"] + "</p></td><td><p>" + list[i]["task_name"]
                                    + "</p></td><td><p>" + list[i]["dateType"] + "</p></td><td><p>" + list[i]["date_values"]
                                    + "</p></td></tr>";
                                $("#formData").append(str);
                            }
                        } else {
                            // alert("保存失败！");
                            layer.alert('保存失败！', {
                                skin: 'layui-layer-lan'
                                , closeBtn: 0
                                , shift: 4 //动画类型
                            });
                        }
                    }
                });
            }
        });
    }
}

function temp() {
    var type = document.getElementById("taskType").value;
    var code = document.getElementById("taskCode").value;
    var wd = document.getElementById("wd").value;
    var dateValues = document.getElementById("dateValues").value;
    var weeks = document.getElementsByName("week");
    for (var i = 0; i < weeks.length; ++i) {
        if (weeks[i].checked) {
            array.push(weeks[i].value);
        }
    }
    if (type == '') {
        // alert("请选择任务类别！");
        layer.alert('请选择任务类别！', {
            skin: 'layui-layer-lan'
            ,closeBtn: 0
            ,shift: 4 //动画类型
        });
        return;
    }
    if (code == '') {
        // alert("请选择任务项！");
        layer.alert('请选择任务项！', {
            skin: 'layui-layer-lan'
            ,closeBtn: 0
            ,shift: 4 //动画类型
        });
        return;
    } else {
        $.ajax({
            url: path + "/product/saveAdd",
            data: {
                "taskType": type,
                "taskCode": code,
                "taskWD": wd,
                "dateValues": dateValues,
                "weeks": array.toString()
            },
            dataType: "json",
            success: function (result) {
                if (result.msg == '1') {
                    alert("保存成功!");
                    var list = result.obj;
                    var taskObj = document.getElementsByName("taskId");
                    $("#formData tr:not(:first-child)").remove();
                    for (var i = 0; i < list.length; ++i) {
                        var str = "<tr name='taskId'><td><input type='checkbox' value='" + list[i]["id"] + "'/></td><td><p>" + list[i]["id"]
                            + "</p></td><td><p>" + list[i]["taskType"] + "</p></td><td><p>" + list[i]["task_name"]
                            + "</p></td><td><p>" + list[i]["dateType"] + "</p></td><td><p>" + list[i]["date_values"]
                            + "</p></td></tr>";
                        $("#formData").append(str);
                    }
                } else {
                    alert("保存失败！");
                }
            }
        });
    }
}

function deleteTask() {
    var list = document.getElementsByName("taskId");
    var str = new Array();
    for (var i=0;i<list.length;++i){
        var ftd = list[i].childNodes;
        for (var j=0;j<ftd.length;++j) {
            var temp = ftd.item(j).firstChild;
            if (temp != null && temp.type == "checkbox") {
                if (temp.checked)
                    str.push(temp.value);
            }
        }
    }
    if (str == []){
        alert("请选择需要删除的任务！");
    } else {
        $.ajax({
            url:path + "/product/deleteTask",
            data:{"id":str.toString()},
            dataType:"json",
            success:function (result) {
                if (result.msg == '1'){
                    alert("删除成功！");
                    var list = result.obj;
                    var taskObj = document.getElementsByName("taskId");
                    $("#formData tr:not(:first-child)").remove();
                    for (var i=0; i<list.length; ++i){
                        var str = "<tr name='taskId'><td><input type='checkbox' value='"+list[i]["id"]+"'/></td><td><p>"+list[i]["id"]
                            + "</p></td><td><p>"+list[i]["taskType"]+"</p></td><td><p>"+list[i]["task_name"]
                            + "</p></td><td><p>"+list[i]["dateType"]+"</p></td><td><p>"+list[i]["date_values"]
                            + "</p></td></tr>";
                        $("#formData").append(str);
                    }
                }else{
                    alert(result.msg);
                }
            }
        })
    }
}
function queryNext(){
    var taskType = document.getElementById("taskType").value;
    $.ajax({
        url:path + "/product/queryTask",
        data:{"task_type": taskType},
        dataType:"json",
        success:function (result) {
            var list = result.obj;
            if (result.msg == "1"){
                $("#taskCode option").remove();
                for (var i=0; i<list.length; ++i){
                    $("#taskCode").append("<option value=" +list[i]["task_id"]+">"+ list[i]["task_name"]+"</option>")
                }
            }
        }
    })
}