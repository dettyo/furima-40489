function card (){
  const payjp = Payjp('pk_test_ac5665cbed5d001c87433f8b')
  const elements = payjp.elements();
  const numberElement = elements.create('cardNumber');
  const expiryElement = elements.create('cardExpiry');
  const cvcElement = elements.create('cardCvc');

  numberElement.mount('#number-form');
  expiryElement.mount('#expiry-form');
  cvcElement.mount('#cvc-form');

  const form = document.getElementById("charge-form");
  form.addEventListener("submit", (e) => {

    const formData = new FormData(document.getElementById("charge-form"));
    const XHR = new XMLHttpRequest();
    XHR.open("POST", "/furimas/:furima_id/orders", true);
    XHR.responseType = "json";
    XHR.send(formData);

    payjp.createToken(numberElement).then(function (response) {
      if (response.error) {
      } else {
        const token = response.id;
        const renderDom = document.getElementById("charge-form");
        const tokenObj = `<input value=${token} name='token' type="hidden">`;
        renderDom.insertAdjacentHTML("beforeend", tokenObj);
      }
      numberElement.clear();
      expiryElement.clear();
      cvcElement.clear();
      document.getElementById("charge-form").submit();
    });

    e.preventDefault();

  });
};


window.addEventListener('turbo:load', card);