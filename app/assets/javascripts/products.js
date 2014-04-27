  $(document).delegate('*[data-toggle="lightbox"]', 'click', function(event) {
    event.preventDefault();
    return $(this).ekkoLightbox();
  });
