Received: from prime.voidband.net (prime.voidband.net [199.247.17.104])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 100AD2F747A;
	Mon, 31 Aug 2026 13:01:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=199.247.17.104
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788181298; cv=none; b=Q239KZXOGq+DqFaVSJ/4HIKJXQW8hLkrBcko22vGNqwKSQ5V4i/aAjCMoxLiIPzUBSvrmKGk1fWXRErdR1fNCzs2rKX4Zouo/gJYkIxCNhE+WxUztzAt9FtJga1tSXdUyXp+pmvwuswEc6XRc83U97uzRh6BucilzBerUzOSKHs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788181298; c=relaxed/simple;
	bh=6Br8hzMSTA1lJTk1xRXZt5M8m6mB2XpRmP5DwPhh25Q=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=oLWO2v1NJOwHMFIf6mYIMqet9qj67q4CeB2kHA+xs2cOJl+jV4/PfLjrCOAoZAwgxSiGsgky6wy+urGwJsvFFcIyKc4PALkQlyEZnZ3n1n5xpI+xx/piDGSw+FvqDrKmYcbXyCKvm+8rkr6/fgnD+DyJM85RDKf/secnMxItOAo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=natalenko.name; spf=pass smtp.mailfrom=natalenko.name; dkim=pass (1024-bit key) header.d=natalenko.name header.i=@natalenko.name header.b=tq3UD49r; arc=none smtp.client-ip=199.247.17.104
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=natalenko.name
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=natalenko.name
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=natalenko.name header.i=@natalenko.name header.b="tq3UD49r"
Received: from spock.localnet (unknown [212.20.115.26])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519MLKEM768 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by prime.voidband.net (Postfix) with ESMTPSA id 8FAEF635B040;
	Mon, 31 Aug 2026 15:01:25 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=natalenko.name;
	s=dkim-20170712; t=1788181288;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=PA1cS1FfafxMWazdG6J5KfTxyGBl8DLna3cwR6X5eUA=;
	b=tq3UD49raDLzZCgHRkxYACITtHW/0o8zlGA6YJmtel07XwqHEHukrwgVrI0HDwf+sG3PTx
	OnD+KeOM3NZGtfkMtiPlL8ERkNf1/pHQ7j6Rp00UxEDj9fjTSLK7HMpolAVmGhx3T92iZA
	z6Us8mrL6X5BvpDkWNCZIel9rCO8fqQ=
From: Oleksandr Natalenko <oleksandr@natalenko.name>
To: linux-kernel@vger.kernel.org
Cc: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>,
 Hans de Goede <hansg@kernel.org>,
 Ilpo =?UTF-8?B?SsOkcnZpbmVu?= <ilpo.jarvinen@linux.intel.com>,
 Pedro Falcato <pfalcato@suse.de>, Sanket Goswami <Sanket.Goswami@amd.com>,
 platform-driver-x86@vger.kernel.org
Subject: Re: [PATCH] platform/x86/amd/pmf: fix build on !CONFIG_AMD_PMF_DEBUG
Date: Mon, 31 Aug 2026 15:01:10 +0200
Message-ID: <eyfjqxPuTjOJWaKP7sJSbw@natalenko.name>
In-Reply-To: <20260831114346.2041361-1-pfalcato@suse.de>
References: <20260831114346.2041361-1-pfalcato@suse.de>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="nextPartsw2MwA-XS16apVyHs8V1Vw";
 micalg="pgp-sha512"; protocol="application/pgp-signature"
x-ms-reactions: disallow

--nextPartsw2MwA-XS16apVyHs8V1Vw
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"; protected-headers="v1"
From: Oleksandr Natalenko <oleksandr@natalenko.name>
To: linux-kernel@vger.kernel.org
Subject: Re: [PATCH] platform/x86/amd/pmf: fix build on !CONFIG_AMD_PMF_DEBUG
Date: Mon, 31 Aug 2026 15:01:10 +0200
Message-ID: <eyfjqxPuTjOJWaKP7sJSbw@natalenko.name>
In-Reply-To: <20260831114346.2041361-1-pfalcato@suse.de>
References: <20260831114346.2041361-1-pfalcato@suse.de>
MIME-Version: 1.0

Hello.

