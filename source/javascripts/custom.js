jQuery(document).ready(function() {
  /* Mobile Devices Navigation Select Script */
  (function (cash) {
    $('select.resp_navigation').bind('change', function () {
      if ($(this).val() !== '' && document.location.pathname !== '/' + $(this).val()) {
        document.location.href = 'http://' + document.location.host + '/' + $(this).val();
      }
    } );
  })(jQuery);

  /* Mobile Devices Navigation Select Script */
  (function (cash) {
    $('select.resp_navigation').bind('change', function () {
      if ($(this).val() !== '' && document.location.href.replace($(this).val(), '') === document.location.href) {
        document.location.href = $(this).val();
      }
    });
  })(jQuery);
});
