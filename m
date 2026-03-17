Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 691F830E0E7;
	Tue, 17 Mar 2026 16:26:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773764803; cv=none; b=V7PnbJUxS3lbvSlJ+FB8yV0GUYjLEikv8XpovfROWKaganlwIKZ8DUM0pCvV6GTzyGjk5ICqLx2aasqec8NCuSmXKlO6M1LP9azmTJhyrhODtoTtYOVimxOVSl5tm/hgugWC0rK44KYvUrMAHx3hCkEPJriEQF3vcTED93Y87GQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773764803; c=relaxed/simple;
	bh=EgXDQ2U1UAUzIypGSiaRe3dom76HCtVViUkEQ9c/JFg=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=UK/Dvtpg+x9KUVtCJRpvoM37rZw0itTlvmRvEIOWq/P/KiYXT5Z0/epVcAd2JccMjd9iLFOreGPCJj4gAbiPpZEa7c+ICYkJYmTGG2nZfuCfi8rNH9NpkBWPO6B5BICV5AQBT9046djRtZKpIiQ5yCiGM+H5qFf4Qdk604H9q20=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gQWiqiDG; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gQWiqiDG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1773764802; x=1805300802;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=EgXDQ2U1UAUzIypGSiaRe3dom76HCtVViUkEQ9c/JFg=;
  b=gQWiqiDGtAx3zS7M8PGOryv12+3ro259RRqyPVbWkMAAUeU8c9xUZNMQ
   jdlAE2L9y1DecvrqYd/ZkqkDexGKo1BY77rcKEYp9ClrxAipvCzK5JJVD
   YhIpBjbwFXGT7C53Jd0RKs640enhTIwLqFgGJav7eYFK0u1gmEVP513q4
   esnz5kRsLwqKkXcGTkBxFxfWONbo4al0tK4T5Ke8Bvn4RVvnrI0QUzFdM
   AL2qV0IE1MhpG50I6ICbVqdn0xCOg0Dyb7f5lYTGkY8WQaAwa+xPOInNm
   OPWRybTSHjASvrZhYqjs5EO/LwxjoHQm00Q4qBdoLFEevxZHGs9hXs7t3
   g==;
X-CSE-ConnectionGUID: +oILM1KbTiSUxqnsr3OFmw==
X-CSE-MsgGUID: rhrDNGoiTGexUa1V1snZHg==
X-IronPort-AV: E=McAfee;i="6800,10657,11732"; a="74718071"
X-IronPort-AV: E=Sophos;i="6.23,126,1770624000"; 
   d="scan'208";a="74718071"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Mar 2026 09:26:41 -0700
X-CSE-ConnectionGUID: yMljdHXJTUOA6BxQ3OBu5Q==
X-CSE-MsgGUID: VcIAzr1iS6ygQvve7csstw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,126,1770624000"; 
   d="scan'208";a="226456013"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.161])
  by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Mar 2026 09:26:37 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Tue, 17 Mar 2026 18:26:34 +0200 (EET)
To: "David E. Box" <david.e.box@linux.intel.com>
cc: thomas.hellstrom@linux.intel.com, rodrigo.vivi@intel.com, 
    irenic.rajneesh@gmail.com, srinivas.pandruvada@linux.intel.com, 
    intel-xe@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
    xi.pardee@linux.intel.com, Hans de Goede <hansg@kernel.org>, 
    LKML <linux-kernel@vger.kernel.org>, platform-driver-x86@vger.kernel.org
Subject: Re: [PATCH 15/22] platform/x86/intel/pmc/ssram: Rename probe and
 PCI ID table for consistency
In-Reply-To: <20260313015202.3660072-16-david.e.box@linux.intel.com>
Message-ID: <f2b9e7e2-336c-99d6-7342-c55df2530e58@linux.intel.com>
References: <20260313015202.3660072-1-david.e.box@linux.intel.com> <20260313015202.3660072-16-david.e.box@linux.intel.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323328-565571473-1773764794=:968"

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323328-565571473-1773764794=:968
Content-Type: text/plain; charset=ISO-8859-15
Content-Transfer-Encoding: QUOTED-PRINTABLE

