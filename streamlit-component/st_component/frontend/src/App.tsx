import { useState, useEffect } from 'react'
import {
  Streamlit,
  withStreamlitConnection,
  type ComponentProps,
} from 'streamlit-component-lib'

type Args = {
  name: string
}

const Component = (props: ComponentProps) => {
  const { name }: Args = props.args
  const [count, setCount] = useState(0)

  useEffect(() => {
    Streamlit.setFrameHeight()
  }, [])

  const handleClick = () => {
    const newCount = count + 1
    setCount(newCount)
    Streamlit.setComponentValue(newCount)
  }

  return (
    <span>
      Hello, {name}! &nbsp;
      <button onClick={handleClick}>Click Me!</button>
    </span>
  )
}

const ConnectedComponent = withStreamlitConnection(Component)

export default ConnectedComponent
