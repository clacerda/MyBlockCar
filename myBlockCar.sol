// SPDX-License-Identifier: GPL-3.0

pragma solidity ^0.8.0;

contract myBlockCarCreate {
    

    //Struct of cars 
    struct Carro{
        string marca;
        string cor; 
        uint32 aroRoda;
        bool ligar;
        uint256 idCar;
        address owner;
        uint32 tanque;
        uint valorVendaCarro;
                
    }

    //Owner cars
    mapping(address => Carro) public carProperty;

    // create a list of cars
    Carro[] carros;

    //Function for creation of new car
    function createCar(string memory _marca, string memory _cor, uint8 _aroRoda, uint _valorVendaCarro) external {
        Carro memory novoCarro; 

        novoCarro.marca = _marca;
        novoCarro.cor = _cor;
        novoCarro.aroRoda = _aroRoda;
        novoCarro.ligar = false;
        novoCarro.idCar = carros.length;
        novoCarro.owner = msg.sender;
        novoCarro.tanque = 100;
        novoCarro.valorVendaCarro = _valorVendaCarro;
        carros.push(novoCarro);

        carProperty[msg.sender] = novoCarro;
    }
  
}

contract myBlockCarChange is myBlockCarCreate {
        //Returns a list of cars
    function ListCars() external view returns (Carro[] memory) { 
        
        return carros;
    }
 

    //Returns a car
    function returnCar(uint _idCar) external view returns (Carro memory) {
       
        return carros[_idCar];
    }

 
    function ligarCarro(address _addr) public  checaGasolina(carProperty[msg.sender].tanque) {
        require(carProperty[msg.sender].owner == _addr, "Thief! You can not leave this car!");
        
        
        carProperty[_addr].ligar = true;
        carProperty[_addr].tanque = carProperty[_addr].tanque  - 10;
 
    }

    function desligarCarro(address _addr) public  checaGasolina(carProperty[msg.sender].tanque){
        require(carProperty[msg.sender].owner == _addr, "Thief! You can not leave this car!");
        
        carProperty[_addr].ligar = false;
        carProperty[_addr].tanque = carProperty[_addr].tanque  - 5;
 
    }

    function verificaTanque(address _addr) public view returns (uint32){
        return carProperty[_addr].tanque;
    }

    modifier checaGasolina(uint32 litro){
        require(10 < litro, "OMG, I think your fuel empity!");
        _;
    }
}
