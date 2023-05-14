## Mini Auditoria Parte2:


1. No se está usando la última versión de solidity, al dia de la fecha la ultima version es 0.8.20[https://docs.soliditylang.org/en/v0.8.20/]


2. En este caso los métodos pueden ser externos en lugar de públicos ahorrando así:


Cuando marcas una función como external, significa que esa función sólo puede ser llamada desde fuera del contrato.
Si se marca como public, significa que la función puede ser llamada tanto desde dentro como desde fuera del contrato.


¿Por qué ?


- Cuando se llama a una función externamente, la EVM trabaja con calldata, que es un área de datos inmutables y más barata.
Cuando se llama a una función internamente, la EVM trabaja con la memoria, que es más cara.




## Acciones:


1. Cambiamos la versión a la última disponible


```ts
pragma solidity 0.8.20;
```
