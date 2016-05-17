From: Oleksij Rempel <linux@rempel-privat.de>
Subject: Re: [PATCH] asus-wmi: provide access to ALS control
Date: Tue, 17 May 2016 22:27:14 +0200
Message-ID: <573B7EA2.6040506@rempel-privat.de>
References: <1459510521-4682-1-git-send-email-linux@rempel-privat.de>
 <20160410030633.GB18689@dvhart-mobl5.amr.corp.intel.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="rHf7MTEdDFiBW9cwTW7pqUwaNknWnHh0w"
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mout.gmx.net ([212.227.15.15]:51007 "EHLO mout.gmx.net"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751054AbcEQU2q (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Tue, 17 May 2016 16:28:46 -0400
In-Reply-To: <20160410030633.GB18689@dvhart-mobl5.amr.corp.intel.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Darren Hart <dvhart@infradead.org>
Cc: corentin.chary@gmail.com, acpi4asus-user@lists.sourceforge.net, platform-driver-x86@vger.kernel.org

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--rHf7MTEdDFiBW9cwTW7pqUwaNknWnHh0w
Content-Type: multipart/mixed; boundary="SghCfiwtmF1GD4H9qlJb9970EahgFK6JU"
From: Oleksij Rempel <linux@rempel-privat.de>
To: Darren Hart <dvhart@infradead.org>
Cc: corentin.chary@gmail.com, acpi4asus-user@lists.sourceforge.net,
 platform-driver-x86@vger.kernel.org
Message-ID: <573B7EA2.6040506@rempel-privat.de>
Subject: Re: [PATCH] asus-wmi: provide access to ALS control
References: <1459510521-4682-1-git-send-email-linux@rempel-privat.de>
 <20160410030633.GB18689@dvhart-mobl5.amr.corp.intel.com>
In-Reply-To: <20160410030633.GB18689@dvhart-mobl5.amr.corp.intel.com>

--SghCfiwtmF1GD4H9qlJb9970EahgFK6JU
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

ping

Am 10.04.2016 um 05:06 schrieb Darren Hart:
> On Fri, Apr 01, 2016 at 01:35:21PM +0200, Oleksij Rempel wrote:
>> Asus Zenbook ux31a is providing ACPI0008 interface for ALS
>> (Ambient Light Sensor), which is accessible for OS =3D> Win 7.
>> This sensor can be used with iio/acpi-als driver.
>> Since it is disabled by default, we should use asus-wmi
>> interface to enable it.
>>
>=20
> Corentin, any concerns?
>=20
>> Signed-off-by: Oleksij Rempel <linux@rempel-privat.de>
>> ---
>>  drivers/platform/x86/asus-wmi.c | 5 +++++
>>  1 file changed, 5 insertions(+)
>>
>> diff --git a/drivers/platform/x86/asus-wmi.c b/drivers/platform/x86/as=
us-wmi.c
>> index a96630d..a26dca3 100644
>> --- a/drivers/platform/x86/asus-wmi.c
>> +++ b/drivers/platform/x86/asus-wmi.c
>> @@ -114,6 +114,7 @@ MODULE_LICENSE("GPL");
>>  #define ASUS_WMI_DEVID_LED6		0x00020016
>> =20
>>  /* Backlight and Brightness */
>> +#define ASUS_WMI_DEVID_ALS_ENABLE	0x00050001 /* Ambient Light Sensor =
*/
>>  #define ASUS_WMI_DEVID_BACKLIGHT	0x00050011
>>  #define ASUS_WMI_DEVID_BRIGHTNESS	0x00050012
>>  #define ASUS_WMI_DEVID_KBD_BACKLIGHT	0x00050021
>=20
> Following this is:
>=20
> #define ASUS_WMI_DEVID_LIGHT_SENSOR	0x00050022 /* ?? */
>=20
> Is there any relationship with this patch and that device? It would be =
useful to
> understand the difference between these two DEVIDs (a comment in the so=
urce).
>=20
> Otherwise, I'm happy with the patch.
>=20
>> @@ -1730,6 +1731,7 @@ ASUS_WMI_CREATE_DEVICE_ATTR(touchpad, 0644, ASUS=
_WMI_DEVID_TOUCHPAD);
>>  ASUS_WMI_CREATE_DEVICE_ATTR(camera, 0644, ASUS_WMI_DEVID_CAMERA);
>>  ASUS_WMI_CREATE_DEVICE_ATTR(cardr, 0644, ASUS_WMI_DEVID_CARDREADER);
>>  ASUS_WMI_CREATE_DEVICE_ATTR(lid_resume, 0644, ASUS_WMI_DEVID_LID_RESU=
ME);
>> +ASUS_WMI_CREATE_DEVICE_ATTR(als_enable, 0644, ASUS_WMI_DEVID_ALS_ENAB=
LE);
>> =20
>>  static ssize_t store_cpufv(struct device *dev, struct device_attribut=
e *attr,
>>  			   const char *buf, size_t count)
>> @@ -1756,6 +1758,7 @@ static struct attribute *platform_attributes[] =3D=
 {
>>  	&dev_attr_cardr.attr,
>>  	&dev_attr_touchpad.attr,
>>  	&dev_attr_lid_resume.attr,
>> +	&dev_attr_als_enable.attr,
>>  	NULL
>>  };
>> =20
>> @@ -1776,6 +1779,8 @@ static umode_t asus_sysfs_is_visible(struct kobj=
ect *kobj,
>>  		devid =3D ASUS_WMI_DEVID_TOUCHPAD;
>>  	else if (attr =3D=3D &dev_attr_lid_resume.attr)
>>  		devid =3D ASUS_WMI_DEVID_LID_RESUME;
>> +	else if (attr =3D=3D &dev_attr_als_enable.attr)
>> +		devid =3D ASUS_WMI_DEVID_ALS_ENABLE;
>> =20
>>  	if (devid !=3D -1)
>>  		ok =3D !(asus_wmi_get_devstate_simple(asus, devid) < 0);
>> --=20
>> 2.5.0
>>
>>
>=20


--=20
Regards,
Oleksij


--SghCfiwtmF1GD4H9qlJb9970EahgFK6JU--

--rHf7MTEdDFiBW9cwTW7pqUwaNknWnHh0w
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iF4EAREIAAYFAlc7frQACgkQHwImuRkmbWk0YwD9Gw3UYbjGtxUy4qO6/PaEn0u3
MWKcnZD5IHcwQjlPqM4A+gMRCPc6rxshyRgrBAW33suS44TSRmrCeoGyv4GVZl9Y
=VUVb
-----END PGP SIGNATURE-----

--rHf7MTEdDFiBW9cwTW7pqUwaNknWnHh0w--
