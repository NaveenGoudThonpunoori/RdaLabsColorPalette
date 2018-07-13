$( document ).ready(function() {
    $('.grid_color').click(function () {
        $(this).css("background-color", $('#color_picker').val());
        $.ajax({
            type: "POST",
            beforeSend: function(xhr) {
                xhr.setRequestHeader('X-CSRF-Token',
                    $('meta[name="csrf-token"]').attr('content'))
            },
            url: "/grids/set_or_update_color",
            data: {
                color:  $('#color_picker').val(),
                position: $(this).attr('position')
            },
            success: function (data, status, xhr) {
                if(status == "success") {
                    alert("Sucessfully updated");
                }else{
                    alert("Some Issue Occured. Will Fix and get back to you soon ")
                }

            },
            error: function () {
                alert("Server Error, Will fix and get back to you");
            }
        });

    });
});