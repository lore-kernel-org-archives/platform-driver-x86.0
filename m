Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 065DD32E148;
	Thu, 20 Nov 2025 10:46:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763635571; cv=none; b=Af27RyGxt/24rRyE1rPb7Rb8qb7t3qZcVgrJ4zH/bx/GE+zJbzDgpxV8/z2Yg7FWMx+Xx1UQJyJ7bvpA8tQFDRN8MMjIhc9YmTvkF7Oad26Cp6nco5s/Cah4lrCo2FJAY8vQDALGtdFcdSDOTcTsEPKgpDpGH/QypuwH07dhA8Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763635571; c=relaxed/simple;
	bh=LRdUuawvRaJb163Me5CVW3LIamFPkAXDVm2wXRmlSq8=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=BQa6ojwqmqA9JidE+/Oh7KUvEwI8OHFtmr7zMEWZp5izyyRWCgUv6eretsMQsxXkbCF7E++vducWT5JbC4Cks5+maGnvpZ/+L8GlS52B0DIro8qf4WZDhn0V9evqH/kx9n5v9knjKwDFR/mVLFhcEYP6V1hkkI/qDidkxeEilDw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FcFHkLyS; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FcFHkLyS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1763635569; x=1795171569;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=LRdUuawvRaJb163Me5CVW3LIamFPkAXDVm2wXRmlSq8=;
  b=FcFHkLySkrhlPwpluk2by93mTT90o3V5nACotuUuQKLwYGKCMNFcGESU
   ZAzFHdu0n6n5C4ZkZlHWQqbs7uDVvGtVmf3k1MZ6nG2qlMFm5mLwCMxyR
   s3V9Dd0lkaSwWmdgBN5dPD86PhnkCD71LdlNpUN3cp5W8TdDKW9LhinPk
   LO+++FMC1ghT7Gvz7+sO6vDRsj70EftxzUL8podWGzu6+l6TlJhnIa6r4
   Q5smwA4qeJci8f8A4bBXt01FigfxcIG1Wl4WCnK5MwYJRGqRq8mWNt4aG
   unC3DrwQ+uT5k0Emjdn/pOg/LkauFPaNNisuvD5l80Fu50yU0ko2BZ302
   g==;
X-CSE-ConnectionGUID: 4889BZdGQT6lRmRCaAtEYg==
X-CSE-MsgGUID: h0q1niBNTKyCJ8e1xHN0lA==
X-IronPort-AV: E=McAfee;i="6800,10657,11618"; a="64706905"
X-IronPort-AV: E=Sophos;i="6.19,317,1754982000"; 
   d="scan'208";a="64706905"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Nov 2025 02:46:08 -0800
X-CSE-ConnectionGUID: Tr3wmsamQemogzS6I+nfgQ==
X-CSE-MsgGUID: twmv9XJ7SgytV8PPoW32Pg==
X-ExtLoop1: 1
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.161])
  by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Nov 2025 02:46:06 -0800
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Thu, 20 Nov 2025 12:46:02 +0200 (EET)
To: Werner Sembach <wse@tuxedocomputers.com>
cc: W_Armin@gmx.de, Hans de Goede <hansg@kernel.org>, 
    platform-driver-x86@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2 2/2] platform/x86/uniwill: Add TUXEDO devices
In-Reply-To: <20251118150839.55336-3-wse@tuxedocomputers.com>
Message-ID: <f8d4ec78-10f9-4534-1cb7-0e35212cac5d@linux.intel.com>
References: <20251118150839.55336-1-wse@tuxedocomputers.com> <20251118150839.55336-3-wse@tuxedocomputers.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323328-1747146664-1763635562=:5326"

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323328-1747146664-1763635562=:5326
Content-Type: text/plain; charset=ISO-8859-15
Content-Transfer-Encoding: QUOTED-PRINTABLE

On Tue, 18 Nov 2025, Werner Sembach wrote:

