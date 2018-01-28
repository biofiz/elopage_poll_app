$(function(){
    $("#add").click(function(e){
        e.preventDefault();
        var count = $("#answers input").length + 1;
        var html = "<div class='form-group row answer'> " +
                       "<div class='col-sm-10'>" +
                          "<input class='form-control' type='text' name='poll[answer_options][answer" + count +"]'" +
                          "id='poll_answer" + count + "'>" +
                       "</div>" +
                       "<div class='col-sm-2'>" +
                           "<a href='#' class='delete-answer'> Delete </a>" +
                       "</div>" +
                   "</div>";
        $('#answers').append(html);

        $(document).on('click', '.delete-answer', function(e) {
            e.preventDefault();
            $(e.target).parents("#answers .answer").remove();
        })
    });

    $(document).on('click', '.delete-answer', function(e) {
        e.preventDefault();
        $(e.target).parents("#answers .answer").remove();
    })
});

