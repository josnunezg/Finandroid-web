import * as React from 'react';
import { IRoute } from '../helpers';
import LoginContainer from '../views/auth/containers/LoginContainer';
import { Finandroid } from './Finandroid';


export const routes:IRoute[] = [
  {
    path: '/login',
    component: LoginContainer,
    exact: true
  },
  {
    path: '/',
    component: Finandroid
  }
]
