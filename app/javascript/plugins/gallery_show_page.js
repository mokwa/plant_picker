function myFunction() {
  // Get the expanded image
  var images = document.querySelectorAll(".image_plant");
  var expandImg = document.getElementById("expandedImg");
  images.forEach(image => {
    image.addEventListener("click", (event) => {

      expandImg.src = event.currentTarget.src;
      var expanding_image = document.querySelector(".block-image")
      expanding_image.style.display = "block";
    });
  });

}

export { myFunction }