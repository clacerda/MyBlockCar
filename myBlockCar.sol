// SPDX-License-Identifier: GPL-3.0

pragma solidity ^0.8.0;

contract myBlockCar {

    struct Carro{
        string marca;
        string cor; 
        uint8 aroRoda;
        bool ligar;
        address owner;
    }

    Carro[] carros;

    mapping(address => uint) private myCar;

    function criarCarro(string memory _marca, string memory _cor, uint8 _aroRoda, bool _ligar) external {
        Carro memory novoCarro; 

        novoCarro.marca = _marca;
        novoCarro.cor = _cor;
        novoCarro.aroRoda = _aroRoda;
        novoCarro.ligar = _ligar;

        carros.push(novoCarro);
    }


    function changeOwnerCar(address _addr) external view returns (Carro memory) {
        Carro memory novoCarro;
        novoCarro.owner = _addr;
    } 


    function retornarCarro(uint8 identityCar) external view returns (Carro memory){
       
        return carros[identityCar];
    }

}