On pond=C4=9Bl=C3=AD 31. srpna 2026 13:43:46, st=C5=99edoevropsk=C3=BD letn=
=C3=AD =C4=8Das Pedro Falcato wrote:
> amd_pmf_get_ta_custom_bios_inputs() is used by non-debug features.
>=20
> Fix the build on !CONFIG_AMD_PMF_DEBUG by moving
> amd_pmf_get_ta_custom_bios_inputs() outside the ifdef CONFIG_AMD_PMF_DEBU=
G.
>=20
> Fixes: 5bda82c797c9 ("platform/x86/amd/pmf: Implement util layer ioctl ha=
ndler")
> Reported-by: Oleksandr Natalenko <oleksandr@natalenko.name>
> Link: https://lore.kernel.org/all/fS7s9V_xTaedaqEAaxwKnQ@natalenko.name/
> Signed-off-by: Pedro Falcato <pfalcato@suse.de>
> ---
>  drivers/platform/x86/amd/pmf/spc.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/drivers/platform/x86/amd/pmf/spc.c b/drivers/platform/x86/am=
d/pmf/spc.c
> index 94355b435a66..592ba4de4c7f 100644
> --- a/drivers/platform/x86/amd/pmf/spc.c
> +++ b/drivers/platform/x86/amd/pmf/spc.c
> @@ -17,7 +17,6 @@
>  #include <linux/units.h>
>  #include "pmf.h"
> =20
> -#ifdef CONFIG_AMD_PMF_DEBUG
>  u32 amd_pmf_get_ta_custom_bios_inputs(struct ta_pmf_enact_table *in, int=
 index)
>  {
>  	switch (index) {
> @@ -31,6 +30,7 @@ u32 amd_pmf_get_ta_custom_bios_inputs(struct ta_pmf_ena=
ct_table *in, int index)
>  }
>  EXPORT_SYMBOL(amd_pmf_get_ta_custom_bios_inputs);
> =20
> +#ifdef CONFIG_AMD_PMF_DEBUG
>  void amd_pmf_dump_ta_inputs(struct amd_pmf_dev *dev, struct ta_pmf_enact=
_table *in)
>  {
>  	int i;
>=20

This fixes it for me, thank you.

Tested-by: Oleksandr Natalenko <oleksandr@natalenko.name>

=2D-=20
Oleksandr Natalenko, MSE
--nextPartsw2MwA-XS16apVyHs8V1Vw
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEZUOOw5ESFLHZZtOKil/iNcg8M0sFAmqVexYACgkQil/iNcg8
M0tp/Q/8CJAnsrT2K6FMWR+Wgsj80NaVyR7At2WnvZeMT84WtY46XeTdyaOdv2CD
yGrZFoy5/9Jd3Wns/y34cffX29/d/vTcqInYzxYMtnDTQZs2lW2lRe0ZfXDtHj2W
aOhILoRROYfIw8eSyF8zR6CkVg/Z0Ru3/CzGd1kHsNBsdeHk56W8med+ISltyrzt
HF85IsTLh20fr3I9SA0x1NdW/VCS/qtMtOYuRlPDk2pGx/Rrw19mH6DM6RyvlZts
UAoM/p2rPlKXiFqWX3khvkLq0sMKh7c565W1uVOHLzNt2UzV6krJ3r6VStAebWZ4
lJes+86UIt9ShhO7ajjtZf8GqDEhpSH37LZtU7OT1on39PryVbMGm5LaP9NbhOnU
Y98x3CEk1HR9RbnHW3h1gXjlZu6L861q9iTh4Q+xljanqr4xn+5hOmkDE4+v5NGT
YVPIwRgN5lffzTFwOGbzzLv2ssVHqQ3P6DVw8tFS7E+VgWpFJCIehtxyKT2qm03e
sN0Ypq9F6Y/3Bkd63weMiiohp0AvQUlPlTgNZZUpiWtUF7+Zven24g2nhcDxwbyD
dVtEupgSarlMRRXHDPmdkozW9gxCWVwzMyHibdYGh/lwBSID8kWSModInLalvHbB
G9mwjYgeF/b4+tCIr9rGoomKPzxYO/wsdsw06IrkGxnTpmprcKk=
=7IXP
-----END PGP SIGNATURE-----

--nextPartsw2MwA-XS16apVyHs8V1Vw--



