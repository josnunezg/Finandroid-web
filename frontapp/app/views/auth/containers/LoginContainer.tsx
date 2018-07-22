import * as React from 'react';
import { connect } from 'react-redux';

import { Login } from '../components';
import {
  changeLogin
} from '../actions';

class LoginContainer extends React.Component<any,any> {
  constructor(props) {
    super(props);
  }

  render() {
    return(
      <Login {...this.props} />
    );
  }
}

const mapStateToProps = state => {
  let { loginForm } = state.views.Auth;
  return {
    loginForm
  }
}

const mapDispatchToProps = dispatch => {
  return {
    changeLogin(params) {
      dispatch(changeLogin(params));
    }
  }
}

export default connect(mapStateToProps,mapDispatchToProps)(LoginContainer);
