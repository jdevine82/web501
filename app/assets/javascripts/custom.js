$(document).ready(function($) {
    $("tr").click(function() {
        window.document.location = $(this).data("link");
    });
});