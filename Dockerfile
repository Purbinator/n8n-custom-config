    # Használjuk a legfrissebb hivatalos n8n image-et.
    # Ez automatikusan frissülhet, amikor az n8n új verziót ad ki a 'latest' tag-re.
    # Ha fix verziót szeretnél, cseréld ki pl. 'n8nio/n8n:1.88.0'-ra.
    FROM n8nio/n8n:latest

    # Az alap image tartalmazza a szükséges WORKDIR, USER és indítási beállításokat.
    # Nincs szükség további utasításokra az alap működéshez.
