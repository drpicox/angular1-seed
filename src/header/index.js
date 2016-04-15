var angular = require('angular');

import {HeaderComponent} from './HeaderComponent';

export let HeaderModule = angular
	.module('dsa.HeaderModule', [])

	.component('dsaHeader', HeaderComponent)

	.name;