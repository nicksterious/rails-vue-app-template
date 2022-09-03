export default function randomImage(width, height){
	const placeholders = [
	    `https://www.fillmurray.com/${ width }/${ height }`,
	    `https://baconmockup.com/${ width }/${ height }`,
	    `http://placebeard.it/${ width }/${ height }`,
	    `https://loremflickr.com/${ width }/${ height }`,
	    `https://www.placecage.com/${ width }/${ height }`,
	    `http://placeimg.com/${ width }/${ height }/any`
	];
	return placeholders[Math.floor(Math.random()*placeholders.length)];
    }
