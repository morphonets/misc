// Creates the Morphonets logo


// settings and canvas
zoomFactor = 10;
setLineWidth(6 * zoomFactor);
newImage("MorphonetsLogo", "8-bit black", 512 * zoomFactor , 512 * zoomFactor, 1);

// Position of central node
xc= 360; yc= 250;

// make child nodes
x1=238; y1=72;
makeNode(x1, y1, 40, 30);

x1=96; y1=126;
makeNode(x1, y1, 48, 120);

x1=142; y1=300;
makeNode(x1, y1, 38, 170);

x1=234; y1=416;
makeNode(x1, y1, 52, 210);

// make central node
outerRadius = 108;
makeNode(xc, yc, outerRadius, 0);
makeNodeExtended(xc, yc, outerRadius, 180, false);
makeNode(xc, yc, outerRadius * 0.85, 250);

// make gap in outer circle
nickCircle(xc, yc, outerRadius);

// apply colors
colorize();


function nickCircle(x, y, r) {
    w = 120 * zoomFactor; h = 20 * zoomFactor;
    x = x * zoomFactor;
    y = y * zoomFactor;
    r = r * zoomFactor;
    setColor(0);
    fillRect(x - w/2, y + r - h /2 , w, h);
    fillRect(x - w/2, y - r - h /2 , w, h);
}

function makeNode(x, y, r, value) {
	makeNodeExtended(x, y, r, value, true);
}

function makeNodeExtended(x, y, r, value, fillFlag) {
	setColor(225); // edge color
	drawLine(xc * zoomFactor, yc * zoomFactor, x * zoomFactor, y * zoomFactor);
	setColor(value); // node color
    x = x * zoomFactor;
    y = y * zoomFactor;
    r = r * zoomFactor;
	xcorner = x - r ;
	ycorner = y - r;
	if (fillFlag) {
		fillOval(xcorner, ycorner, r * 2, r * 2);
	} else {
		drawOval(xcorner, ycorner, r * 2, r * 2);
	}
}

function colorize() {
	run("mpl-viridis");
	getLut(reds, greens, blues);
	reds[0] = 255; greens[0] = 255; blues[0] = 255;
	setLut(reds, greens, blues);
}
