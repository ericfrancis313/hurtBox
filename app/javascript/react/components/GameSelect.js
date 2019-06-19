import React from 'react';

class GameSelect extends React.Component {
  constructor(props){
    super(props);
    this.state ={
      game:''
    }
  }

  componentDidMount(){
    let game_id = 
    fetch(`/api/v1/games/${game_id}`)
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
      this.setState({game: body.game})
      console.log(body.game)
    })
    .catch(error => console.error(`Error in fetch: ${error.message}`));
  }
  render(){
    return(
      <div>
      {this.state.game.name}
      </div>
    )
  }
}
export default GameSelect
