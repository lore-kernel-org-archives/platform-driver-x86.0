Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C11C0393DEB;
	Tue,  7 Apr 2026 13:18:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775567917; cv=none; b=XP1Kc41oultDMBdedoC65GZonRCWB46WDrQxtrFbM19zJiZq7aAmvcr70w/qpsBCap1CJ3rrUKelYSkTzcV86Asw1TULE/exBxRorKUYzQ/ZtQA9SPSk9ljXoW6LVsAA01NUBlKjFK10UmYDWZcEBjQjpeg0ZcreZljjtIQ5i+s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775567917; c=relaxed/simple;
	bh=fsrjDhL5iMKvmcs5p3yY7NxtbU4c/hcs+1vbuWqVzrQ=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=RSybBTOoT37AHqW+B6/3scG0T3xtzYlgCP0BdMEfJZGShls5+Gn52ckknM89v2x43IS6008XutF01DlMf91R9/rFj/afSUdaAA/vw9sh7AQVj0tuGDOAgHkGzSD3vVvxbI7i9J1NoiQFUa1e1wxfsmxlQCXcG8Op0u5Ize6Ikzg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=MPrxVEjG; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MPrxVEjG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1775567915; x=1807103915;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=fsrjDhL5iMKvmcs5p3yY7NxtbU4c/hcs+1vbuWqVzrQ=;
  b=MPrxVEjG3ipWcRrsHvXnRgkSIv5LbQj0cxepklqMcmVOp7iRjq0o6JXF
   owNz/KmNzPPIN/p+3Hnj5ZbzGHfnyb/YFv5Kx6LLg+NKfVQFZM2bDivKk
   DsfARqLOCxaiv99f4J19vxOli48g8hiwmfRnHZmH46bR0jjfe2nIpKb+o
   n6JAuk7g8ibIw1jkR3nvnR1zCebS2iu/1XXCQP+sTOUbW/upruuiGoXW1
   peqh2iKM57EFw3XgbL1jrz09PJFFVhr7x3QnHPezH3kD0K/wzizxVg/M7
   EMR2/Y1qvsQeSwGQMk0gArpi/17tevFNpC2Qm/UgrW1nwrtEQ2nl5e9VR
   A==;
X-CSE-ConnectionGUID: VXA0mag3TSWVLeUTwO8AQw==
X-CSE-MsgGUID: Tz2B0RMmSJisKk2IxYnKzg==
X-IronPort-AV: E=McAfee;i="6800,10657,11752"; a="76651778"
X-IronPort-AV: E=Sophos;i="6.23,165,1770624000"; 
   d="scan'208";a="76651778"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Apr 2026 06:18:35 -0700
X-CSE-ConnectionGUID: eogt3mnQTwewvmTKdOf68A==
X-CSE-MsgGUID: RsdZZsHyQsKginqz/DmG4g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,165,1770624000"; 
   d="scan'208";a="223379931"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.110])
  by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Apr 2026 06:18:32 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Tue, 7 Apr 2026 16:18:28 +0300 (EEST)
To: "David E. Box" <david.e.box@linux.intel.com>
cc: irenic.rajneesh@gmail.com, srinivas.pandruvada@linux.intel.com, 
    xi.pardee@linux.intel.com, Hans de Goede <hansg@kernel.org>, 
    LKML <linux-kernel@vger.kernel.org>, platform-driver-x86@vger.kernel.org
Subject: Re: [PATCH V2 11/17] platform/x86/intel/pmc/ssram: Refactor
 DEVID/PWRMBASE extraction into helper
In-Reply-To: <20260325014819.1283566-12-david.e.box@linux.intel.com>
Message-ID: <db315bd2-a070-75f8-5fb3-2213e676023c@linux.intel.com>
References: <20260325014819.1283566-1-david.e.box@linux.intel.com> <20260325014819.1283566-12-david.e.box@linux.intel.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323328-503127906-1775567908=:983"

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323328-503127906-1775567908=:983
Content-Type: text/plain; charset=ISO-8859-15
Content-Transfer-Encoding: QUOTED-PRINTABLE

On Tue, 24 Mar 2026, David E. Box wrote:

