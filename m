From: Pavel Machek <pavel@ucw.cz>
Subject: Re: [PATCH] drivers/x86: add thinkpad-wmi
Date: Wed, 15 Nov 2017 11:02:52 +0100
Message-ID: <20171115100252.GA8412@amd>
References: <20170904082110.30925-1-corentin.chary@gmail.com>
 <20171021064102.15166-1-corentin.chary@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="cNdxnHkX5QqsyA0e"
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from atrey.karlin.mff.cuni.cz ([195.113.26.193]:55860 "EHLO
        atrey.karlin.mff.cuni.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1755205AbdKOKCy (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 15 Nov 2017 05:02:54 -0500
Content-Disposition: inline
In-Reply-To: <20171021064102.15166-1-corentin.chary@gmail.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Corentin Chary <corentin.chary@gmail.com>
Cc: Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org


--cNdxnHkX5QqsyA0e
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi!

> diff --git a/Documentation/ABI/testing/sysfs-platform-thinkpad-wmi b/Docu=
mentation/ABI/testing/sysfs-platform-thinkpad-wmi
> new file mode 100644
> index 000000000000..c3673876c5b3
> --- /dev/null
> +++ b/Documentation/ABI/testing/sysfs-platform-thinkpad-wmi
> @@ -0,0 +1,50 @@
> +What:		/sys/devices/platform/thinkpad-wmi/password
> +Date:		Aug 2017
> +KernelVersion:	4.14
> +Contact:	"Corentin Chary" <corentin.chary@gmail.com>
> +Description:
> +		BIOS password needs to be written in this file if set
> +		to be able to change BIOS settings.

Should this go under platform/thinkpad-wmi? Seems like similar
interface is potentially useful on different machines?

> +What:		/sys/devices/platform/thinkpad-wmi/password_encoding
> +Date:		Aug 2017
> +KernelVersion:	4.14
> +Contact:	"Corentin Chary" <corentin.chary@gmail.com>
> +Description:
> +		Password encoding ('ascii' or 'scanmode').
> +
> +What:		/sys/devices/platform/thinkpad-wmi/password_kbd_lang
> +Date:		Aug 2017
> +KernelVersion:	4.14
> +Contact:	"Corentin Chary" <corentin.chary@gmail.com>
> +Description:
> +		Keyboard language used for password. One of 'us', 'fr' and 'gr'.
> +
> +What:		/sys/devices/platform/thinkpad-wmi/password_type
> +Date:		Aug 2017
> +KernelVersion:	4.14
> +Contact:	"Corentin Chary" <corentin.chary@gmail.com>
> +Description:
> +		Password type to be changed when password_change is written to, e.g. '=
pap'.

> +What:		/sys/devices/platform/thinkpad-wmi/password_change
> +Date:		Aug 2017
> +KernelVersion:	4.14
> +Contact:	"Corentin Chary" <corentin.chary@gmail.com>
> +Description:
> +		Writing to this file will set the password specified in password_type.
> +		The new password will not take effect until the next reboot.

With the different "encoding" and "keyboard language" fields, this
looks like great way to lock user out of his own machine ;-(.

> +What:		/sys/devices/platform/thinkpad-wmi/password_settings
> +Date:		Oct 2015
> +KernelVersion:	4.14
> +Contact:	"Corentin Chary" <corentin.chary@gmail.com>
> +Description:
> +		Display various password settings.

Umm. We have one value per file in sysfs?

> +What:		/sys/devices/platform/thinkpad-wmi/load_default_settings
> +Date:		Oct 2015
> +KernelVersion:	4.14
> +Contact:	"Corentin Chary" <corentin.chary@gmail.com>
> +Description:
> +		Write anything to this file to load default BIOS
> settings.

Is that reasonable?

> +### password_type
> +
> +Specify the password type to be changed when password_change is written =
to.
> +Can be:
> +* 'pap': supervisor password
> +* 'pop': power-on-password
> +
> +Other types may be valid, e.g. for user and master disk passwords.

This is extremely weird for /sysfs interface. Sounds like you should
have supervisor_password_change and power_on_password_change, etc...

> +### password_settings
> +
> +Display password related settings. This includes:
> +
> +* password_state: which passwords are set, if any
> +  * bit 0: user password (power on password) is installed / 'pop'
> +  * bit 1: admin/supervisor password is installed / 'pap'
> +  * bit 2: hdd password(s) installed
> +* supported_encodings: supported keyboard encoding(s)
> +  * bit 0: ASCII
> +  * bit 1: scancode
> +* supported_keyboard: support keyboard language(s)
> +  * bit 0: us
> +  * bit 1: fr
> +  * bit 2: gr
> +

If this belongs to the kernel (I'm not convinced), it certainly needs
different/better interface.
									Pavel
--=20
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blo=
g.html

--cNdxnHkX5QqsyA0e
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEARECAAYFAloMEMwACgkQMOfwapXb+vJ5vQCgh2dyFHHy6B2bLfRYJzf7QnUh
jQ0AnRtuAr9Yi9IF+V/nDg6J1X/GNfIN
=qYi7
-----END PGP SIGNATURE-----

--cNdxnHkX5QqsyA0e--
