import * as React from 'react';

import { IForm } from '../../helpers';

export class Form extends React.Component<IForm, any> {
  constructor(props) {
    super(props);
  }

  render() {
    let { className } = this.props;
    return(
      <form className={className}>
        {this.props.children}
      </form>
    )
  }
}
