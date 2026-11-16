Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=136.143.188.112
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794850608;
	b=KMT8kDmT5i8BvqFOEW47bkJsF/R16sCpoOO3xZCf0zlwiLk0n78OFgwNTq23uRNvNCTq
	 L32Qmm0i1p2kywP4g6ru4J6KFO6YxR3jCV53gkUDWeq9Z04XN1s6CDwhid7ST8dIaL5pN
	 Spa5Yl5yuVtfF0dRMNn0r/w2b9tbrBRAmo4K0UL9uYxr+UjFjpmFJDCGV01V/cpOQ1yxW
	 WVp0CtKjFOqnEwOMbYVnlBo4PKKyCQ0SZp1SN1DLjEcNM8v0x8R/kLj5YI1WkToWg/3tN
	 lgapjf6KAQvS/49Q8kTMl+Rd9b+fKacPLMBjan5+1dYqGfMN1VM/ZcC/yzmfp1ZV0Mg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794850608;
	h=DMARC-Filter:DKIM-Signature:Received:Message-ID:Subject:From:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date:
	 MIME-Version:User-Agent:X-ZohoMailClient;
	bh=UXYHltKKl/4HM8Kr8XccVKnGTDSBa0hsHGr73OZKerg=;
	b=cUevz1bN2aOtYH6PuHwBKCUTf8jO+oYo8f9nQsJ2WAZ8bL3BtJH/zah5JQURaUIVQTJJ
	 /UvxbuCTWZTrGhHRPKb+LhS+hrzdBttPjYnTV/EeFRCpBLzYucG95ES+bxdGXPyyTUQou
	 Ddo8AK5+CMqwsuUBIUozgCclWM+HmkZCln7EmvAoLM/J+18rgBZQ3B9BlSiGgfvg0Alt6
	 mt/PLT9nCj9xpVxzVAl/mU5skPbEFqf4Pezsk9c5gXCMuYqMJ6ZzKi2JlyWyF6IDtbjeN
	 dmc4D3umqQ8rlLhAPfrXN0kL0tCv2DznJ8L88hxw+4ecAbGW6qRHkDzqZ2iBjglOMDg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=rong.moe;
	spf=pass smtp.mailfrom=rong.moe;
	dkim=pass header.d=rong.moe header.i=@rong.moe header.a=rsa-sha256 header.s=zmail2048 header.b=jali7fLE;
	arc=pass header.oldest-pass=0 smtp.remote-ip=136.143.188.112
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com [136.143.188.112])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 297E8606A31C;
	Mon, 16 Nov 2026 17:36:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 297E8606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rong.moe
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rong.moe
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=rong.moe header.i=@rong.moe header.a=rsa-sha256 header.s=zmail2048 header.b=jali7fLE
ARC-Seal: i=1; a=rsa-sha256; t=1794850599; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=DecEHM3nKTQpQqdF/hTs3DlxVnIY6g41bvpp7ewpEacBYnYU1T/DaikUGXpX3GYnxDta/q3/gOr6/+Va+kMbIoW6mbJ1A5Bh++Rly994pPLsalG3r5utUuO3LiACi9xPRDnWr0Gq3wbRkGQtlBj2p1bgGLUTZbgffEflCXyP+/U=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1794850599; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=UXYHltKKl/4HM8Kr8XccVKnGTDSBa0hsHGr73OZKerg=; 
	b=TX8u/4BSR3JQLqa4+BYwpJZ+VJnKNybDNPJ951Z64NkbymHccSlgrmoSh2tF7YQJm6XOiIASP/Hx85/gUpmVVcn6TzrTAH0bK7LH/7zkdsQUUCA5AAo5iGMlEODQmVO5Aff59I6+BnRs0hPDJ9dnqKCBFK29t3vz8dtTqwR1KKw=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=rong.moe;
	spf=pass  smtp.mailfrom=i@rong.moe;
	dmarc=pass header.from=<i@rong.moe>
DKIM-Signature: a=rsa-sha256; b=jali7fLEl1f092nc0FHGzA3b8HKYP2K7kCEurA5miq6cHzrwpjCI5CT4Q5Y1yjeiBOqy5lzncodxsYu4sOdXncUsA4/R94u6ElaBCXsazDzO8ITGuR6nJATMxHr09pquw5QMufwlGElg87dagIFWXjsghNW2P5wStw8/shRSzgDA2Gzi+dC2DJXyBDlB/K/Ohqa6otnRIBezDnwvXB5LQP5ic7XnPI/dLikPTMSKQ4TWSn6s7qQVvmJu8KaGBc8zo7TzfzSNp14Wec5QTFhjCbK5wj+iXEinNxcrha99MGMoIzl1wrKN71bgvLADRlkLQ0eMyURWUaBQXzZZGNYTRw==; c=relaxed/relaxed; s=zmail2048; d=rong.moe; v=1; bh=UXYHltKKl/4HM8Kr8XccVKnGTDSBa0hsHGr73OZKerg=; h=Content-Description:Content-ID:Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:List-Subscribe:List-Post:List-Owner:List-Id:List-Archive:List-Help:List-Unsubscribe:MIME-Version:Message-ID:Resent-Sender:Resent-Cc:Resent-Date:Resent-To:Reply-To:Resent-Message-ID:Resent-From:Sender:Subject:To:Date:From:Message-Id:Reply-To:Subject:To:Cc;
Received: by smtp.zohomail.com with SMTPS id 1794850597233573.0837788483478;
	Mon, 16 Nov 2026 09:36:37 -0800 (PST)
