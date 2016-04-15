var angular = require('angular');

import {HeroComponent} from './HeroComponent';

export let HeroModule = angular
	.module('dsa.HeroModule', [])

	.component('dsaHero', HeroComponent)

	.name;