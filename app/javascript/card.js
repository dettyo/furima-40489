function card (){
  console.log("クレジット処理作成");

  const chargeform = document.getElementById("charge-form");
  chargeform.addEventListener("submit", (e) => {
    console.log("購入ボタン確認");
    console.log(document.getElementById("charge-form"));

    const formData = new FormData(document.getElementById("charge-form"));
    const XHR = new XMLHttpRequest();
    XHR.open("POST", "/furimas/:furima_id/orders", true);
    XHR.responseType = "json";
    XHR.send(formData);

    e.preventDefault();
  });
};

window.addEventListener('turbo:load', card);