import * as React from 'react';
import { connect } from 'react-redux';

import { BankAccountList } from '../components';

class BankAccountListContainer extends React.Component<any,any> {
  constructor(props:any) {
    super(props);
  }

  render() {
    return(
      <BankAccountList {...this.props} />
    )
  }
}

const mapStateToProps = state => {
  return {

  }
}

const mapDispatchToProps = dispatch => {
  return {

  }
}

export default connect(mapStateToProps,mapDispatchToProps)(BankAccountListContainer);
