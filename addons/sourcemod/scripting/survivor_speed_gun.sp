#include <sourcemod>
#include <sdktools>

public Plugin myinfo = {
    name = "Reload Speed Guns",
    description = "Plugin of Vanila Max",
    author = "Shlould",
    version = "1.0",
    url = "https://unknowns.dev/"
};

public void OnClientPutInServer(int client) {
    CreateTimer(1.0, Timer_AdjustSpeed, client, TIMER_REPEAT|TIMER_FLAG_NO_MAPCHANGE);
}

public Action Timer_AdjustSpeed(Handle timer, int client) {
    AdjustSpeed(client);
    return Plugin_Continue;
}

void AdjustSpeed(int client) {
    if (!IsClientInGame(client)) return;

    char weapon[64];
    GetClientWeapon(client, weapon, sizeof weapon);

    if (StrEqual(weapon, "weapon_sniper_military")) {
        SetEntPropFloat(client, Prop_Send, "m_flMaxspeed", 190.0);
    } else {
        SetEntPropFloat(client, Prop_Send, "m_flMaxspeed", 220.0);
    }
}
