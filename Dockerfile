    # 1. Indulj ki a konkrét n8n verzióból, amit használsz (ellenőrzött: 1.88.0)
    FROM n8nio/n8n:1.88.0

    # 2. Válts át ideiglenesen 'root' felhasználóra a globális telepítéshez,
    #    mivel a 'node' felhasználónak esetleg nincs jogosultsága globálisan írni.
    USER root

    # 3. Telepítsd a pdf-lib csomagot GLOBÁLISAN (-g kapcsoló).
    #    A --unsafe-perm kapcsolóra szükség lehet jogosultsági problémák elkerülése végett.
    RUN npm install -g pdf-lib --unsafe-perm

    # 4. Válts vissza az n8n alapértelmezett 'node' felhasználójára a biztonság érdekében.
    #    Az n8n folyamatok ezen a felhasználón futnak.
    USER node

    # 5. Az alapértelmezett munkakönyvtár valószínűleg /data vagy /home/node,
    #    de ezt az alap image kezeli. Explicit WORKDIR nem feltétlenül szükséges itt,
    #    hacsak nem volt konkrét oka a korábbi Dockerfile-ban.
    #    Az n8n indításáról az alap image gondoskodik.
