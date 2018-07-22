import { combineReducers } from 'redux';
import { reducer as bankAccountReducer } from './bank_accounts/reducer';
import { reducer as authReducer } from './auth/reducer';

export const reducer = combineReducers({
  BankAccounts: bankAccountReducer,
  Auth: authReducer
})
