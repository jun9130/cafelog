document.addEventListener('turbolinks:load', ()=> {
  const mainImage = document.getElementById('mainImage');
  const otherImage = document.querySelectorAll('.otherImage');

  otherImage.forEach(image => 
    image.addEventListener('click', function() {
      mainImage.src = this.src;
    })
  );
});


