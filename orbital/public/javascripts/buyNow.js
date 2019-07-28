var buyNow = document.getElementById("button2");
buyNow.addEventListener("click", function() {
    result = confirm("An email will be sent to the seller. Are you sure you want to purchase?");
    if (result) {
        //do backend work of sending email, adding to myOrder, deleting from seller's shop?
        alert("Your request has been emailed, please discuss details of your transaction with the seller through email or handphone.");
    }
})
//<script type="text/javascript" src="javascripts/buyNow.js"></script>