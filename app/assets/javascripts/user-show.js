document.addEventListener('turbolinks:load', function() {
  const tabs = document.querySelectorAll(".tabs li a");
  const mypageContents = document.querySelectorAll(".mypage-contents li");

  for (let i = 0; i < tabs.length; i++) {
    tabs[i].addEventListener('click', function(e){
      e.preventDefault();
    for(let j = 0; j < tabs.length; j++) {
      tabs[j].classList.remove("active");
    } 
    for(let j = 0; j < mypageContents.length; j++) {
      mypageContents[j].classList.remove("active");
    } 
      this.classList.add('active')
      mypageContents[i].classList.add('active');
    }); 
  }
});





