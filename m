Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7803A139CFC
	for <platform-driver-x86@vger.kernel.org>; Wed, 14 Aug 2024 11:00:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723633249; cv=none; b=gIl/HCN/5tGoMKEWMtRXktynE79g+Uk/6TM/hZiXsjGGlug9OQxk9GmCdMKFVXNIdPecxmWGZp/6LS/jUyYfY+9SB9J7OslcCmkZNoFam+57rRSzYkoNR3e0Ub511N6EwSXuhU3QfDSWeOwQNHpPu1jMSBBaOJNM0aM6C8l/s7U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723633249; c=relaxed/simple;
	bh=qYsPHt98x9coHBFPiap2uS15j3T3oZrgslUM85gor3s=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=bSramMVTdLwDSi5gdp4hDAYVzPKau/kRC6hwG3dmr9o42zEu2fAvV/sE7KQfmBawrXLC370vczdwoy0B9BJdPNXA5vxnBDL0c3sDY/orbveP0s6vmo9iy9DoN41qZO/Y6PuuXf6IWperve1YrB5tBMVizldkwHezcl3g3ONdpSQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=h9uga4lz; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="h9uga4lz"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1723633247; x=1755169247;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=qYsPHt98x9coHBFPiap2uS15j3T3oZrgslUM85gor3s=;
  b=h9uga4lzSw2avQaF9IMZe7xcZSnEfE7EAde0a+LnUpWnfC8YupFC4xqO
   zQWcqqjRw03YXFbxI0sjT1NXThthKZUwH1CyNKj/g5Ri70rpkGkDLzHIy
   G/2y3eMt38tCLw0GXxaE881KYKp7cYp6QWQlipkzAkdEI2z9g2Qjbm+h1
   ZQ2B2h90sF/yJGPYyDZezBsH4tJLmfSiYKfoDpRWimjzw59BxWt2OaHsq
   uH9wOKVcz3jT1u1LJVHhN8QSJbrnIGAGrBOKI08N4d/RXX7cF2n2Obq8A
   HScoTVI/p+so1lTvMA6G6x/8w7zm3revWOYQwZbTWcC+1OdJANU4gkDvV
   w==;
X-CSE-ConnectionGUID: 1nbzoz7YT921vN/05FfcKg==
X-CSE-MsgGUID: +Ss9DZWdTaCMVZCzvkK7Xg==
X-IronPort-AV: E=McAfee;i="6700,10204,11163"; a="33246917"
X-IronPort-AV: E=Sophos;i="6.09,145,1716274800"; 
   d="scan'208";a="33246917"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Aug 2024 04:00:46 -0700
X-CSE-ConnectionGUID: qoYS610oQ+Ks7+AipKihzw==
X-CSE-MsgGUID: 0HPDkN5DS5az3ojYb89Qqg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,145,1716274800"; 
   d="scan'208";a="59265608"
Received: from ijarvine-desk1.ger.corp.intel.com (HELO localhost) ([10.245.245.61])
  by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Aug 2024 04:00:44 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Wed, 14 Aug 2024 14:00:40 +0300 (EEST)
To: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
cc: hdegoede@redhat.com, ilpo.jarvinen@linux.intel.com, 
    platform-driver-x86@vger.kernel.org, Patil.Reddy@amd.com
Subject: Re: [PATCH v3 1/2] platform/x86/amd/pmf: Relocate CPU ID macros to
 the PMF header
In-Reply-To: <20240813133540.367384-1-Shyam-sundar.S-k@amd.com>
Message-ID: <b0b503f5-e257-064b-9695-a2a3d2ca62e0@linux.intel.com>
References: <20240813133540.367384-1-Shyam-sundar.S-k@amd.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323328-2100976987-1723633240=:1018"

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323328-2100976987-1723633240=:1018
Content-Type: text/plain; charset=ISO-8859-15
Content-Transfer-Encoding: QUOTED-PRINTABLE

On Tue, 13 Aug 2024, Shyam Sundar S K wrote:

> The CPU ID macros are needed by the Smart PC builder. Therefore, transfer
> the CPU ID macros from core.c to the common PMF header file.
>=20
> Co-developed-by: Patil Rajesh Reddy <Patil.Reddy@amd.com>
> Signed-off-by: Patil Rajesh Reddy <Patil.Reddy@amd.com>
> Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
> ---
> v3:
>  - No change
>=20
> v2:
>  - No change
>=20
>  drivers/platform/x86/amd/pmf/core.c | 6 ------
>  drivers/platform/x86/amd/pmf/pmf.h  | 6 ++++++
>  2 files changed, 6 insertions(+), 6 deletions(-)
>=20
> diff --git a/drivers/platform/x86/amd/pmf/core.c b/drivers/platform/x86/a=
md/pmf/core.c
> index 8f1f719befa3..88314b0277a3 100644
> --- a/drivers/platform/x86/amd/pmf/core.c
> +++ b/drivers/platform/x86/amd/pmf/core.c
> @@ -37,12 +37,6 @@
>  #define AMD_PMF_RESULT_CMD_UNKNOWN           0xFE
>  #define AMD_PMF_RESULT_FAILED                0xFF
> =20
> -/* List of supported CPU ids */
> -#define AMD_CPU_ID_RMB=09=09=090x14b5
> -#define AMD_CPU_ID_PS=09=09=090x14e8
> -#define PCI_DEVICE_ID_AMD_1AH_M20H_ROOT=090x1507
> -#define PCI_DEVICE_ID_AMD_1AH_M60H_ROOT=090x1122
> -
>  #define PMF_MSG_DELAY_MIN_US=09=0950
>  #define RESPONSE_REGISTER_LOOP_MAX=0920000
> =20
> diff --git a/drivers/platform/x86/amd/pmf/pmf.h b/drivers/platform/x86/am=
d/pmf/pmf.h
> index 9bf4326d06c3..9fc26f672f12 100644
> --- a/drivers/platform/x86/amd/pmf/pmf.h
> +++ b/drivers/platform/x86/amd/pmf/pmf.h
> @@ -19,6 +19,12 @@
>  #define POLICY_SIGN_COOKIE=09=090x31535024
>  #define POLICY_COOKIE_OFFSET=09=090x10
> =20
> +/* List of supported CPU ids */
> +#define AMD_CPU_ID_RMB                  0x14b5
> +#define AMD_CPU_ID_PS                   0x14e8
> +#define PCI_DEVICE_ID_AMD_1AH_M20H_ROOT 0x1507
> +#define PCI_DEVICE_ID_AMD_1AH_M60H_ROOT 0x1122
> +
>  struct cookie_header {
>  =09u32 sign;
>  =09u32 length;
>=20

Reviewed-by: Ilpo J=E4rvinen <ilpo.jarvinen@linux.intel.com>

--=20
 i.

--8323328-2100976987-1723633240=:1018--
