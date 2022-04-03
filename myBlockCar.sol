// SPDX-License-Identifier: GPL-3.0

pragma solidity ^0.8.0;

contract myBlockCar {
    //Owner cars
     mapping(address => Carro) public carProperty;

    //Struct of cars 
    struct Carro{
        string marca;
        string cor; 
        uint aroRoda;
        bool ligar;
        uint256 idCar;
        //address owner;
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
        novoCarro.idCar = carros.length;
        //novoCarro.owner = msg.sender;
        carros.push(novoCarro);
    }

    //Returns a list of cars
    function ListCars() external view returns (Carro[] memory) { 
        
        return carros;
    }

    //Change a cars owner // function changeOwnerCar(address _addr, uint _id, address _to) external view returns (Carro memory) {
    //      carProperty[_addr] =  
    // }

   

    //Returns a car
    function returnCar(uint _idCar) external view returns (Carro memory) {
       
        return carros[_idCar];
    }

 
    function ligarCarro(address _addr) external {
        require(msg.sender == _addr);

        
    }

  
}
