Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D26F82D057
	for <platform-driver-x86@vger.kernel.org>; Tue,  4 Feb 2025 14:33:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738679635; cv=none; b=fSxIugYW4LB9U1uGaDsPDMlVQmw2X2kox1tVCh5PATIpkBMqZp7L0qxAU6Pha8gHfbwcWszpmSbbsMijluBuFWVvA0u3aiGq/hNJS0J0GeOB6O0ooUmeEz7UsijIGrdfGibxjUq85aHmZOu/t6o3R9ITQhYWEknjOlhcrzPOFaY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738679635; c=relaxed/simple;
	bh=O26S971ezCYIEmcC63Zru61uBFhVGiJG5nC7PxZQazw=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=FTadUMQ6uIVoWP4WTdoh9iE93sRDpeYKiEhy3AM/mjjFaOU3e0F0xTwwUm9VGz4vjn1QKBL21zBnxepB/reAPmu19vO0BSfe2xHTlnzW4bBL8WuX7KFQrF7AXDu9X+UuRmEv7gTqP8Rw+0bZ5pB6WssrwouhJnKNlIwOsI8PdSo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gLknl/8Q; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gLknl/8Q"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1738679633; x=1770215633;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version:content-id;
  bh=O26S971ezCYIEmcC63Zru61uBFhVGiJG5nC7PxZQazw=;
  b=gLknl/8QutsWYG0bCmEeug5yT7ZbtobhB/kVi/024IG3JAnV2wwS0M+l
   er/DCjaJssegZHH948ttuwVuSpobhKJxaJ4NSKforiBXuLuHLHmxgRKfL
   aI65wKjs6w5ZVRCNdEBCFvq0TYr0+ifHIJmuiWHfh7qYLF5mIzVWuNVGz
   FLHrtIYCF2SmtNfpq3cClmXZfBn0VbpHpLhbXCPSso2NtTgkU/sFOE1qt
   /aS6prh6vIhV4BM6RgbY0tk73nCmoFaBMgGy6PzquyPrhE01iUUPJivdV
   kX04+jjZyC3SYfI4ItpwG/wGkEJwsUL72T05dywTeAsbnawVo8HlTmZEz
   Q==;
X-CSE-ConnectionGUID: ghk3oMlVSJiMieSRDBaoRg==
X-CSE-MsgGUID: ug6XV656RYqpU/pNaTf73Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11336"; a="64561486"
X-IronPort-AV: E=Sophos;i="6.13,258,1732608000"; 
   d="scan'208";a="64561486"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Feb 2025 06:33:52 -0800
X-CSE-ConnectionGUID: SmlbMEfLQDiLDuxHVfdzpA==
X-CSE-MsgGUID: H6bBjulYSs2mM+1u8TBLAA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="133859412"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.75])
  by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Feb 2025 06:33:50 -0800
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Tue, 4 Feb 2025 16:33:46 +0200 (EET)
To: Vadim Pasternak <vadimp@nvidia.com>
cc: Hans de Goede <hdegoede@redhat.com>, michaelsh@nvidia.com, 
    crajank@nvidia.com, fradensky@nvidia.com, oleksandrs@nvidia.com, 
    platform-driver-x86@vger.kernel.org
Subject: Re: [PATCH v5 01/12] mellanox: Relocate mlx-platform driver
In-Reply-To: <20250124172632.22437-2-vadimp@nvidia.com>
Message-ID: <e96ebd29-e494-f668-b50b-5c6e5719717b@linux.intel.com>
References: <20250124172632.22437-1-vadimp@nvidia.com> <20250124172632.22437-2-vadimp@nvidia.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/mixed; BOUNDARY="8323328-541824478-1738667254=:1609"
Content-ID: <861f88c2-8d7e-79c4-d70f-935ce057590a@linux.intel.com>

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323328-541824478-1738667254=:1609
Content-Type: text/plain; CHARSET=ISO-8859-15
Content-Transfer-Encoding: QUOTED-PRINTABLE
Content-ID: <afb5bcd9-4e7e-be92-0c86-66fa2732ffad@linux.intel.com>

