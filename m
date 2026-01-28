Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52B792F3C3F
	for <platform-driver-x86@vger.kernel.org>; Wed, 28 Jan 2026 13:02:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769605353; cv=none; b=WRgsZnMVnnk5cUBke2vGQD/ZCGK62TymVLpHKbVgyY5r08t5Ugy2q0VHoBIkFcPc6Qz+P0daSkzJybGIfcbj5igsG6xRndyk4Xh9BNOqHGDy3n5kduciTAfYk5Re525grvV4rgp5n+WA3AVRtMWPEpdqlQkIyn1W4BmAMseE0Lg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769605353; c=relaxed/simple;
	bh=GKt7Bp8aV7jw+XNvE64YOvTAdbPGJ2q93kUKEJXOpLw=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=Y/xopy/pVZ0+1C8OpGCcWcR4X55ynng/EMbtJRrsIUi/04EkZNQB3Lq9/DRLHw8+hV43ruVq9CqxWye8c1WsZEdu12h3JaaWSfDQADS1x6dMtQVNHoiXt5swl/MHD9hGeBuqoPoGrl28ROOew/2XznuJm84PWbarl/FqF1PXX2o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BJhfhi5v; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BJhfhi5v"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769605352; x=1801141352;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version:content-id;
  bh=GKt7Bp8aV7jw+XNvE64YOvTAdbPGJ2q93kUKEJXOpLw=;
  b=BJhfhi5vGYAY9PsUaGAJCQns5k0qtiS3oWuAksFLzS4Pa7M2v5igrU2u
   cQy85O2boPwBk1IjiWlcdqp5RiccjPLqymph1leL1n5QLsx4cdAgOFs4F
   RJu11qIN5NDheG9rMoV3oo14V9CsgOGJ5vecj0QgqpdDzAty2HFwYwe3W
   DP+zz6e8qgvobSAPkWh3tbF/bfc/CMDVn40X2eKlVUUnAIuV6kkcYptwq
   1SVCeMnr1XXx6gfaAKrMI1saQONcXO2BhF4XBhI0pfRNhFwxk0x4Koitx
   1xYqT7cwKyC5d5O2UNMvkoWDIxpS/BW+MBUUVUdfREsl8B5AuSUzK2agH
   w==;
X-CSE-ConnectionGUID: 4YqJZpbZTQO//NVY876M0g==
X-CSE-MsgGUID: zhqIsMAuTsyYM7HwCzFphw==
X-IronPort-AV: E=McAfee;i="6800,10657,11684"; a="81130856"
X-IronPort-AV: E=Sophos;i="6.21,258,1763452800"; 
   d="scan'208";a="81130856"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jan 2026 05:02:32 -0800
X-CSE-ConnectionGUID: kGcVnbpYSGG/g9ef2Q/XKQ==
X-CSE-MsgGUID: 7uPcUpSOQRCAzeKvyERKJw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,258,1763452800"; 
   d="scan'208";a="208054759"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.14])
  by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jan 2026 05:02:28 -0800
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Wed, 28 Jan 2026 15:02:24 +0200 (EET)
To: "Ruhl, Michael J" <michael.j.ruhl@intel.com>
cc: "platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>, 
    "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>, 
    Hans de Goede <hansg@kernel.org>, 
    "Brost, Matthew" <matthew.brost@intel.com>, 
    "Vivi, Rodrigo" <rodrigo.vivi@intel.com>, 
    "thomas.hellstrom@linux.intel.com" <thomas.hellstrom@linux.intel.com>, 
    "airlied@gmail.com" <airlied@gmail.com>, 
    "simona@ffwll.ch" <simona@ffwll.ch>, 
    "david.e.box@linux.intel.com" <david.e.box@linux.intel.com>
Subject: RE: [PATCH 2/5] drm/xe/vsec: Use correct pm state get
In-Reply-To: <IA1PR11MB6418E9C2CAC15788E3C65952C191A@IA1PR11MB6418.namprd11.prod.outlook.com>
Message-ID: <a6f3afe9-b70a-27bd-a558-2d6e482b50bc@linux.intel.com>
References: <20260127182418.640701-7-michael.j.ruhl@intel.com> <20260127182418.640701-9-michael.j.ruhl@intel.com> <3f8ecbc2-e5bd-37d7-faf9-f5e090845243@linux.intel.com> <IA1PR11MB6418E9C2CAC15788E3C65952C191A@IA1PR11MB6418.namprd11.prod.outlook.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/mixed; BOUNDARY="8323328-400380153-1769605290=:1017"
Content-ID: <0943f6a4-90f9-8036-ec2f-1fa43a4761df@linux.intel.com>

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323328-400380153-1769605290=:1017
Content-Type: text/plain; CHARSET=ISO-8859-15
Content-Transfer-Encoding: QUOTED-PRINTABLE
Content-ID: <9f8e4de7-b99d-a373-609d-a4e2718d8f7b@linux.intel.com>

