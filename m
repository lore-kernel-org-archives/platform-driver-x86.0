From: Pali =?utf-8?q?Roh=C3=A1r?= <pali.rohar@gmail.com>
Subject: Re: [PATCH v2 12/14] platform/x86: dell-wmi-smbios: introduce character device for userspace
Date: Tue, 26 Sep 2017 22:10:11 +0200
Message-ID: <201709262210.11550@pali>
References: <cover.1506451187.git.mario.limonciello@dell.com> <dcc096b40d4a7084be54942270984159d09abe1e.1506451187.git.mario.limonciello@dell.com>
Mime-Version: 1.0
Content-Type: multipart/signed;
  boundary="nextPart1675469.TWGS478bSM";
  protocol="application/pgp-signature";
  micalg=pgp-sha1
Content-Transfer-Encoding: 7bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-wr0-f195.google.com ([209.85.128.195]:37085 "EHLO
        mail-wr0-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S966382AbdIZUKP (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 26 Sep 2017 16:10:15 -0400
In-Reply-To: <dcc096b40d4a7084be54942270984159d09abe1e.1506451187.git.mario.limonciello@dell.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Mario Limonciello <mario.limonciello@dell.com>
Cc: dvhart@infradead.org, Andy Shevchenko <andy.shevchenko@gmail.com>, LKML <linux-kernel@vger.kernel.org>, platform-driver-x86@vger.kernel.org, quasisec@google.com

--nextPart1675469.TWGS478bSM
Content-Type: Text/Plain;
  charset="utf-8"
Content-Transfer-Encoding: quoted-printable

On Tuesday 26 September 2017 20:50:10 Mario Limonciello wrote:
> This userspace character device will be used to perform SMBIOS calls
> from any applications.
>=20
> It contains 3 operating IOCTL's
> 1) sending a properly formatted 4k calling interface buffer.
> 2) Querying number of tokens in the given system
> 3) Copying the status of all these tokens to a properly formatted
>    userspace buffer.
>=20
> This character device is intended to deprecate the dcdbas kernel
> module and the interface that it provides to userspace.
>=20
> It's important for the driver to provide a R/W ioctl to ensure that
> two competing userspace processes don't race to provide or read each
> others data.
>=20
> The character device will only be created if the WMI interface was
> found.
>=20
> The API for interacting with this interface is defined in
> documentation as well as a uapi header provides the format of the
> structures.
>=20
> Signed-off-by: Mario Limonciello <mario.limonciello@dell.com>
> ---
>  Documentation/ABI/testing/dell-wmi-smbios |  10 +++
>  drivers/platform/x86/dell-wmi-smbios.c    | 110
> +++++++++++++++++++++++++++---
> drivers/platform/x86/dell-wmi-smbios.h    |  28 +-------
>  include/uapi/linux/dell-wmi-smbios.h      |  55 +++++++++++++++
>  4 files changed, 165 insertions(+), 38 deletions(-)
>  create mode 100644 Documentation/ABI/testing/dell-wmi-smbios
>  create mode 100644 include/uapi/linux/dell-wmi-smbios.h
>=20
> diff --git a/Documentation/ABI/testing/dell-wmi-smbios
> b/Documentation/ABI/testing/dell-wmi-smbios new file mode 100644
> index 000000000000..8ec98e9b7b34
> --- /dev/null
> +++ b/Documentation/ABI/testing/dell-wmi-smbios
> @@ -0,0 +1,10 @@
> +What:		/dev/wmi-dell-wmi-smbios
> +Date:		October 2017
> +KernelVersion:	4.15
> +Contact:	"Mario Limonciello" <mario.limonciello@dell.com>
> +Description:
> +		Perform SMBIOS calls on supported Dell machines.
> +		through the Dell ACPI-WMI interface.
> +
> +		IOCTL's and buffer formats are defined in:
> +		<uapi/linux/dell-wmi-smbios.h>

Should be "wmi" part of device name, even if whole driver work without=20
WMI?

I think that "wmi" should be part of device name only if it is related=20
to WMI bus functions, and not in case when it exports some vendor (Dell)=20
specific API which may be implemented via WMI.

E.g. we have /dev/i2c-* for raw access to i2c devices. But we do not=20
have /dev/i2c-something for e.g. RTC device connected via i2c...

=2D-=20
Pali Roh=C3=A1r
pali.rohar@gmail.com

--nextPart1675469.TWGS478bSM
Content-Type: application/pgp-signature; name=signature.asc 
Content-Description: This is a digitally signed message part.

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iEYEABECAAYFAlnKtCMACgkQi/DJPQPkQ1JoggCgyieKaRrpIF08qEkpsaE5HK14
RzQAnioJXNmldaPWFct9SJRcjY9MzeF1
=6eyg
-----END PGP SIGNATURE-----

--nextPart1675469.TWGS478bSM--
