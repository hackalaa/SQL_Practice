# SQL-harjoituksia

**Drone-tietokanta**

Aihe: Tietokanta drone-kuvien tallennukseen, analysointiin ja edelleen lähetettäväksi.

Kuvaus: tietovarasto, johon tallennetaan:
* droneja (id, nimi, merkki, malli, lisäinfo)
* käyttäjiä (nimi, tunnus, salasana ja token sekä tieto, koska drone käytössä)
* dronen ottamia kuvia, joihin liitetään analysointietoja (id, nimi, analyysin kuvaus, paikkatieto (lat, lon), ajankohta)
* lähetysosoite, johon kuvat edelleen lähetetään analysoinnin jälkeen. Tallennetaan myös tarvittava tunnistautuminen (token)

Tietokannasta tulee saada seuraavat raportit:
* Kuka käyttää dronea
* Onko drone vapaana
* Dronen ottamat kuvat ja niiden käyttäjät
* Kuvan ottanut drone, kuvan analyysi, käyttäjä, ajankohta ja paikkatiedot
