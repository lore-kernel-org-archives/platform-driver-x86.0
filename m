From: Oleksij Rempel <linux@rempel-privat.de>
Subject: Re: [PATCH] asus-wmi: restore kbd led level after resume
Date: Mon, 21 Sep 2015 19:28:59 +0200
Message-ID: <56003E5B.8040402@rempel-privat.de>
References: <1442222190-8591-1-git-send-email-linux@rempel-privat.de>
 <20150918223144.GO66179@vmdeb7> <55FCF67B.4020201@rempel-privat.de>
 <20150921171243.GB117557@vmdeb7>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="utulpxH22jM3fbKdXaWlASu6beh9vxO6s"
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mout.gmx.net ([212.227.15.18]:62912 "EHLO mout.gmx.net"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1756591AbbIUR3j (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Mon, 21 Sep 2015 13:29:39 -0400
In-Reply-To: <20150921171243.GB117557@vmdeb7>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Darren Hart <dvhart@infradead.org>
Cc: corentin.chary@gmail.com, acpi4asus-user@lists.sourceforge.net, platform-driver-x86@vger.kernel.org

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--utulpxH22jM3fbKdXaWlASu6beh9vxO6s
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Am 21.09.2015 um 19:12 schrieb Darren Hart:
> On Sat, Sep 19, 2015 at 07:45:31AM +0200, Oleksij Rempel wrote:
>> Hi,
>>
>> Am 19.09.2015 um 00:31 schrieb Darren Hart:
>>> On Mon, Sep 14, 2015 at 11:16:30AM +0200, Oleksij Rempel wrote:
>>>> Afters suspend/resume cycle with closed lid the kbd backlight level
>>>> is lost. This patch will will restore this value to last known level=
=2E
>>>>
>>>> Signed-off-by: Oleksij Rempel <linux@rempel-privat.de>
>>>
>>> Hi Oleksij,
>>>
>>> Please always run scripts/get_maintainer.pl -f path/to/files/changed
>>>
>>> And include *all* the maintainers and lists on Cc. This will ensure a=
 faster
>>> response.
>>>
>>>> ---
>>>>  drivers/platform/x86/asus-wmi.c | 19 +++++++++++++++++--
>>>>  1 file changed, 17 insertions(+), 2 deletions(-)
>>>>
>>>> diff --git a/drivers/platform/x86/asus-wmi.c b/drivers/platform/x86/=
asus-wmi.c
>>>> index efbc3f0..1f7d80f 100644
>>>> --- a/drivers/platform/x86/asus-wmi.c
>>>> +++ b/drivers/platform/x86/asus-wmi.c
>>>> @@ -582,7 +582,7 @@ static void asus_wmi_led_exit(struct asus_wmi *a=
sus)
>>>> =20
>>>>  static int asus_wmi_led_init(struct asus_wmi *asus)
>>>>  {
>>>> -	int rv =3D 0;
>>>> +	int rv =3D 0, led_val;
>>>> =20
>>>>  	asus->led_workqueue =3D create_singlethread_workqueue("led_workque=
ue");
>>>>  	if (!asus->led_workqueue)
>>>> @@ -602,9 +602,11 @@ static int asus_wmi_led_init(struct asus_wmi *a=
sus)
>>>>  			goto error;
>>>>  	}
>>>> =20
>>>> -	if (kbd_led_read(asus, NULL, NULL) >=3D 0) {
>>>> +	led_val =3D kbd_led_read(asus, NULL, NULL);
>>>> +	if (led_val >=3D 0) {
>>>>  		INIT_WORK(&asus->kbd_led_work, kbd_led_update);
>>>> =20
>>>> +		asus->kbd_led_wk =3D led_val;
>>>>  		asus->kbd_led.name =3D "asus::kbd_backlight";
>>>>  		asus->kbd_led.brightness_set =3D kbd_led_set;
>>>>  		asus->kbd_led.brightness_get =3D kbd_led_get;
>>>> @@ -2160,6 +2162,16 @@ static int asus_hotk_thaw(struct device *devi=
ce)
>>>>  	return 0;
>>>>  }
>>>> =20
>>>> +static int asus_hotk_resume(struct device *device)
>>>> +{
>>>> +	struct asus_wmi *asus =3D dev_get_drvdata(device);
>>>> +
>>>> +	if (!IS_ERR_OR_NULL(asus->kbd_led.dev))
>>>
>>> 	if (asus->kbd_led.dev)
>>>
>>> 	should be sufficient, I don't see the dev pointer being stored as an=

>>> 	errno.
>>>
>>> 	Corentin?
>>
>> led_classdev_register
>>   led_classdev_next_name
>>     device_create_with_groups
>>       device_create_groups_vargs
>>         retval =3D -ENODEV;
>>         retval =3D -ENOMEM;
>>         return ERR_PTR(retval);
>>   if (IS_ERR(led_cdev->dev))
>>
>> this is how dev pointer is stored as errno.
>=20
> Ah! Thank you for the correction. Noted.
>=20

No problem :)
probably it can be optimised in separate patch.

--=20
Regards,
Oleksij


--utulpxH22jM3fbKdXaWlASu6beh9vxO6s
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iF4EAREIAAYFAlYAPmYACgkQHwImuRkmbWmXJAD/egY3WhENkINlg3dSdQz2VYdw
Xh/cvz7FkwczX6H5QlkA/3tndj3XEI9u23PJL3W5GHbaBwFiFzVBsk/PACmiJNpj
=ueE5
-----END PGP SIGNATURE-----

--utulpxH22jM3fbKdXaWlASu6beh9vxO6s--
