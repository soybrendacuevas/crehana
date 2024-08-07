## Smart Contract de prueba
### PréstamoAutomatizado
PréstamoAutomatizado es un contrato que permite la creación de préstamos entre un prestamista y un prestatario.
Funciones Clave:
- solicitarPréstamo: Permite al prestatario solicitar un préstamo, estableciendo el monto, la tasa de interés y la duración.
liberarFondos: El prestamista transfiere los fondos al prestatario. Solo puede ser llamado por el prestamista y asegura que los fondos se transfieren una vez.
- pagarPréstamo: Permite al prestatario pagar el monto total del préstamo más intereses. Al realizar el pago, el contrato se destruye, enviando los fondos al prestamista.

Este contrato simple demuestra cómo se pueden automatizar los préstamos financieros utilizando contratos inteligentes, asegurando la transferencia y el pago de fondos de manera segura y transparente.

### ProductoInteligente
El contrato ProductoInteligente es un contrato inteligente básico en Solidity diseñado para representar la propiedad y el manejo de un producto.
- Creación de Productos: Cuando el contrato se despliega, se crea un nuevo "Producto Inteligente" con un nombre, precio y propietario inicial. Esto puede ser útil para registrar productos físicos o digitales en la blockchain.
- Transferencia de Propiedad: El contrato permite la transferencia segura de la propiedad del producto a otra persona, asegurando que solo el propietario actual pueda realizar esta acción, lo cual es crucial para mantener la integridad y seguridad de la propiedad en la blockchain.

Este contrato es un ejemplo simple pero efectivo de cómo se puede utilizar la tecnología blockchain para manejar la propiedad y la gestión de activos digitales o físicos.
