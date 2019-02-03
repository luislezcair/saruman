import { MaskElementByClass, MakeDateRangePicker } from '../util';

function maskSearchFormElements() {
  MakeDateRangePicker('.input-group.input-daterange');
  MaskElementByClass('mask-date', 'date');
  MaskElementByClass('mask-numeric', 'integer');
}

document.addEventListener('moves:index:load', maskSearchFormElements);
