import React from 'react'

class TextFeild = (props) =>{
  return(
    <label>{props.label}
      <input
        name={props.name}
        type='text'
        value={props.content}
        onChange={props.handleChange}
      />
    </label>
  )
}
