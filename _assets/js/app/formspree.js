$(document).ready(function() {
  $('#_formspree').attr('action', [
    'https:', '', ['formspree', 'io'].join('.'), [
      [ 'secnanosiar'.split('').reverse().join(''), 14 ].join(''),
      [ 'liamg'.split('').reverse().join(''), 'com' ].join('.')
    ].join('@')
  ].join('/'));

  $('#_formspree').show();
});
