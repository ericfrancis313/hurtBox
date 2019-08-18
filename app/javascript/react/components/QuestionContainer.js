import React,{Component} from 'react'


class QuestionContainer extends Component{
  constructor(props){
      super(props);
      this.state = {
        word:''
      }
  }
  componentDidMount(){
    fetch(`/api/v1/vocabularies`)
    .then(response => {
    
      if (response.ok) {
        return response;
      } else {
        let errorMessage = `${response.status}(${response.statusText})`,
        error = new Error(errorMessage);
        throw(error);
      }
    })
    .then(response => response.json())
    .then(body => {
      this.setState({word: body.word})
    })
    .then(body => {
      this.conditionalStyling()
    })
    .catch(error => console.error(`Error in fetch: ${error.message}`));
  }
  render(){
    return(
      <div>
      yorp
      </div>
    )
  }
}



export default QuestionContainer
