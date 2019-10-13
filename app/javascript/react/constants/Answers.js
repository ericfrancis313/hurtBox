import React from 'react'


const Answers = (props) => {

  return (
  <div className="definitions">
    <div id={props.Id} className={props.className} onClick={props.handleClick} >
      {props.answer}
    </div>
  </div>
  )
}





export default Answers
