Received: from maynard.decadent.org.uk (maynard.decadent.org.uk [65.21.191.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DBB21ADC83;
	Wed, 25 Feb 2026 20:44:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=65.21.191.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772052279; cv=none; b=IRvL+emagcTZ9BxR6DGGLrLqNzlscQZRVllWxiMlQsuvX8cKD9cOzbua5OFOZQi0AMSzzKjvs5SoMtly19hE0JodrGjxkxByW+jJTyHu9wE79Xq15er/ZbXaG7Y/Z1yXFpMP+c4noUi7j1OwBPQxlALtwnkDBY9sry2/26R9s0o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772052279; c=relaxed/simple;
	bh=W2N6BACJr01uw/xa4vn24YTz+VWDreGTq787oT3WWWQ=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=a/VBo5vahYDtYDxUDvW7/Yk9Uctm6xRpCASOIfd47OrsP080W3yXAi9xMt5UCFJaLnQiDxhwutGghP4TC4RMKAecmdfuU7amFV1BDRwyPp90389hn94KXcxmngq+JEmmaCxGwtiNFKuH2h3tuwd5SYUOpI6taVclFgFyTGTe/oc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=decadent.org.uk; spf=pass smtp.mailfrom=decadent.org.uk; arc=none smtp.client-ip=65.21.191.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=decadent.org.uk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=decadent.org.uk
Received: from [2a02:578:851f:1502:391e:c5f5:10e2:b9a3] (helo=deadeye)
	by maynard with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <ben@decadent.org.uk>)
	id 1vvLjz-002uqX-2o;
	Wed, 25 Feb 2026 20:44:14 +0000
Received: from ben by deadeye with local (Exim 4.99.1)
	(envelope-from <ben@decadent.org.uk>)
	id 1vvLjx-00000002fGc-3hun;
	Wed, 25 Feb 2026 21:44:13 +0100
Message-ID: <46bc9091ac8d36a237c575a0cd140752872b44bc.camel@decadent.org.uk>
Subject: Re: [PATCH] platform/x86: hp-bioscfg: Support allocations of larger
 data
From: Ben Hutchings <ben@decadent.org.uk>
To: Mario Limonciello <mario.limonciello@amd.com>, jorge.lopez2@hp.com, 
	hansg@kernel.org, ilpo.jarvinen@linux.intel.com, linux@weissschuh.net
Cc: stable@vger.kernel.org, Paul Kerry <p.kerry@sheffield.ac.uk>, 
	platform-driver-x86@vger.kernel.org
Date: Wed, 25 Feb 2026 21:44:04 +0100
In-Reply-To: <20260223163245.3294630-1-mario.limonciello@amd.com>
References: <20260223163245.3294630-1-mario.limonciello@amd.com>
Content-Type: multipart/signed; micalg="pgp-sha512";
	protocol="application/pgp-signature"; boundary="=-HP75UzRBsmQb4AhSmMDE"
User-Agent: Evolution 3.56.2-8 
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2a02:578:851f:1502:391e:c5f5:10e2:b9a3
X-SA-Exim-Mail-From: ben@decadent.org.uk
X-SA-Exim-Scanned: No (on maynard); SAEximRunCond expanded to false


--=-HP75UzRBsmQb4AhSmMDE
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, 2026-02-23 at 10:32 -0600, Mario Limonciello wrote:
> Some systems have much larger amounts of enumeration attributes
> than have been previously encountered. This can lead to page allocation
> failures when using kcalloc().  Switch over to using kvcalloc() to
> allow larger allocations.
>=20
> Fixes: 6b2770bfd6f92 ("platform/x86: hp-bioscfg: enum-attributes")
> Cc: stable@vger.kernel.org
> Reported-by: Paul Kerry <p.kerry@sheffield.ac.uk>
> Closes: https://bugs.debian.org/1127612
> Signed-off-by: Mario Limonciello <mario.limonciello@amd.com>
> ---
>  drivers/platform/x86/hp/hp-bioscfg/enum-attributes.c | 7 +++++--
>  1 file changed, 5 insertions(+), 2 deletions(-)
>=20
> diff --git a/drivers/platform/x86/hp/hp-bioscfg/enum-attributes.c b/drive=
rs/platform/x86/hp/hp-bioscfg/enum-attributes.c
> index 470b9f44ed7aa..af24313d078db 100644
> --- a/drivers/platform/x86/hp/hp-bioscfg/enum-attributes.c
> +++ b/drivers/platform/x86/hp/hp-bioscfg/enum-attributes.c
> @@ -94,8 +94,11 @@ int hp_alloc_enumeration_data(void)
>  	bioscfg_drv.enumeration_instances_count =3D
>  		hp_get_instance_count(HP_WMI_BIOS_ENUMERATION_GUID);
> =20
> -	bioscfg_drv.enumeration_data =3D kzalloc_objs(*bioscfg_drv.enumeration_=
data,
> -						    bioscfg_drv.enumeration_instances_count);
> +	if (!bioscfg_drv.enumeration_instances_count)
> +		return -EINVAL;
> +	bioscfg_drv.enumeration_data =3D kvcalloc(bioscfg_drv.enumeration_insta=
nces_count,
> +						sizeof(*bioscfg_drv.enumeration_data), GFP_KERNEL);
> +

So the kfree() in hp_exit_enumeration_attributes() also needs to become
a kvfree(), right?

Ben.

>  	if (!bioscfg_drv.enumeration_data) {
>  		bioscfg_drv.enumeration_instances_count =3D 0;
>  		return -ENOMEM;

--=20
Ben Hutchings
Anthony's Law of Force: Don't force it, get a larger hammer.

--=-HP75UzRBsmQb4AhSmMDE
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEErCspvTSmr92z9o8157/I7JWGEQkFAmmfXxQACgkQ57/I7JWG
EQkv/g//cxP6M5mOCbjfgF93vL51WvXuMt/E3jgyfppaEw7S3DPsfitQ3uZgZUVb
CLxGgXeDHdI3ac97VY4YkBtqWfaDbjHICpHCYgVADx8qRVwd2lBuFhtA/XhAoSAY
5Kj0nYqJ5d+g5X2gTYMItX78hkXFUQFTaX5iid6DROhBZlVD+SK03gpI4fG7A/ut
iLYSJ6FGnxliW79UsgNfIvbW85ccStWTHMijvBRjqonfMwS8gpeQp21YqcCTHmQY
VseyCY9L1hGmSbX/IbvipzrygYkn7wO6KHIZ9K9RJzZtFOGNQc5N6PNcnWRSDVsU
jG6/DZP1Dr3G2XtaeWGV7D5oordiHoSeq06ZT5vnRRAmzKjHz+oEMLQF6w/swFiY
WWpLTPvSntfRMO1pm4mNcXsPfEHPTn6qvJ2FW87O9JHTmZr8SVVHs9goSqQfH9HA
dGmq2irEUQ8Zn3UK5o3g+2+zxffbTk2z7vUjSVFHQvMln4qepfqSNuduES/Ut1wV
GNJ859T1EGG8BdaeFNY3cvw3o5ZGd/uRl0yXCef5ENchQqkGEC7bcW7YuQ0uYvXb
4+D2xi/01k/EE1e2KfcfnmZFH+6pHN4mOe9GJrUmoqDeTD0lKnhFQ1wLvKcJmuPA
H3g8XQEEpbPiQKEuxZUBQa7rqrEzCPJTMkGdSgKrxOfwMzkt94s=
=eDs7
-----END PGP SIGNATURE-----

--=-HP75UzRBsmQb4AhSmMDE--
