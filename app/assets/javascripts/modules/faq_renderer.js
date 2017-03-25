function faqFilter() {
  $('.faq-filter').on('change', function() {
    var qSlug = $('#question-filter').find(":selected").attr('data-slug');
    var iSlug = $('#insurer-filter').find(":selected").attr('data-slug')
    var href = '/veelgestelde_vragen/' + iSlug + '/' + qSlug;

    updateFaqFilter(href);
  });
}

function updateFaqFilter(url) {
  location.replace(url)
}

$(document).ready(function() {
  faqFilter();
});
