import React, {Component} from 'react'
import Form from './Form'
import QuestionContainer from './QuestionContainer'


class App extends React.Component {
  constructor(props) {
    super(props)
  }
    render(){

      return(
      <div className="box">
        <div className="text">
          <h1>VOCAB TEST</h1>
          <QuestionContainer/>
        </div>
      </div>
    )
  }
}

export default App
