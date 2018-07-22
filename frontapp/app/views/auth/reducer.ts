import { AUTH } from '../../helpers/constants';
import {
  CHANGE_LOGIN_FORM
} from '../../helpers/action_names';

export const reducer = (state = AUTH, action) => {
  switch(action.type) {
    case CHANGE_LOGIN_FORM:
      return {
        ...state,
        loginForm: {...state.loginForm, ...action.loginForm}
      }
    default:
      return state;
  }
}