On Fri, 24 Jan 2025, Vadim Pasternak wrote:

> Move 'mlx-platform' driver 'x86' to 'mellanox' folder.
>=20
> Motivation to allow running it on systems with ARM architecture.
>=20
> Since drivers/platform/x86/mlx-platform.c is rellocated to folder
> drivers/platform/x86/, remove "MELLANOX PLATFORM DRIVER" item.
> This driver will be located under "MELLANOX HARDWARE PLATFORM SUPPORT"
> item.
>=20
> Add reference for Documentation/ABI/testing/sysfs-driver-mlxreg-io under
> "MELLANOX HARDWARE PLATFORM SUPPORT".
>=20
> Reviewed-by: Michael Shych <michaelsh@nvidia.com>
> Signed-off-by: Vadim Pasternak <vadimp@nvidia.com>
> ---
>  MAINTAINERS                                       |  7 +------
>  drivers/platform/mellanox/Kconfig                 | 13 +++++++++++++
>  drivers/platform/mellanox/Makefile                |  1 +
>  drivers/platform/{x86 =3D> mellanox}/mlx-platform.c |  0
>  drivers/platform/x86/Kconfig                      | 13 -------------
>  drivers/platform/x86/Makefile                     |  1 -
>  6 files changed, 15 insertions(+), 20 deletions(-)
>  rename drivers/platform/{x86 =3D> mellanox}/mlx-platform.c (100%)
>=20
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 6bb4ec0c162a..7d12a8f08f52 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -14705,6 +14705,7 @@ M:=09Ilpo J=E4rvinen <ilpo.jarvinen@linux.intel.c=
om>
>  M:=09Vadim Pasternak <vadimp@nvidia.com>
>  L:=09platform-driver-x86@vger.kernel.org
>  S:=09Supported
> +F:=09Documentation/ABI/testing/sysfs-driver-mlxreg-io

I ended up dropping this line (and the related explanation in the commit=20
message) from this change in the review-ilpo-next branch because there=20
appears to be stable vs testing confusion which was caught by lkp. Please=
=20
add it in a separate patch.

--=20
 i.

