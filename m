Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9BFB51C3E
	for <platform-driver-x86@vger.kernel.org>; Wed,  7 Aug 2024 11:33:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723030414; cv=none; b=U2PUXaWdgSYzU10fJai/9//5iMbXO3ifzMvZPjVaERi71Mu+GJ/A1QZ3WeNO6ST1ectPGthJhHg2vIwe0AbGwdDkDM84iAOIMEB+5StJ3o24fynKxa/X8Sh3vfiJUgvHklpEjZHa0X+MQwl29JFZaClqGQunXcZEUwkEWoNn36I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723030414; c=relaxed/simple;
	bh=5sKibSd6MovknEkcTEh6ENTa0lp+So7bMEt2FOJO1Kw=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=KeGtIGyYZt4XoAgLHipBFhupxWdsrQ0sq03DX16INzL2f+ZdrwAJEtOvVdooHvlK8RY8VDsvhrbGI99Zvx2ZW9j7PCpQ5zwvU/kAz2OUGlwdiGaX00HQFAKc5jdPa5FkYnPN3Psf9rMpnI6XBBcjFWY6MYB5PNhS5K3KCFHDZJ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lfOn/sJi; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lfOn/sJi"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1723030413; x=1754566413;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=5sKibSd6MovknEkcTEh6ENTa0lp+So7bMEt2FOJO1Kw=;
  b=lfOn/sJiTZkBRfprk1oCsRfnvnbJ7MvB9g6nUWaQB0VQeNxMXaz93lam
   5B7vTtWrMMplYCzEDm5G36QaqWg3x8cRiPo2aPP8vMznmLHpqAJrYSILP
   e0kHaAuBmQH0oWfQC0AYrEVSJ8sBiem4y8IeQ1JJ6JQW8Mlia14FWf6W1
   XXDhOG1gkF9bBW4TJ+Hx6tXVM6O3BRDJVaPp/yjtLZSZae07d0Dt9S2di
   6d8Op5yiwiy4WeGFRt8ATrlKGJNt/D6mzCe5qsuLL9LguIp/W+SmlqzzQ
   WvLgTbTOhiQEDY7ybB7mZ/NB/BuRv8/2oSL4x8HU8YiijctNB7RUdCEWS
   w==;
X-CSE-ConnectionGUID: qhl1dzlEQlWTjhMeCJxMdw==
X-CSE-MsgGUID: /rFigguLThOwxvGjoRWOcQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11156"; a="32495500"
X-IronPort-AV: E=Sophos;i="6.09,269,1716274800"; 
   d="scan'208";a="32495500"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Aug 2024 04:33:31 -0700
X-CSE-ConnectionGUID: S5SHgqg1TSiXqNuaOJ82ow==
X-CSE-MsgGUID: /QfkBlNbRzuhpV6PUCArFw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,269,1716274800"; 
   d="scan'208";a="56493243"
Received: from ijarvine-desk1.ger.corp.intel.com (HELO localhost) ([10.245.244.202])
  by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Aug 2024 04:33:29 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Wed, 7 Aug 2024 14:33:24 +0300 (EEST)
To: Suma Hegde <suma.hegde@amd.com>
cc: platform-driver-x86@vger.kernel.org, Hans de Goede <hdegoede@redhat.com>, 
    Naveen Krishna Chatradhi <naveenkrishna.chatradhi@amd.com>
Subject: Re: [v3 01/11] platform/x86/amd/hsmp: Create hsmp/ directory
In-Reply-To: <20240720174552.946255-1-suma.hegde@amd.com>
Message-ID: <ab50731e-69f2-32fd-89cd-fb6274c4e006@linux.intel.com>
References: <20240720174552.946255-1-suma.hegde@amd.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323328-824459486-1723030404=:1138"

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323328-824459486-1723030404=:1138
Content-Type: text/plain; charset=ISO-8859-15
Content-Transfer-Encoding: QUOTED-PRINTABLE

On Sat, 20 Jul 2024, Suma Hegde wrote:

> This is in preparation to splitting ACPI and platform device drivers.
> Create and move hsmp specific code into its own directory,
> no logical changes.
>=20
> Signed-off-by: Suma Hegde <suma.hegde@amd.com>
> Reviewed-by: Naveen Krishna Chatradhi <naveenkrishna.chatradhi@amd.com>

Reviewed-by: Ilpo J=E4rvinen <ilpo.jarvinen@linux.intel.com>

--=20
 i.

