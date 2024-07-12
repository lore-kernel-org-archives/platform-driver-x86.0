Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1A4AAD52
	for <platform-driver-x86@vger.kernel.org>; Fri, 12 Jul 2024 08:31:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720773079; cv=none; b=OfC9On4CktTQKNNjHEwqxLs464+Zv3Fiojhr44Ek7odxqZeqUaL5GHexML5j4GGgUB1dEIpecCymvZrKhD9k6Z0X7R/IbBAAKZB/OPbWiloKJKkLEFlM4ZyFHFIwyRS09Vvk1eeW6WlUT+OEPjWKnp1PJcwTqHFwiPVbBTOkSMg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720773079; c=relaxed/simple;
	bh=H4YZlVo8ItBsN1L3RTAmq0NS4QrDI7+JS4fvngV4QPA=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=BJdr8uSsmfHyWwH6fi00xy/CRMYrhf3DRj7miisDCxIqB6LSMAIY7aj4IXYeKAvgdzHVo1X4I8FmOLv6ulpUfMXxQ1ln+VqRkLEbUyF4vU0Bo1Fvh0BmMvA9knKzkgU9cA36C5GUm9LgpUUcZ4josyFkgUCGPI1no+J/cl280rs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=OtTRWof4; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="OtTRWof4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1720773078; x=1752309078;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=H4YZlVo8ItBsN1L3RTAmq0NS4QrDI7+JS4fvngV4QPA=;
  b=OtTRWof4uLOqf/VA64RuizRojNgUW7CFwXiR60m+VaLrC9KktFaZ/mjZ
   S3mCq8D3Nb51ZlKDHw0TtocTEnrzhsxs//+e0nirzTx7NlwOp3cFlEjZR
   visk551hn8ogHmEIFOie0DX64uqkHNLTasgAeEwPxt5zaX3+ybwfscGLU
   ctPVVoNZRmzYTL21iZLZ0hnLbktfVXu2N6UEuTn/XHjWnvVEVr4u0n4zX
   ToQx4tQWc9WqTsalADmAgZ2Jb5xFGLTlv6Ya3FGQyoz02qnkcHHaEsCDq
   g+5WDSdWWDrRC4u61mBkqhF465Y3TRGlwwd60zTkmg0A512avv7a76FYR
   w==;
X-CSE-ConnectionGUID: VAhT35eWTSSJ/IfHHdRpTw==
X-CSE-MsgGUID: Zo76wLeQTuGPD7lfdNYbHg==
X-IronPort-AV: E=McAfee;i="6700,10204,11130"; a="35746783"
X-IronPort-AV: E=Sophos;i="6.09,202,1716274800"; 
   d="scan'208";a="35746783"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jul 2024 01:31:17 -0700
X-CSE-ConnectionGUID: qffckUchSAqOBqOvbS0vxg==
X-CSE-MsgGUID: cNIXOdweSk24KVHvTPx3Ow==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,202,1716274800"; 
   d="scan'208";a="53151132"
Received: from unknown (HELO localhost) ([10.245.247.129])
  by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jul 2024 01:31:15 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Fri, 12 Jul 2024 11:31:11 +0300 (EEST)
To: "Ruhl, Michael J" <michael.j.ruhl@intel.com>
cc: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>, 
    "platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>, 
    "david.e.box@linux.intel.com" <david.e.box@linux.intel.com>, 
    "Brost, Matthew" <matthew.brost@intel.com>
Subject: RE: [PATCH v6 5/6] platform/x86/intel/pmt: Add support for PMT base
 adjust
In-Reply-To: <IA1PR11MB64186499A6047EE3951BE8C4C1A52@IA1PR11MB6418.namprd11.prod.outlook.com>
Message-ID: <61965dbe-9ad4-edc0-e0f1-131916e1a9b2@linux.intel.com>
References: <20240710192249.3915396-1-michael.j.ruhl@intel.com> <20240710192249.3915396-6-michael.j.ruhl@intel.com> <b521ebe3-e7d2-6ca9-e626-ae9d3a455078@linux.intel.com> <IA1PR11MB64186499A6047EE3951BE8C4C1A52@IA1PR11MB6418.namprd11.prod.outlook.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323328-1723152562-1720773071=:1010"

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323328-1723152562-1720773071=:1010
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE

