// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require_tree .

function cycle(){
  $('.data-row:odd').addClass("even").removeClass("odd");
  $('.data-row:even').addClass("odd").removeClass("even");
}
// from http://www.mediacollege.com/internet/javascript/number/round.html
function roundNumber(number,decimals) {
  var newString;// The new rounded number
  decimals = Number(decimals);
  if (decimals < 1) {
    newString = (Math.round(number)).toString();
  } else {
    var numString = number.toString();
    if (numString.lastIndexOf(".") == -1) {// If there is no decimal point
      numString += ".";// give it one at the end
    }
    var cutoff = numString.lastIndexOf(".") + decimals;// The point at which to truncate the number
    var d1 = Number(numString.substring(cutoff,cutoff+1));// The value of the last decimal place that we'll end up with
    var d2 = Number(numString.substring(cutoff+1,cutoff+2));// The next decimal, after the last one we want
    if (d2 >= 5) {// Do we need to round up at all? If not, the string will just be truncated
      if (d1 == 9 && cutoff > 0) {// If the last digit is 9, find a new cutoff point
        while (cutoff > 0 && (d1 == 9 || isNaN(d1))) {
          if (d1 != ".") {
            cutoff -= 1;
            d1 = Number(numString.substring(cutoff,cutoff+1));
          } else {
            cutoff -= 1;
          }
        }
      }
      d1 += 1;
    }
    if (d1 == 10) {
      numString = numString.substring(0, numString.lastIndexOf("."));
      var roundedNum = Number(numString) + 1;
      newString = roundedNum.toString() + '.';
    } else {
      newString = numString.substring(0,cutoff) + d1.toString();
    }
  }
  if (newString.lastIndexOf(".") == -1) {// Do this again, to the new string
    newString += ".";
  }
  var decs = (newString.substring(newString.lastIndexOf(".")+1)).length;
  for(var i=0;i<decimals-decs;i++) newString += "0";
  //var newNumber = Number(newString);// make it a number if you like
  return newString; // Output the result to the form field (for your purpose)
}
function to_currency (number) {
  var number = roundNumber(number,2);
  number = "$"+number;
  return number;
}
function to_float (number) {
  if (!number) return 0;
  var number = parseFloat(number.replace('$',''));
  return number;
}
function update_line (target) {
  var row = $(target).parents('.data-row');
  var linetotal_value =  row.find('.qty-value').val() * to_float(row.find('.price-value').val());
  row.find('.linetotal').val(to_currency(linetotal_value));
  update_subtotal();
}
function update_subtotal () {
  var subtotal_value = 0;
  $('#line_items .linetotal:visible').map(function(){
    var money = to_float($(this).val());
    if (!isNaN(money)) {
      subtotal_value += money;
    }
  });
  $('#totals #subtotal-value').val(to_currency(subtotal_value));
  update_finaltotal();
}
function update_finaltotal () {
  var finaltotal = to_float($('#totals #subtotal-value').val()) + to_float($('#totals #tax-value').val());
  $('#totals #total-value').val(to_currency(finaltotal));
}
function update_image () {
  var image_url = $('#imageloc').val();
  if (image_url) {
    document.getElementById('image').src=image_url;
  } else {
    document.getElementById('image').src="/images/logo.jpg";
  }
}
function hide_image () {
  var image_show = $('#image_show').val();
  if (image_show = 'alt="logo"') {
    $('#image_show').hide();
  }
}

$(document).ready(function(){
//  $('#image').click(function(){
//    $(this).hide();
//    $('#logoclick').show();
//  });
  $('#deletelogo').click(function(){
    document.getElementById('image').src="/images/logo.jpg"
    document.getElementById('imageloc').value='';
  });
//  $('#cancellogo').click(function(){
//    $('#logoclick').hide();
//    $('#image').show();
//  });
  $('#changelogo').click(function(){
    $('#logoclick').hide();
    $('#changeform').show();
  });
  $('#changecancel').click(function(){
    $('#changeform').hide();
    $('#logoclick').show();
  })
  $("#changesave").click(function(){
    $("#image").attr('src',$("#imageloc").val());
    $('#changeform').hide();
    $('#logoclick').show();
    update_image();
    $('#image').show();
  });
  $('#line_items').on('change','.qty-value',function(e){
    update_line(this);
  });
  $('#line_items').on('change', '.price-value',function(e){
    $(this).val(to_currency($(this).val()));
    update_line(this);
  });
  $('#line_items').on('change', '.linetotal',function(){
    update_subtotal();
  });
  $('#totals').on('change', '#tax-value',function(){
    $(this).val(to_currency($(this).val()));
    update_finaltotal();
  });

  $('#receipt_payable').on('keyup', function(){
    this.size = this.value.length + this.value.length/8;
  });

  $('.add_line').on('click','.add_line_item',function(){
    id = Math.floor(Math.random() * (500000 - 100000 + 1)) + 100000;
    line = '<tr class="data-row">'+$('#line_items tbody tr:last').html()+'</tr>';
    line = line.replace(/attributes_/g,'attributes_'+id);
    line = line.replace(/attributes]\[/g,'attributes]['+id);
    $('#line_items tbody tr:visible:last').after(line);
    return false;
  });

  $('#line_items').on('click','.delete_line_item',function(){
    if ($('.delete_line_item').length <= 1) return false;
    $(this).parents('tr').find('.destroy').val('true').end().hide();
    $('.linetotal').trigger('change');
    return false;
  });

  $('#line_items tbody tr:last').hide();

  update_image();
  hide_image();
});
