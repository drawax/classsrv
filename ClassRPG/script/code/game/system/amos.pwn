#if defined __game_system_amos
	#endinput
#endif
#define __game_system_amos

/****************************
 *           cmdk           *
 *    �: 1   �: 4   �: 7    *
 *    �: 2   �: 5   �: 8    *
 *    �: 3   �: 6   �: 9    *  
 ****************************/

//*******************************************************************************************************
//Verzi� V3.6
// /fme - cselekv�s feliratot helyez a feje f�l�, az �sszetettebb RP-k �rdek�ben.
// /fdo - t�rt�n�s feliratot helyez a feje f�l�, szint�n az �sszetettebb RP-k �rdek�ben.
// /fnv - n�vtelen cselekv�st helyez a feje f�l�, de az IDK ott lesz, �gy az adminok tudj�k ki az.
// (PL: ha szeretn�d, hogy �szre vegy�k, ha megs�r�lt�l, de nem ez az els�dleges c�l)
// /felszerel�sek poz�ci�ja pontosan ugyan ott lesz ahol a duty hely, �gy IG �trak�skor ez is v�ltozik.
// Munka�gyi hivatal beiktat�sa (Teh�t m�r nem a v�rosh�z�n van!)
// /sex paramcs �gyban is haszn�lhat� t�nylegesen.
// fegyver k�sz�t�s mostant�l csak a Maffia sz�m�ra el�rhet�.
// drog k�sz�t�s mostant�l csak a Band�k sz�m�ra el�rhet�.
// Rendv�delm nagyobb kaliber� fegyverei kicsit visszafogva.
//*******************************************************************************************************