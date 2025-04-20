    # 1. Indulj ki a konkrét n8n verzióból (1.88.0)
    FROM n8nio/n8n:1.88.0

    # 2. Állítsd be a munkakönyvtárat /data-ra
    WORKDIR /data

    # 3. Telepítsd a pdf-lib csomagot HELYBEN (a /data/node_modules alá)
    #    Lehet, hogy root jogosultság kell, ha az alap image nem kezeli, 
    #    de a korábbi logok alapján ez működött. Ha mégsem, próbáld USER root/USER node köré tenni.
    RUN npm install pdf-lib

    # 4. Az n8n indításáról az alap image gondoskodik. Visszaállítjuk a default usert.
    USER node 
