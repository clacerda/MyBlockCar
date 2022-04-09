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
    mapping(address => Carro) internal carProperty;
    

    // create a list of cars
    Carro[] carros;

    //Function for creation of new car
    function createCar(string memory _marca, string memory _cor, uint8 _aroRoda, address _address, uint _valorVendaCarro) external {
        Carro memory novoCarro; 

        novoCarro.marca = _marca;
        novoCarro.cor = _cor;
        novoCarro.aroRoda = _aroRoda;
        novoCarro.ligar = false;
        novoCarro.idCar = getIdentityCar();
        novoCarro.owner = _address != address(0x0) ?  _address : msg.sender;
        novoCarro.tanque = 100;
        novoCarro.valorVendaCarro = _valorVendaCarro;
        novoCarro.aVenda = false;
        carros.push(novoCarro);

        carProperty[msg.sender] = novoCarro;
    }

     function getIdentityCar() internal returns (uint256){
        uint256 getIdentity = 0;
        for(uint256 i; i <= carros.length; i++){
            getIdentity += 1;
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

    function venderCarro(address _addr, uint256 _idCar) public payable  {
        require(carProperty[_addr].idCar == _idCar && carProperty[_addr].aVenda == false, "this car is not for sale");
        require(carProperty[_addr].valorVendaCarro <= msg.value, "insufficient value");
    
    }
    
    function enviaPagamento(address payable recebedor) public payable{
        recebedor.transfer(msg.value);
    }

    // modifier checaSeAVenda(address _addr, uint _idCar){
    //     require(carProperty[_addr].idCar == _idCar && carProperty[_addr].aVenda == false, "this car is not for sale");
    //     _;
    // }

    modifier checaGasolina(uint32 litro){
        require(10 < litro, "OMG, I think your fuel empity!");
        _;
    }
}
