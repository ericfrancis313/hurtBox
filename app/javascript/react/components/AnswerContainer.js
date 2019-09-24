import React,{Component} from 'react'
import Answers from '../constants/Answers'

class AnswerContainer extends Component{
  constructor(props){
      super(props)
      this.state = {
        selectedId:''
      }
      this.setSelectedId = this.setSelectedId.bind(this)
  }
  setSelectedId(id){
    this.setState({selectedId:id})
  }
  render(){
    let correct = this.props.correct
    let result = <p></p>

    if (this.state.selectedId !== ""){
      if (this.state.selectedId == correct){
        result = <p>Correct!</p>
      }else{
          result = <p>Wrong!</p>
        }
    }
      let answers=this.props.answers.map((answer)=>{

        let setSelectedId =()=>{
        return this.setSelectedId(answer.id)
      }
      let className
      if(answer.id===this.state.selectedId){
        className = "selected"
      }else{
        className=""
      }
      return(
        <Answers
        key={answer.id}
        id={answer.id}
        answer={answer.definition}
        className={className}
        handleClick = {setSelectedId}
        />
      )
    })
      return(
        <div>
        {answers}
        {result}
        </div>
      )
  }
}

export default AnswerContainer
