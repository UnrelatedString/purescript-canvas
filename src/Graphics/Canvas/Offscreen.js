export function createOffscreenCanvasImpl(width, height) {
  return function() {
    return OffscreenCanvas(width, height);
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

export function toBlob(offscreen) {
  return function(){
    return offscreen.toBlob();
  };
}

export function getContext2D(offscreen) {
  return function(){
    return offscreen.getContext();
  };
}
