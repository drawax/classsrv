#include <a_samp>

stock GetSpeedFromVelocity(Float:x, Float:y, Float:z)
{
	return floatround( floatsqroot(x*x + y*y + z*z) * 160.0 );
}

new test[21][3][32];
public OnFilterScriptInit()
{
	new korlat = 50;
	new Float:x = 0.5, Float:y = 0.5, Float:z;
	new spd = GetSpeedFromVelocity(x, y, z);
	printf("korlat: %d, spd: %d", korlat, spd);
	
	if(korlat < spd)
	{
		new Float:dec = (float(korlat) - 3.0) / float(spd);
		x *= dec;
		y *= dec;
		z *= dec;
		
		new newSpd = GetSpeedFromVelocity(x, y, z);
		printf("newspd: %d", newSpd);
	}
	
	return true;
}