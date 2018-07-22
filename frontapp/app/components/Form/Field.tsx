import * as React from 'react';

import { IField } from '../../helpers';

export class Field extends React.Component<IField,any> {
  getGrid() {
    let { m, l, xl } = this.props;
    let mGrid = m && m >= 0? `m${m}` : '';
    let lGrid = l && l >= 0? `m${l}` : '';
    let xlGrid = xl && xl >= 0? `m${xl}` : '';
    return `${mGrid} ${lGrid} ${xlGrid}`;
  }

  render() {
    let {
      col
    } = this.props;
    let grids = col ? `col ${this.getGrid()}` : '';
    return  <div className={`input-field ${grids}`}>
              {this.props.children}
            </div>
  }
}
