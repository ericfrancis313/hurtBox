import React,{Component} from 'react'


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
      }
        vocabList.push(vocabWord.definition)
      while(vocabList.length < 4) {
        let definitions = body[Math.floor(Math.random()*body.length)].definition
        if(vocabList.includes(definitions)== false){
          vocabList.push(definitions)
        }
      }

      var shuffle = function (array) {

        var currentIndex = array.length;
        var temporaryValue, randomIndex;
        while (0 !== currentIndex) {
        randomIndex = Math.floor(Math.random() * currentIndex);
        currentIndex -= 1;
        temporaryValue = array[currentIndex];
        array[currentIndex] = array[randomIndex];
        array[randomIndex] = temporaryValue;
        }
      return array;
      };

      console.log(shuffle(vocabList))
      this.setState({
        word:vocabWord.word,
        definition:vocabWord.definition,
        herrings: this.state.herrings.concat(vocabList)
      })
      console.log(this.state.herrings)
    })
    .catch(error => console.error(`Error in fetch: ${error.message}`));
  }
  render(){
  let definitions = this.state.herrings.map((definiton) =>
    <p>{definiton}</p>
  )

  
    return(
      <div>
        <div className="testWord">
          <h3>{this.state.word}</h3>
        </div>
          <p>Select the correct answer!</p>
        <div>
          <h5>{definitions}</h5>
        </div>
      </div>
    )
  }
}
export default QuestionContainer
