Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.15
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792527656;
	b=kuFL5jEoWR60MFqeEfHMg9c4i3OgPpsE0iXUcsCIZqqROPD3qL8Sh2GpuaAZ1LD0quOx
	 hQhJOsZ1SeZZg7/tIZ0etsUKUTpX/SH1hazmhBbibKchZxdKzATbQajDyiVzJxH1a7x7d
	 rJuMPGbZ4f5R72lM2iqyEqIp8Shk67EyrLmZWArhetK0SM71EvmS871HAoDY2ex7Xo754
	 0x7DAISjxqrUe65zIEIYH7DxFeezb7Rl2xZd9U9GekOZUsbDm9eeh2zTvIJktvtt5U5Zh
	 xqntOMGNpVo9umq5sVdw1cgJ1aQftFqaRbqfYYEOrjNs8uHIxLyT4SHQnnxBdbvqSjA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792527656;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:From:Date:To:cc:
	 Subject:In-Reply-To:Message-ID:References:MIME-Version:Content-Type;
	bh=Y1PhgQ1ndqRDyJF7Pafjgy82Qw1ekRDup6lb/N9jbJs=;
	b=qmsrF8Xd6miuP5r0Ra6aNM5GC4gL/E5578mtAVj2/2Gqey3yl0EyjtF08rAarUROH2BL
	 YCCb/5/IwqUcQAGxU8w1kCbGHRlxbCxtsOns/giHjXqMHpDNRgp2nvc8kw1OfpVsUGSOB
	 SZgCGpfgq8sgwu7KEIeu2svQscVe3SizUdzwIdN355dN1UqYHWKOLSXxbhAykggApT/4G
	 dJ3lxL57el8u9IJQ0TgufvYPqluI6pXaCD1WZId0tjQYCjgzMEBR8s9RNc2agmbTGtRr0
	 Lm+FJo+shNvNYQdfXMvA1BDL6Oj55iv82RTLuklQFhQ6cW7H1Doiai8xsLd11SI2XKg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.intel.com;
	spf=pass smtp.mailfrom=linux.intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=NCNZ9smD;
	arc=none smtp.remote-ip=198.175.65.15
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6B02606A31D;
	Tue, 20 Oct 2026 20:20:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D6B02606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=NCNZ9smD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1792527656; x=1824063656;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=p9o98t3CO2x/QIfBS82D/0ItkWNwlaPRKyWOi2emP2U=;
  b=NCNZ9smDyHYdnAyZ6NFqjnvyo8OpNNQX90dSuDRg83rUiO/NP9zhG0Gx
   EiJrQlHCPEpdzajGUH8mh0EmRxXxfHPW5/rptEmas5IijVZJpzBHa2IFU
   Ul/zphHFoelwjkUb4eE61WbqyquVrW5mLapKuRDvFjtEBe/cx+aRWoepL
   uSOuRLTnps1Eoy6us3ld6drIFTF3q88QHOXel3RHK1hoiIFr6SOdniaar
   e81yRT8IoI6EMedQA2JZAY//CbhFtoDSArFZ64nH6TQdeoAQ2sXPf296T
   ZoqwrmVNm0dJOGVxOJ//CyNEdqL/7AoEUiLx15vvCkyHWK2Xa3b5YfFY6
   Q==;
X-CSE-ConnectionGUID: a0qGKGHET12Mq7dr8HjLRg==
X-CSE-MsgGUID: dEbKqAsCR6m21Cu7poLTog==
X-IronPort-AV: E=McAfee;i="6800,10657,11941"; a="1244063"
X-IronPort-AV: E=Sophos;i="6.27,168,1787036400"; 
   d="scan'208";a="1244063"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Oct 2026 13:20:56 -0700
X-CSE-ConnectionGUID: kMQ6bIZ7SDC0o6gMdR15jw==
X-CSE-MsgGUID: uWOTTOCSTBaIoF+KT0kngQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,168,1787036400"; 
   d="scan'208";a="3363731"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.181])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Oct 2026 13:20:52 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Tue, 20 Oct 2026 23:20:50 +0300 (EEST)
To: Takashi Iwai <tiwai@suse.de>
cc: platform-driver-x86@vger.kernel.org, Hans de Goede <hansg@kernel.org>, 
    Junrui Luo <moonafterrain@outlook.com>, 
    LKML <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] platform/x86: ibm_rtl: Fix potential OOB read at signature
 search
In-Reply-To: <87y0bsfocc.wl-tiwai@suse.de>
Message-ID: <4d28c3ce-63f7-399e-9798-4f35e60c608b@linux.intel.com>
References: <20261020130301.351768-1-tiwai@suse.de> <818a69b8-785f-9eec-d93a-89c8833d94fc@linux.intel.com> <87y0bsfocc.wl-tiwai@suse.de>
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Post: <mailto:platform-driver-x86@vger.kernel.org>
List-Help: <mailto:platform-driver-x86+help@vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
List-Owner: <mailto:platform-driver-x86+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323328-264967888-1792527650=:1177"

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323328-264967888-1792527650=:1177
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE

