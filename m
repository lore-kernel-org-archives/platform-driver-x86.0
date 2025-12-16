Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 837337E110
	for <platform-driver-x86@vger.kernel.org>; Tue, 16 Dec 2025 19:23:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765913000; cv=none; b=rzdfGlssgW7RET1AqJcIud9oIXzBUUS+Doi4CNyMske8vpSm4yhINM3xYJVelQdZ3uMNCJ7nS2t20XtW86VnzvTibI/rksGrEhl7e5ZcghExUuThX43Q8+x2dm+nB2wE7X2QXBKdz8QFRoF0Mq4V1L6IlBg9aqv7Woh2YcZ/J+U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765913000; c=relaxed/simple;
	bh=bL9O3w91AYnLY4hB9rqgPphT7H+95M3gz34bpL7U72s=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=ZsYxeixSd7JxV1C0jgTeN6hxbxHNsJm9xGAb3OjDx584oqcO2W7RoJHadrLK/uqDp6Q6u6f9/dA9F/kiHc/RBDJV4X2LytPck6y46u/apNtz5gT64vLHLUm055y0f24BgHk2L5Anz1F0Q/kknjvBT9+i6zesITsnpchbnvje4/w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=EejHiPXk; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="EejHiPXk"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765912999; x=1797448999;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=bL9O3w91AYnLY4hB9rqgPphT7H+95M3gz34bpL7U72s=;
  b=EejHiPXkG3mWrHB84PT44BEyIBTmY6PV25ZjihWb3ju3R7We0+3QILeY
   kzFKI2C+qc0QoP82mLI6jJ2qf1iCSShGe/DKji3iI/ZfP5SCEcu+HE2Sg
   VtTOjpv3BhmZ86dG0VHyveWlyAFBVC3jvQMhbfRe9CRet+X9uttAfMmom
   Tr0qBLsf521ZwoxL2H9wMwulW+rS720+AFCitrc7FWz49eWeSug1EMQr0
   Rsm37mU2fdplbenIDEG0EHv/idCKi1UZsFFR+2QCKb6EwsOEaOZbJq5kd
   nhWnTGTg+bxbHxfKwn05lg/zc2BTHYrN7mgpkOz2cRrGqaw0Up/BxbQcN
   w==;
X-CSE-ConnectionGUID: A7aYbCpZTTi/9BufV4S4dw==
X-CSE-MsgGUID: wbcUWIS9RwuXkS4dJAy8DQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11644"; a="67996840"
X-IronPort-AV: E=Sophos;i="6.21,153,1763452800"; 
   d="scan'208";a="67996840"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Dec 2025 11:23:18 -0800
X-CSE-ConnectionGUID: zFEYXhH5RCOzKgOlSQRh3Q==
X-CSE-MsgGUID: WoOTSxoQTOSPcz2kzgbzBg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,153,1763452800"; 
   d="scan'208";a="203216480"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.4])
  by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Dec 2025 11:23:17 -0800
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Tue, 16 Dec 2025 21:23:13 +0200 (EET)
To: Krishna Chomal <krishna.chomal108@gmail.com>
cc: Hans de Goede <hansg@kernel.org>, platform-driver-x86@vger.kernel.org
Subject: Re: [PATCH v2] platform/x86: hp-wmi: fix platform profile values
 for Omen 16-wf1xxx
In-Reply-To: <aUGilpWofRetSNpZ@archlinux>
Message-ID: <4bea39ad-9027-5692-0b81-98267422a172@linux.intel.com>
References: <20251216121338.124615-1-krishna.chomal108@gmail.com> <43d49656-7c7c-ec55-a448-9cc9321ab3b2@linux.intel.com> <aUGilpWofRetSNpZ@archlinux>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323328-1376531826-1765912993=:1169"

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323328-1376531826-1765912993=:1169
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE

On Wed, 17 Dec 2025, Krishna Chomal wrote:

