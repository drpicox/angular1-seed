import HeroComponentTemplate from './HeroComponent.tpl.html';

class HeroController {
	constructor() {
		this.text = 'Learn more';
		this.href = 'https://github.com/drpicox/angular1-seed';
	}
}

export let HeroComponent = {
	template: HeroComponentTemplate,
	controller: HeroController,
};