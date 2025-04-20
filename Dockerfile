    # 1. Indulj ki a konkrét n8n verzióból (1.88.0)
    FROM n8nio/n8n:1.88.0

    # 2. Válts át 'root' felhasználóra a telepítéshez n8n saját könyvtárába
    USER root

    # 3. Navigálj az n8n fő node_modules könyvtárának VALÓSZÍNŰ szülőkönyvtárába.
    #    Ez az útvonal az n8n image belső szerkezetétől függ, de a stack trace alapján ez a legjobb tipp.
    WORKDIR /usr/local/lib/node_modules/n8n

    # 4. Telepítsd a pdf-lib-et közvetlenül ide.
    #    Így a pdf-lib bekerül a /usr/local/lib/node_modules/n8n/node_modules/ alá.
    #    A --save kapcsoló itt nem lényeges, csak a fájlok jelenléte.
    #    A --unsafe-perm továbbra is hasznos lehet jogosultsági problémák miatt.
    RUN npm install pdf-lib --unsafe-perm

    # 5. Válts vissza a 'node' felhasználóra
    USER node

    # 6. Állítsd vissza az alapértelmezett munkakönyvtárat /data-ra, ahogy az n8n várja.
    WORKDIR /data
