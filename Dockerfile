# 1. Alap kép használata
FROM n8nio/n8n:latest

# 2. Munkakönyvtár beállítása
WORKDIR /data

# 3. pdf-lib telepítése
RUN npm install pdf-lib

# 4. NODE_PATH beállítása
ENV NODE_PATH=/usr/local/lib/node_modules:/data/node_modules

# 5. (Opcionális) Ellenőrzés a telepített modulokról
RUN ls -la /data/node_modules
