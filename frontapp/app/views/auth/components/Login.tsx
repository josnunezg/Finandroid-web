import * as React from 'react';
import { Form, Field, Input, Label } from '../../../components';


export const Login = props => {
  let {
    loginForm,
    changeLogin
  } = props;

  const handleChange = (target, name) => {
    let params = {};
    params[name] = target.value;
    changeLogin(params);
  }

  return  <div>
            <Form>
              <Field>
                <Input
                  type="text"
                  value={loginForm["username"]}
                  name="username"
                  handleChange={handleChange}
                  placeholder="Usuario"
                />
                <Label text="Usuario" />
              </Field>
              <Field>
                <Input
                  type="password"
                  value={loginForm["password"]}
                  name="password"
                  handleChange={handleChange}
                  placeholder="Contraseña"
                />
                <Label text="Contraseña" />
              </Field>
            </Form>
          </div>
}
