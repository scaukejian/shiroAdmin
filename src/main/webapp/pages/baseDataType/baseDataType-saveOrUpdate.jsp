<%@ page contentType="text/html;charset=UTF-8" language="java" %>
 <script src="baseDataType-list.js?${ts}"></script>

<div class="padd">
    <form id="baseDataType_box" method="post">
        <table class="table table-thead-box">
            <tbody>
                <tr>
                <th style="width:85px">编号：<span class="required">*</span></th>
                <td>
                    <div class="position form-group">
                        <input class="form-control" name="code" id="baseDataType_code" dataType="Require"/>
                        <input  name="id" id="baseDataType_id" type="hidden"/>
                    </div>
                </td>
            </tr>
            <tr>
                <th style="width:85px">名称：<span class="required">*</span></th>
                <td>
                    <div class="position form-group">
                        <textarea class="form-control" name="name" id="baseDataType_name" dataType="Require"></textarea>
                    </div>
                </td>
            </tr>
            </tbody>
        </table>
    </form>
</div>