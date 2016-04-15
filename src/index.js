'use strict';

var angular = require('angular');

import { HeaderModule } from './header';
import { HeroModule } from './hero';

module.exports = angular.module('drpxSeedApp', [

	HeaderModule,
	HeroModule,
	//require('./yourLogic'),

	//require('angular-route')
])

//.component('hello', HelloComponent)
/*
.config(function($routeProvider) {

	$routeProvider.otherwise({
		redirectTo: '/TODO',
	});
})
*/

.name;
