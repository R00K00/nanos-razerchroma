function rgbToBgr(rgb) {
    // Validate input: rgb should be an array with 3 elements representing R, G, and B values
    if (!Array.isArray(rgb) || rgb.length !== 3) {
        throw new Error("Input should be an array with 3 elements (R, G, B).");
    }
  
    // Concatenate the Blue, Green, and Red values into a single integer
    const bgrNumber = (rgb[2] << 16) | (rgb[1] << 8) | rgb[0];
  
    return bgrNumber;
}


var color = new Array(6);
for (r = 0; r < 6; r++) {
    color[r] = new Array(22);
    for (c = 0; c < 22; c++) {
        color[r][c] = 0;
    }
}
var key = new Array(6);
for (r = 0; r < 6; r++) {
    key[r] = new Array(22);
    for (c = 0; c < 22; c++) {
        key[r][c] = 0;
    }
}

/*
setTimeout(() => {
    color[2][3] = rgbToBgr([0, 255, 4]);
    color[5][1] = rgbToBgr([0, 255, 4]);
    chromaSDK.createKeyboardEffect("CHROMA_CUSTOM_KEY", { 'color': color, 'key': key });
    console.log("joa")
}, 3000);*/

function SetKeyboardColor(c_array) {
    chromaSDK.createKeyboardEffect("CHROMA_CUSTOM_KEY", { 'color': c_array, 'key': key });
}
Events.Subscribe("ChromaJS:SetKeyboardColor", SetKeyboardColor)


var mouse_data = new Array(9);
for (r = 0; r < 9; r++) {
    mouse_data[r] = new Array(7);
    for (c = 0; c < 7; c++) {
        mouse_data[r][c] = 0xffff;
    }
}
function SetMouseColor(m_array) {
    chromaSDK.createMouseEffect("CHROMA_CUSTOM2", m_array);
}
Events.Subscribe("ChromaJS:SetMouseColor", SetMouseColor)


var mousemat_data = new Array(15);
for (i = 0; i < 15; i++) {
    mousemat_data[i] = ncolor;
}
function SetMousematColor(mm_array) {
    chromaSDK.createMousematEffect("CHROMA_CUSTOM", mm_array);
}
Events.Subscribe("ChromaJS:SetMousematColor", SetMousematColor)


/*
ncolor = [252, 3, 3];
ncolor = rgbToBgr(ncolor);


setTimeout(() => {
    for (let i = 0; i < color.length; i++) {
        const element = color[i];
        for (let a = 0; a < element.length; a++) {
            color[i][a] = ncolor;
            chromaSDK.createKeyboardEffect("CHROMA_CUSTOM_KEY", { 'color': color, 'key': key });
            console.log("x: "+parseInt(a+1)+"  y: "+parseInt(i+1));
            sleep(4000);
        }
    }
}, 5000);


ncolor = [252, 3, 3];
ncolor = rgbToBgr(ncolor);


setTimeout(() => {
    var data = new Array(15);
    for (i = 0; i < 15; i++) {
        data[i] = ncolor;
    }
    chromaSDK.createMousematEffect("CHROMA_CUSTOM", data);
}, 5000);*/