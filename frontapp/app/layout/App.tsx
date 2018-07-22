import * as React from 'react';

import { RouteTemplate } from '../routes/RouteTemplate';
import { routes } from './routes';

class App extends React.Component<any,any> {
  constructor(props) {
    super(props);
  }

  render() {
    return(
      <RouteTemplate routes={routes} {...this.props} />
    )
  }
}

export default App;
