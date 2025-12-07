#include <sourcemod>
#include <WeaponHandling>
#include <colors>

public Plugin myinfo = {
    name = "Reload Speed Guns",
    description = "Sueño Max",
    author = "Shlould",
    version = "1.2",
    url = "https://unknowns.dev/"
};

public void WH_OnReloadModifier(int client, int weapon, L4D2WeaponType weapontype, float &speedmodifier) {
    switch(weapontype) {
        case L4D2WeaponType_Pistol: {
            speedmodifier *= 1.5;
        }
        case L4D2WeaponType_HuntingRifle, L4D2WeaponType_SniperMilitary: {
            speedmodifier *= 0.8;
        }
    }
}

public void WH_OnGetRateOfFire(int client, int weapon, L4D2WeaponType weapontype, float &speedmodifier) {
    switch(weapontype) {
        case L4D2WeaponType_HuntingRifle, L4D2WeaponType_SniperMilitary: {
            speedmodifier *= 0.8;
        }
    }
}
