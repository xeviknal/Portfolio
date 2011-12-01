function remove_fields(link) {
  jQuery(link).prev("input[type=hidden]").val("1");
  jQuery(link).closest(".image").hide();
}

function add_fields(link, association) {
  var new_id = new Date().getTime();
  var regexp = new RegExp("new_" + association, "g");
  //jQuery(link).before(content.replace(regexp, new_id));
  var new_image = jQuery("#image_new").clone();
  new_image.removeAttr("id");
  jQuery("#image_new").before(new_image);

  //replacing input name id for a newer one.
  new_image.find('input').each(function(index,value){
      replace_id(new_id,value);
    });
  //replacing also the name id for textareas
  new_image.find('textarea').each(function(index,value){
      replace_id(new_id,value);
    });
  new_image.show();
}

//change ID for the input in order to make diferent input names.
function replace_id(new_id,value){
  var id = jQuery(value).attr("id");
  var name = jQuery(value).attr("name");
  jQuery(value).attr("name", name.replace("0",new_id));
  jQuery(value).attr("id", id.replace("0",new_id));
  jQuery(value).removeAttr('disabled');
}

//All images for a design are sorted by its atributte "sort_by".
//This method show the image preservind the order.
function sort_images(img){

}

jQuery(document).ready(function(){
  //reload de image when user select new file to upload
  jQuery("form[id *= edit_image] input[type = file]").live("change",function() {
    var divImage = jQuery(this).closest("div.image_design");
    var options = {
      success: function(responseXML){
        var response = jQuery.parseJSON(jQuery(responseXML).text());
        divImage.find('img').attr("src",response.thumb);
        divImage.children("a[rel = facebox]").attr("href",response.original);
      }
    };
    jQuery(this).closest("form[id *= edit_image]").ajaxSubmit(options);
  });

  //submit new_image form in admin/designs/show
  jQuery("form[id = new_image]").live("submit",function() {
    var options = {
      success: function(responseXML){
        jQuery("#new_image_form").before(responseXML);
        jQuery(".best_in_place").best_in_place();
        jQuery(document).trigger('close.facebox')
      }
    };

    jQuery(this).ajaxSubmit(options);
    return false;
  });

});
