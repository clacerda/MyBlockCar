// SPDX-License-Identifier: GPL-3.0

pragma solidity ^0.8.0;

contract myBlockCar {
    //Owner cars
    mapping(address => uint) public carProperty;
    //Struct of cars 
    struct Carro{
        string marca;
        string cor; 
        uint aroRoda;
        bool ligar;  
    }
    // create a list of cars
    Carro[] carros;

    //Function for creation of new car
    function createCar(string memory _marca, string memory _cor, uint8 _aroRoda, bool _ligar) external {
        Carro memory novoCarro; 

        novoCarro.marca = _marca;
        novoCarro.cor = _cor;
        novoCarro.aroRoda = _aroRoda;
        novoCarro.ligar = _ligar; 

        carros.push(novoCarro);
    }

    //Create a cars owner
    function createOwnerCar(address _addr, uint _idCar) external{
         
        carProperty[_addr] = _idCar;
    }

    //Change a cars owner
    function changeOwnerCar(address _addr, uint _idCar) external {
        require(msg.sender == _addr);
 
        carProperty[_addr] = _idCar;
    }


    //Returns a car
    function returnCar(uint _idCar) external view returns (Carro memory) {
       
        return carros[_idCar];
    }

    //Start a car
    // function onOffCar() external(Carro memory){

    // }


  
}
