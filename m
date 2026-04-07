Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A31053B637C;
	Tue,  7 Apr 2026 13:09:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775567342; cv=none; b=hT01UDmY/ooFhJzcTuuhy92F3WwiwI1GbE2EsDiuchtULO4J/Q2PDwFekuFa4nXLUpWBnMlJVZ65IN6Vd8BU11i/exnKLIb79wDxIeKnrzbh9XkwNKFjFCHY+WnJpJpEC33nc8dzlhabIAJ0frtjVRfWjE22x81XILeQOoFI2AA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775567342; c=relaxed/simple;
	bh=nnsFbXRCx+NeeOubUQh5zeoYotBCtEHEmT+9TZVDlNA=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=exhBrVkewBvlcMRsHVedb9hH1EV+RW1zR02mrwQkxOUql6/nyuBwWGhqzASNpL4jEj3LjWtn8hVNej44SFiG4lkm21wfose4haqetIjAvuaqicRR6PxZdrM9QlyXsk8S/Gr+vjcvA9e44ipxF4Oodm9OHj0eMNofG04z50e7cUU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dabi3V0/; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dabi3V0/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1775567341; x=1807103341;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=nnsFbXRCx+NeeOubUQh5zeoYotBCtEHEmT+9TZVDlNA=;
  b=dabi3V0/5UBL+JlTR1rLDykVEI1A9a/yHjojamRV5yZhRuyMWsuY1cH8
   oCPn8I3YJoVFxHz3DlGpaDv22Z97d/u1hwTx8gcgBOpPqo0NkvOnyn1Z/
   CQKVtKQooXGqBm6Ano7cZ0D+7BegZ4fFDME6b25ozkDh6feqSZ34GqAUV
   5WlYBZyucCNHMSXXx3Zv2w6CRL+xrJ+x8+4qjHTLogvvkS2Bqk6DO8qTi
   6RXLO1EkSzV+BWPC8uHiyrnrhPLDe86aksyN7iwE48LvL3HsJMD4YVTJV
   B8u43ijEDFQWFosO2Pk1TDeP19Feq54NxxXe9y8EfjPXnxfbGBmXl6nAM
   w==;
X-CSE-ConnectionGUID: npBGJpDGS8CZmVntJ0ESqQ==
X-CSE-MsgGUID: VtGUjqNvT0yHKTkySoO31Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11752"; a="75702391"
X-IronPort-AV: E=Sophos;i="6.23,165,1770624000"; 
   d="scan'208";a="75702391"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Apr 2026 06:09:00 -0700
X-CSE-ConnectionGUID: 8ZWuRXPPQ3aK9yh6e4l1CQ==
X-CSE-MsgGUID: BRe+LpyhQr6pLmVGo3rESw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,165,1770624000"; 
   d="scan'208";a="227165154"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.110])
  by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Apr 2026 06:08:57 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Tue, 7 Apr 2026 16:08:54 +0300 (EEST)
To: "David E. Box" <david.e.box@linux.intel.com>
cc: irenic.rajneesh@gmail.com, srinivas.pandruvada@linux.intel.com, 
    xi.pardee@linux.intel.com, Hans de Goede <hansg@kernel.org>, 
    LKML <linux-kernel@vger.kernel.org>, platform-driver-x86@vger.kernel.org
Subject: Re: [PATCH V2 10/17] platform/x86/intel/pmc/ssram: Use fixed-size
 static pmc array
In-Reply-To: <20260325014819.1283566-11-david.e.box@linux.intel.com>
Message-ID: <43801499-cf67-4606-4b48-10429dd0f76f@linux.intel.com>
References: <20260325014819.1283566-1-david.e.box@linux.intel.com> <20260325014819.1283566-11-david.e.box@linux.intel.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323328-384796759-1775567334=:983"

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323328-384796759-1775567334=:983
Content-Type: text/plain; charset=ISO-8859-15
Content-Transfer-Encoding: QUOTED-PRINTABLE

On Tue, 24 Mar 2026, David E. Box wrote:

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
> ---
>=20
> V2 changes:
> - Replaced hardcoded array size [3] with MAX_NUM_PMC constant
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

Reviewed-by: Ilpo J=E4rvinen <ilpo.jarvinen@linux.intel.com>

--=20
 i.

--8323328-384796759-1775567334=:983--
