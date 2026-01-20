Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DEFD73D6488;
	Tue, 20 Jan 2026 15:10:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768921810; cv=none; b=QC1q+RnOuVhIlCOQs+krovZ8RAuK2+wtkloHk6Kq5W+Tbpj3JANPOWFYuh5U5klbeR6Z0yfwv7fB42GIQn3cXRiXxBxgqPZ9AoDCOKKYkk8eaTffxiArF2APEwh+RZmJXCWG46NnLBeV3UO0bHSeKmLAiUJRr7vyRt4g91oGHo0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768921810; c=relaxed/simple;
	bh=dHVFDy2YS/pxhFOLCdtAotjn8l8gvMlsBBh8NyCWEFk=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=m8Mqsu/H7DcKn6CfgJofplcFgYKt0+NwJQvUwJwLfxUErBaVF19bZqV29HfcfHHqKtCVSIF1aMHXfxq56BqGh4xFgfOs8gHZk7da7aOaYWKiFOPfc+pRZ58yKT8rZ28PVZmpOCG/kQ3zegl5zAOcG/ETTs1ctQZRlJAa2YaYiuk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kcoq7YcA; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kcoq7YcA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768921808; x=1800457808;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version:content-id;
  bh=dHVFDy2YS/pxhFOLCdtAotjn8l8gvMlsBBh8NyCWEFk=;
  b=kcoq7YcAloEojviFCRiRGPcHCNE6IzAnHOHUwoo9DyP//3fAdFT1IxLN
   t8TwrX3kcDcsTEYvVwxIaf4++UEq/7QcMD2ErHZtyEZkVzYnh4kLAJoK7
   cODWA7Fs8oAbjv6GyLbfx+OGhgcf7YAbH6rc5hWF6lzcSO1ldy9bv2uDF
   oIrXaeRblBAB+Wa3VsmkPJ9E+d2nrHvgCc7sR1MRSZFeEtShdK0oJdCjb
   40b9ReFrdP1U3e8YXGcV9paOe9IpL+ooyAD0cVkL2An2kBkYpIb0Qvs0z
   ChMVJkkQJ5TUguHRDO8O/jt0gSOSkNsPpX5axNP3O6Xu1Sz9bmSylodDh
   Q==;
X-CSE-ConnectionGUID: /ZtCFZFkSCu4gaLrtU8lZA==
X-CSE-MsgGUID: Jeho33wbQxiYbwP+NmUgZw==
X-IronPort-AV: E=McAfee;i="6800,10657,11677"; a="70105876"
X-IronPort-AV: E=Sophos;i="6.21,240,1763452800"; 
   d="scan'208";a="70105876"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Jan 2026 07:10:05 -0800
X-CSE-ConnectionGUID: cicZd60lSl2rtRvb8bnofQ==
X-CSE-MsgGUID: Y7/0ENclSZqxjCFJJTeODg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,240,1763452800"; 
   d="scan'208";a="229084865"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.10])
  by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Jan 2026 07:10:03 -0800
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Tue, 20 Jan 2026 17:10:00 +0200 (EET)
To: Krishna Chomal <krishna.chomal108@gmail.com>
cc: Hans de Goede <hansg@kernel.org>, platform-driver-x86@vger.kernel.org, 
    LKML <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v5 2/2] platform/x86: hp-wmi: Add EC offsets to read
 Victus S thermal profile
In-Reply-To: <aWpKUa--tT0ZSRKG@archlinux>
Message-ID: <b2be1f6c-4f2e-cbb1-af52-46a85ecd5edd@linux.intel.com>
References: <20251218124303.22024-1-krishna.chomal108@gmail.com> <20260113182604.115211-1-krishna.chomal108@gmail.com> <20260113182604.115211-3-krishna.chomal108@gmail.com> <60c0e7ad-f25e-4e73-668b-4bb08dbbb79e@linux.intel.com> <aWpKUa--tT0ZSRKG@archlinux>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/mixed; BOUNDARY="8323328-277296359-1768921331=:972"
Content-ID: <1d7eb6e3-73c7-bb82-86d6-91d09092f910@linux.intel.com>

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323328-277296359-1768921331=:972
Content-Type: text/plain; CHARSET=ISO-8859-15
Content-Transfer-Encoding: QUOTED-PRINTABLE
Content-ID: <98a0183b-4395-78e7-c010-700f89de2ca7@linux.intel.com>

On Fri, 16 Jan 2026, Krishna Chomal wrote:

> On Thu, Jan 15, 2026 at 03:26:45PM +0200, Ilpo J=E4rvinen wrote:
> [snip]
> > > +static int platform_profile_victus_s_get_ec(enum platform_profile_op=
tion
> > > *profile)
> > > +{
> > > +=09int ret, i;
> > > +=09bool current_ctgp_state, current_ppab_state;
> > > +=09u8 current_dstate, current_gpu_slowdown_temp, tp;
> > > +=09static const u8 tp_ec_offsets[2] =3D {
> > > HP_OMEN_EC_THERMAL_PROFILE_OFFSET,
> > > +
> > > HP_VICTUS_S_EC_THERMAL_PROFILE_OFFSET };
> > > +
> > > +=09/*
> > > +=09 * Victus S devices have more than 1 EC layouts, hence we cannot
> > > directly
> > > +=09 * call omen_thermal_profile_get() like other
> > > platform_profile_*_get_ec()
> > > +=09 * variants, since it would only resolve to that 1 type of board.
> > > Hence
> > > +=09 * we iteratively query a set of candidates: tp_ec_offsets[] unti=
l we
> > > +=09 * find a valid thermal profile.
> > > +=09 */
> > > +=09for (i =3D 0 ; i < ARRAY_SIZE(tp_ec_offsets) ; i++) {
> > > +=09=09ret =3D ec_read(tp_ec_offsets[i], &tp);
> >=20
> > I'm not so sure about this. Reading EC offsets and hoping we find the
> > correct one doesn't sound the best idea. I'd prefer we store the
> > information like we already do for thermal profiles. Unless there's som=
e
> > other way to detect which layout it is?
>=20
> I explored the Omen Gaming Hub (OGH) behavior on Windows to see if a WMI
> query exists for readback. OGH appears to default to "Balanced" on first
> run and tracks state via a profile.json file on the disk. Deleting this
> file causes the app to lose the current state, suggesting that there is n=
o
> official WMI readback query. By implementing EC reads, the driver can
> actually remain more consistent with the real hardware state than the
> offcial software.
>=20
> I agree that iterative EC reads are not ideal. However, since these two
> offsets (0x95 and 0x59) cover all (or almost all) known Victus/Omen layou=
ts,
> the risk of "hoping" is low.
>=20
> Storing them at compile time in the victus_s array as a part of
> .driver_data is indeed the best thing. But since we do not know what EC
> layout is followed by the existing boards in the array, we can take a
> hybrid approach here:
> 1. I (and subsequent additions) will store their EC offset in the
>    .driver_data field struct.
> 2. For already existing boards we will perform this iterative probe once
>    during init, and store it somewhere common.
> 3. Then platform_profile_victus_s_get_ec() can simply use this "definite"
>    offset to perform the EC read.

I guess we'll have to settle to that but it likely means we'll never be=20
able to source those offsets because things appear "working" and therefore=
=20
cannot get rid of the extra code necessary for the EC offset iteration.

Another alternative would be to add pr_warn() if we don't have the EC=20
offset yet for a board and not read anything (and hope somebody who has=20
one of those boards will come to us with the information or patch).

--=20
 i.
--8323328-277296359-1768921331=:972--
