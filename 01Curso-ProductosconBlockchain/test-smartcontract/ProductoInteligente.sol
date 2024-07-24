// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract ProductoInteligente {
    string public nombre;
    uint public precio;
    address public propietario;

    event ProductoCreado(string nombre, uint precio, address propietario);

    constructor(string memory _nombre, uint _precio) {
        nombre = _nombre;
        precio = _precio;
        propietario = msg.sender;
        emit ProductoCreado(_nombre, _precio, msg.sender);
    }

    function transferirPropiedad(address _nuevoPropietario) public {
        require(msg.sender == propietario, "Solo el propietario puede transferir el producto");
        propietario = _nuevoPropietario;
    }
}
