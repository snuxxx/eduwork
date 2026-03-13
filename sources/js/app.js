document.querySelectorAll('a[href^="#"]').forEach(anchor => {

anchor.addEventListener("click", function(e){

e.preventDefault();

document.querySelector(this.getAttribute("href"))
.scrollIntoView({
behavior:"smooth"
});

});

});

const products = [

{
name: "Gaming Laptop",
price: 15000000,
description: "Laptop gaming high performance",
category: "laptop",
image: "sources/images/WhatsApp Image 2025-08-17 at 22.56.53_21a14d57.jpg"
},

{
name: "Mechanical Keyboard",
price: 1200000,
description: "RGB mechanical keyboard",
category: "accessory",
image: "sources/images/WhatsApp Image 2025-08-17 at 22.31.32_30413a96.jpg"
},

{
name: "Laptop Cleaning Service",
price: 150000,
description: "Professional laptop cleaning",
category: "service",
image: "sources/images/WhatsApp Image 2025-08-17 at 22.56.53_21a14d57.jpg"
},

{
name: "Wireless Mouse",
price: 300000,
description: "Ergonomic wireless mouse",
category: "accessory",
image: "sources/images/WhatsApp Image 2025-08-17 at 22.31.32_30413a96.jpg"
}

];

function displayProducts(productArray){

const productContainer = document.getElementById("product-list");

productContainer.innerHTML = "";

productArray.forEach(product => {

const productHTML = `
<div class="col-md-3">

<div class="card h-100 shadow-sm product-card">

<img src="${product.image}" class="card-img-top">

<div class="card-body">

<h5 class="card-title">${product.name}</h5>

<p class="card-text">${product.description}</p>

<p class="fw-bold">Rp ${product.price.toLocaleString()}</p>

</div>

</div>

</div>
`;

productContainer.innerHTML += productHTML;

});

}

function filterProduct(category){

if(category === "all"){

displayProducts(products);

return;

}

const filtered = products.filter(product => product.category === category);

displayProducts(filtered);

}

displayProducts(products);