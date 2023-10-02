import { mudConfig } from "@latticexyz/world/register";

export default mudConfig({
  enums: {
    // TODO
  },
  tables: {
    Role: {
      keySchema: {
        id: "bytes32",
      },
      schema: {
        age: "uint32",
        health: "uint32",
        karma: "uint32",
        name: "string",
        description: "string",
      },
    },
  },
});
