import { CHANGE_LOGIN_FORM } from '../../helpers/action_names';

export const changeLogin = (params) => {
  return {
    type: CHANGE_LOGIN_FORM,
    loginForm: params
  }
}
