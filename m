Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2B9D2A8FE
	for <platform-driver-x86@vger.kernel.org>; Thu, 18 Jul 2024 15:03:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721315029; cv=none; b=kyxd9e63NNYK7spKivhmTwIJ4MU3mRR8BAxU142zEXqKE8/j0oJb+S48/vNQafWoHoGEVpY/O7l3brHfbyDrtmqZzg7NNPeCPmLq9Yy5+H4Kqc9Mat3B18KJKC/GZZ3Mhco5TjJb40i97K+Z/toJuqoLyYoAUY54mYdxV2LeDj4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721315029; c=relaxed/simple;
	bh=OsFbb5qAFaq0j2BLRUvkYCPDhHoPBHIacrSLrDciKWw=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=nVnL9c3VTgaoGSQNS4NhYdOrNh+l7B/Q08VAyAbKxaze5MO+vv/Gi+fWzHKSszf6U+vwy9Ox9fGO46J5heRHKXShDZaYO0JI9lYHQDF8YSo3XGDT8M5gQ/vk4k4pfv7f+GcP7wJoKeb3muqUMYz6z+iDHf1SF+elet/Qj6hjlnY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=WjMh0PIH; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WjMh0PIH"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1721315027; x=1752851027;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=OsFbb5qAFaq0j2BLRUvkYCPDhHoPBHIacrSLrDciKWw=;
  b=WjMh0PIH60G3/d1XDpmo7OmQrxMyXWydpNx1GBrW+UBsdMZo38WSli70
   LhoarsvW73aEG5np9T4xLJL5IJvb+iRGcCcc7oUdGG3rSOVHwo3oXpbLj
   Ob4aKYwN9Xp+jSuEeUMuQoFpORrxXQ7rHrvLsrD/VBewiYTxJ36F3UCUC
   084ddlrQKN8n6dzKsC9bsYXUBBPV2NEQ407FiP7BdmO67ANnfeaj/iek4
   hzj+mXkFvjFnD5nUVoRGRJVwWlXGAoZZ0lzORvPxLfSVyrAs90TZ12Rfn
   F56miqi46tUrmDR8TdPi2lC7lHaoZ9ZZXT3M6pt68gyFlWCV7tWvdBxC4
   A==;
X-CSE-ConnectionGUID: hKD5fkjNRsyusNIKU/UjCg==
X-CSE-MsgGUID: UfxzzBpnR1uJ95rSGdKrdA==
X-IronPort-AV: E=McAfee;i="6700,10204,11137"; a="44304908"
X-IronPort-AV: E=Sophos;i="6.09,218,1716274800"; 
   d="scan'208";a="44304908"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Jul 2024 08:03:31 -0700
X-CSE-ConnectionGUID: ksRXK2fhQneXolssfy4uiA==
X-CSE-MsgGUID: T//9/le6T129/GsGxUQAjQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,218,1716274800"; 
   d="scan'208";a="50858873"
Received: from ijarvine-desk1.ger.corp.intel.com (HELO localhost) ([10.245.247.144])
  by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Jul 2024 08:03:30 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Thu, 18 Jul 2024 18:03:27 +0300 (EEST)
To: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
cc: Hans de Goede <hdegoede@redhat.com>, Sanket.Goswami@amd.com, 
    platform-driver-x86@vger.kernel.org
Subject: Re: [PATCH v1] platform/x86/amd/pmc: Send OS_HINT command for new
 AMD platform
In-Reply-To: <20240718150119.3427190-1-Shyam-sundar.S-k@amd.com>
Message-ID: <80e7091e-443f-6c2d-bbd8-4831eef1bfc9@linux.intel.com>
References: <20240718150119.3427190-1-Shyam-sundar.S-k@amd.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323328-1958994358-1721315007=:1055"

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323328-1958994358-1721315007=:1055
Content-Type: text/plain; charset=ISO-8859-15
Content-Transfer-Encoding: QUOTED-PRINTABLE

On Thu, 18 Jul 2024, Shyam Sundar S K wrote:

> To initiate the HW deep state transistion the OS_HINT command has to be
> sent to the PMFW. Add this support to the platforms that belong to family
> 1Ah model 60h series.
>=20
> Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>

Reviewed-by: Ilpo J=E4rvinen <ilpo.jarvinen@linux.intel.com>

--=20
 i.


> ---
>  drivers/platform/x86/amd/pmc/pmc.c | 2 ++
>  drivers/platform/x86/amd/pmc/pmc.h | 1 +
>  2 files changed, 3 insertions(+)
>=20
> diff --git a/drivers/platform/x86/amd/pmc/pmc.c b/drivers/platform/x86/am=
d/pmc/pmc.c
> index a3d881f6e5d9..c3e51f0a5c33 100644
> --- a/drivers/platform/x86/amd/pmc/pmc.c
> +++ b/drivers/platform/x86/amd/pmc/pmc.c
> @@ -764,6 +764,7 @@ static int amd_pmc_get_os_hint(struct amd_pmc_dev *de=
v)
>  =09case AMD_CPU_ID_CB:
>  =09case AMD_CPU_ID_PS:
>  =09case PCI_DEVICE_ID_AMD_1AH_M20H_ROOT:
> +=09case PCI_DEVICE_ID_AMD_1AH_M60H_ROOT:
>  =09=09return MSG_OS_HINT_RN;
>  =09}
>  =09return -EINVAL;
> @@ -967,6 +968,7 @@ static const struct pci_device_id pmc_pci_ids[] =3D {
>  =09{ PCI_DEVICE(PCI_VENDOR_ID_AMD, AMD_CPU_ID_RV) },
>  =09{ PCI_DEVICE(PCI_VENDOR_ID_AMD, AMD_CPU_ID_SP) },
>  =09{ PCI_DEVICE(PCI_VENDOR_ID_AMD, PCI_DEVICE_ID_AMD_1AH_M20H_ROOT) },
> +=09{ PCI_DEVICE(PCI_VENDOR_ID_AMD, PCI_DEVICE_ID_AMD_1AH_M60H_ROOT) },
>  =09{ }
>  };
> =20
> diff --git a/drivers/platform/x86/amd/pmc/pmc.h b/drivers/platform/x86/am=
d/pmc/pmc.h
> index 9e32d3128c3a..f1166d15c856 100644
> --- a/drivers/platform/x86/amd/pmc/pmc.h
> +++ b/drivers/platform/x86/amd/pmc/pmc.h
> @@ -67,6 +67,7 @@ void amd_mp2_stb_deinit(struct amd_pmc_dev *dev);
>  #define AMD_CPU_ID_PS=09=09=090x14E8
>  #define AMD_CPU_ID_SP=09=09=090x14A4
>  #define PCI_DEVICE_ID_AMD_1AH_M20H_ROOT 0x1507
> +#define PCI_DEVICE_ID_AMD_1AH_M60H_ROOT 0x1122
>  #define PCI_DEVICE_ID_AMD_MP2_STB=090x172c
> =20
>  #endif /* PMC_H */
>=20
--8323328-1958994358-1721315007=:1055--