On Thu, 12 Mar 2026, David E. Box wrote:

> Rename intel_pmc_ssram_telemetry_probe() to pmc_ssram_telemetry_probe() a=
nd
> intel_pmc_ssram_telemetry_pci_ids[] to pmc_ssram_telemetry_pci_ids[],
> updating the MODULE_DEVICE_TABLE() and pci_driver wiring accordingly.
>=20
> This aligns the symbol names with the driver filename and module name,
> reduces redundant intel_ prefixes, and improves readability. No functiona=
l
> behavior changes are intended.
>=20
> Signed-off-by: David E. Box <david.e.box@linux.intel.com>
> ---
>  drivers/platform/x86/intel/pmc/ssram_telemetry.c | 14 +++++++-------
>  1 file changed, 7 insertions(+), 7 deletions(-)
>=20
> diff --git a/drivers/platform/x86/intel/pmc/ssram_telemetry.c b/drivers/p=
latform/x86/intel/pmc/ssram_telemetry.c
> index 6f6e83e70fc5..1deb4d71da3f 100644
> --- a/drivers/platform/x86/intel/pmc/ssram_telemetry.c
> +++ b/drivers/platform/x86/intel/pmc/ssram_telemetry.c
> @@ -149,7 +149,7 @@ int pmc_ssram_telemetry_get_pmc_info(unsigned int pmc=
_idx,
>  }
>  EXPORT_SYMBOL_GPL(pmc_ssram_telemetry_get_pmc_info);
> =20
> -static int intel_pmc_ssram_telemetry_probe(struct pci_dev *pcidev, const=
 struct pci_device_id *id)
> +static int pmc_ssram_telemetry_probe(struct pci_dev *pcidev, const struc=
t pci_device_id *id)
>  {
>  =09int ret;
> =20
> @@ -183,7 +183,7 @@ static int intel_pmc_ssram_telemetry_probe(struct pci=
_dev *pcidev, const struct
>  =09return ret;
>  }
> =20
> -static const struct pci_device_id intel_pmc_ssram_telemetry_pci_ids[] =
=3D {
> +static const struct pci_device_id pmc_ssram_telemetry_pci_ids[] =3D {
>  =09{ PCI_DEVICE(PCI_VENDOR_ID_INTEL, PMC_DEVID_MTL_SOCM) },
>  =09{ PCI_DEVICE(PCI_VENDOR_ID_INTEL, PMC_DEVID_ARL_SOCS) },
>  =09{ PCI_DEVICE(PCI_VENDOR_ID_INTEL, PMC_DEVID_ARL_SOCM) },
> @@ -193,14 +193,14 @@ static const struct pci_device_id intel_pmc_ssram_t=
elemetry_pci_ids[] =3D {
>  =09{ PCI_DEVICE(PCI_VENDOR_ID_INTEL, PMC_DEVID_WCL_PCDN) },
>  =09{ }
>  };
> -MODULE_DEVICE_TABLE(pci, intel_pmc_ssram_telemetry_pci_ids);
> +MODULE_DEVICE_TABLE(pci, pmc_ssram_telemetry_pci_ids);
> =20
> -static struct pci_driver intel_pmc_ssram_telemetry_driver =3D {
> +static struct pci_driver pmc_ssram_telemetry_driver =3D {
>  =09.name =3D "intel_pmc_ssram_telemetry",
> -=09.id_table =3D intel_pmc_ssram_telemetry_pci_ids,
> -=09.probe =3D intel_pmc_ssram_telemetry_probe,
> +=09.id_table =3D pmc_ssram_telemetry_pci_ids,
> +=09.probe =3D pmc_ssram_telemetry_probe,
>  };
> -module_pci_driver(intel_pmc_ssram_telemetry_driver);
> +module_pci_driver(pmc_ssram_telemetry_driver);
> =20
>  MODULE_IMPORT_NS("INTEL_VSEC");
>  MODULE_AUTHOR("Xi Pardee <xi.pardee@intel.com>");
>=20

Reviewed-by: Ilpo J=E4rvinen <ilpo.jarvinen@linux.intel.com>

--=20
 i.

--8323328-565571473-1773764794=:968--