Message-ID: <598e22ddcfa810915cead43afb9886d0564e9319.camel@rong.moe>
Subject: Re: [PATCH] platform/x86: ideapad-laptop: Add V14 G2 ITL to
 ideapad_dytc_v4_allow_table[]
From: Rong Zhang <i@rong.moe>
To: Arnav Kapoor <kapoorarnav43@gmail.com>, Hans de Goede
 <hansg@kernel.org>,  Ilpo =?ISO-8859-1?Q?J=E4rvinen?=	
 <ilpo.jarvinen@linux.intel.com>
Cc: Ike Panhc <ikepanhc@gmail.com>, Mark Pearson
 <mpearson-lenovo@squebb.ca>,  "Derek J . Clark"
 <derekjohn.clark@gmail.com>, platform-driver-x86@vger.kernel.org,
 linux-kernel@vger.kernel.org
In-Reply-To: <20261116171817.21802-1-kapoorarnav43@gmail.com>
References: <20261116171817.21802-1-kapoorarnav43@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Date: Tue, 17 Nov 2026 01:31:33 +0800
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Post: <mailto:platform-driver-x86@vger.kernel.org>
List-Help: <mailto:platform-driver-x86+help@vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
List-Owner: <mailto:platform-driver-x86+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Evolution 3.62.1-3 
X-ZohoMailClient: External

Hi Arnav,

On Mon, 2026-11-16 at 22:48 +0530, Arnav Kapoor wrote:
> The Lenovo V14 G2 ITL (82KA) uses DYTC version 4 for platform profile
> control, so ideapad-laptop currently skips it and logs:
>=20
>   DYTC_VERSION 4 support may not work. Pass ideapad_laptop.allow_v4_dytc=
=3DY on the kernel commandline to enable
>=20
> With allow_v4_dytc=3DY, platform_profile registers with low-power,
> balanced and performance. Each profile reads back after it is set, no
> ACPI errors are logged when switching, and the firmware applies it:
> with all CPUs busy on AC power, the sustained package power was about
> 14 W in low-power, 17 W in balanced and 24 W in performance.
>=20
> Add the V14 G2 ITL to ideapad_dytc_v4_allow_table[].
>=20
> Signed-off-by: Arnav Kapoor <kapoorarnav43@gmail.com>

Reviewed-by: Rong Zhang <i@rong.moe>

> ---
> Tested on a V14 G2 ITL (BIOS GGCN55WW) with the 7.0 kernel's
> ideapad-laptop and allow_v4_dytc=3DY, which takes the same path as this
> table entry; the patch itself is build-tested (W=3D1) on pdx86 for-next.
> Package power is the RAPL energy
> counter over the last 20 s of a 45 s all-CPU busy loop, on AC, with
> 60 s of cooldown between profiles.=C2=A0
>=20

> Fn+Q does not switch profiles on
> this model.

Even on Windows?

If Windows can switch profiles, you may improve the relevant Linux
drivers.

Thanks,
Rong

>=20
>  drivers/platform/x86/lenovo/ideapad-laptop.c | 7 +++++++
>  1 file changed, 7 insertions(+)
>=20
> diff --git a/drivers/platform/x86/lenovo/ideapad-laptop.c b/drivers/platf=
orm/x86/lenovo/ideapad-laptop.c
> index 91a8d11c79c5..ebd4bf6c8798 100644
> --- a/drivers/platform/x86/lenovo/ideapad-laptop.c
> +++ b/drivers/platform/x86/lenovo/ideapad-laptop.c
> @@ -1134,6 +1134,13 @@ static const struct dmi_system_id ideapad_dytc_v4_=
allow_table[] =3D {
>  =09=09=09DMI_MATCH(DMI_PRODUCT_VERSION, "IdeaPad 5 15ITL05")
>  =09=09}
>  =09},
> +=09{
> +=09=09/* V14 G2 ITL */
> +=09=09.matches =3D {
> +=09=09=09DMI_MATCH(DMI_SYS_VENDOR, "LENOVO"),
> +=09=09=09DMI_MATCH(DMI_PRODUCT_VERSION, "V14 G2 ITL")
> +=09=09}
> +=09},
>  =09{}
>  };
> =20
>=20
> base-commit: a362539b42193dcdb17f8fba40031a515c53885c
