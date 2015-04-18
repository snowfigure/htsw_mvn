<script type="text/javascript">
    $(function () {
        $.ajax({
            type: 'POST',
            url: '/article/',
            dataType: 'json',
            data: {
                aid:${aid!},
            },
            success: function (data) {
                if (data == "false") {
                    $('#right-article-content').html("错误的页面");
                }
                else {
                    $('#right-article-content').html(data.content);
                    $('h1').html(data.title);
                }
            }
        });
    });
</script>