From: Jonathan Woithe <jwoithe@physics.adelaide.edu.au>
Subject: Re: [PATCH] fujitsu-laptop: fix compiler warning on pnp_ids
Date: Wed, 8 Dec 2010 08:49:11 +1030 (CST)
Message-ID: <201012072219.oB7MJBgm020656@turbo.physics.adelaide.edu.au>
References: <1291734254-12250-1-git-send-email-namhyung@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from adelphi.physics.adelaide.edu.au ([129.127.102.1]:35956 "EHLO
	adelphi.physics.adelaide.edu.au" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1754226Ab0LGWes (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Tue, 7 Dec 2010 17:34:48 -0500
In-Reply-To: <1291734254-12250-1-git-send-email-namhyung@gmail.com> from "Namhyung Kim" at Dec 08, 2010 12:04:14 AM
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Namhyung Kim <namhyung@gmail.com>
Cc: Jonathan Woithe <jwoithe@physics.adelaide.edu.au>, Matthew Garrett <mjg@redhat.com>, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org

Looks fine to me.

Acked-by: Jonathan Woithe <jwoithe@physics.adelaide.edu.au>

> Annotate pnp_ids as '__used' to fix following warning:
>=20
>   CC      drivers/platform/x86/fujitsu-laptop.o
> drivers/platform/x86/fujitsu-laptop.c:1243: warning: =E2=80=98pnp_ids=
=E2=80=99 defined but not used
>=20
> Signed-off-by: Namhyung Kim <namhyung@gmail.com>
> ---
>  drivers/platform/x86/fujitsu-laptop.c |    2 +-
>  1 files changed, 1 insertions(+), 1 deletions(-)
>=20
> diff --git a/drivers/platform/x86/fujitsu-laptop.c b/drivers/platform=
/x86/fujitsu-laptop.c
> index f44cd26..ad88b2e 100644
> --- a/drivers/platform/x86/fujitsu-laptop.c
> +++ b/drivers/platform/x86/fujitsu-laptop.c
> @@ -1240,7 +1240,7 @@ MODULE_ALIAS("dmi:*:svnFUJITSUSIEMENS:*:pvr:rvn=
=46UJITSU:rnFJNB1D3:*:cvrS6410:*");
>  MODULE_ALIAS("dmi:*:svnFUJITSUSIEMENS:*:pvr:rvnFUJITSU:rnFJNB1E6:*:c=
vrS6420:*");
>  MODULE_ALIAS("dmi:*:svnFUJITSU:*:pvr:rvnFUJITSU:rnFJNB19C:*:cvrS7020=
:*");
> =20
> -static struct pnp_device_id pnp_ids[] =3D {
> +static struct pnp_device_id pnp_ids[] __used =3D {
>  	{.id =3D "FUJ02bf"},
>  	{.id =3D "FUJ02B1"},
>  	{.id =3D "FUJ02E3"},
> --=20
> 1.7.0.4
