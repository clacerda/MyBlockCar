// SPDX-License-Identifier: GPL-3.0

pragma solidity ^0.8.0;

contract myBlockCar {

    struct Carro{
        string marca;
        string cor;
        uint marcha;
        uint8 aroRoda; 
    }

    Carro[] public carros;

    function criarCarro(string memory _marca, string memory _cor, uint8 marcha, uint8 _aroRoda) external {
        Carro memory novoCarro; 

        novoCarro.marca = _marca;
        novoCarro.cor = _cor;
        novoCarro.aroRoda = _aroRoda;

        carros.push(novoCarro);
 
    }

}
