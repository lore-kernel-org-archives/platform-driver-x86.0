Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4FC4279792;
	Tue,  7 Apr 2026 12:16:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775564183; cv=none; b=A68/71b71rom15/BhcoiUzePdXJOrj+O9otSR9H/DxHo454DcRulKOzP9Dxm+hVBpXrlL1mVCrWs9kcALTl2rlF8Sey6NIm1oryNOUyNRMutCpfiJyEBGYP8xr5VkVKH1uXdrxW+qCaSQQFhsl9Ss/3W5hGBkGinDMGZqEzpVYY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775564183; c=relaxed/simple;
	bh=kzwUiIzKEYQ+jFOBU45ypDEwo6E7Gn7U0kBMrMYVJ+A=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=b7ImhX4ub39G0CesUu/xvEr1stKk3kttvTbzFmqOXGyUnDD5GTmtXYoUhvoyqMq7oi//CqVWmxwYMk0EGvkA+gQMzNPnoKY5ps4338wjp9h5+aUFiXqH4hEhawS70moCele5j3naHeaya8kKB7c41jmXz4Gb04fznEvGVWA1dUw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=cDN6+8Tl; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cDN6+8Tl"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1775564182; x=1807100182;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=kzwUiIzKEYQ+jFOBU45ypDEwo6E7Gn7U0kBMrMYVJ+A=;
  b=cDN6+8Tld80HhKOOA9i+BYPHyXTqMzB4yg6g5vvexpwWmfVFxDKUUiKi
   rFuzI9tSeXoTRAEyMgdJ7dl/F2dOW3EFELAjmVP29GrApEFfmYC8USq5J
   npUpYGGitIfmny/GdHg4RBOjJf9Rt8KJBnrDUwjWRpUXOz9FdqHsSAwCR
   f7maMWkfjibi8Uin2k2+rEJOADTKlQ5x5n5xys8d+Lpun0eobQTOJ7izj
   eTQYdAnU7DuAN8fJBEDoUY0CjrGUcXN3BseajUwz2MNu2HwDrwloM9em1
   bVWPe146LgdVVBRHZDSMG0t2gj/WFKMknxcex7JyQJ37EkzdACYnyCTYQ
   g==;
X-CSE-ConnectionGUID: HWe8ZQlrQSGvRAXOA6+YIQ==
X-CSE-MsgGUID: H4FMW+xrSDe0NPtI8fGbXg==
X-IronPort-AV: E=McAfee;i="6800,10657,11752"; a="87975569"
X-IronPort-AV: E=Sophos;i="6.23,165,1770624000"; 
   d="scan'208";a="87975569"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Apr 2026 05:16:21 -0700
X-CSE-ConnectionGUID: V0nmCttbTzSEMxVz3xhKkQ==
X-CSE-MsgGUID: TZxlm+JgRl+2xa2tjVR9pg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,165,1770624000"; 
   d="scan'208";a="227317288"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.110])
  by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Apr 2026 05:16:19 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Tue, 7 Apr 2026 15:16:14 +0300 (EEST)
To: "David E. Box" <david.e.box@linux.intel.com>
cc: irenic.rajneesh@gmail.com, srinivas.pandruvada@linux.intel.com, 
    xi.pardee@linux.intel.com, Hans de Goede <hansg@kernel.org>, 
    LKML <linux-kernel@vger.kernel.org>, platform-driver-x86@vger.kernel.org
Subject: Re: [PATCH V2 07/17] platform/x86/intel/pmc: Add PMC SSRAM Kconfig
 description
In-Reply-To: <20260325014819.1283566-8-david.e.box@linux.intel.com>
Message-ID: <3319ff60-39d2-2b4f-9b9d-4f0e1fbcb88b@linux.intel.com>
References: <20260325014819.1283566-1-david.e.box@linux.intel.com> <20260325014819.1283566-8-david.e.box@linux.intel.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323328-1708292767-1775564174=:983"

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323328-1708292767-1775564174=:983
Content-Type: text/plain; charset=ISO-8859-15
Content-Transfer-Encoding: QUOTED-PRINTABLE

On Tue, 24 Mar 2026, David E. Box wrote:

> Add a proper description for the intel_pmc_ssram driver.
>=20
> Signed-off-by: David E. Box <david.e.box@linux.intel.com>
> ---
>=20
> V2 - No changes
>=20
>  drivers/platform/x86/intel/pmc/Kconfig | 11 +++++++++++
>  1 file changed, 11 insertions(+)
>=20
> diff --git a/drivers/platform/x86/intel/pmc/Kconfig b/drivers/platform/x8=
6/intel/pmc/Kconfig
> index c6ef0bcf76af..0f19dc7edcf9 100644
> --- a/drivers/platform/x86/intel/pmc/Kconfig
> +++ b/drivers/platform/x86/intel/pmc/Kconfig
> @@ -28,3 +28,14 @@ config INTEL_PMC_CORE
> =20
>  config INTEL_PMC_SSRAM_TELEMETRY
>  =09tristate
> +=09help
> +=09  This PCI driver discovers PMC SSRAM telemetry regions through the
> +=09  PMC's MMIO interface and registers them with the Intel VSEC framewo=
rk
> +=09  as Intel PMT telemetry devices.
> +
> +=09  It probes the PMC SSRAM device, extracts DVSEC information from MMI=
O,
> +=09  reads device IDs and base addresses for multiple PMCs (main, IOE, P=
CH),
> +=09  and exposes the discovered telemetry through Intel PMT interfaces
> +=09  (including sysfs).
> +
> +=09  This option is selected by INTEL_PMC_CORE.
>=20

Reviewed-by: Ilpo J=E4rvinen <ilpo.jarvinen@linux.intel.com>


--=20
 i.

--8323328-1708292767-1775564174=:983--
