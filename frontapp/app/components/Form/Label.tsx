import * as React from 'react';

import { ILabel } from '../../helpers';

export const Label = (props:ILabel) => {
  let {
    active,
    id,
    key,
    text
  } = props;
  let className = active ? "active" : "";

  return <label className={className} key={key} id={id}>{text}</label>
}
