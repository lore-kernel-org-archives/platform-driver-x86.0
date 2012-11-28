From: joeyli <jlee@suse.com>
Subject: Re: [PATCH 2/6] msi-laptop: Work around gcc warning
Date: Wed, 28 Nov 2012 10:47:46 +0800
Message-ID: <1354070866.21227.948.camel@linux-s257.site>
References: <1353796141-1470-1-git-send-email-maxtram95@gmail.com>
	 <1353796141-1470-3-git-send-email-maxtram95@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from smtp.nue.novell.com ([195.135.221.5]:49354 "EHLO
	smtp.nue.novell.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750896Ab2K1Cst (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Tue, 27 Nov 2012 21:48:49 -0500
In-Reply-To: <1353796141-1470-3-git-send-email-maxtram95@gmail.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Maxim Mikityanskiy <maxtram95@gmail.com>
Cc: platform-driver-x86@vger.kernel.org, jlee@novell.com, mjg@redhat.com

=E6=96=BC =E6=97=A5=EF=BC=8C2012-11-25 =E6=96=BC 00:28 +0200=EF=BC=8CMa=
xim Mikityanskiy =E6=8F=90=E5=88=B0=EF=BC=9A
> Signed-off-by: Maxim Mikityanskiy <maxtram95@gmail.com>

Signed-off-by: Lee, Chun-Yi <jlee@suse.com>

Thanks for your patch!
Joey Lee

> ---
>  drivers/platform/x86/msi-laptop.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>=20
> diff --git a/drivers/platform/x86/msi-laptop.c b/drivers/platform/x86=
/msi-laptop.c
> index 063113c..7ba107a 100644
> --- a/drivers/platform/x86/msi-laptop.c
> +++ b/drivers/platform/x86/msi-laptop.c
> @@ -291,7 +291,7 @@ static ssize_t show_wlan(struct device *dev,
>  	struct device_attribute *attr, char *buf)
>  {
> =20
> -	int ret, enabled;
> +	int ret, enabled =3D 0;
> =20
>  	if (old_ec_model) {
>  		ret =3D get_wireless_state(&enabled, NULL);
> @@ -315,7 +315,7 @@ static ssize_t show_bluetooth(struct device *dev,
>  	struct device_attribute *attr, char *buf)
>  {
> =20
> -	int ret, enabled;
> +	int ret, enabled =3D 0;
> =20
>  	if (old_ec_model) {
>  		ret =3D get_wireless_state(NULL, &enabled);