> ---
> Changes since v2:
> None
> Changes since v1:
> None
>=20
>  MAINTAINERS                                |  2 +-
>  drivers/platform/x86/amd/Kconfig           | 14 +-------------
>  drivers/platform/x86/amd/Makefile          |  3 +--
>  drivers/platform/x86/amd/hsmp/Kconfig      | 17 +++++++++++++++++
>  drivers/platform/x86/amd/hsmp/Makefile     |  8 ++++++++
>  drivers/platform/x86/amd/{ =3D> hsmp}/hsmp.c |  0
>  6 files changed, 28 insertions(+), 16 deletions(-)
>  create mode 100644 drivers/platform/x86/amd/hsmp/Kconfig
>  create mode 100644 drivers/platform/x86/amd/hsmp/Makefile
>  rename drivers/platform/x86/amd/{ =3D> hsmp}/hsmp.c (100%)
>=20
> diff --git a/MAINTAINERS b/MAINTAINERS
> index d6c90161c7bf..a7d79d1f7ec1 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -1037,7 +1037,7 @@ S:=09Maintained
>  F:=09Documentation/arch/x86/amd_hsmp.rst
>  F:=09arch/x86/include/asm/amd_hsmp.h
>  F:=09arch/x86/include/uapi/asm/amd_hsmp.h
> -F:=09drivers/platform/x86/amd/hsmp.c
> +F:=09drivers/platform/x86/amd/hsmp/
> =20
>  AMD IOMMU (AMD-VI)
>  M:=09Joerg Roedel <joro@8bytes.org>
> diff --git a/drivers/platform/x86/amd/Kconfig b/drivers/platform/x86/amd/=
Kconfig
> index f88682d36447..2c671cc17d63 100644
> --- a/drivers/platform/x86/amd/Kconfig
> +++ b/drivers/platform/x86/amd/Kconfig
> @@ -3,22 +3,10 @@
>  # AMD x86 Platform Specific Drivers
>  #
> =20
> +source "drivers/platform/x86/amd/hsmp/Kconfig"
>  source "drivers/platform/x86/amd/pmf/Kconfig"
>  source "drivers/platform/x86/amd/pmc/Kconfig"
> =20
> -config AMD_HSMP
> -=09tristate "AMD HSMP Driver"
> -=09depends on AMD_NB && X86_64 && ACPI
> -=09help
> -=09  The driver provides a way for user space tools to monitor and manag=
e
> -=09  system management functionality on EPYC server CPUs from AMD.
> -
> -=09  Host System Management Port (HSMP) interface is a mailbox interface
> -=09  between the x86 core and the System Management Unit (SMU) firmware.
> -
> -=09  If you choose to compile this driver as a module the module will be
> -=09  called amd_hsmp.
> -
>  config AMD_WBRF
>  =09bool "AMD Wifi RF Band mitigations (WBRF)"
>  =09depends on ACPI
> diff --git a/drivers/platform/x86/amd/Makefile b/drivers/platform/x86/amd=
/Makefile
> index dcec0a46f8af..96ec24c8701b 100644
> --- a/drivers/platform/x86/amd/Makefile
> +++ b/drivers/platform/x86/amd/Makefile
> @@ -5,7 +5,6 @@
>  #
> =20
>  obj-$(CONFIG_AMD_PMC)=09=09+=3D pmc/
> -amd_hsmp-y=09=09=09:=3D hsmp.o
> -obj-$(CONFIG_AMD_HSMP)=09=09+=3D amd_hsmp.o
> +obj-y=09=09=09=09+=3D hsmp/
>  obj-$(CONFIG_AMD_PMF)=09=09+=3D pmf/
>  obj-$(CONFIG_AMD_WBRF)=09=09+=3D wbrf.o
> diff --git a/drivers/platform/x86/amd/hsmp/Kconfig b/drivers/platform/x86=
/amd/hsmp/Kconfig
> new file mode 100644
> index 000000000000..b55d4ed9bceb
> --- /dev/null
> +++ b/drivers/platform/x86/amd/hsmp/Kconfig
> @@ -0,0 +1,17 @@
> +# SPDX-License-Identifier: GPL-2.0-only
> +#
> +# AMD HSMP Driver
> +#
> +
> +config AMD_HSMP
> +=09tristate "AMD HSMP Driver"
> +=09depends on AMD_NB && X86_64 && ACPI
> +=09help
> +=09  The driver provides a way for user space tools to monitor and manag=
e
> +=09  system management functionality on EPYC server CPUs from AMD.
> +
> +=09  Host System Management Port (HSMP) interface is a mailbox interface
> +=09  between the x86 core and the System Management Unit (SMU) firmware.
> +
> +=09  If you choose to compile this driver as a module the module will be
> +=09  called amd_hsmp.
> diff --git a/drivers/platform/x86/amd/hsmp/Makefile b/drivers/platform/x8=
6/amd/hsmp/Makefile
> new file mode 100644
> index 000000000000..fda64906a5e8
> --- /dev/null
> +++ b/drivers/platform/x86/amd/hsmp/Makefile
> @@ -0,0 +1,8 @@
> +# SPDX-License-Identifier: GPL-2.0
> +#
> +# Makefile for drivers/platform/x86/amd/hsmp
> +# AMD HSMP Driver
> +#
> +
> +obj-$(CONFIG_AMD_HSMP)=09=09+=3D amd_hsmp.o
> +amd_hsmp-objs=09=09=09:=3D hsmp.o
> diff --git a/drivers/platform/x86/amd/hsmp.c b/drivers/platform/x86/amd/h=
smp/hsmp.c
> similarity index 100%
> rename from drivers/platform/x86/amd/hsmp.c
> rename to drivers/platform/x86/amd/hsmp/hsmp.c
>=20
--8323328-824459486-1723030404=:1138--
