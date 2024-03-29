import Inputmask from 'inputmask';
import $ from 'jquery';
import 'bootstrap-datepicker';
import 'bootstrap-datepicker/js/locales/bootstrap-datepicker.es';
import 'bootstrap-datepicker/dist/css/bootstrap-datepicker3.css';

const maskDefaults = {
  integer: { alias: 'integer' },
  meters: {
    alias: 'numeric',
    radixPoint: ',',
    digits: 2,
    suffix: ' m',
    removeMaskOnSubmit: true,
    unmaskAsNumber: true,
  },
  shortTime: { alias: 'datetime', inputFormat: 'HH:MM' },
  currency: {
    alias: 'currency',
    prefix: '',
    groupSeparator: '.',
    radixPoint: ',',
    removeMaskOnSubmit: true,
    unmaskAsNumber: true,
    numericInput: true,
  },
  date: {
    alias: 'datetime',
    inputFormat: 'dd/mm/yyyy',
    placeholder: 'dd/mm/aaaa',
  },
  phone: {
    mask: '(9999) 999 999',
    removeMaskOnSubmit: true,
    unmaskAsNumber: true,
  },
  accountCode: {
    mask: '9[9][.9[9]][.9[9]][.9[9]][.9[9]][.9[9]][.9[9]][.9[9]]',
  },
  dni: {
    mask: '[99].999.999',
    removeMaskOnSubmit: true,
    unmaskAsNumber: true,
  },
  cuit: {
    mask: '99 - 99999999 - 9',
    removeMaskOnSubmit: true,
    unmaskAsNumber: true,
  },
};

const MaskElement = (element, mask) => {
  const m = new Inputmask(maskDefaults[mask]);
  m.mask(element);
};

const MaskElementByClass = (selector, mask) => {
  const elements = document.getElementsByClassName(selector);
  const m = new Inputmask(maskDefaults[mask]);
  m.mask(elements);
};

const MakeDateRangePicker = (selector) => {
  $(selector).datepicker({
    todayBtn: 'linked',
    language: 'es',
    autoclose: true,
  });
};

export { MaskElement, MaskElementByClass, MakeDateRangePicker };
