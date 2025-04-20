    # 1. Meghatározzuk, melyik hivatalos n8n képből indulunk ki.
    # Javasolt egy konkrét verziót megadni a 'latest' helyett a stabilitás érdekében.
    # A legfrissebb verziót itt találod: https://hub.docker.com/r/n8nio/n8n/tags
    # Példa egy konkrét verzióra: FROM n8nio/n8n:1.23.0
    FROM n8nio/n8n:latest

    # 2. Megadjuk a munkakönyvtárat a containeren belül.
    # Az n8n image-ek általában a /data könyvtárat használják belső működésre.
    # Itt fogjuk telepíteni a plusz csomagot is.
    WORKDIR /data

    # 3. Telepítjük a pdf-lib csomagot az npm segítségével.
    # Ez a parancs letölti és telepíti a pdf-lib-et a container /data/node_modules könyvtárába.
    RUN npm install pdf-lib

    # Az n8n indításáról az alapként használt 'n8nio/n8n:latest' image gondoskodik,
    # így nekünk itt további teendőnk nincs az indítással.
