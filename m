Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 936313911CE;
	Fri, 22 May 2026 10:37:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779446236; cv=none; b=oKodSHtHJ93MsNk9T2jxsSHfoCbK1PT49pACB5NB6KdsAkcxSxCZf8aQQ1EK5zbD66pyFE0rCpIv+lQhZfD9JM9RPjUFj/4+IwdJsGmnuplMaVcxD1snxwkbxu4rZ92Sq3UulqqYAldGfv2+5IT80cjV4epFz0CnwD0Z2Ca3aGE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779446236; c=relaxed/simple;
	bh=SSZEVcJjuYocPCEAdQdMJ+E7w4XrVSGVGKvHMkVkaFE=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=KJzlMMZLS7hGpUALh5aiReKjUo44jfJO2OHxqHf2idSFUhO4wZmpzCAqaOMdwsW6TNHOFbi/6YsqlQYqnVtLNNuao2obUbsVlNN2lIso2E5GxELy8QvNH/TY6xk9wQ0bU50/18Txcd1qPKJx3FPb1el0Tod3Vl825R/fX9mWaL8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ZjWggVfL; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZjWggVfL"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1779446235; x=1810982235;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=SSZEVcJjuYocPCEAdQdMJ+E7w4XrVSGVGKvHMkVkaFE=;
  b=ZjWggVfLo6hheIk/V7v9ZZ38uhyQMlbXL+3H9C4cU+mFcleFZSJbGuQE
   htzVm2V9LZz32g2jTvqEPOhKUy79I1jxfUlvnkhKSh11t+ROiFR+pF/DS
   6TX4TlbJWCED1cDZBNjCQKZWV6J3nJcn+33dtQmi6i3H8CWn+Cb/lah9W
   jqu6EEzgyO9Ml5xdrT4Nh4w1Z7xOfQsyBgCPbqyAZPPH2O424V2rMitqM
   X5kxv98O+Y82gUUaZb8ZEUKFvPqX486TQfRYvlx1ITnuKpctIQKb6QpBU
   P+7Ve2UzXPBmDk1vsiZ91pXKkDGYqhHJTWfOjz8nwlQ51ughGWcCFFbJM
   Q==;
X-CSE-ConnectionGUID: vM6he46fQiC7WhBCtMHQQQ==
X-CSE-MsgGUID: xNC1OIULQZ2JX/AUDkuLow==
X-IronPort-AV: E=McAfee;i="6800,10657,11793"; a="67899531"
X-IronPort-AV: E=Sophos;i="6.24,162,1774335600"; 
   d="scan'208";a="67899531"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 May 2026 03:37:14 -0700
X-CSE-ConnectionGUID: cVkcGKP8Rb2yZGBqynehWA==
X-CSE-MsgGUID: Utk2sKkuSy25xTi4VtFu2w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,162,1774335600"; 
   d="scan'208";a="240931190"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.16])
  by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 May 2026 03:37:11 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Fri, 22 May 2026 13:37:07 +0300 (EEST)
To: "David E. Box" <david.e.box@linux.intel.com>
cc: Rajneesh Bhardwaj <irenic.rajneesh@gmail.com>, 
    Hans de Goede <hansg@kernel.org>, Xi Pardee <xi.pardee@linux.intel.com>, 
    platform-driver-x86@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, 
    Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>
Subject: Re: [PATCH v5 10/16] platform/x86/intel/pmc/ssram: Use fixed-size
 static pmc array
In-Reply-To: <20260522022147.4137494-11-david.e.box@linux.intel.com>
Message-ID: <96195b96-23eb-da7c-1437-39ed9ca6a151@linux.intel.com>
References: <20260522022147.4137494-1-david.e.box@linux.intel.com> <20260522022147.4137494-11-david.e.box@linux.intel.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323328-621665549-1779446227=:1157"

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323328-621665549-1779446227=:1157
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE

On Thu, 21 May 2026, David E. Box wrote:

> From: Xi Pardee <xi.pardee@linux.intel.com>
>=20
> Switch pmc_ssram_telems from a devm-allocated pointer to a fixed-size
> static array, eliminating per-probe allocation overhead and simplifying
> lifetime management.
>=20
> Correspondingly simplify pmc_ssram_telemetry_get_pmc_info() validation to
> check devid availability and tighten input bounds checking. Drop
> null-pointer checks now that the storage is static.
>=20
> Signed-off-by: Xi Pardee <xi.pardee@linux.intel.com>
> Signed-off-by: David E. Box <david.e.box@linux.intel.com>
> Reviewed-by: Ilpo J=C3=A4rvinen <ilpo.jarvinen@linux.intel.com>
> ---

Sashiko has noted some corner case issues related probe/init paths and=20
missing cleanup which may have some merit, especially if this series makes=
=20
the issue worse (for patches 10-14 but all those seem to fundamendally=20
relate to same reprobe corner case and leaks of stale setups through=20
static vars).

It has some false positives too, such as not realizing smp_*mb() implies=20
a compiler barrier so those READ/WRITE_ONCE() requests look bogus to me.

--=20
 i.

> V5 - No changes
>=20
> V4 - No changes
>=20
> V3 - No changes
>=20
> V2 changes:
>   - Replaced hardcoded array size [3] with MAX_NUM_PMC constant
>=20
>  drivers/platform/x86/intel/pmc/ssram_telemetry.c | 10 ++--------
>  1 file changed, 2 insertions(+), 8 deletions(-)
>=20
> diff --git a/drivers/platform/x86/intel/pmc/ssram_telemetry.c b/drivers/p=
latform/x86/intel/pmc/ssram_telemetry.c
> index 1deb4d71da3f..4bfe60ee55ca 100644
> --- a/drivers/platform/x86/intel/pmc/ssram_telemetry.c
> +++ b/drivers/platform/x86/intel/pmc/ssram_telemetry.c
> @@ -24,7 +24,7 @@
> =20
>  DEFINE_FREE(pmc_ssram_telemetry_iounmap, void __iomem *, if (_T) iounmap=
(_T))
> =20
> -static struct pmc_ssram_telemetry *pmc_ssram_telems;
> +static struct pmc_ssram_telemetry pmc_ssram_telems[MAX_NUM_PMC];
>  static bool device_probed;
> =20
>  static int
> @@ -140,7 +140,7 @@ int pmc_ssram_telemetry_get_pmc_info(unsigned int pmc=
_idx,
>  =09if (pmc_idx >=3D MAX_NUM_PMC)
>  =09=09return -EINVAL;
> =20
> -=09if (!pmc_ssram_telems || !pmc_ssram_telems[pmc_idx].devid)
> +=09if (!pmc_ssram_telems[pmc_idx].devid)
>  =09=09return -ENODEV;
> =20
>  =09pmc_ssram_telemetry->devid =3D pmc_ssram_telems[pmc_idx].devid;
> @@ -153,12 +153,6 @@ static int pmc_ssram_telemetry_probe(struct pci_dev =
*pcidev, const struct pci_de
>  {
>  =09int ret;
> =20
> -=09pmc_ssram_telems =3D devm_kzalloc(&pcidev->dev, sizeof(*pmc_ssram_tel=
ems) * MAX_NUM_PMC,
> -=09=09=09=09=09GFP_KERNEL);
> -=09if (!pmc_ssram_telems) {
> -=09=09ret =3D -ENOMEM;
> -=09=09goto probe_finish;
> -=09}
> =20
>  =09ret =3D pcim_enable_device(pcidev);
>  =09if (ret) {
>=20
--8323328-621665549-1779446227=:1157--
