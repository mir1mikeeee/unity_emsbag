# 💉 Unity EMS-Bag (ESX/QBCore) 

## 📃 Beschreibung

**Unity EMS-Bag** ist ein erweitertes medizinisches Ausrüstungs-Add-on für die **osp_ambulance**-Ressource. Ursprünglich von **hitachi_90** (Discord) entwickelt (Version 0.1), wurde es in höheren Versionen von **mir_mikeeee** verbessert. 

### ✨ Funktionen:
- ✅ **Inventar-Unterstützung**: Kompatibel mit **qs-inventory**, **qb-inventory** und **ox_inventory**.
- 🔧 **Target-System**: Standardmäßig **ox-target** oder **qb-target**, konfigurierbar auf Tastendruck-Steuerung.
- ⚕️ **SARF-Bag für osp_ambulance**: Zugriff auf medizinische Gegenstände.
- 🛠 **Persönliches SARF-Inventar**: Funktioniert wie ein tragbarer Kofferraum.
- 💡 **Übersichtliche Konfiguration**: Anpassbare `config.lua`.
- 🌍 **Framework-Unterstützung**: Kompatibel mit **QBCore** und **ESX**.
- 🛠️ **Add-on SARF-Bag**: Kein Ersatz bestehender Gegenstände.

---

## 🛠 Installation

### 📊 1. Abhängigkeiten
Stelle sicher, dass folgende Ressourcen installiert sind:
- ⚙ **ox_inventory** oder ein kompatibles Inventar-System (*qs-inventory, qb-inventory*)
- 🔍 **ox_target** oder **qb-target** für Interaktionen
- ⚕️ **osp_ambulance** (das SARF-Bag ist dafür optimiert)

### 📝 2. Installation
1. Lade die **unity_emsbag**-Ressource herunter und platziere sie im `resources`-Ordner.
2. Füge folgende Zeile in die `server.cfg` ein:
   ```ini
   ensure unity_emsbag
   ```
3. Erstelle in deiner Datenbank ein Item mit dem Namen **emsbag**, falls es nicht existiert.

### 🔍 3. Konfiguration
Öffne `config.lua` und passe die Einstellungen an:
- Auswahl des **Inventarsystems**
- Wechsel zwischen **Target-System** oder **Tastensteuerung**
- Weitere Anpassungen

### 🌐 4. Sprachunterstützung (OX_LIB)
Falls **ox_lib** genutzt wird, setze die Sprache mit:
```ini
setr ox:locale en  # Für Englisch (ändere zu 'de' für Deutsch)
```

---

## 💊 Nutzung
- Das **emsbag**-Item öffnet das medizinische SARF-Bag.
- Spieler können **medizinische Gegenstände** entnehmen oder ihr persönliches SARF-Bag nutzen.
- **QBCore & ESX** vollständig unterstützt.

---

## 🛠 English Version

### 🌟 Description
**Unity EMS-Bag** is an advanced medical equipment add-on for **osp_ambulance**. Initially developed by **hitachi_90** (Discord) (Version 0.1), later improved by **mir_mikeeee**.

### ✨ Features:
- ✅ **Inventory Support**: Compatible with **qs-inventory**, **qb-inventory**, and **ox_inventory**.
- 🔧 **Target System**: Uses **ox-target** or **qb-target** by default, configurable to key-based control.
- ⚕️ **SARF-Bag for osp_ambulance**: Access to medical items.
- 🛠 **Personal SARF Inventory**: Functions as a portable trunk.
- 💡 **Clear Configuration**: Customizable `config.lua`.
- 🌍 **Framework Support**: Works with **QBCore** and **ESX**.
- 🛠️ **Add-on SARF-Bag**: Adds a new medical bag without replacing existing items.

---

### 🛠 Installation
#### 📊 1. Requirements
Ensure you have the following dependencies installed:
- ⚙ **ox_inventory** or a compatible inventory system (*qs-inventory, qb-inventory*)
- 🔍 **ox_target** or **qb-target** for interaction
- ⚕️ **osp_ambulance** (The SARF-Bag is optimized for this system)

#### 📝 2. Installation Steps
1. Download the **unity_emsbag** resource and place it in your `resources` folder.
2. Add the following line to your `server.cfg`:
   ```ini
   ensure unity_emsbag
   ```
3. Ensure your database includes an item called **emsbag**. If it does not exist, add it manually.

#### 🔍 3. Configuration
Open `config.lua` and customize the settings:
- Selecting the **inventory system**
- Switching between **target system** and **key-based activation**
- Additional adjustments

#### 🌐 4. Language Support (OX_LIB)
If using **ox_lib**, set the language variable correctly:
```ini
setr ox:locale en  # Change to 'de' for German
```

---

### 💊 Usage
- The **emsbag** item allows players to access the medical SARF-Bag.
- Players can **retrieve medical items** or use their personal SARF-Bag as a portable trunk.
- **QBCore & ESX** are fully supported.

---

### 💡 Notes
For any issues or suggestions, contact **mir_mikeeee** or create a **GitHub issue**.

