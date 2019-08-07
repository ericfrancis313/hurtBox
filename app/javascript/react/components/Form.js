import React, {Components} from 'react'


class Form extends Component {
  constructor(props){
    super(props)
    this.state = {
      CharacterName: '',
      MoveName:'',
      MoveInput:''
    }
  }
  render(){
    return(
      <div>
        <h3> Create New Fighter!</h3>
      </div>
    )
  }
}
export default Form
