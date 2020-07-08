import React,{Component} from 'react'

import Answers from '../constants/Answers'

class QuestionContainer extends Component{
  constructor(props){
      super(props);
      this.state = {
        word:'',
        definition:'',
        herrings:[],
        id:'',
        selectedId:"",
        health:4
      }

      this.setSelectedId = this.setSelectedId.bind(this)
      this.resetTest = this.resetTest.bind(this)
      this.handleHealth = this.handleHealth.bind(this)
      this.handleClick = this.handleClick.bind(this)
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
        definition:vocabWord.definition,
        herrings: this.state.herrings.concat(shuffle(vocabList)),
        id:vocabWord.id
      })

    })
    .catch(error => console.error(`Error in fetch: ${error.message}`));
  }
  setSelectedId(id){
    this.setState({selectedId:id})
  }
  resetTest(){
      this.setState({
        word:'',
        definition:'',
        herrings:[],
        id:'',
        selectedId:""
      })
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
          definition:vocabWord.definition,
          herrings: this.state.herrings.concat(shuffle(vocabList)),
          id:vocabWord.id
        })
      })
      .catch(error => console.error(`Error in fetch: ${error.message}`));

      if(this.state.health <= 0){
        this.setState({
          health:4
        })
      }
  }
  handleHealth(){
    if(this.state.selectedId !== this.state.id) {
      this.setState({
        health:this.state.health - 1
      })
    }
  }

  handleClick(event){
    this.handleHealth()
    this.resetTest()
  }
  render(){
    let loss = <p></p>
    let result = <p></p>
    let correct = this.state.definition
    console.log(correct)
  let definitions = this.state.herrings.map((definition,key) =>{

    let setSelectedId =()=>{
    return this.setSelectedId(definition.id)
  }
    let className
    if (definition.id===this.state.selectedId){
      className = "selected"
    }else{
      className=""
    }
    return(
      <div className="definitions">
        <Answers
        key={definition.id}
        id={definition.id}
        answer={definition.definition}
        className={className}
        handleClick={setSelectedId}
        />
      </div>
    )
  })
  let words = this.state.word
  let text = <h3>Select the correct answer!</h3>
  let button =
  <button type="button" onClick={this.handleClick}>
    <span>Submit!</span>
  </button>

  if(this.state.selectedId !== ""){
    if (this.state.selectedId == this.state.id){
      result = <p> Correct!</p>
    }else{
      result = <p>Wrong!</p>
    }
  }

  if(this.state.health <= 0){
    text = ""
    words = ""
    definitions = <p>YOU LOSE!</p>
    button =
    <button type="button" onClick={this.handleClick}>
      <span>Try Again?</span>
    </button>

  }
    return(
      <div>
        <div className="testWord">
        <p>Health: {this.state.health}</p>
          {words}
          </div>
            {text}
              {definitions}
              {button}
      </div>
    )

  }
}
export default QuestionContainer
