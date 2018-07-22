import * as React from 'react';

import { IInput } from '../../helpers';

class Generic extends React.Component <any,any> {
  type = "text"

  getBody() {
    let {
      className,
      key,
      disabled,
      placeholder,
      handleChange,
      name,
      id,
      value
    } = this.props;
    return  <input
              type={this.type}
              onChange={({target}) => handleChange(target,name)}
              key={key}
              disabled={disabled}
              placeholder={placeholder}
              name={name}
              className={`validate ${className}`}
              id={id}
              value={value}
            />
  }
  render() {
    return this.getBody();
  }
}

class Number extends Generic {
  type = "number"
}

class Email extends Generic {
  type = "email"
}

class Password extends Generic {
  type = "password"
}

export const Input = (props:IInput) => {
  const mapComponent = {
    text: Generic,
    number: Number,
    email: Email,
    password: Password
  }

  let Component = mapComponent[props.type];
  return <Component {...props} />
}
