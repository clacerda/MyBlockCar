// SPDX-License-Identifier: GPL-3.0

pragma solidity ^0.8.0;

contract myBlockCar {
    

    //Struct of cars 
    struct Carro{
        string marca;
        string cor; 
        uint aroRoda;
        bool ligar;
        uint256 idCar;
        uint32 tanque;
        //address owner;
    }

    //Owner cars
    mapping(address => Carro) public carProperty;

    // create a list of cars
    Carro[] carros;

    //Function for creation of new car
    function createCar(string memory _marca, string memory _cor, uint8 _aroRoda) external {
        Carro memory novoCarro; 

        novoCarro.marca = _marca;
        novoCarro.cor = _cor;
        novoCarro.aroRoda = _aroRoda;
        novoCarro.ligar = false;
        novoCarro.idCar = carros.length;
        //novoCarro.owner = msg.sender;
        novoCarro.tanque = 100;
        carros.push(novoCarro);

        carProperty[msg.sender] = novoCarro;
    }

    //Returns a list of cars
    function ListCars() external view returns (Carro[] memory) { 
        
        return carros;
    }
 

    //Returns a car
    function returnCar(uint _idCar) external view returns (Carro memory) {
       
        return carros[_idCar];
    }

 
    function ligarCarro(address _addr) external   returns (Carro memory) {
        //require(msg.sender == _addr, "Thief! You can not leave this car!");
        //require(carProperty[_addr].tanque < 10, "OMG, I think your fuel empity!");
        
        carProperty[_addr].ligar = true;
        carProperty[_addr].tanque - 10;

        return carProperty[_addr];
    }

    function desligarCarro(address _addr) public   returns (Carro memory){
        //require(msg.sender == _addr, "Thief! You can not leave this car!");
        
        carProperty[_addr].ligar = false;
        carProperty[_addr].tanque - 1;

        return carProperty[_addr];
    }

  
}
