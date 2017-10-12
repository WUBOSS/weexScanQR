// { "framework": "Vue" }

/******/ (function(modules) { // webpackBootstrap
/******/ 	// The module cache
/******/ 	var installedModules = {};

/******/ 	// The require function
/******/ 	function __webpack_require__(moduleId) {

/******/ 		// Check if module is in cache
/******/ 		if(installedModules[moduleId])
/******/ 			return installedModules[moduleId].exports;

/******/ 		// Create a new module (and put it into the cache)
/******/ 		var module = installedModules[moduleId] = {
/******/ 			exports: {},
/******/ 			id: moduleId,
/******/ 			loaded: false
/******/ 		};

/******/ 		// Execute the module function
/******/ 		modules[moduleId].call(module.exports, module, module.exports, __webpack_require__);

/******/ 		// Flag the module as loaded
/******/ 		module.loaded = true;

/******/ 		// Return the exports of the module
/******/ 		return module.exports;
/******/ 	}


/******/ 	// expose the modules object (__webpack_modules__)
/******/ 	__webpack_require__.m = modules;

/******/ 	// expose the module cache
/******/ 	__webpack_require__.c = installedModules;

/******/ 	// __webpack_public_path__
/******/ 	__webpack_require__.p = "";

/******/ 	// Load entry module and return exports
/******/ 	return __webpack_require__(0);
/******/ })
/************************************************************************/
/******/ ({

/***/ 0:
/***/ (function(module, exports, __webpack_require__) {

	"use strict";

	if (window.Weex) {
	  Weex.install(__webpack_require__(7));
	} else if (window.weex) {
	  weex.install(__webpack_require__(7));
	}

/***/ }),

/***/ 7:
/***/ (function(module, exports) {

	'use strict';

	var WeexScanQR = {
	  show: function show() {
	    alert("module WeexScanQR is created sucessfully ");
	  }
	};

	var meta = {
	  WeexScanQR: [{
	    name: 'show',
	    args: []
	  }]
	};

	if (window.Vue) {
	  weex.registerModule('WeexScanQR', WeexScanQR);
	}

	function init(weex) {
	  weex.registerApiModule('WeexScanQR', WeexScanQR, meta);
	}
	module.exports = {
	  init: init
	};

/***/ })

/******/ });