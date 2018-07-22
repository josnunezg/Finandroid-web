import * as React from 'react';

import routes from '../routes/routes';
import { RouteTemplate } from '../routes/RouteTemplate';

export class Finandroid extends React.Component<any,any> {
  constructor(props) {
    super(props);
  }

  render() {
    return(
      <RouteTemplate routes={routes} {...this.props}/>
    )
  }
}
