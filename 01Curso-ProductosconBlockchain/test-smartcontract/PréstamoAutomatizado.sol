// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract PrestamoAutomatizado {
    address public prestamista;
    address public prestatario;
    uint256 public montoPrestamo;
    uint256 public tasaInteres; // Representada en porcentaje
    uint256 public fechaVencimiento;
    uint256 public montoTotalPagar;
    bool public prestamoLiberado;

    event PrestamoSolicitado(address indexed prestatario, uint256 monto, uint256 interes);
    event FondosLiberados(address indexed prestatario, uint256 monto);
    event PrestamoPagado(address indexed prestatario, uint256 monto);

    constructor() {
        prestamista = msg.sender;
    }

    function solicitarPrestamo(uint256 _monto, uint256 _tasaInteres, uint256 _dias) public {
        require(prestatario == address(0), "Prestamo ya solicitado");
        prestatario = msg.sender;
        montoPrestamo = _monto;
        tasaInteres = _tasaInteres;
        fechaVencimiento = block.timestamp + (_dias * 1 days);
        montoTotalPagar = _monto + (_monto * _tasaInteres / 100);
        emit PrestamoSolicitado(prestatario, _monto, _tasaInteres);
    }

    function liberarFondos() public payable {
        require(msg.sender == prestamista, "Solo el prestamista puede liberar fondos");
        require(msg.value == montoPrestamo, "Monto incorrecto para liberar fondos");
        require(prestamoLiberado == false, "Fondos ya liberados");
        prestamoLiberado = true;
        payable(prestatario).transfer(montoPrestamo);
        emit FondosLiberados(prestatario, montoPrestamo);
    }

    function pagarPrestamo() public payable {
        require(msg.sender == prestatario, "Solo el prestatario puede pagar el prestamo");
        require(msg.value == montoTotalPagar, "Monto incorrecto para pagar el prestamo");
        require(block.timestamp <= fechaVencimiento, "El prestamo ha vencido");
        emit PrestamoPagado(prestatario, msg.value);
        payable(prestatario).transfer(address(this).balance);
    }
}
