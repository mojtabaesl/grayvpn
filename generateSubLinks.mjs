import { readFile, writeFile, mkdir } from "node:fs/promises";

(async function generateSubLinks() {
  try {
    const json = await readFile("../configs/users.json", { encoding: "utf-8" });
    const users = JSON.parse(json).users;
    users.forEach(async (user) => {
      const configs = user.servers.map((server) => {
        return `vless://${user.uuid}@${server.domain}:${
          user.network.port
        }?path=${user.network.path}&security=${
          user.network.security
        }&encryption=none&type=${user.network.type}&sni=${server.sni}#${
          server.name
        }:${user.network.type.toUpperCase()}-VLESS/${user.name}`;
      });

      await mkdir("./export/subs", { recursive: true });
      await writeFile(`./export/subs/${user.username}.txt`, configs.join("\n"));
    });
  } catch (error) {
    console.log(error);
  }
})();
