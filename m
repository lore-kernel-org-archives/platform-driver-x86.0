From: Pali =?utf-8?B?Um9ow6Fy?= <pali.rohar@gmail.com>
Subject: Re: [PATCH] drivers/platform/x86/dell-rbtn.c - add missing #include
Date: Tue, 12 Mar 2019 23:46:11 +0100
Message-ID: <20190312224611.elsl2buuhkddecih@pali>
References: <17631.1552389966@turing-police>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="7nc22qo4yobgowsb"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <17631.1552389966@turing-police>
Sender: linux-kernel-owner@vger.kernel.org
To: Valdis =?utf-8?Q?Kl=C4=93tnieks?= <valdis.kletnieks@vt.edu>
Cc: Darren Hart <dvhart@infradead.org>, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: platform-driver-x86.vger.kernel.org


--7nc22qo4yobgowsb
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tuesday 12 March 2019 07:26:06 Valdis Kl=C4=93tnieks wrote:
> Building with W=3D1 complains:
>   CC [M]  drivers/platform/x86/dell-rbtn.o
> drivers/platform/x86/dell-rbtn.c:345:5: warning: no previous prototype fo=
r 'dell_rbtn_notifier_register' [-Wmissing-prototypes]
>   345 | int dell_rbtn_notifier_register(struct notifier_block *nb)
>       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~
> drivers/platform/x86/dell-rbtn.c:371:5: warning: no previous prototype fo=
r 'dell_rbtn_notifier_unregister' [-Wmissing-prototypes]
>   371 | int dell_rbtn_notifier_unregister(struct notifier_block *nb)
>       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Can you identify in which commit was introduced this problem? If yes,
then Fixes: keyword should be added into commit message.

> =20
> The real problem is a missing include. Add it to keep dell-rbtn.c and .h =
in sync
>=20
> Signed-off-by: Valdis Kletnieks <valdis.kletnieks@vt.edu>
>=20
> diff --git a/drivers/platform/x86/dell-rbtn.c b/drivers/platform/x86/dell=
-rbtn.c
> index f3afe778001e..d50ca96d99f0 100644
> --- a/drivers/platform/x86/dell-rbtn.c
> +++ b/drivers/platform/x86/dell-rbtn.c
> @@ -17,6 +17,7 @@
>  #include <linux/acpi.h>
>  #include <linux/rfkill.h>
>  #include <linux/input.h>
> +#include "dell-rbtn.h"
> =20
>  enum rbtn_type {
>  	RBTN_UNKNOWN,
>=20

--=20
Pali Roh=C3=A1r
pali.rohar@gmail.com

--7nc22qo4yobgowsb
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EABECAB0WIQS4VrIQdKium2krgIWL8Mk9A+RDUgUCXIg2rwAKCRCL8Mk9A+RD
UlQrAKCp19B+YVLaIEg/aiud1DJD2AzXogCfSa4nOkhPh2pS7Ee1Frszc4d/7Qo=
=F+gJ
-----END PGP SIGNATURE-----

--7nc22qo4yobgowsb--
