function fnName() {
    $("#TextBoxId").autocomplete({
        source: function (request, response) {
            $.ajax({
                url: "WebserviceUrl", // ex. "../Webservice.asmx/GetList"

                data: "{'prefix': '" + request.term + "'}",
                type: "POST",
                dataType: "Json",
                contentType: "application/json;charset=utf-8",
                success: function (data) {
                    response(data.d);
                },
                error: function () {
                    alert("url error!");
                }
            });
        }

    });

}