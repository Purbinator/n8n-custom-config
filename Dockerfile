# 1. Meghatározzuk, melyik hivatalos n8n képből indulunk ki.
FROM n8nio/n8n:latest

# 2. Megadjuk a munkakönyvtárat a containeren belül.
# Az n8n image-ek általában a /data könyvtárát használják belső működésre.
WORKDIR /data

# 3. Telepítjük a pdf-lib csomagot az npm segítségével.
# Ez a parancs letöli és telepíti a pdf-lib-et a container /data/node_modules könyvtárába.
RUN npm install pdf-lib

# 4. Beállítjuk a NODE_PATH környezeti változót, hogy az n8n Code node találja a modulokat.
ENV NODE_PATH=/usr/local/lib/node_modules:/data/node_modules

# 5. (Opcionális) Ellenőrizzük a telepített modulokat.
RUN ls -la /data/node_modules
