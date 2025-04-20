    # 1. Indulj ki a konkrét n8n verzióból (1.88.0)
    FROM n8nio/n8n:1.88.0

    # 2. Állítsd be a munkakönyvtárat /data-ra
    WORKDIR /data

    # 3. Cache invalidáló argumentum és kiíratás
    #    Ez a sor minden buildnél változhat (vagy legalábbis invalidálja a cache-t)
    #    A lényeg, hogy valami változzon a telepítés előtt.
    ARG CACHEBUST=1
    RUN echo "Cachebust argument: $CACHEBUST"

    # 4. Telepítsd a pdf-lib csomagot HELYBEN (a /data/node_modules alá)
    #    Most már ennek a parancsnak ténylegesen le kell futnia, nem lehet CACHED.
    RUN npm install pdf-lib && \
        echo "--- Listing /data contents after install ---" && \
        ls -la /data && \
        echo "--- Listing /data/node_modules contents ---" && \
        ls -la /data/node_modules && \
        echo "--- End of listings ---"

    # 5. Az n8n indításáról az alap image gondoskodik. Visszaállítjuk a default usert.
    USER node
