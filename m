Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 362991D2B34
	for <platform-driver-x86@vger.kernel.org>; Tue, 14 Jan 2025 16:16:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736871371; cv=none; b=Z6eRnkSA6egw2DH26BQJdOPUrGLZodpN5U/UGzSqaBztVJqjaZd87RRsitxqyCGd+Em1K0+XbLl6HFugs6rnObFL269QzGdmSzVS0s52SN3/Ra0nB7RJkwt6QRBHehmlnlx2era/kA94LCQCofkzWupbyuNMlzjNr6LSvgWZ1iU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736871371; c=relaxed/simple;
	bh=njP9DEUe3azcdvil6RrhnD0YAFcN/kC7qbgtCVhAdGE=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=mvHOgkXWFC5dQZklNM2KFiCp5y7r+fy8mRt1T0mEUmePqy2lN510OoanMNZDv7g9nN69Rsd+Vsw4Kc0bpPRvI8QsGblfjUK8H1pV3PgVauzPmjv60CS/o3qF5Q2ffbJzuRgZbHpzQosRXFvjRFV/BKDprTOdtdhau5CJoRf/poQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kJHmcTeY; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kJHmcTeY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1736871369; x=1768407369;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=njP9DEUe3azcdvil6RrhnD0YAFcN/kC7qbgtCVhAdGE=;
  b=kJHmcTeYgM7/E+SVpzBwFRt0s+uN5wuAf4ksn+VcP+KOxQ58Wx903HXd
   gqHA2DiRLhp8flcTJfRpUZaGTxhXFn3FRhQsfFCC2zzGEOzsPiB4KcrBU
   0IN+w57oorwmdfCWeEX40pDDhMP/p9bUYoavyGCZBpVxXNId24T1tcbVL
   9Qm2czNmg+9dkRzl/9w0fO3AwHy905wui/wMDxCzH66QqQgibdTgDZ21X
   FzkPeR1qpycia3EqNUaz1wNKXoRllSQ/NcNC4J5mBqQ3PgdtIRQ1MoD+2
   q1ocFkA9GUI67kWLUON/Sv87fARragXwtdPZue6Wl3D9gLm1PWo+LaiaX
   g==;
X-CSE-ConnectionGUID: IalssJcKTGywcFikxr+CbA==
X-CSE-MsgGUID: LEM/bFoUS2q8vIdi16s2Jg==
X-IronPort-AV: E=McAfee;i="6700,10204,11315"; a="40938759"
X-IronPort-AV: E=Sophos;i="6.12,314,1728975600"; 
   d="scan'208";a="40938759"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Jan 2025 08:16:08 -0800
X-CSE-ConnectionGUID: iz7+t4+JT0iK6pb+Gdh79A==
X-CSE-MsgGUID: dNVOSC4cThWdf5asPOm5bg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,314,1728975600"; 
   d="scan'208";a="104606237"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.54])
  by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Jan 2025 08:16:06 -0800
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Tue, 14 Jan 2025 18:16:02 +0200 (EET)
To: Julien ROBIN <julien.robin28@free.fr>
cc: Hans de Goede <hdegoede@redhat.com>, platform-driver-x86@vger.kernel.org
Subject: Re: [PATCH] platform/x86: hp-wmi: Add fan and thermal profile support
 for Victus 16-s1000
In-Reply-To: <ec8d7fa6-a386-4392-b6e0-a632981f91e3@free.fr>
Message-ID: <00713401-6cfb-6d0c-4573-8a97d2705555@linux.intel.com>
References: <69a3a3bf-fe56-4843-91a5-b765e53e337d@free.fr> <d59c584b-1b25-213f-a481-97cb75c8d021@linux.intel.com> <ec8d7fa6-a386-4392-b6e0-a632981f91e3@free.fr>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323328-1849433803-1736871362=:1077"

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323328-1849433803-1736871362=:1077
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE

On Mon, 13 Jan 2025, Julien ROBIN wrote:

> Hello and thank you very much for the feedback.
>=20
> I reworked my changes accordingly, sorry I took some time on it.
> I'm going to send a corrected [Patch v2] soon, so that the changes may=20
> be reviewed (as it's my first patch submission, your feedback is=20
> welcome).
>
> I'm going to list the changes into the [Patch v2] description, but as=20
> remainder, you can find my answers to your feedback and suggestions=20
> below.
>=20
> On 08/01/2025 11:08 AM, Ilpo J=C3=A4rvinen wrote:
>=20
> >> +static int victus_s_set_cpu_pl1_pl2(char pl1, char pl2)
> >=20
> > Is char correct type here or should you use like u8? Given you use 0xff=
=20
> > below I highly thing it's not a real character at all but generic 8-bit=
=20
> > data that should be u8.
> >=20
> >> +{
> >> +=09/* Placing 0xFF in the 2 last bytes tells we're setting PL1 and PL=
2 */
> >> +=09char buffer[4] =3D { pl1, pl2, 0xFF, 0xFF };
> >=20
> > correct type?
> >=20
> > I see lots of other char use elsewhere too in this patch, please check=
=20
> > those too that it's correct.
>=20
> You're right, usage of char variable types was just copy of what I saw=20
> into existing functions; but used as unsigned numeric 8-bit values, u8=20
> variable type is indeed more relevant.
> So I changed my "char" additions to "u8" as you suggested.

Unfortunately in the past the developers have not paid too much=20
attention to this difference so we're moving only (very) slowly towards=20
consistency.

> >> +static int hp_wmi_fan_speed_reset(void)
> >> +{
> >> +=09int ret;
> >> +=09char fan_speed[2] =3D { 0 }; /* Restores automatic speed */
> >=20
> > Instead of a comment, add a named define for the value?
>=20
> >> +
> >> +=09if (pl1 =3D=3D 0xFF || pl2 =3D=3D 0xFF)
> >> +=09=09return -EINVAL; /* the 0xFF value has a special meaning */
> >=20
> > Could that "special meaning" be labeled with a named define?
> > (I understand you might not know anything beyond it being "special" but=
=20
> > if you know a more precise meaning, a define would be much better than =
a=20
> > literal.)
>=20
> I dug a little more about the observed special behavior of 0 and 0xFF=20
> values for these HP WMI queries.
>=20
> It turns out 0xFF is more exactly used as "ignore / don't change"=20
> parameter for HPWMI_SET_POWER_LIMITS_QUERY (0x29).
> Also, 3rd and 4th parameters for HPWMI_SET_POWER_LIMITS_QUERY turned out=
=20
> to be PL4, and CPU + GPU concurrent TDP, so for these 4 bytes, I've=20
> changed the buffer[4] to a struct with more clearly expressed names. In=
=20
> order to be consistent, I did the same work for GPU power modes.
>=20
> For the named define for those values, I was about to propose the followi=
ng ones:
>=20
> #define HP_VICTUS_ARG_VALUE_RESTORE_DEFAULT 0x00
> #define HP_VICTUS_ARG_VALUE_KEEP_UNCHANGED 0xFF
>=20
> However these 2 statements wouldn't always be true and could be=20
> deceptive for other settings, as it turns out using 0 or 0x00 as=20
> arguments for others WMI queries (others than fan speed and CPU power=20
> limits settings) tends to set 0 as actual value instead of restoring=20
> default one, and same goes for 0xFF.=20
>
> So for now I just moved the comment as function level comment, as you=20
> suggested below, but in case you had something else in mind, I'm of=20
> course open to another approach.

You could add comment before the defines to tell which queries are known=20
to use those values. It would still be very much preferrable to have those=
=20
literals named so the code will become self-explanatory and those comments=
=20
wouldn't be neede anymore.

> >> +=09if (pl2 < pl1)
> >> +=09=09return -EINVAL; /* PL2 is not supposed to be lower than PL1 */
> >=20
> > Please move those two comments before the if () line.
> >=20
> >> +
> >> +=09/* Note: providing 0x00 as PL1 and PL2 is restoring default values=
 */
> >> +
> >=20
> > That comments sounds like something that could be a function level comm=
ent=20
> > instead.
>=20
> That's right, I moved those comments as you suggested.
> =20
> >> +static int platform_profile_victus_s_get(struct platform_profile_hand=
ler
> >> *pprof,
> >> +=09=09=09=09=09 enum platform_profile_option
> >> *profile)
> >> +{
> >> +=09/* Same behaviour as platform_profile_omen_get */
> >> +=09return platform_profile_omen_get(pprof, profile);
> >> +}
> >=20
> > Just use platform_profile_omen_get() directly then instead?
>=20
> Yes, I was copying again another approach I saw; but I indeed asked=20
> myself the same question.
> So I removed this one and made platform_profile_omen_get() called instead=
=2E
>=20
>=20
> Finally, while investigating about 0x00 and 0xFF special effects, I also=
=20
> dug a little more about a 0x57 fixed magic 4th byte used when applying=20
> GPU power modes (0x57 is 87 in decimal). It turned out to be a GPU=20
> slowdown temperature threshold, sometimes called GPS, that didn't need=20
> to be hard coded: despite being unable to use 0x00 and 0xFF to deal with=
=20
> it (was applying 0=C2=B0C and 255=C2=B0C), I successfully added=20
> HPWMI_GET_GPU_THERMAL_MODES_QUERY and associated function, and now the=20
> current setting for this value can be retrieved prior to overwrite.
> So into the [Patch v2] this is used to retrieve and reuse the current=20
> value (which is confirmed to be 87 in my case after a power cycle)=20
> instead of using an hard coded value, before overwriting GPU power=20
> modes. I believe it's better that way, in case others machines are using=
=20
> another value in the future.

Great, thanks for looking into it! :-)

--=20
 i.

--8323328-1849433803-1736871362=:1077--
