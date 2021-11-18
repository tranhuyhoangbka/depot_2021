import React, {Component} from 'react'

class CreditCardPayType extends Component {
  render() {
    return (
      <div>
        <div className="field">
          <label htmlFor="order_credit_card_number">{I18n.t('javascript.cc')}</label>
          <input type="password" name="order[credit_card_number]" id="order_credit_card_number" />
        </div>

        <div className="field">
          <label htmlFor="order_expiration_date">{I18n.t('javascript.expire')}</label>
          <input type="text" name="order[expiration_date]"
            id="order_expiration_date" size="9" placeholder="e.g 03/19" />
        </div>
      </div>
    );
  }
}

export default CreditCardPayType
