function price (){
  let itemPrice = document.getElementById('item-price');
  const commission_per = 0.1;

  itemPrice.addEventListener("keyup", () => {
    let commission = Math.floor(itemPrice.value * commission_per);
    let itemRevenue = itemPrice.value - commission;
    document.getElementById('add-tax-price').innerHTML = commission;
    document.getElementById('profit').innerHTML = itemRevenue;
  });
};

window.addEventListener('turbo:load', price);