> Add all TUXEDO devices that can make use of this driver.
>=20
> Reviewed-by: Armin Wolf <W_Armin@gmx.de>
> Signed-off-by: Werner Sembach <wse@tuxedocomputers.com>

Reviewed-by: Ilpo J=E4rvinen <ilpo.jarvinen@linux.intel.com>

--=20
 i.

> ---
>  drivers/platform/x86/uniwill/uniwill-acpi.c | 308 ++++++++++++++++++++
>  1 file changed, 308 insertions(+)
>=20
> diff --git a/drivers/platform/x86/uniwill/uniwill-acpi.c b/drivers/platfo=
rm/x86/uniwill/uniwill-acpi.c
> index 4efb5a909f717..0cb86a701b2e1 100644
> --- a/drivers/platform/x86/uniwill/uniwill-acpi.c
> +++ b/drivers/platform/x86/uniwill/uniwill-acpi.c
> @@ -1495,6 +1495,20 @@ static struct platform_driver uniwill_driver =3D {
>  };
> =20
>  static const struct dmi_system_id uniwill_dmi_table[] __initconst =3D {
> +=09{
> +=09=09.ident =3D "XMG FUSION 15",
> +=09=09.matches =3D {
> +=09=09=09DMI_MATCH(DMI_SYS_VENDOR, "SchenkerTechnologiesGmbH"),
> +=09=09=09DMI_EXACT_MATCH(DMI_BOARD_NAME, "LAPQC71A"),
> +=09=09},
> +=09},
> +=09{
> +=09=09.ident =3D "XMG FUSION 15",
> +=09=09.matches =3D {
> +=09=09=09DMI_MATCH(DMI_SYS_VENDOR, "SchenkerTechnologiesGmbH"),
> +=09=09=09DMI_EXACT_MATCH(DMI_BOARD_NAME, "LAPQC71B"),
> +=09=09},
> +=09},
>  =09{
>  =09=09.ident =3D "Intel NUC x15",
>  =09=09.matches =3D {
> @@ -1520,6 +1534,300 @@ static const struct dmi_system_id uniwill_dmi_tab=
le[] __initconst =3D {
>  =09=09=09=09=09UNIWILL_FEATURE_BATTERY |
>  =09=09=09=09=09UNIWILL_FEATURE_HWMON),
>  =09},
> +=09{
> +=09=09.ident =3D "TUXEDO InfinityBook Pro 14 Gen6 Intel",
> +=09=09.matches =3D {
> +=09=09=09DMI_MATCH(DMI_SYS_VENDOR, "TUXEDO"),
> +=09=09=09DMI_EXACT_MATCH(DMI_BOARD_NAME, "PHxTxX1"),
> +=09=09},
> +=09},
> +=09{
> +=09=09.ident =3D "TUXEDO InfinityBook Pro 14 Gen6 Intel",
> +=09=09.matches =3D {
> +=09=09=09DMI_MATCH(DMI_SYS_VENDOR, "TUXEDO"),
> +=09=09=09DMI_EXACT_MATCH(DMI_BOARD_NAME, "PHxTQx1"),
> +=09=09},
> +=09},
> +=09{
> +=09=09.ident =3D "TUXEDO InfinityBook Pro 14/16 Gen7 Intel",
> +=09=09.matches =3D {
> +=09=09=09DMI_MATCH(DMI_SYS_VENDOR, "TUXEDO"),
> +=09=09=09DMI_EXACT_MATCH(DMI_BOARD_NAME, "PHxARX1_PHxAQF1"),
> +=09=09},
> +=09},
> +=09{
> +=09=09.ident =3D "TUXEDO InfinityBook Pro 16 Gen7 Intel/Commodore Omnia-=
Book Pro Gen 7",
> +=09=09.matches =3D {
> +=09=09=09DMI_MATCH(DMI_SYS_VENDOR, "TUXEDO"),
> +=09=09=09DMI_EXACT_MATCH(DMI_BOARD_NAME, "PH6AG01_PH6AQ71_PH6AQI1"),
> +=09=09},
> +=09},
> +=09{
> +=09=09.ident =3D "TUXEDO InfinityBook Pro 14/16 Gen8 Intel/Commodore Omn=
ia-Book Pro Gen 8",
> +=09=09.matches =3D {
> +=09=09=09DMI_MATCH(DMI_SYS_VENDOR, "TUXEDO"),
> +=09=09=09DMI_EXACT_MATCH(DMI_BOARD_NAME, "PH4PRX1_PH6PRX1"),
> +=09=09},
> +=09},
> +=09{
> +=09=09.ident =3D "TUXEDO InfinityBook Pro 14 Gen8 Intel/Commodore Omnia-=
Book Pro Gen 8",
> +=09=09.matches =3D {
> +=09=09=09DMI_MATCH(DMI_SYS_VENDOR, "TUXEDO"),
> +=09=09=09DMI_EXACT_MATCH(DMI_BOARD_NAME, "PH4PG31"),
> +=09=09},
> +=09},
> +=09{
> +=09=09.ident =3D "TUXEDO InfinityBook Pro 16 Gen8 Intel",
> +=09=09.matches =3D {
> +=09=09=09DMI_MATCH(DMI_SYS_VENDOR, "TUXEDO"),
> +=09=09=09DMI_EXACT_MATCH(DMI_BOARD_NAME, "PH6PG01_PH6PG71"),
> +=09=09},
> +=09},
> +=09{
> +=09=09.ident =3D "TUXEDO InfinityBook Pro 14/15 Gen9 AMD",
> +=09=09.matches =3D {
> +=09=09=09DMI_MATCH(DMI_SYS_VENDOR, "TUXEDO"),
> +=09=09=09DMI_EXACT_MATCH(DMI_BOARD_NAME, "GXxHRXx"),
> +=09=09},
> +=09},
> +=09{
> +=09=09.ident =3D "TUXEDO InfinityBook Pro 14/15 Gen9 Intel/Commodore Omn=
ia-Book 15 Gen9",
> +=09=09.matches =3D {
> +=09=09=09DMI_MATCH(DMI_SYS_VENDOR, "TUXEDO"),
> +=09=09=09DMI_EXACT_MATCH(DMI_BOARD_NAME, "GXxMRXx"),
> +=09=09},
> +=09},
> +=09{
> +=09=09.ident =3D "TUXEDO InfinityBook Pro 14/15 Gen10 AMD",
> +=09=09.matches =3D {
> +=09=09=09DMI_MATCH(DMI_SYS_VENDOR, "TUXEDO"),
> +=09=09=09DMI_EXACT_MATCH(DMI_BOARD_NAME, "XxHP4NAx"),
> +=09=09},
> +=09},
> +=09{
> +=09=09.ident =3D "TUXEDO InfinityBook Pro 14/15 Gen10 AMD",
> +=09=09.matches =3D {
> +=09=09=09DMI_MATCH(DMI_SYS_VENDOR, "TUXEDO"),
> +=09=09=09DMI_EXACT_MATCH(DMI_BOARD_NAME, "XxKK4NAx_XxSP4NAx"),
> +=09=09},
> +=09},
> +=09{
> +=09=09.ident =3D "TUXEDO InfinityBook Pro 15 Gen10 Intel",
> +=09=09.matches =3D {
> +=09=09=09DMI_MATCH(DMI_SYS_VENDOR, "TUXEDO"),
> +=09=09=09DMI_EXACT_MATCH(DMI_BOARD_NAME, "XxAR4NAx"),
> +=09=09},
> +=09},
> +=09{
> +=09=09.ident =3D "TUXEDO Polaris 15 Gen1 AMD",
> +=09=09.matches =3D {
> +=09=09=09DMI_MATCH(DMI_SYS_VENDOR, "TUXEDO"),
> +=09=09=09DMI_EXACT_MATCH(DMI_BOARD_NAME, "POLARIS1501A1650TI"),
> +=09=09},
> +=09},
> +=09{
> +=09=09.ident =3D "TUXEDO Polaris 15 Gen1 AMD",
> +=09=09.matches =3D {
> +=09=09=09DMI_MATCH(DMI_SYS_VENDOR, "TUXEDO"),
> +=09=09=09DMI_EXACT_MATCH(DMI_BOARD_NAME, "POLARIS1501A2060"),
> +=09=09},
> +=09},
> +=09{
> +=09=09.ident =3D "TUXEDO Polaris 17 Gen1 AMD",
> +=09=09.matches =3D {
> +=09=09=09DMI_MATCH(DMI_SYS_VENDOR, "TUXEDO"),
> +=09=09=09DMI_EXACT_MATCH(DMI_BOARD_NAME, "POLARIS1701A1650TI"),
> +=09=09},
> +=09},
> +=09{
> +=09=09.ident =3D "TUXEDO Polaris 17 Gen1 AMD",
> +=09=09.matches =3D {
> +=09=09=09DMI_MATCH(DMI_SYS_VENDOR, "TUXEDO"),
> +=09=09=09DMI_EXACT_MATCH(DMI_BOARD_NAME, "POLARIS1701A2060"),
> +=09=09},
> +=09},
> +=09{
> +=09=09.ident =3D "TUXEDO Polaris 15 Gen1 Intel",
> +=09=09.matches =3D {
> +=09=09=09DMI_MATCH(DMI_SYS_VENDOR, "TUXEDO"),
> +=09=09=09DMI_EXACT_MATCH(DMI_BOARD_NAME, "POLARIS1501I1650TI"),
> +=09=09},
> +=09},
> +=09{
> +=09=09.ident =3D "TUXEDO Polaris 15 Gen1 Intel",
> +=09=09.matches =3D {
> +=09=09=09DMI_MATCH(DMI_SYS_VENDOR, "TUXEDO"),
> +=09=09=09DMI_EXACT_MATCH(DMI_BOARD_NAME, "POLARIS1501I2060"),
> +=09=09},
> +=09},
> +=09{
> +=09=09.ident =3D "TUXEDO Polaris 17 Gen1 Intel",
> +=09=09.matches =3D {
> +=09=09=09DMI_MATCH(DMI_SYS_VENDOR, "TUXEDO"),
> +=09=09=09DMI_EXACT_MATCH(DMI_BOARD_NAME, "POLARIS1701I1650TI"),
> +=09=09},
> +=09},
> +=09{
> +=09=09.ident =3D "TUXEDO Polaris 17 Gen1 Intel",
> +=09=09.matches =3D {
> +=09=09=09DMI_MATCH(DMI_SYS_VENDOR, "TUXEDO"),
> +=09=09=09DMI_EXACT_MATCH(DMI_BOARD_NAME, "POLARIS1701I2060"),
> +=09=09},
> +=09},
> +=09{
> +=09=09.ident =3D "TUXEDO Trinity 15 Intel Gen1",
> +=09=09.matches =3D {
> +=09=09=09DMI_MATCH(DMI_SYS_VENDOR, "TUXEDO"),
> +=09=09=09DMI_EXACT_MATCH(DMI_BOARD_NAME, "TRINITY1501I"),
> +=09=09},
> +=09},
> +=09{
> +=09=09.ident =3D "TUXEDO Trinity 17 Intel Gen1",
> +=09=09.matches =3D {
> +=09=09=09DMI_MATCH(DMI_SYS_VENDOR, "TUXEDO"),
> +=09=09=09DMI_EXACT_MATCH(DMI_BOARD_NAME, "TRINITY1701I"),
> +=09=09},
> +=09},
> +=09{
> +=09=09.ident =3D "TUXEDO Polaris 15/17 Gen2 AMD",
> +=09=09.matches =3D {
> +=09=09=09DMI_MATCH(DMI_SYS_VENDOR, "TUXEDO"),
> +=09=09=09DMI_EXACT_MATCH(DMI_BOARD_NAME, "GMxMGxx"),
> +=09=09},
> +=09},
> +=09{
> +=09=09.ident =3D "TUXEDO Polaris 15/17 Gen2 Intel",
> +=09=09.matches =3D {
> +=09=09=09DMI_MATCH(DMI_SYS_VENDOR, "TUXEDO"),
> +=09=09=09DMI_EXACT_MATCH(DMI_BOARD_NAME, "GMxNGxx"),
> +=09=09},
> +=09},
> +=09{
> +=09=09.ident =3D "TUXEDO Stellaris/Polaris 15/17 Gen3 AMD",
> +=09=09.matches =3D {
> +=09=09=09DMI_MATCH(DMI_SYS_VENDOR, "TUXEDO"),
> +=09=09=09DMI_EXACT_MATCH(DMI_BOARD_NAME, "GMxZGxx"),
> +=09=09},
> +=09},
> +=09{
> +=09=09.ident =3D "TUXEDO Stellaris/Polaris 15/17 Gen3 Intel",
> +=09=09.matches =3D {
> +=09=09=09DMI_MATCH(DMI_SYS_VENDOR, "TUXEDO"),
> +=09=09=09DMI_EXACT_MATCH(DMI_BOARD_NAME, "GMxTGxx"),
> +=09=09},
> +=09},
> +=09{
> +=09=09.ident =3D "TUXEDO Stellaris/Polaris 15/17 Gen4 AMD",
> +=09=09.matches =3D {
> +=09=09=09DMI_MATCH(DMI_SYS_VENDOR, "TUXEDO"),
> +=09=09=09DMI_EXACT_MATCH(DMI_BOARD_NAME, "GMxRGxx"),
> +=09=09},
> +=09},
> +=09{
> +=09=09.ident =3D "TUXEDO Stellaris 15 Gen4 Intel",
> +=09=09.matches =3D {
> +=09=09=09DMI_MATCH(DMI_SYS_VENDOR, "TUXEDO"),
> +=09=09=09DMI_EXACT_MATCH(DMI_BOARD_NAME, "GMxAGxx"),
> +=09=09},
> +=09},
> +=09{
> +=09=09.ident =3D "TUXEDO Polaris 15/17 Gen5 AMD",
> +=09=09.matches =3D {
> +=09=09=09DMI_MATCH(DMI_SYS_VENDOR, "TUXEDO"),
> +=09=09=09DMI_EXACT_MATCH(DMI_BOARD_NAME, "GMxXGxx"),
> +=09=09},
> +=09},
> +=09{
> +=09=09.ident =3D "TUXEDO Stellaris 16 Gen5 AMD",
> +=09=09.matches =3D {
> +=09=09=09DMI_MATCH(DMI_SYS_VENDOR, "TUXEDO"),
> +=09=09=09DMI_EXACT_MATCH(DMI_BOARD_NAME, "GM6XGxX"),
> +=09=09},
> +=09},
> +=09{
> +=09=09.ident =3D "TUXEDO Stellaris 16/17 Gen5 Intel/Commodore ORION Gen =
5",
> +=09=09.matches =3D {
> +=09=09=09DMI_MATCH(DMI_SYS_VENDOR, "TUXEDO"),
> +=09=09=09DMI_EXACT_MATCH(DMI_BOARD_NAME, "GMxPXxx"),
> +=09=09},
> +=09},
> +=09{
> +=09=09.ident =3D "TUXEDO Stellaris Slim 15 Gen6 AMD",
> +=09=09.matches =3D {
> +=09=09=09DMI_MATCH(DMI_SYS_VENDOR, "TUXEDO"),
> +=09=09=09DMI_EXACT_MATCH(DMI_BOARD_NAME, "GMxHGxx"),
> +=09=09},
> +=09},
> +=09{
> +=09=09.ident =3D "TUXEDO Stellaris Slim 15 Gen6 Intel/Commodore ORION Sl=
im 15 Gen6",
> +=09=09.matches =3D {
> +=09=09=09DMI_MATCH(DMI_SYS_VENDOR, "TUXEDO"),
> +=09=09=09DMI_EXACT_MATCH(DMI_BOARD_NAME, "GM5IXxA"),
> +=09=09},
> +=09},
> +=09{
> +=09=09.ident =3D "TUXEDO Stellaris 16 Gen6 Intel/Commodore ORION 16 Gen6=
",
> +=09=09.matches =3D {
> +=09=09=09DMI_MATCH(DMI_SYS_VENDOR, "TUXEDO"),
> +=09=09=09DMI_EXACT_MATCH(DMI_BOARD_NAME, "GM6IXxB_MB1"),
> +=09=09},
> +=09},
> +=09{
> +=09=09.ident =3D "TUXEDO Stellaris 16 Gen6 Intel/Commodore ORION 16 Gen6=
",
> +=09=09.matches =3D {
> +=09=09=09DMI_MATCH(DMI_SYS_VENDOR, "TUXEDO"),
> +=09=09=09DMI_EXACT_MATCH(DMI_BOARD_NAME, "GM6IXxB_MB2"),
> +=09=09},
> +=09},
> +=09{
> +=09=09.ident =3D "TUXEDO Stellaris 17 Gen6 Intel/Commodore ORION 17 Gen6=
",
> +=09=09.matches =3D {
> +=09=09=09DMI_MATCH(DMI_SYS_VENDOR, "TUXEDO"),
> +=09=09=09DMI_EXACT_MATCH(DMI_BOARD_NAME, "GM7IXxN"),
> +=09=09},
> +=09},
> +=09{
> +=09=09.ident =3D "TUXEDO Stellaris 16 Gen7 AMD",
> +=09=09.matches =3D {
> +=09=09=09DMI_MATCH(DMI_SYS_VENDOR, "TUXEDO"),
> +=09=09=09DMI_EXACT_MATCH(DMI_BOARD_NAME, "X6FR5xxY"),
> +=09=09},
> +=09},
> +=09{
> +=09=09.ident =3D "TUXEDO Stellaris 16 Gen7 Intel",
> +=09=09.matches =3D {
> +=09=09=09DMI_MATCH(DMI_SYS_VENDOR, "TUXEDO"),
> +=09=09=09DMI_EXACT_MATCH(DMI_BOARD_NAME, "X6AR5xxY"),
> +=09=09},
> +=09},
> +=09{
> +=09=09.ident =3D "TUXEDO Stellaris 16 Gen7 Intel",
> +=09=09.matches =3D {
> +=09=09=09DMI_MATCH(DMI_SYS_VENDOR, "TUXEDO"),
> +=09=09=09DMI_EXACT_MATCH(DMI_BOARD_NAME, "X6AR5xxY_mLED"),
> +=09=09},
> +=09},
> +=09{
> +=09=09.ident =3D "TUXEDO Pulse 14 Gen1 AMD",
> +=09=09.matches =3D {
> +=09=09=09DMI_MATCH(DMI_SYS_VENDOR, "TUXEDO"),
> +=09=09=09DMI_EXACT_MATCH(DMI_BOARD_NAME, "PULSE1401"),
> +=09=09},
> +=09},
> +=09{
> +=09=09.ident =3D "TUXEDO Pulse 15 Gen1 AMD",
> +=09=09.matches =3D {
> +=09=09=09DMI_MATCH(DMI_SYS_VENDOR, "TUXEDO"),
> +=09=09=09DMI_EXACT_MATCH(DMI_BOARD_NAME, "PULSE1501"),
> +=09=09},
> +=09},
> +=09{
> +=09=09.ident =3D "TUXEDO Pulse 15 Gen2 AMD",
> +=09=09.matches =3D {
> +=09=09=09DMI_MATCH(DMI_SYS_VENDOR, "TUXEDO"),
> +=09=09=09DMI_EXACT_MATCH(DMI_BOARD_NAME, "PF5LUXG"),
> +=09=09},
> +=09},
>  =09{ }
>  };
>  MODULE_DEVICE_TABLE(dmi, uniwill_dmi_table);
>=20
--8323328-1747146664-1763635562=:5326--
