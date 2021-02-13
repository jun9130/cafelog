document.addEventListener('turbolinks:load', ()=> {
  const shopContent = document.querySelectorAll(".shops-content__shop");
  document.addEventListener("scroll", function() {
    for (let i = 0; i < shopContent.length; i++) {
    const getElentDistance = shopContent[i].getBoundingClientRect().top + shopContent [i].clientHeight * .3
    if (window.innerHeight > getElentDistance) {
      shopContent[i].classList.add("scrollEvent");
      }
    }
  })
})

