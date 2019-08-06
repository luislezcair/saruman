import { Controller } from 'stimulus';
import { MaskElement } from '../views/util';

export default class extends Controller {
  static targets = ['salePrice', 'costPrice'];

  connect() {
    // MaskElementByClass('mask-money', 'currency');
    MaskElement(this.salePriceTarget, 'currency');
    MaskElement(this.costPriceTarget, 'currency');
  }
}
