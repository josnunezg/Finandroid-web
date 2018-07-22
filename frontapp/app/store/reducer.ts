import { combineReducers } from 'redux';
import { reducer as viewsReducer } from '../views/reducer';

export const reducer = combineReducers({
  views: viewsReducer
})
