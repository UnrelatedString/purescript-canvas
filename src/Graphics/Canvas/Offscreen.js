export function createOffscreenCanvas(dims) {
  return function() {
    return new OffscreenCanvas(dims.width, dims.height);
  };
}

export function getHeight(offscreen) {
  return function() {
    return offscreen.height;
  };
}

export function getWidth(offscreen) {
  return function() {
    return offscreen.width;
  };
}

export function toBlobDefault(offscreen) {
  return function() {
    return offscreen.toBlob();
  };
}

export function toBlobFormat(offscreen, format) {
  return function() {
    return offscreen.toBlob({type: format});
  };
}

export function toBlobFormatQuality(offscreen, format, quality) {
  return function() {
    return offscreen.toBlob({type: format, quality: quality});
  };
}

export function getContext2D(offscreen) {
  return function() {
    return offscreen.getContext("2d");
  };
}