On Tue, 20 Oct 2026, Takashi Iwai wrote:

> On Tue, 20 Oct 2026 15:52:28 +0200,
> Ilpo J=E4rvinen wrote:
> >=20
> > On Tue, 20 Oct 2026, Takashi Iwai wrote:
> >=20
> > > The loop for signature search fetches 8 bytes at each check,
> >=20
> > But that's not all it's going to access??
>=20
> Oh indeed it access further.
>=20
> > > while the
> > > loop count is calculated in 4 bytes unit, which means that, at the
> > > last entry, it fetches over the limit.
> > >=20
> > > Correct the boundary condition to "ebda_size/sizeof(unsigned int)-1"
> >=20
> > This seems even more obfuscated than this code already is!
>=20
> Yeah, the driver code is really ugly, and I made a whip cream on the
> top :)
>=20
> > I think it should do this instead:
> >=20
> > (ebda_size - sizeof(*rtl_table)) / sizeof(u32)
>=20
> Hrm, this will result in the omit of the last loop entry?
>=20
> I guess it'd be better understandable rather by directly adding the
> offset in the loop instead of the counter.  Something like below.

The patch below looks fine sans one nit but could you please send it in=20
own thread so it gets captured by patchwork & sashiko & etc.

> > Admittedly, it a logical change too but why you think only partial RTL=
=20
> > table is good enough just because signature can be checked? After the s=
ig=20
> > check, it will read the struct beyond that.
> >=20
> > ...And that other sizeof() should use u32 as well.
> >=20
> >=20
> > Unrelated to this change and if you have this HW and can test changes, =
it=20
> > would be nice to also get rid of the debug parameter and use dynamic=20
> > debugging instead of RTL_DEBUG() for consistency.
>=20
> No, I don't.  It was caught only through reviews at backporting to the
> distro kernels.

Fair.
=20
> > I also don't understand why it's mixing readq() and ioread*() for readi=
ng=20
> > from the same area.
>=20
> I guess it's just an optimization for the signature check.
> The driver needs significant code cleanup, in anyway...

Sure. I had written something along the lines of having plenty of=20
additional comments but cut it out in the end. :-)

> thanks,
>=20
> Takashi
>=20
> -- 8< --
> From: Takashi Iwai <tiwai@suse.de>
> Subject: [PATCH v2] platform/x86: ibm_rtl: Fix potential OOB read at sign=
ature
>  search
>=20
> The loop for signature search fetches 22 bytes of struct ibm_rtl_table
> at each check, while the loop count is calculated in 4 bytes unit,
> which means that, at the last entry, it fetches over the limit.
>=20
> Rewrite the loop to use the byte offset and correct the boundary
> condition check for avoiding the potential OOB access.
>=20
> Fixes: 15dd100349b8 ("platform/x86: ibm_rtl: fix EBDA signature search po=
inter arithmetic")
> Signed-off-by: Takashi Iwai <tiwai@suse.de>
> ---
>  drivers/platform/x86/ibm_rtl.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
>=20
> diff --git a/drivers/platform/x86/ibm_rtl.c b/drivers/platform/x86/ibm_rt=
l.c
> index 139956168cf9..6f0a10e1d81e 100644
> --- a/drivers/platform/x86/ibm_rtl.c
> +++ b/drivers/platform/x86/ibm_rtl.c
> @@ -234,9 +234,9 @@ static const struct dmi_system_id ibm_rtl_dmi_table[]=
 __initconst =3D {
>  };
> =20
>  static int __init ibm_rtl_init(void) {
> -=09unsigned long ebda_addr, ebda_size;
> +=09unsigned long ebda_addr, ebda_size, offset;
>  =09unsigned int ebda_kb;
> -=09int ret =3D -ENODEV, i;
> +=09int ret =3D -ENODEV;
> =20
>  =09if (force)
>  =09=09pr_warn("module loaded by force\n");
> @@ -271,9 +271,9 @@ static int __init ibm_rtl_init(void) {
>  =09=09return -ENOMEM;
> =20
>  =09/* search for the _RTL_ signature at the start of the table */
> -=09for (i =3D 0 ; i < ebda_size/sizeof(unsigned int); i++) {
> +=09for (offset =3D 0 ; offset + sizeof(*rtl_table) <=3D ebda_size; offse=
t +=3D 4) {

Nit, remove the extra space before semicolon.


--=20
 i.

--8323328-264967888-1792527650=:1177--
