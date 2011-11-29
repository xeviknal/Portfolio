$(document).ready(function($) {
    jQuery('a[rel*=facebox]').facebox();
    jQuery(".best_in_place").best_in_place();
});

function remove_fields(link) {
  jQuery(link).prev("input[type=hidden]").val("1");
  jQuery(link).closest(".image").hide();
}

function add_fields(link, association) {
  var new_id = new Date().getTime();
  var regexp = new RegExp("new_" + association, "g");
  //jQuery(link).before(content.replace(regexp, new_id));
  var new_image = jQuery("#new_image").clone();
  new_image.attr("id","");
  jQuery(link).before(new_image);
  new_image.find('input').removeAttr('disabled');
  new_image.find('textarea').removeAttr('disabled');
  new_image.show();
}
