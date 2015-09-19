From: Oleksij Rempel <linux@rempel-privat.de>
Subject: Re: [PATCH] asus-wmi: restore kbd led level after resume
Date: Sat, 19 Sep 2015 07:45:31 +0200
Message-ID: <55FCF67B.4020201@rempel-privat.de>
References: <1442222190-8591-1-git-send-email-linux@rempel-privat.de>
 <20150918223144.GO66179@vmdeb7>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="k1kAaFAXDFF4x6ffpO5PRRrs4ulPnGinC"
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mout.gmx.net ([212.227.15.19]:61163 "EHLO mout.gmx.net"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751521AbbISFqQ (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Sat, 19 Sep 2015 01:46:16 -0400
In-Reply-To: <20150918223144.GO66179@vmdeb7>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Darren Hart <dvhart@infradead.org>
Cc: corentin.chary@gmail.com, acpi4asus-user@lists.sourceforge.net, platform-driver-x86@vger.kernel.org

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--k1kAaFAXDFF4x6ffpO5PRRrs4ulPnGinC
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Hi,

Am 19.09.2015 um 00:31 schrieb Darren Hart:
> On Mon, Sep 14, 2015 at 11:16:30AM +0200, Oleksij Rempel wrote:
>> Afters suspend/resume cycle with closed lid the kbd backlight level
>> is lost. This patch will will restore this value to last known level.
>>
>> Signed-off-by: Oleksij Rempel <linux@rempel-privat.de>
>=20
> Hi Oleksij,
>=20
> Please always run scripts/get_maintainer.pl -f path/to/files/changed
>=20
> And include *all* the maintainers and lists on Cc. This will ensure a f=
aster
> response.
>=20
>> ---
>>  drivers/platform/x86/asus-wmi.c | 19 +++++++++++++++++--
>>  1 file changed, 17 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/platform/x86/asus-wmi.c b/drivers/platform/x86/as=
us-wmi.c
>> index efbc3f0..1f7d80f 100644
>> --- a/drivers/platform/x86/asus-wmi.c
>> +++ b/drivers/platform/x86/asus-wmi.c
>> @@ -582,7 +582,7 @@ static void asus_wmi_led_exit(struct asus_wmi *asu=
s)
>> =20
>>  static int asus_wmi_led_init(struct asus_wmi *asus)
>>  {
>> -	int rv =3D 0;
>> +	int rv =3D 0, led_val;
>> =20
>>  	asus->led_workqueue =3D create_singlethread_workqueue("led_workqueue=
");
>>  	if (!asus->led_workqueue)
>> @@ -602,9 +602,11 @@ static int asus_wmi_led_init(struct asus_wmi *asu=
s)
>>  			goto error;
>>  	}
>> =20
>> -	if (kbd_led_read(asus, NULL, NULL) >=3D 0) {
>> +	led_val =3D kbd_led_read(asus, NULL, NULL);
>> +	if (led_val >=3D 0) {
>>  		INIT_WORK(&asus->kbd_led_work, kbd_led_update);
>> =20
>> +		asus->kbd_led_wk =3D led_val;
>>  		asus->kbd_led.name =3D "asus::kbd_backlight";
>>  		asus->kbd_led.brightness_set =3D kbd_led_set;
>>  		asus->kbd_led.brightness_get =3D kbd_led_get;
>> @@ -2160,6 +2162,16 @@ static int asus_hotk_thaw(struct device *device=
)
>>  	return 0;
>>  }
>> =20
>> +static int asus_hotk_resume(struct device *device)
>> +{
>> +	struct asus_wmi *asus =3D dev_get_drvdata(device);
>> +
>> +	if (!IS_ERR_OR_NULL(asus->kbd_led.dev))
>=20
> 	if (asus->kbd_led.dev)
>=20
> 	should be sufficient, I don't see the dev pointer being stored as an
> 	errno.
>=20
> 	Corentin?

led_classdev_register
  led_classdev_next_name
    device_create_with_groups
      device_create_groups_vargs
        retval =3D -ENODEV;
        retval =3D -ENOMEM;
        return ERR_PTR(retval);
  if (IS_ERR(led_cdev->dev))

this is how dev pointer is stored as errno.

>> +		queue_work(asus->led_workqueue, &asus->kbd_led_work);
>> +
>> +	return 0;
>> +}
>> +
>>  static int asus_hotk_restore(struct device *device)
>>  {
>>  	struct asus_wmi *asus =3D dev_get_drvdata(device);
>> @@ -2190,6 +2202,8 @@ static int asus_hotk_restore(struct device *devi=
ce)
>>  		bl =3D !asus_wmi_get_devstate_simple(asus, ASUS_WMI_DEVID_UWB);
>>  		rfkill_set_sw_state(asus->uwb.rfkill, bl);
>>  	}
>> +	if (!IS_ERR_OR_NULL(asus->kbd_led.dev))
>> +		queue_work(asus->led_workqueue, &asus->kbd_led_work);
>=20
> Ditto
>=20
>> =20
>>  	return 0;
>>  }
>> @@ -2197,6 +2211,7 @@ static int asus_hotk_restore(struct device *devi=
ce)
>>  static const struct dev_pm_ops asus_pm_ops =3D {
>>  	.thaw =3D asus_hotk_thaw,
>>  	.restore =3D asus_hotk_restore,
>> +	.resume =3D asus_hotk_resume,
>>  };
>> =20
>>  static int asus_wmi_probe(struct platform_device *pdev)
>> --=20
>> 2.5.0
>>
>> --
>> To unsubscribe from this list: send the line "unsubscribe platform-dri=
ver-x86" in
>> the body of a message to majordomo@vger.kernel.org
>> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>>
>=20


--=20
Regards,
Oleksij


--k1kAaFAXDFF4x6ffpO5PRRrs4ulPnGinC
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iF4EAREIAAYFAlX89oEACgkQHwImuRkmbWm5LgD5ASm4i9MYcIuCk9w2Q0efgUBw
ZSayj3tZMTWd1UtCj/sA/A07P05ZuNqIuKyPKSd5+KuUnZX8kTw8vCH4cCSjvdJe
=/DAi
-----END PGP SIGNATURE-----

--k1kAaFAXDFF4x6ffpO5PRRrs4ulPnGinC--
