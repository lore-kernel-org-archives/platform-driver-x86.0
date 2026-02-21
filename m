Received: from master.debian.org (master.debian.org [82.195.75.110])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07B98165F16
	for <platform-driver-x86@vger.kernel.org>; Sat, 21 Feb 2026 15:26:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=82.195.75.110
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771687601; cv=none; b=K4CYNuJT9CEnngqJE7VFYNztAlo3oOlhFtf6dIlLkQaasPHB788mRR3hGjzHSTMIctnIEh0dZV8rSllSt5CGm5Mn7D6LMCewpSjVN5O52pghyWMaDVPqXNgtMGTvWfK5mgxKBvClHACPJffL/uqNCpASvevtPzjL5x+gZXgLUWo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771687601; c=relaxed/simple;
	bh=qNOf/qFEUkGzQgJ54Nv1QtsZfjjfzh114THDwYe0jW4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CZDaNiwR/9j/vELJ4a+QW1xMJKuovvNbezRz707Emv3j9DGKuXeHXN6Ft3HdFOmvKxHN6fvhFOKfhMHXKf+rNgpC73zsKPo36MVCbJNkwiTm8L0F2nMgLf1TgeJzZHwFf6LrnyuG70sL+2iqW4YbbtvMx0dSe/DNh6S0RoRcGCk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=debian.org; spf=none smtp.mailfrom=master.debian.org; dkim=pass (2048-bit key) header.d=debian.org header.i=@debian.org header.b=e8D2hvfG; arc=none smtp.client-ip=82.195.75.110
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=debian.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=master.debian.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=debian.org header.i=@debian.org header.b="e8D2hvfG"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=debian.org;
	s=smtpauto.master; h=In-Reply-To:Content-Type:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description;
	bh=PJai6hIhsyRkoZdZ+uA+ArjJxVwqE+Ak+Mv/aRWWwSQ=; b=e8D2hvfGLgqIANIVAyVzlFd+EY
	jaHAsEknUWEquylsWxiWB4dYzfo3+1XaeUcVSKQ92j9mwQ+RF86jmu6hWOPbfOqBQXboBdSL95gJG
	BEihItd7Ani90WJWRjegD3sVTje+fVDpsOVBJkEJAaUhwppHO1cAsxtXjkvnEkLHNFk4HNz3N9BrZ
	H2AjZwPOn/BWRHHl/4/Sv1QKhu2dhOp2Y0ovjau/aVyuCKIdtktxOpOmEW/VhfcjXVoX+DVB5PYwa
	uaPM8LKRUA3HH6cxncvDLiTNI1zq3rsAkPanuYgCzgJLQXDrPxQllAarJmoCbv85rxdiw20EE41Or
	ro7HDR7w==;
Received: from ukleinek by master.debian.org with local (Exim 4.96)
	(envelope-from <ukleinek@master.debian.org>)
	id 1vtosI-00G9Kl-02;
	Sat, 21 Feb 2026 15:26:30 +0000
Date: Sat, 21 Feb 2026 16:26:28 +0100
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <ukleinek@debian.org>
To: Paul Kerry <p.kerry@sheffield.ac.uk>, 
	Mario Limonciello <mario.limonciello@amd.com>
Cc: 1127612@bugs.debian.org, Jorge Lopez <jorge.lopez2@hp.com>, 
	platform-driver-x86@vger.kernel.org
Subject: Re: Bug#1127612: linux-image-6.12.69+deb13-amd64: hp_bioscfg
 mm/page_alloc.c:4802 warning
Message-ID: <aZnNu_AphE78MIoY@monoceros>
References: <dafda4bd-87cb-4fbd-a811-66d629a10c70@sheffield.ac.uk>
 <aZMt6sSlpKK_JAdT@monoceros>
 <4ddfa94c-5cb5-4c7a-a0b4-9b9ff5e4cc85@sheffield.ac.uk>
 <dafda4bd-87cb-4fbd-a811-66d629a10c70@sheffield.ac.uk>
 <4faeb5e7-e56e-429e-88fa-a1fefa4d1034@amd.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="nyf6gl2tbxgmfdtq"
