$(function () {
    $("#ajax-search").select2({
        placeholder: "カードを検索",
        ajax: {
            url: "/search",
            dataType: 'json',
            delay: 250,
            type: 'GET',

            data: function (params) {
                return {
                    q: params.term
                };
            },
            processResults: function (data) {
                return {
                    results: $.map(data, function (obj) {
                        console.log(obj);
                        return {id: obj.board_id, text: obj.name + ':' + obj.title};
                    })
                };
            },
            cache: true
        },
        minimumInputLength: 1
    }).on("change", function (e) {
        location.href = '/boards/' + $("#ajax-search").val();
    });
});