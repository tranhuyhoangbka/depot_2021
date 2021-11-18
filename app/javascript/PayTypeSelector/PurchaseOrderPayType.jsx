import React, {Component} from 'react'

class PurchaseOrderPayType extends Component {
  render() {
    return (
      <div>
        <div className="field">
          <label htmlFor="order_po_number">{I18n.t('javascript.po')}</label>
          <input type="password" name="order[po_number]" id="order_po_number" />
        </div>
      </div>
    );
  }
}

export default PurchaseOrderPayType
