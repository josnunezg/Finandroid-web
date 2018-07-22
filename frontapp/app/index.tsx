import * as React from 'react';
import * as ReactDOM from 'react-dom';
import { Provider } from 'react-redux'

import { store } from './store/store';
import App from './layout/App';

const element = document.getElementById('finandroid_app')

ReactDOM.render(
  <Provider store={store}>
    <App />
  </Provider>,
  element,
)
