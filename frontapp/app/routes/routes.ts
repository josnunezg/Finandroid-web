import { IRoute } from '../helpers';
import BankAccountListContainer from '../views/bank_accounts/containers/BankAccountListContainer';

const routes:IRoute[] = [
  {
    path: '/bank_accounts',
    component: BankAccountListContainer,
  }
]

export default routes;
