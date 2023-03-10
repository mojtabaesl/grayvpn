import { writeFile, mkdir } from "node:fs/promises";

async function generateSubscriptionFiles(users = [], config = {}) {
  if (users.length === 0) return;
  const globalNetwork = config?.network;
  try {
    users.forEach(async (user) => {
      const configs = user.servers.map((server) => {
        const { uuid, name } = user;
        const { domain, sni, name: serverName, network } = server;
        const port = network?.port ?? globalNetwork?.port;
        const path = network?.path ?? globalNetwork?.path;
        const security = network?.security ?? globalNetwork?.security;
        const type = network?.type ?? globalNetwork?.type;

        return `vless://${uuid}@${domain}:${port}?path=${path}&security=${security}&encryption=none&type=${type}&sni=${sni}#${serverName}:${type.toUpperCase()}-VLESS/${name}`;
      });

      await mkdir("./export/subs", { recursive: true });
      await writeFile(`./export/subs/${user.username}.txt`, configs.join("\n"));
    });
  } catch (error) {
    console.log(error);
  }
}

async function generateXrayConfigFile(
  xrayConfigTemplate,
  users = [],
  config,
  plan
) {
  if (users.length === 0) return;
  let xrayConfig = xrayConfigTemplate;

  users.forEach((user) => {
    if (!user.active && user.plan !== plan) return;
    const client = {
      id: user?.uuid,
      level: 0,
      email: user.email,
    };

    xrayConfig.inbounds.forEach((inbound) => {
      if (inbound.tag == "vless-tcp") {
        inbound.settings.clients?.push({
          ...client,
          flow: config?.network?.flow,
        });
      }

      if (
        inbound.tag == "vmess-ws" ||
        inbound.tag == "vless-ws" ||
        inbound.tag == "vmess-tcp"
      ) {
        inbound.settings.clients?.push(client);
      }
    });
  });
  await mkdir("./export/subs", { recursive: true });
  await writeFile(
    "./export/xray-config.json",
    JSON.stringify(xrayConfig, undefined, 2)
  );
}

async function fetchFromJsonBin(binId) {
  const dataURL = `https://api.jsonbin.io/v3/b/${binId}`;

  const masterKey = process.env?.MASTER_KEY;
  const accessKey = process.env?.ACCESS_KEY;

  try {
    const res = await fetch(dataURL, {
      method: "GET",
      headers: {
        "Content-Type": "application/json",
        "X-Master-Key": masterKey,
        "X-Access-Key": accessKey,
      },
    });

    if (res.ok) {
      return res.json();
    }
  } catch (error) {
    console.log(error);
  }
}

(async function main() {
  try {
    const usersBinId = process.env?.USERS_BIN_ID;
    const xrayBinId = process.env?.XRAY_BIN_ID;
    const plan = process.env?.PLAN;

    const usersQueryResult = await fetchFromJsonBin(usersBinId);
    const { config, users } = usersQueryResult?.record;
    await generateSubscriptionFiles(users, config);

    const xrayCofigQueryResult = await fetchFromJsonBin(xrayBinId);
    await generateXrayConfigFile(
      xrayCofigQueryResult?.record,
      users,
      config,
      plan
    );
  } catch (error) {
    console.log(error);
  }
})();