On Wed, 28 Jan 2026, Ruhl, Michael J wrote:

> >-----Original Message-----
> >From: Ilpo J=E4rvinen <ilpo.jarvinen@linux.intel.com>
> >Sent: Wednesday, January 28, 2026 7:42 AM
> >To: Ruhl, Michael J <michael.j.ruhl@intel.com>
> >Cc: platform-driver-x86@vger.kernel.org; intel-xe@lists.freedesktop.org;=
 Hans
> >de Goede <hansg@kernel.org>; Brost, Matthew <matthew.brost@intel.com>;
> >Vivi, Rodrigo <rodrigo.vivi@intel.com>; thomas.hellstrom@linux.intel.com=
;
> >airlied@gmail.com; simona@ffwll.ch; david.e.box@linux.intel.com
> >Subject: Re: [PATCH 2/5] drm/xe/vsec: Use correct pm state get
> >
> >On Tue, 27 Jan 2026, Michael J. Ruhl wrote:
> >
> >> Crashlog needs to be collected at all times.  The current pm
> >> check assumes telemetry only.
> >>
> >> Update read path to enable device for crashlog instances.
> >>
> >> Signed-off-by: Michael J. Ruhl <michael.j.ruhl@intel.com>
> >> ---
> >>  drivers/gpu/drm/xe/xe_vsec.c | 16 +++++++++++++---
> >>  1 file changed, 13 insertions(+), 3 deletions(-)
> >>
> >> diff --git a/drivers/gpu/drm/xe/xe_vsec.c b/drivers/gpu/drm/xe/xe_vsec=
=2Ec
> >> index 4ebb4dbe1c9b..44607f1eaa88 100644
> >> --- a/drivers/gpu/drm/xe/xe_vsec.c
> >> +++ b/drivers/gpu/drm/xe/xe_vsec.c
> >> @@ -145,6 +145,7 @@ int xe_pmt_telem_read(struct pci_dev *pdev, u32
> >guid, u64 *data, loff_t user_off
> >>  {
> >>  =09struct xe_device *xe =3D pdev_to_xe_device(pdev);
> >>  =09void __iomem *telem_addr =3D xe->mmio.regs +
> >BMG_TELEMETRY_OFFSET;
> >> +=09u32 cap_type =3D FIELD_GET(GUID_CAP_TYPE, guid);
> >>  =09u32 mem_region;
> >>  =09u32 offset;
> >>  =09int ret;
> >> @@ -160,9 +161,18 @@ int xe_pmt_telem_read(struct pci_dev *pdev, u32
> >guid, u64 *data, loff_t user_off
> >>  =09if (!xe->soc_remapper.set_telem_region)
> >>  =09=09return -ENODEV;
> >>
> >> -=09/* indicate that we are not at an appropriate power level */
> >> -=09if (!xe_pm_runtime_get_if_active(xe))
> >> -=09=09return -ENODATA;
> >> +=09/* make sure that we are not at an inappropriate power level */
> >> +=09switch (cap_type) {
> >> +=09case CRASHLOG:
> >> +=09=09xe_pm_runtime_get(xe);
> >
> >While this is xe code so I don't know much about it, it feels odd to me =
to
> >just add a get without put or explanation in the changelog why this chan=
ge
> >doesn't result in imbalance.
>=20
> There is an existing xe_pm_runtime_put() before this function exits.  (or=
iginal
> line ~170, new line ~181).  Is this what you are looking for?
>=20
> The TELEM entry will not take the reference if the device is not powered,
> so a put is unnecessary (exit on not enabled).
>=20
> CRASLOG requires power, so the _get() will power the device and take
> reference.

I see, I didn't look up the function but just read the patch and found it=
=20
odd. I guess it's fine as is.

--=20
 i.
--8323328-400380153-1769605290=:1017--
