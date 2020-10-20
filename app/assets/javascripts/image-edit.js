$(document).on('turbolinks:load', $(function() {

  var image_tag;
  var deletes = [];
  var delete_ids = [];

  function buildImageTag(alt, src){
    var html = `<div class= "img_view">
                  <img alt="${alt}" src="${src}">
                  <div class="image-upload-button">
                    <div class="btn update-delete">削除</div>
                  </div>
                </div>`
    return html;
  };
    
  function buildUpdatefile(num){
    var html = `<label class="uploader" for="shop_images_attributes_${num}" id="label-box--${num}" style="display:block">
                    <pre>クリックしてファイルをアップロード</pre>
                </label>`
    return html;
  }

  function buildInputbox(num){
    var html = `<input class="update-image" id="shop_images_attributes_${num}" name="shop[shop_images_attributes][${num}][image]" type="file">`
    return html;
  }


  $(document).on('change', '.update-image', function(){
    var target_id = $(this).attr('id');
    var target_num = Number(target_id.replace('shop_images_attributes_',''));
    var display_num = target_num + 1;
    var file = $(this).prop('files')[0];
    var file_reader = new FileReader();

    file_reader.onload = (function(){
      return function (e) {
        image_tag = buildImageTag(target_num, e.target.result);

        if (target_num <= 3){
          $('#preview').append(image_tag);
          $(`#label-box--${target_num}`).remove();
          $('#preview').after(buildUpdatefile(display_num));      
        }
        if(target_num == 4){
          $('#preview').append(image_tag);
          $('#label-box--${target_num}').remove();
        }
      };
    })(file);
    
    file_reader.readAsDataURL(file);

  });

  $(document).on('click','.edit-delete', function(){
    var target_image = $(this).parent().parent();
    var img_num = Number(target_image.children('img').attr('alt'));
    var img_id = target_image.children('img').attr('id');
    var img_id_num = Number(img_id.replace('img_view_',''));

    target_image.remove();
    delete_ids.push(img_num);

    $(`#shop_shop_images_attributes_${img_id_num}_image`).remove();
    $(`#shop_shop_images_attributes_${img_id_num}_id`).remove();
    $('.uploader').remove();
    $('#preview').after(buildUpdatefile(img_id_num));
    $('.hidden-content').append(buildInputbox(img_id_num));

  });
  
  $(document).on('click','.update-delete', function(){
    var target_image = $(this).parent().parent();
    var img_num = Number(target_image.children('img').attr('alt'));

    target_image.remove();
    $(`#shop_images_attributes_${img_num}`).remove();
    $('.hidden-content').append(buildInputbox(img_num));
    $('.uploader').remove();
    $('#preview').after(buildUpdatefile(img_num));
    
    deletes.push(img_num);
  });

  
  $(document).on('click','#edit-submit', function(){
    $.ajax({
      url: '/shops/delete_image',
      type: 'GET',
      data: { id: delete_ids },
      dataType: 'json'
    })
  });
  
}));