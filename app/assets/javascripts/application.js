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
//= require jquery-ui/datepicker


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
function date_picker () {
  $( "#datepicker" ).datepicker({
    dateFormat: "yy-mm-dd"
  });
}
function clear_upload () {
  var original_image = $('.hidden img').attr('src');
  $('#logo img').attr('src', original_image);
  $("#imageloc").replaceWith($("#imageloc").clone(true));
}
function image_preview (preview) {
  var files = event.target.files;
  var image = files[0]
  var reader = new FileReader();
  reader.onload = function(file) {
    var img = new Image();
    console.log(file);
    img.src = file.target.result;
    $(preview).html(img);
  }
  reader.readAsDataURL(image);
  console.log(files);
}



$(document).ready(function(){

  //Display image update option depending on new or edit
  $('#delete_logo').click(function(){
    var r = confirm("Receipt logo will be deleted.");
    if (r == true) {
      document.getElementById('image').src="/images/logo.jpg";
      $('.hidden img').attr('src','/images/logo.jpg');

      if ($('#receipt_remove_logo').length > 0) {
        document.getElementById("receipt_remove_logo").checked = true;
      } else {
        document.getElementById("user_remove_logo").checked = true;
      }

    } else {
    return false;
    }
  });
  $('#change_logo').click(function(){
    $('#edit_form').hide();
    $('#change_form').show();
    if ($('#receipt_new_logo').length > 0) {
      document.getElementById("receipt_new_logo").checked = true;
    } else {
      document.getElementById("user_new_logo").checked = true;
    }
  });
  $('#change_cancel').click(function(){
    $('#change_form').hide();
    $('#edit_form').show();
    if ($('#receipt_new_logo').length > 0) {
      document.getElementById("receipt_new_logo").checked = false;
    } else {
      document.getElementById("user_new_logo").checked = false;
    }
    clear_upload();
  });
  $('#logo').clone().insertAfter('div#logo').addClass('hidden');

  //Update the subtotal and total values on change in line items
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

//  $('#receipt_payable').on('keyup', function(){
//    this.size = this.value.length + this.value.length/8;
//  });

  //Add an extra line item by cloning
  $('.add_line').on('click','.add_line_item',function(){
    id = Math.floor(Math.random() * (500000 - 100000 + 1)) + 100000;
    line = '<tr class="data-row">'+$('#line_items tbody tr:last').html()+'</tr>';
    line = line.replace(/attributes_/g,'attributes_'+id);
    line = line.replace(/attributes]\[/g,'attributes]['+id);
    $('#line_items tbody tr:last').after(line);
    $('#line_items tbody tr:last').find('.destroy').val('false');
    return false;
  });

  //Delete line item, trigger update on line totals
  $('#line_items').on('click','.delete_line_item',function(){
    if ($('.delete_line_item').length <= 1) return false;
    $(this).parents('tr').find('.destroy').val('true').end().hide();
    $('.linetotal').trigger('change');
    return false;
  });

  date_picker();

  //Form display image preview after upload
  $('#imageloc').on('change',function(){
    image_preview('#logo');
  });

  //User profile display image after upload
  $('#user_default_logo').on('change',function(){
    image_preview('#logo');
  });

});
