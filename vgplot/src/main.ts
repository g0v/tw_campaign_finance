import * as vg from "@uwdata/vgplot";

import yaml from "yaml";

export async function load(view: any) {
  const wasm = await vg.wasmConnector();
  vg.coordinator().databaseConnector(wasm);
  
  
  const spec = yaml.parse(
    await fetch(`campaign-finance.yaml`).then(res => res.text())
  );
  
  const child = await vg.parseSpec(spec, { baseURL: location.href + '/' });
  
  view!.replaceChildren(child);
 
}