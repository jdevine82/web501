jQuery(document).ready(function(jQuery) {
    $("tr").click(function() {
        window.document.location = $(this).data("link");
    });
});