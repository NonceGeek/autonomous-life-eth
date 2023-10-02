import { Has, HasValue, getComponentValue, runQuery } from "@latticexyz/recs";
import { uuid, awaitStreamValue } from "@latticexyz/utils";
import { MonsterCatchResult } from "../monsterCatchResult";
import { ClientComponents } from "./createClientComponents";
import { SetupNetworkResult } from "./setupNetwork";

export type SystemCalls = ReturnType<typeof createSystemCalls>;

export function createSystemCalls(
  { singletonEntity, playerEntity, worldSend, txReduced$ }: SetupNetworkResult,
  components: ClientComponents
) {
  const moveTo = async (x: number, y: number) => {
    // TODO
    return null as any;
  };

  const moveBy = async (deltaX: number, deltaY: number) => {
    // TODO
    return null as any;
  };

  const spawn = async (x: number, y: number) => {
    // TODO
    return null as any;
  };

  const throwBall = async () => {
    // TODO
    return null as any;
  };

  const fleeEncounter = async () => {
    // TODO
    return null as any;
  };

  const genRole = async (name : string, description :string , age: number, karma: number) => {
    // console.log("genRole");
    // const tx = await worldContract.write.genRole(age, karma, name, description);
    const tx = await worldSend("genRole", [ age, karma, name, description ]);
    //   // const tx = await worldSend("genRole", { 100 , 0, "test", "Aha"});
    // // worldContract.write.genRole(100, 0, "test", "test");
    await awaitStreamValue(txReduced$, (txHash) => txHash === tx.hash);
  }

  return {
    moveTo,
    moveBy,
    spawn,
    throwBall,
    fleeEncounter,
    genRole,
  };
}