> Move DEVID/PWRMBASE extraction into pmc_ssram_get_devid_pwrmbase().
>=20
> This is a preparatory refactor to place functionality in a common helper
> for reuse by a subsequent patch. Additionally add missing bits.h
> include and define SSRAM_BASE_ADDR_MASK for the address extraction mask.
>=20
> Signed-off-by: David E. Box <david.e.box@linux.intel.com>
> ---
>=20
> V2 changes:
> - Added missing <linux/bits.h> include for GENMASK_ULL() used in get_base=
()
> - Defined SSRAM_BASE_ADDR_MASK macro to replace magic mask constant
>   GENMASK_ULL(63, 3)
>=20
>  .../platform/x86/intel/pmc/ssram_telemetry.c  | 33 ++++++++++++-------
>  1 file changed, 21 insertions(+), 12 deletions(-)
>=20
> diff --git a/drivers/platform/x86/intel/pmc/ssram_telemetry.c b/drivers/p=
latform/x86/intel/pmc/ssram_telemetry.c
> index 4bfe60ee55ca..779e84c724ac 100644
> --- a/drivers/platform/x86/intel/pmc/ssram_telemetry.c
> +++ b/drivers/platform/x86/intel/pmc/ssram_telemetry.c
> @@ -5,6 +5,7 @@
>   * Copyright (c) 2023, Intel Corporation.
>   */
> =20
> +#include <linux/bits.h>
>  #include <linux/cleanup.h>
>  #include <linux/intel_vsec.h>
>  #include <linux/pci.h>
> @@ -21,12 +22,30 @@
>  #define SSRAM_PCH_OFFSET=090x60
>  #define SSRAM_IOE_OFFSET=090x68
>  #define SSRAM_DEVID_OFFSET=090x70
> +#define SSRAM_BASE_ADDR_MASK=09GENMASK_ULL(63, 3)
> =20
>  DEFINE_FREE(pmc_ssram_telemetry_iounmap, void __iomem *, if (_T) iounmap=
(_T))
> =20
>  static struct pmc_ssram_telemetry pmc_ssram_telems[MAX_NUM_PMC];
>  static bool device_probed;
> =20
> +static inline u64 get_base(void __iomem *addr, u32 offset)
> +{
> +=09return lo_hi_readq(addr + offset) & SSRAM_BASE_ADDR_MASK;
> +}
> +
> +static void pmc_ssram_get_devid_pwrmbase(void __iomem *ssram, unsigned i=
nt pmc_idx)
> +{
> +=09u64 pwrm_base;
> +=09u16 devid;
> +
> +=09pwrm_base =3D get_base(ssram, SSRAM_PWRM_OFFSET);
> +=09devid =3D readw(ssram + SSRAM_DEVID_OFFSET);
> +
> +=09pmc_ssram_telems[pmc_idx].devid =3D devid;
> +=09pmc_ssram_telems[pmc_idx].base_addr =3D pwrm_base;
> +}
> +
>  static int
>  pmc_ssram_telemetry_add_pmt(struct pci_dev *pcidev, u64 ssram_base, void=
 __iomem *ssram)
>  {
> @@ -63,18 +82,12 @@ pmc_ssram_telemetry_add_pmt(struct pci_dev *pcidev, u=
64 ssram_base, void __iomem
>  =09return intel_vsec_register(&pcidev->dev, &info);
>  }
> =20
> -static inline u64 get_base(void __iomem *addr, u32 offset)
> -{
> -=09return lo_hi_readq(addr + offset) & GENMASK_ULL(63, 3);
> -}
> -
>  static int
>  pmc_ssram_telemetry_get_pmc(struct pci_dev *pcidev, unsigned int pmc_idx=
, u32 offset)
>  {
>  =09void __iomem __free(pmc_ssram_telemetry_iounmap) *tmp_ssram =3D NULL;
>  =09void __iomem __free(pmc_ssram_telemetry_iounmap) *ssram =3D NULL;
> -=09u64 ssram_base, pwrm_base;
> -=09u16 devid;
> +=09u64 ssram_base;
> =20
>  =09ssram_base =3D pci_resource_start(pcidev, 0);
>  =09tmp_ssram =3D ioremap(ssram_base, SSRAM_HDR_SIZE);
> @@ -99,11 +112,7 @@ pmc_ssram_telemetry_get_pmc(struct pci_dev *pcidev, u=
nsigned int pmc_idx, u32 of
>  =09=09ssram =3D no_free_ptr(tmp_ssram);
>  =09}
> =20
> -=09pwrm_base =3D get_base(ssram, SSRAM_PWRM_OFFSET);
> -=09devid =3D readw(ssram + SSRAM_DEVID_OFFSET);
> -
> -=09pmc_ssram_telems[pmc_idx].devid =3D devid;
> -=09pmc_ssram_telems[pmc_idx].base_addr =3D pwrm_base;
> +=09pmc_ssram_get_devid_pwrmbase(ssram, pmc_idx);
> =20
>  =09/* Find and register and PMC telemetry entries */
>  =09return pmc_ssram_telemetry_add_pmt(pcidev, ssram_base, ssram);
>=20

Reviewed-by: Ilpo J=E4rvinen <ilpo.jarvinen@linux.intel.com>

--=20
 i.

--8323328-503127906-1775567908=:983--
