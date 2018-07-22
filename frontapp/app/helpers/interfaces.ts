interface IRoute {
  path: string,
  component: any,
  exact?: boolean
}

interface IForm {
  className?: string,
  children?: any
}

interface IInput {
  className?: string,
  key?: any,
  disabled?: boolean,
  placeholder?: string,
  handleChange: any,
  name?: string,
  id?: string,
  type: string,
  value: any
}

interface ILabel {
  active?: boolean,
  key?: any,
  id?: any,
  text: any
}

interface IField {
  col?: boolean,
  m?: number,
  l?: number,
  xl?: number
}

export {
  IRoute,
  IForm,
  IInput,
  ILabel,
  IField
}
