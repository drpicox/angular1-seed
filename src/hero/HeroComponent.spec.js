describe('HeroComponent', function() {

	beforeEach(module('dsa.HeroModule'));

	it('should have text and href', inject(function($componentController, $rootScope) {
		var heroComponentController = $componentController('dsaHero', {$scope: $rootScope});

		expect(heroComponentController.text).toEqual('Learn more');
		expect(heroComponentController.href).toEqual(jasmine.stringMatching('http'));
	}));

});