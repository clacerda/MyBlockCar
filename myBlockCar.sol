// SPDX-License-Identifier: GPL-3.0

pragma solidity ^0.8.0;

contract myBlockCar {

    struct Carro{
        string marca;
        string cor; 
        uint8 rodas; 
    }

    Carro[] carros;

    function criarCarro(string memory _marca, string memory _cor, uint8 _rodas) external {
        Carro memory novoCarro; 

        novoCarro.marca = _marca;
        novoCarro.cor = _cor;
        novoCarro.rodas = _rodas;

        carros.push(novoCarro);
 
    }

}