Content-Disposition: inline
In-Reply-To: <4faeb5e7-e56e-429e-88fa-a1fefa4d1034@amd.com>


--nyf6gl2tbxgmfdtq
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: Bug#1127612: linux-image-6.12.69+deb13-amd64: hp_bioscfg
 mm/page_alloc.c:4802 warning
MIME-Version: 1.0

Hello,

On Tue, Feb 17, 2026 at 07:53:17AM -0600, Mario Limonciello wrote:
> On 2/16/26 10:18 AM, Paul Kerry wrote:
> >=20
> > Hi Uwe
> >=20
> > Thanks for the reply and information.
> >=20
> > You are correct: when I boot the HP Z2 Tower G9 into the older
> > 6.12.63+deb13-amd64 kernel, the hp_bioscfg module is not loaded which I
> > had not noticed, and running a "modprobe hp_bioscfg" on that older
> > 6.12.63+deb13-amd64 kernel does indeed generate the same dmesg warnings
> > as 6.12.69+deb13-amd64 does, which auto-loads the hp_bioscfg module.
> >=20
> > I've not had any noticeable problems caused by this issue since
> > 6.12.69+deb13-amd64 came out.
>=20
> Considering there appears to be a rather large number of attributes on th=
is
> system, maybe we should be using a different memory allocation method?
>=20
> Something like this:
>=20
> diff --git a/drivers/platform/x86/hp/hp-bioscfg/enum-attributes.c
> b/drivers/platform/x86/hp/hp-bioscfg/enum-attributes.c
> index f346aad8e9d89..72bd6037300ab 100644
> --- a/drivers/platform/x86/hp/hp-bioscfg/enum-attributes.c
> +++ b/drivers/platform/x86/hp/hp-bioscfg/enum-attributes.c
> @@ -94,8 +94,11 @@ int hp_alloc_enumeration_data(void)
>         bioscfg_drv.enumeration_instances_count =3D
>                 hp_get_instance_count(HP_WMI_BIOS_ENUMERATION_GUID);
>=20
> -       bioscfg_drv.enumeration_data =3D
> kcalloc(bioscfg_drv.enumeration_instances_count,
> - sizeof(*bioscfg_drv.enumeration_data), GFP_KERNEL);
> +       if (!bioscfg_drv.enumeration_instances_count)
> +               return -EINVAL;
> +
> +       bioscfg_drv.enumeration_data =3D
> kvcalloc(bioscfg_drv.enumeration_instances_count,
> + sizeof(*bioscfg_drv.enumeration_data), GFP_KERNEL);
>         if (!bioscfg_drv.enumeration_data) {
>                 bioscfg_drv.enumeration_instances_count =3D 0;
>                 return -ENOMEM;

The patch looks fine to me and now I wonder how to continue here. Would
a test by Paul help? Or are we sure enough the patch is fine?

@Paul: Could you test the patch? Are you able to create a kernel image
with that patch included yourself, or would a test package help you?

Best regards
Uwe

--nyf6gl2tbxgmfdtq
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmmZzqEACgkQj4D7WH0S
/k6iJwf9GW34w4t08Ikjc/fFKrhotRoMSVWeCIC7Fy9lTS+FuCLFvZ4EE8wR8+MW
8ccVZLF7U99cG1a8WZ6HWHTlgz7NVYAr4HnXVG9VLjSxsH/D+WwbBbERcrI98SGf
65O6SJ4+Jbb24/msb3Z3WSFCtpnvZgkYnXACWElFI09Jrd6Z5qk0um1LTHpEXUKt
qMsSjQOZSUPGI554WqDfOiAhb2kvU8xSQPxzLQntUs/EJOS0a9V0Rs0bJTfyvTIx
AC9yk+HitE2xADltQQKNi5u9BuLnsMFaKXbWMwcxJMdQc1TT+zPUEjxs4VoyuwTd
Jk7ipVlGM1p2hIT9KwYEPvI47krFtQ==
=jNZp
-----END PGP SIGNATURE-----

--nyf6gl2tbxgmfdtq--