>  F:=09Documentation/ABI/testing/sysfs-platform-mellanox-bootctl
>  F:=09drivers/platform/mellanox/
>  F:=09include/linux/platform_data/mlxreg.h
> @@ -14775,12 +14776,6 @@ F:=09Documentation/leds/leds-mlxcpld.rst
>  F:=09drivers/leds/leds-mlxcpld.c
>  F:=09drivers/leds/leds-mlxreg.c
> =20
> -MELLANOX PLATFORM DRIVER
> -M:=09Vadim Pasternak <vadimp@nvidia.com>
> -L:=09platform-driver-x86@vger.kernel.org
> -S:=09Supported
> -F:=09drivers/platform/x86/mlx-platform.c
> -
>  MEMBARRIER SUPPORT
>  M:=09Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
>  M:=09"Paul E. McKenney" <paulmck@kernel.org>
> diff --git a/drivers/platform/mellanox/Kconfig b/drivers/platform/mellano=
x/Kconfig
> index f7dfa0e785fd..aa760f064a17 100644
> --- a/drivers/platform/mellanox/Kconfig
> +++ b/drivers/platform/mellanox/Kconfig
> @@ -14,6 +14,19 @@ menuconfig MELLANOX_PLATFORM
> =20
>  if MELLANOX_PLATFORM
> =20
> +config MLX_PLATFORM
> +=09tristate "Mellanox Technologies platform support"
> +=09depends on ACPI && I2C && PCI
> +=09select REGMAP
> +=09help
> +=09  This option enables system support for the Mellanox Technologies
> +=09  platform. The Mellanox systems provide data center networking
> +=09  solutions based on Virtual Protocol Interconnect (VPI) technology
> +=09  enable seamless connectivity to 56/100Gb/s InfiniBand or 10/40/56Gb=
E
> +=09  connection.
> +
> +=09  If you have a Mellanox system, say Y or M here.
> +
>  config MLXREG_HOTPLUG
>  =09tristate "Mellanox platform hotplug driver support"
>  =09depends on HWMON
> diff --git a/drivers/platform/mellanox/Makefile b/drivers/platform/mellan=
ox/Makefile
> index 04703c0416b1..ba56485cbe8c 100644
> --- a/drivers/platform/mellanox/Makefile
> +++ b/drivers/platform/mellanox/Makefile
> @@ -3,6 +3,7 @@
>  # Makefile for linux/drivers/platform/mellanox
>  # Mellanox Platform-Specific Drivers
>  #
> +obj-$(CONFIG_MLX_PLATFORM)=09+=3D mlx-platform.o
>  obj-$(CONFIG_MLXBF_BOOTCTL)=09+=3D mlxbf-bootctl.o
>  obj-$(CONFIG_MLXBF_PMC)=09=09+=3D mlxbf-pmc.o
>  obj-$(CONFIG_MLXBF_TMFIFO)=09+=3D mlxbf-tmfifo.o
> diff --git a/drivers/platform/x86/mlx-platform.c b/drivers/platform/mella=
nox/mlx-platform.c
> similarity index 100%
> rename from drivers/platform/x86/mlx-platform.c
> rename to drivers/platform/mellanox/mlx-platform.c
> diff --git a/drivers/platform/x86/Kconfig b/drivers/platform/x86/Kconfig
> index 3875abba5a79..92a3d5be0e36 100644
> --- a/drivers/platform/x86/Kconfig
> +++ b/drivers/platform/x86/Kconfig
> @@ -1010,19 +1010,6 @@ config SERIAL_MULTI_INSTANTIATE
>  =09  To compile this driver as a module, choose M here: the module
>  =09  will be called serial-multi-instantiate.
> =20
> -config MLX_PLATFORM
> -=09tristate "Mellanox Technologies platform support"
> -=09depends on ACPI && I2C && PCI
> -=09select REGMAP
> -=09help
> -=09  This option enables system support for the Mellanox Technologies
> -=09  platform. The Mellanox systems provide data center networking
> -=09  solutions based on Virtual Protocol Interconnect (VPI) technology
> -=09  enable seamless connectivity to 56/100Gb/s InfiniBand or 10/40/56Gb=
E
> -=09  connection.
> -
> -=09  If you have a Mellanox system, say Y or M here.
> -
>  config TOUCHSCREEN_DMI
>  =09bool "DMI based touchscreen configuration info"
>  =09depends on ACPI && DMI && I2C=3Dy && TOUCHSCREEN_SILEAD
> diff --git a/drivers/platform/x86/Makefile b/drivers/platform/x86/Makefil=
e
> index e1b142947067..8849c0a36419 100644
> --- a/drivers/platform/x86/Makefile
> +++ b/drivers/platform/x86/Makefile
> @@ -122,7 +122,6 @@ obj-$(CONFIG_TOPSTAR_LAPTOP)=09+=3D topstar-laptop.o
>  # Platform drivers
>  obj-$(CONFIG_FW_ATTR_CLASS)=09=09+=3D firmware_attributes_class.o
>  obj-$(CONFIG_SERIAL_MULTI_INSTANTIATE)=09+=3D serial-multi-instantiate.o
> -obj-$(CONFIG_MLX_PLATFORM)=09=09+=3D mlx-platform.o
>  obj-$(CONFIG_TOUCHSCREEN_DMI)=09=09+=3D touchscreen_dmi.o
>  obj-$(CONFIG_WIRELESS_HOTKEY)=09=09+=3D wireless-hotkey.o
>  obj-$(CONFIG_X86_ANDROID_TABLETS)=09+=3D x86-android-tablets/
>=20
--8323328-541824478-1738667254=:1609--
