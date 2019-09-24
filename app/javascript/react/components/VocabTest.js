import React,{Component} from 'react'
import AnswerContainer from './AnswerContainer'

class QuestionContainer extends Component{
  constructor(props){
      super(props);
      this.state = {
        word:'',
        definition:'',
        herrings:[]
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
      let vocabWord
      let vocabList = []
      let count = 1
      for(var i in body){
       vocabWord = body[Math.floor(Math.random()*body.length)]
          let word = vocabWord.word
          let definition = vocabWord.definition
          let id = vocabWord.id
      }
        vocabList.push(vocabWord)
      while(vocabList.length < 4) {
        let definitions = body[Math.floor(Math.random()*body.length)]
        if(vocabList.includes(definitions)== false){
          vocabList.push(definitions)
        }
      }


      let shuffle = function (array) {
        let currentIndex = array.length;
        let temporaryValue, randomIndex;
        while (0 !== currentIndex) {
        randomIndex = Math.floor(Math.random() * currentIndex);
        currentIndex -= 1;
        temporaryValue = array[currentIndex];
        array[currentIndex] = array[randomIndex];
        array[randomIndex] = temporaryValue;
        }
      return array;
      };

      this.setState({
        word:vocabWord.word,
        definition:vocabWord.id,
        herrings: this.state.herrings.concat(shuffle(vocabList))
      })
    })
    .catch(error => console.error(`Error in fetch: ${error.message}`));
  }
  render(){
    console.log(this.state)
  let definitions = this.state.herrings.map((definiton,key) =>
    <p>{definiton}</p>
  )
    return(
      <div>
        <div className="testWord">
          <h3>Word:</h3>
          <p>{this.state.word}</p>
        </div>
          <h3>Select the correct answer!</h3>
        <AnswerContainer
          answers={this.state.herrings}
          correct={this.state.definition}
        />
      </div>
    )
  }
}
export default QuestionContainer
