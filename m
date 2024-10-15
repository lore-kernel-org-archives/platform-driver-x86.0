Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B8681D9A53
	for <platform-driver-x86@vger.kernel.org>; Tue, 15 Oct 2024 08:18:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728980313; cv=none; b=KTv/8VCcjvwf79XWC0J0wvLY3TeeG3LN/z71slryjCdsvOHxVB0uVV8DFJP7+6gxBDtiYsZZujYzuh6ucSk/N7AQdxXr5A7iFETEW089BneS0JETSpnmLRONM4bK9bN43Cs77qDmbt4J5rgdcPZQUXOU4R2FC1Q7TTd6lwc0nSo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728980313; c=relaxed/simple;
	bh=DtzaaTmL5kP/ElHs8j3IusO6x6pv4667dmELvzgNzSQ=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=aHg8NWAXrTbkokJFCmKQIp8Yzhr3dWq39Z2jUUeHg8QhL3RJYYMpOdWKFru8Jr7wek0JyehW69RdxLniOQyXp2GMdieOwF8GykgAm2JKCWJI2RtfcZcY+mIObZPss+74IEhoBxzy79c4cTRt+P/sPHrficVl/nuYNylrfl6+jhQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=CmAZEGjj; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CmAZEGjj"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1728980312; x=1760516312;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=DtzaaTmL5kP/ElHs8j3IusO6x6pv4667dmELvzgNzSQ=;
  b=CmAZEGjjxS2Mka9LADEir5xZRF4DXX5eAW/ZTdVQrLHisQ3h2Nt19usS
   v9yMRbXdoHSmQmVg7dXKAv8XejbWTpa+GaLwAlO7i8BvTexeMn48xKgkO
   Et0qK2GZXdlLu/HQ/qiT9HxoQz9HNUtIoaY1FsSyghnxbh/GouH6djhqV
   hCpAwICZL5QtQOKtJz2gIUn3/boTjxlPQbrPa9jluaZvtJzAaVJIwZWQ9
   GgDXd/naM3nA5m/pjQjtYkXyTACmPl4Ft6O7KcS3BX8vqQsr2e0nUPemn
   Y0y7MQNuSxB+7r08HiJOCH7dFcfg+dktNrw9hD1B+zFMNbJdIB8s5GHG+
   Q==;
X-CSE-ConnectionGUID: IY6QQ/dBQ/aU/LfBlYAseA==
X-CSE-MsgGUID: 44t7WMniSf6kAIz0IKZqfg==
X-IronPort-AV: E=McAfee;i="6700,10204,11225"; a="15983522"
X-IronPort-AV: E=Sophos;i="6.11,204,1725346800"; 
   d="scan'208";a="15983522"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Oct 2024 01:18:31 -0700
X-CSE-ConnectionGUID: KNuWoxq3Qtq4jdZf5KBrkA==
X-CSE-MsgGUID: ytv+aWxTQfufGGEJvoTSyg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,204,1725346800"; 
   d="scan'208";a="77836942"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.12])
  by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Oct 2024 01:18:29 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Tue, 15 Oct 2024 11:18:26 +0300 (EEST)
To: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
cc: Hans de Goede <hdegoede@redhat.com>, platform-driver-x86@vger.kernel.org, 
    Patil.Reddy@amd.com
Subject: Re: [PATCH 4/5] platform/x86/amd/pmf: Switch to platform_get_resource()
 and devm_ioremap_resource()
In-Reply-To: <a2033c72-0c82-4164-b538-ae4eabc5821e@amd.com>
Message-ID: <3cd2a5f1-51b3-6863-7f57-034c770f70a5@linux.intel.com>
References: <20241014045759.1517226-1-Shyam-sundar.S-k@amd.com> <20241014045759.1517226-5-Shyam-sundar.S-k@amd.com> <279d7dcd-2a94-1dd2-c34e-15b852dbceee@linux.intel.com> <d160d900-d15c-4868-8f9e-d6477abca38d@amd.com> <b83b67b8-e1ca-7e9a-5205-d6d69c87be6c@linux.intel.com>
 <a2033c72-0c82-4164-b538-ae4eabc5821e@amd.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323328-1862501406-1728980306=:1100"

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323328-1862501406-1728980306=:1100
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE

On Tue, 15 Oct 2024, Shyam Sundar S K wrote:
> On 10/14/2024 23:24, Ilpo J=C3=A4rvinen wrote:
> > On Mon, 14 Oct 2024, Shyam Sundar S K wrote:
> >> On 10/14/2024 13:26, Ilpo J=C3=A4rvinen wrote:
> >>> On Mon, 14 Oct 2024, Shyam Sundar S K wrote:
> >>>
> >>>> Use platform_get_resource() to fetch the memory resource instead of
> >>>> acpi_walk_resources() and devm_ioremap_resource() for mapping the
> >>>> resources.
> >>>>
> >>>> Co-developed-by: Patil Rajesh Reddy <Patil.Reddy@amd.com>
> >>>> Signed-off-by: Patil Rajesh Reddy <Patil.Reddy@amd.com>
> >>>> Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
> >>>> ---
> >>>>  drivers/platform/x86/amd/pmf/Kconfig  |  1 +
> >>>>  drivers/platform/x86/amd/pmf/acpi.c   | 37 ++++++++----------------=
---
> >>>>  drivers/platform/x86/amd/pmf/pmf.h    |  6 +++--
> >>>>  drivers/platform/x86/amd/pmf/tee-if.c |  8 +++---
> >>>>  4 files changed, 20 insertions(+), 32 deletions(-)
> >>>>

