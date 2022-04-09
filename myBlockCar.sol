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
        bool aVenda;
    }

    //Owner cars
    mapping(uint256 => Carro) public carProperty;
 
    // create a list of cars
    Carro[] carros;

    //Function for creation of new car
    function createCar(string memory _marca, string memory _cor, uint32 _aroRoda, uint _valorVendaCarro) public {
        Carro memory novoCarro; 
 
        novoCarro.marca = _marca;
        novoCarro.cor = _cor;
        novoCarro.aroRoda = _aroRoda;
        novoCarro.ligar = false;
        novoCarro.idCar = getIdentityCar();
        novoCarro.owner = msg.sender ;
        novoCarro.tanque = 100;
        novoCarro.valorVendaCarro = _valorVendaCarro;
        novoCarro.aVenda = false;
        carros.push(novoCarro);

        carProperty[getIdentityCar()] = novoCarro;
    }

     function getIdentityCar() internal returns (uint256){
        uint256 getIdentity = 0;
        for(uint256 i = 0; i < carros.length; i++){
            getIdentity ++;
        }

        return getIdentity; 
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

 
    function ligarCarro(uint256 _idCar) public checaGasolina(carProperty[_idCar].tanque){
       require(carProperty[_idCar].owner == msg.sender, "Thief! You can not leave this car!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!");
        
        
        carProperty[_idCar].ligar = true;
        carProperty[_idCar].tanque = carProperty[_idCar].tanque  - 10;
 
    }

    function desligarCarro(uint256 _idCar) public  checaGasolina(carProperty[_idCar].tanque){
        require(carProperty[_idCar].owner == msg.sender, "Thief! You can not leave this car!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!");
        
        carProperty[_idCar].ligar = false;
        carProperty[_idCar].tanque = carProperty[_idCar].tanque  - 5;
 
    }

  
    function ComprarCarro(uint256 _idCar, address payable _to) public payable checarTermosVenda(_idCar) {
       require(carProperty[_idCar].owner == msg.sender, "Thief! You can not leave this car!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!");
        //transfere o dinheiro ao vendedor
        _to.transfer(msg.value);
        //transfere o carro ao novo dono
        carProperty[_idCar].owner = msg.sender;
        
    }
    
    modifier checarTermosVenda(uint256 _idCar){
        require(carProperty[_idCar].aVenda == false, "This car isn't a sale!");
        _;
    }

   
    modifier checaGasolina(uint32 litro){
        require(10 < litro, "OMG, I think your fuel empity!");
        _;
    }
}