On Thu, 11 Jul 2024, Ruhl, Michael J wrote:
> >-----Original Message-----
> >From: Ilpo J=E4rvinen <ilpo.jarvinen@linux.intel.com>
> >Sent: Thursday, July 11, 2024 7:34 AM
> >To: Ruhl, Michael J <michael.j.ruhl@intel.com>
> >Cc: intel-xe@lists.freedesktop.org; platform-driver-x86@vger.kernel.org;
> >david.e.box@linux.intel.com; Brost, Matthew <matthew.brost@intel.com>
> >Subject: Re: [PATCH v6 5/6] platform/x86/intel/pmt: Add support for PMT
> >base adjust
> >
> >On Wed, 10 Jul 2024, Michael J. Ruhl wrote:
> >
> >> DVSEC offsets are based on the endpoint BAR.  If an endpoint is
> >> not avialable allow the offset information to be adjusted by the
> >
> >available
> >
> >> parent driver.
> >>
> >> Signed-off-by: Michael J. Ruhl <michael.j.ruhl@intel.com>
> >> ---
> >>  drivers/platform/x86/intel/pmt/class.h     | 1 +
> >>  drivers/platform/x86/intel/pmt/telemetry.c | 9 +++++++++
> >>  drivers/platform/x86/intel/vsec.c          | 1 +
> >>  include/linux/intel_vsec.h                 | 2 ++
> >>  4 files changed, 13 insertions(+)
> >>
> >> diff --git a/drivers/platform/x86/intel/pmt/class.h
> >b/drivers/platform/x86/intel/pmt/class.h
> >> index a267ac964423..984cd40ee814 100644
> >> --- a/drivers/platform/x86/intel/pmt/class.h
> >> +++ b/drivers/platform/x86/intel/pmt/class.h
> >> @@ -46,6 +46,7 @@ struct intel_pmt_entry {
> >>  =09void __iomem=09=09*base;
> >>  =09struct pmt_callbacks=09*cb;
> >>  =09unsigned long=09=09base_addr;
> >> +=09s32=09=09=09base_adjust;
> >>  =09size_t=09=09=09size;
> >>  =09u32=09=09=09guid;
> >>  =09int=09=09=09devid;
> >> diff --git a/drivers/platform/x86/intel/pmt/telemetry.c
> >b/drivers/platform/x86/intel/pmt/telemetry.c
> >> index c9feac859e57..5c44e500e8f6 100644
> >> --- a/drivers/platform/x86/intel/pmt/telemetry.c
> >> +++ b/drivers/platform/x86/intel/pmt/telemetry.c
> >> @@ -78,6 +78,13 @@ static int pmt_telem_header_decode(struct
> >intel_pmt_entry *entry,
> >>  =09header->access_type =3D TELEM_ACCESS(readl(disc_table));
> >>  =09header->guid =3D readl(disc_table + TELEM_GUID_OFFSET);
> >>  =09header->base_offset =3D readl(disc_table + TELEM_BASE_OFFSET);
> >> +=09if (entry->base_adjust) {
> >> +=09=09u32 new_base =3D header->base_offset + entry->base_adjust;
> >
> >The code setting ->base_adjust is responsible for avoiding stupid settin=
gs
> >that would lead to underflows and overflows?
>=20
> I would think so.  Since this driver is not aware of why the adjust is se=
t,
> it is not clear how it would validate it.
>=20
> Is this a request for documentation of the usage, or did you have a conce=
rn
> that we need to verify the value?

It's just that usually in-kernel interfaces too feature sanity checks but=
=20
perhaps you're right and the telemetry side just doesn't know enough to=20
even make a sanity check on the value. Let's just leave this as is for=20
now, it can be revisited later if there starts to be many usecases for=20
this.

--=20
 i.

--8323328-1723152562-1720773071=:1010--
