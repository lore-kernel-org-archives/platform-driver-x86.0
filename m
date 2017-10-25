From: Harvey <harv@gmx.de>
Subject: Re: [PATCH] platform/x86: fujitsu-laptop: Fix radio LED detection
Date: Wed, 25 Oct 2017 15:11:11 +0200
Message-ID: <bd3f022f-6585-134e-57ed-ea0b02f51581@gmx.de>
References: <20171025042946.13225-1-kernel@kempniu.pl>
 <20171025063356.GE1090@marvin.atrad.com.au>
Reply-To: harv@gmx.de
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
 protocol="application/pgp-signature";
 boundary="Ubw4NDC46xe9w80omX2cKwAEQWtNfvLVM"
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mout.gmx.net ([212.227.15.18]:62927 "EHLO mout.gmx.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1750949AbdJYNMt (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 25 Oct 2017 09:12:49 -0400
In-Reply-To: <20171025063356.GE1090@marvin.atrad.com.au>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Jonathan Woithe <jwoithe@just42.net>, Micha?? K??pie?? <kernel@kempniu.pl>
Cc: Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--Ubw4NDC46xe9w80omX2cKwAEQWtNfvLVM
Content-Type: multipart/mixed; boundary="TKmlhGTwPTLG8frr8nlX1GDTAEjMc3RRN";
 protected-headers="v1"
From: Harvey <harv@gmx.de>
Reply-To: harv@gmx.de
To: Jonathan Woithe <jwoithe@just42.net>, Micha?? K??pie?? <kernel@kempniu.pl>
Cc: Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>,
 platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
Message-ID: <bd3f022f-6585-134e-57ed-ea0b02f51581@gmx.de>
Subject: Re: [PATCH] platform/x86: fujitsu-laptop: Fix radio LED detection
References: <20171025042946.13225-1-kernel@kempniu.pl>
 <20171025063356.GE1090@marvin.atrad.com.au>
In-Reply-To: <20171025063356.GE1090@marvin.atrad.com.au>

--TKmlhGTwPTLG8frr8nlX1GDTAEjMc3RRN
Content-Type: text/plain; charset=utf-8
Content-Language: en-GB
Content-Transfer-Encoding: quoted-printable

Am 25.10.2017 um 08:33 schrieb Jonathan Woithe:
> On Wed, Oct 25, 2017 at 06:29:46AM +0200, Micha?? K??pie?? wrote:
>> Radio LED detection method implemented in commit 4f62568c1fcf
>> ("fujitsu-laptop: Support radio LED") turned out to be incorrect as it=

>> causes a radio LED to be erroneously detected on a Fujitsu Lifebook E7=
51
>> which has a slide switch (and thus no radio LED).  Use bit 17 of
>> flags_supported (the value returned by method S000 of ACPI device
>> FUJ02E3) to determine whether a radio LED is present as it seems to be=
 a
>> more reliable indicator, based on comparing DSDT tables of four Fujits=
u
>> Lifebook models (E744, E751, S7110, S8420).
>>
>> Reported-by: Heinrich Siebmanns <harv@gmx.de>
>> Signed-off-by: Micha?? K??pie?? <kernel@kempniu.pl>
>=20
> This seems to be a reasonable approach given the most recent set of
> observations.  Assuming it tests ok on the E751:
>=20
>   Reviewed-by: Jonathan Woithe <jwoithe@just42.net>

It does. I applied the patch against an Archlinux vanilla 4.13.9 kernel.
The resulting module is clean and the error messages are gone, while
anything else seems to work as expected.

So this looks ok for me.

Tested-by: Heinrich Siebmanns <harv@gmx.de>

> Regards
>   jonathan
>=20
>> ---
>> I do not have a Fujitsu laptop with a radio LED for testing, so I was
>> only able to check that this patch still does not cause a radio LED to=

>> be detected on a Lifebook S7020.
>>
>> Harvey, could you please try this patch on your Lifebook E751 and see
>> whether the log messages you reported disappear?  I will be happy to
>> assist you off-list in case you need help with it.
>>
>>  drivers/platform/x86/fujitsu-laptop.c | 14 +++++++++-----
>>  1 file changed, 9 insertions(+), 5 deletions(-)
>>
>> diff --git a/drivers/platform/x86/fujitsu-laptop.c b/drivers/platform/=
x86/fujitsu-laptop.c
>> index 56a8195096a2..2cfbd3fa5136 100644
>> --- a/drivers/platform/x86/fujitsu-laptop.c
>> +++ b/drivers/platform/x86/fujitsu-laptop.c
>> @@ -691,6 +691,7 @@ static enum led_brightness eco_led_get(struct led_=
classdev *cdev)
>> =20
>>  static int acpi_fujitsu_laptop_leds_register(struct acpi_device *devi=
ce)
>>  {
>> +	struct fujitsu_laptop *priv =3D acpi_driver_data(device);
>>  	struct led_classdev *led;
>>  	int result;
>> =20
>> @@ -724,12 +725,15 @@ static int acpi_fujitsu_laptop_leds_register(str=
uct acpi_device *device)
>>  	}
>> =20
>>  	/*
>> -	 * BTNI bit 24 seems to indicate the presence of a radio toggle
>> -	 * button in place of a slide switch, and all such machines appear
>> -	 * to also have an RF LED.  Therefore use bit 24 as an indicator
>> -	 * that an RF LED is present.
>> +	 * Some Fujitsu laptops have a radio toggle button in place of a sli=
de
>> +	 * switch and all such machines appear to also have an RF LED.  Base=
d on
>> +	 * comparing DSDT tables of four Fujitsu Lifebook models (E744, E751=
,
>> +	 * S7110, S8420; the first one has a radio toggle button, the other
>> +	 * three have slide switches), bit 17 of flags_supported (the value
>> +	 * returned by method S000 of ACPI device FUJ02E3) seems to indicate=

>> +	 * whether given model has a radio toggle button.
>>  	 */
>> -	if (call_fext_func(device, FUNC_BUTTONS, 0x0, 0x0, 0x0) & BIT(24)) {=

>> +	if (priv->flags_supported & BIT(17)) {
>>  		led =3D devm_kzalloc(&device->dev, sizeof(*led), GFP_KERNEL);
>>  		if (!led)
>>  			return -ENOMEM;
>> --=20
>> 2.14.2
>=20

--=20
I am root. If you see me laughing, you'd better have a backup!


--TKmlhGTwPTLG8frr8nlX1GDTAEjMc3RRN--

--Ubw4NDC46xe9w80omX2cKwAEQWtNfvLVM
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQRSRNvmxYqoNs6vm0SLlqqYsFRKCQUCWfCNbwAKCRCLlqqYsFRK
CabTAJ46qYXhHWW4+I7eiYiH0RaERA0DAACeKxAq7jPHkRI2S4x91CUJtYVTPqw=
=GFPO
-----END PGP SIGNATURE-----

--Ubw4NDC46xe9w80omX2cKwAEQWtNfvLVM--
