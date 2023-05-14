## Mini Auditoria Parte1:

1. Underflow/Overflow de enteros: Las operaciones de suma y resta en Solidity no son seguras por defecto en versiones menores a la 0.8.0

- Si el resultado de una operación de resta es negativo o
- Si el resultado de una suma es mayor que 2^256 - 1
  El resultado se desbordará y será incorrecto.

SafeMath[https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/utils/math/SafeMath.sol]

2. Falta de eventos: Los contratos ERC20 deben emitir eventos para las operaciones transfer y approval dado que es parte del estándar ERC20.
   https://eips.ethereum.org/EIPS/eip-20

3. Ausencia de verificaciones de seguridad: No existe comprobaciones para verificar si el parámetro \_to en la función transfer y en la funcion transferFrom
   no es la dirección 0x00 o Null.

## Acciones:

1. Podemos usar la librería OpenZeppelin SafeMath que nos proporciona un conjunto de operaciones que lanzan excepciones
   en caso que ocurra un overflow o underflow.

2.

```ts
uint256 allowance = allowance[_from][msg.sender];
balances[_from] = balances[_from].sub(_value);
balances[_to] = balances[_to].add(_value);
allowance[_from][msg.sender] = allowance.sub(_value);
```

3.

```ts
event Transfer(address indexed _from, address indexed _to, uint256 _value)
event Approval(address indexed _owner, address indexed _spender, uint256 _value)
```

4. Agregar en el transfer, transferFrom y approval un `require` para evitar enviar tokens a la direccion NULL

```ts
require(_to != address(0), "Null is an invalid address");
```