> >>>> +=09if (!pmf_dev->res) {
> >>>> +=09=09dev_err(pmf_dev->dev, "Failed to get I/O memory resource\n");
> >>>> +=09=09return -EINVAL;
> >>>>  =09}
> >>>> =20
> >>>> -=09return AE_OK;
> >>>> -}
> >>>> +=09pmf_dev->policy_addr =3D pmf_dev->res->start;
> >>>> +=09pmf_dev->policy_sz =3D resource_size(pmf_dev->res) - 1;
> >>>
> >>> If you have a resource, why you convert it into something custom like=
=20
> >>> this?
> >>>
> >>
> >> I will address your comments in v2. But for this specific comment:
> >>
> >> the DSDT looks like this:
> >>
> >> Device (PMF)
> >> {
> >> =09...
> >>
> >> =09Method (_CRS, 0, NotSerialized)  // _CRS: Current Resource Settings
> >> =09{
> >> =09=09Name (RBUF, ResourceTemplate ()
> >> =09=09{
> >> =09=09=09QWordMemory (ResourceConsumer, PosDecode, MinNotFixed, MaxNot=
Fixed,
> >> NonCacheable, ReadOnly,
> >> =09=09=09=090x0000000000000000, // Granularity
> >> =09=09=09=090x000000FD00BC1000, // Range Minimum
> >> =09=09=09=090x000000FD00C0C000, // Range Maximum
> >> =09=09=09=090x0000000000000000, // Translation Offset
> >> =09=09=09=090x000000000004B000, // Length=09
> >> =09=09=09=09,, , AddressRangeMemory, TypeStatic)
> >> =09=09}
> >>
> >> =09=09...
> >> =09}
> >> }
> >>
> >> But, resource_size() will do 'res->end - res->start + 1;'
> >>
> >> So, that will become 0x4B000 + 1 =3D 0x4B001 which will exceed
> >> POLICY_BUF_MAX_SZ.
> >=20
> > That +1 is there to counter the -1 done on the set side. res->end is=20
> > supposed to point last valid address of the resource, not the address=
=20
> > after it. With round sizes, the end address is expected to end with lot=
s=20
> > of Fs (hex) but in your example it ends into zeros (if I interpret your=
=20
> > numbers right)?
> >=20
>=20
> Yes, that's right.
>=20
>=20
> Couple of more examples, where resource_size() will fit correctly.
>=20
>=20
> Example #1:
> WordIO (ResourceProducer, MinFixed, MaxFixed, PosDecode, EntireRange,
>                     0x0000,             // Granularity
>                     0x0D00,             // Range Minimum
>                     0x0FFF,             // Range Maximum
>                     0x0000,             // Translation Offset
>                     0x0300,             // Length
>                     ,, , TypeStatic, DenseTranslation)
>=20
> resource_size() will do 'res->end - res->start + 1;'
> So,
> 0xFFF-0xD00 =3D 0x2FF
> 0x2FF + 1 =3D 0x300 (which matches the length field)
>=20
> Example #2:
> DWordMemory (ResourceProducer, SubDecode, MinFixed, MaxFixed,
> NonCacheable, ReadWrite,
>                     0x00000000,         // Granularity
>                     0xFED45000,         // Range Minimum
>                     0xFED811FF,         // Range Maximum
>                     0x00000000,         // Translation Offset
>                     0x0003C200,         // Length
>                     ,, , AddressRangeMemory, TypeStatic)
>=20
> Here,
> 0xFED811FF - 0xFED45000 =3D 0x3C1FF
> 0x3C1FF + 1 =3D 0x3C200 (which again matches the length field)
>=20
> But the same resource_size() will not help in case of PMF _CRS
> ResourceTemplate(). Hence I had to make a custom change like doing "-1".
>=20
> So, in the current change proposed here, we can have two options:
>=20
> 1) just use:
> pmf_dev->policy_sz =3D pmf_dev->res->end - pmf_dev->res->start;

Since it doesn't seem to cover the entire resource, I think this option 1)=
=20
is better for now.

> 2) use resource_size() with -1 and leave a note on why "-1" is required
> pmf_dev->policy_sz =3D resource_size(pmf_dev->res) - 1;
>=20
> Let me know your thoughts.

--=20
 i.

--8323328-1862501406-1728980306=:1100--
