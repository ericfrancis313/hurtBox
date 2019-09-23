import React from 'react'


const Answers = (props) => {  
  return (
  <div id={props.Id} className={props.className} onClick={props.handleClick}>
    {props.answer}
  </div>
  )
}





export default Answers
