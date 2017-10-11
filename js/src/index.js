

const WeexScanQR = {
  show() {
      alert("module WeexScanQR is created sucessfully ")
  }
};


var meta = {
   WeexScanQR: [{
    name: 'show',
    args: []
  }]
};



if(window.Vue) {
  weex.registerModule('WeexScanQR', WeexScanQR);
}

function init(weex) {
  weex.registerApiModule('WeexScanQR', WeexScanQR, meta);
}
module.exports = {
  init:init
};
