// See: http://jasmine.github.io/2.4/introduction.html
describe('drpxSeedApp', function() {

	it('should exists', function() {

		var drpxSeedApp = angular.module('drpxSeedApp');
		expect(drpxSeedApp).toBeDefined();
	});

});