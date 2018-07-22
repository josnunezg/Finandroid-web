import * as React from 'react';
import {
  BrowserRouter as Router,
  Route,
  Switch
} from 'react-router-dom'

export const RouteTemplate = (props:any) => (
  <Router>
    <Switch>
      {
        props.routes.map((r:any,i:any) => (
          <Route
            key={i}
            path={r.path}
            component={(props) => <r.component {...props} />}
            exact={r.exact}
          />
        ))
      }
    </Switch>
  </Router>
)
