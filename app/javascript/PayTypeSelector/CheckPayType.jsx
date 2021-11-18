import React, {Component} from 'react'

class CheckPayType extends Component {
  render() {
    return (
      <div>
        <div className="field">
          <label htmlFor="order_routing_number">{I18n.t('javascript.routing')}</label>
          <input type="password" name="order[routing_number]" id="order_routing_number" />
        </div>

        <div className="field">
          <label htmlFor="order_account_number">{I18n.t('javascript.account')}</label>
          <input type="text" name="order[account_number]" id="order_account_number" />
        </div>
      </div>
    );
  }
}

export default CheckPayType