> On Tue, Dec 16, 2025 at 03:07:37PM +0200, Ilpo J=C3=A4rvinen wrote:
> > > +enum hp_thermal_profile {
> > > +=09HP_THERMAL_PROFILE_PERFORMANCE=09=09=09=3D 0x00,
> > > +=09HP_THERMAL_PROFILE_DEFAULT=09=09=09=3D 0x01,
> > > +=09HP_THERMAL_PROFILE_COOL=09=09=09=09=3D 0x02,
> > > +=09HP_THERMAL_PROFILE_QUIET=09=09=09=3D 0x03,
> > > +};
> > > +
> > > +struct thermal_profile_params {
> > > +=09u8 performance;
> > > +=09u8 balanced;
> > > +=09u8 eco;
> > > +};
> >=20
> > How do you envision this being used on the get side? You choose not to
> > change the get side, so you didn't run to that challenge. Currently
> > at least platform_profile_omen_get_ec() is sort of cheating as it maps
> > multiple variants without properly differentiation them.
>=20
> The get side for victus_s devices as defined in platform_profile_victus_s=
_ops
> is platform_profile_omen_get(). That function simply returns the value
> stored in the global static var: active_platform_profile. As far as
> platform_profile_omen_get_ec() is concerned, it being called:
> 1. In omen_powersource_event() and
> 2. In thermal_profile_setup()
>=20
> However both of these are irrelevant for victus_s devices, as it is
> guarded by a if(is_omen_thermal_profile()) block.

Thanks, I assumed all _ec variants are called from the similarly named=20
getter/setter but apparently there are exceptions I didn't notice until=20
now.

> So basically victus_s
> devices never actually reach that function. I believe that is because it
> internally calls omen_thermal_profile_get(), which itself uses ec_read
> to read the current thermal profile. This functionality was added in
> commit 4c51ba9af42df, back in the year 2021. Since then the EC layout,
> and some WMI calls have been changed in HP laptops. In fact that is the
> reason victus_s list exists in the first place.
>=20
> After some basic EC-dumping from Windows, I know that the EC offset for
> these newer boards should be 0x59. If you want, I can add this new EC
> mapping too.

No objection, just put the new stuff into own patch.

> So basically for victus_s boards, at least as of now, there is no
> get side to read the actual platform profile, hence no challenges faced
> yet.

The get side should still be thought at this point as it affects what the=
=20
struct layuout should be. The only way to do the reverse mapping will the=
=20
current struct layout is using one if () per a struct member (e.g. loop is=
=20
going to be impractical). Perhaps some union+array trickery could allow=20
looping through them while retaining the current way to name the fields.

> > Is "eco" hp specific terminology? (platform_profile_option doesn't use
> > that terminology at all.)
>=20
> Yes "eco" is hp-specific terminology, but you are right, I will change
> it to "low_power" in V3 for consistency.
>=20
> > Wouldn't we want to include struct platform_profile_ops * somewhere as
> > well so this framework can extend beyond just victus_s? (I'm not sure i=
f
> > it should be in struct thermal_profile_params or if should be separate
> > from that, this whole platform profile code is so hard to read it's har=
d
> > to infer what are all the variations.)
>=20
> That seems like a valid direction but given the current state of the
> driver (with its many static vars), I would prefer to keep this patch
> focused on fixing victus_s thermal profile values. I can look into a
> more broader refactor later.

Fine. Doing it in smaller steps is easier to review anyway.

> > >  static int victus_s_gpu_thermal_profile_get(bool *ctgp_enable,
> > > @@ -1672,25 +1708,33 @@ static int victus_s_set_cpu_pl1_pl2(u8 pl1, u=
8
> > > pl2)
> > >=20
> > >  static int platform_profile_victus_s_set_ec(enum platform_profile_op=
tion
> > > profile)
> > >  {
> > > +=09const struct dmi_system_id *id;
> > > +=09const struct thermal_profile_params *params;
> > >  =09bool gpu_ctgp_enable, gpu_ppab_enable;
> > >  =09u8 gpu_dstate; /* Test shows 1 =3D 100%, 2 =3D 50%, 3 =3D 25%, 4 =
=3D 12.5% */
> > >  =09int err, tp;
> > >=20
> > > +=09id =3D dmi_first_match(victus_s_thermal_profile_boards);
> > > +=09if (!id)
> > > +=09=09return -ENODEV;
> > > +
> > > +=09params =3D id->driver_data;
> >=20
> > We should do this once at init time. Then you can mark the dmi table(s)
> > with __init.
> >=20
> > Normally the pointer would be stored into a priv struct (which this dri=
ver
> > doesn't have yet but gazillions of static vars).
>=20
> Yes I agree querying the dmi table for every profile change is very
> suboptimal. I will add that in V3 with yet another static var :)

Thanks.

--=20
 i.

--8323328-1376531826-1765912993=:1169--
