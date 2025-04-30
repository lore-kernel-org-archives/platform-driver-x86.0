Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 241B521B182
	for <platform-driver-x86@vger.kernel.org>; Wed, 30 Apr 2025 13:20:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746019228; cv=none; b=fR7TV5PlEyAm+RX5PvRRQszo6a50XUK+Axgl9ZdbwMZLBwsB6lRiODlsQz1X3E8CBBsjJjCDIl29Bgioxu9Me61IvQjWm1KiBvOyCG4rt4TKN6uVjSMqK+ysQJ6KaubO7UEEtGigiRJoqutePjZa1yBELUwHYn9YgrwY+AbNZcw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746019228; c=relaxed/simple;
	bh=zrPkL3TfFpt165rD9QFl+01aiAGvK3HtND/xSxhVmIU=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=K6r8Qn//TMsFwCefo+UoS2hsZctCxBqoh9Fw0FjS1FYOc+Wkw1GXYyLZuFdDoI0X7p5kMcgusjBUAFb0F+KALk454l4jJHCO1dGsvlt+/PHa0K3DrHVYYW+lDM24gefi5eihi/L+kN/w9t5nAFdHYVXkXXOTjO2EGJZRbo+K/ys=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=MTaHLacZ; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MTaHLacZ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1746019226; x=1777555226;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=zrPkL3TfFpt165rD9QFl+01aiAGvK3HtND/xSxhVmIU=;
  b=MTaHLacZYEpYtNVWVccLIzGqfPTWacABCMXidXJ6hMSmCUzEpP101pRz
   PsrgmMsAYFDr51Z37XRLZNmkTzniJ89fPoIf1uX1Wt9TM0evlYueOgwyd
   f2QX/c/4+MuyRBCxp1t7duyXLqOKj+4x+qJ73r6cu+Q4Zn1S8+l34IwW0
   5aKHvcQDOcZ9hd6BjGOwSAevREcceNOASac38gRhvc8sGViitnMhDAzFt
   SfgAtqS0aRC9Wb0Z6m6E0rgU/oEybJKaS4l8Nse6MzBirz8REbG0r+vIB
   nlT5Jp11sfieHbJeeQ04I0oadMV85Z9+8H99xLYbkBRXQpkkomCam7TYo
   Q==;
X-CSE-ConnectionGUID: XnhVtyi8TTWv3Q53h9dq2g==
X-CSE-MsgGUID: uCr2r3w6S1eX4GhVXpafcA==
X-IronPort-AV: E=McAfee;i="6700,10204,11419"; a="47555824"
X-IronPort-AV: E=Sophos;i="6.15,251,1739865600"; 
   d="scan'208";a="47555824"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Apr 2025 06:20:22 -0700
X-CSE-ConnectionGUID: bYuq1MprQ/CkbyIzGVMDBg==
X-CSE-MsgGUID: k+nkRtAAS+qVAJLEKPzd3w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,251,1739865600"; 
   d="scan'208";a="134018981"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.97])
  by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Apr 2025 06:20:20 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Wed, 30 Apr 2025 16:20:16 +0300 (EEST)
To: Suma Hegde <suma.hegde@amd.com>
cc: platform-driver-x86@vger.kernel.org, Hans de Goede <hdegoede@redhat.com>, 
    Naveen Krishna Chatradhi <naveenkrishna.chatradhi@amd.com>
Subject: Re: [v3 2/3] platform/x86/amd/hsmp: Report power via hwmon sensors
In-Reply-To: <20250430123819.1289068-2-suma.hegde@amd.com>
Message-ID: <6b5d93d2-864b-48d9-d681-7a123bfda4a4@linux.intel.com>
References: <20250430123819.1289068-1-suma.hegde@amd.com> <20250430123819.1289068-2-suma.hegde@amd.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323328-1581851198-1746019216=:7433"

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323328-1581851198-1746019216=:7433
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE

On Wed, 30 Apr 2025, Suma Hegde wrote:

> Expose power reading and power limits via hwmon power sensors.
>=20
> Signed-off-by: Suma Hegde <suma.hegde@amd.com>
> Reviewed-by: Naveen Krishna Chatradhi <naveenkrishna.chatradhi@amd.com>
> ---
> Changes since v2:
> 1. Remove hwmon related documentation content from patch 3 and add that c=
ontent
>    in this patch. Add space before starting paranthesis in power1_xxx,
>    remove extra blank line before HSMP HWMON interface section.
> 2. Remove double semicolon at the end of hsmp_create_sensor()
> 3. Place hsmp_create_sensor() stub's code right after the function
> 4. Include err.h and types.h header files in hwmon.c
> 5. Initialize struct hsmp_message using {} instead of {0} everywhere
> 6. Convert power value to milli watt before writing it to SMU
> 7. Remove return 0 from hsmp_hwmon_is_visble()
> 8. Multiply power value by 1000 before sending it back to hwmon
>    subsystem
> 9. Add semicolon after hsmp_info in hsmp_chip_info declaration
> 10.Replace IS_ERR() with PTR_ERR_OR_ZERO()
> 11. uintptr_t is retained to avoid compiler warning
> 12. remove parenthesis around sock_ind parameter in
>     devm_hwmon_device_register_with_info()
>=20
> Changes since v1:
> 1. Move hsmp_create_sensor() call to init_acpi() in acpi.c and init_platf=
orm_device() in plat.c
> 2. Pass u16 as parameter instead of void * in hsmp_create_sensor()
> 3. Change dev_err() print after hsmp_create_sensor()
> 4. Add CONFIG_HWMON dependency in Makefile
> 5. Add #if IS_REACHABLE(CONFIG_HWMON) condition check in hsmp.h
> 6. Remove hsmp_hwmon struct in hsmp.h and add hwmon_channel_info and hwmo=
n_chip_info to
>    hwmon.c file as static variables
> 7. Change argument to devm_hwmon_device_register_with_info()
> 8. Remove hsmp_create_power_sensor() and define power info statically. In=
stead of multiple channel,
>    use single channel with different attributes.
> 9. Replace switch with if in hsmp_hwmon_is_visble()
> 10. Remove referencing channel related code in hsmp_hwmon_read() and add =
code for attribute checking.
> 11. Replace switch with if in hsmp_hwmon_read()
> 12. Remove hsmp_hwmon_read_label().
> 13. Update hsmp_hwmon_write() to remove switch and code related to channe=
l
> 14. Remove int-ll64.h header
> 15. Update the documentation
>=20
>  Documentation/arch/x86/amd_hsmp.rst    |   8 ++
>  drivers/platform/x86/amd/hsmp/Makefile |   1 +
>  drivers/platform/x86/amd/hsmp/acpi.c   |   4 +
>  drivers/platform/x86/amd/hsmp/hsmp.h   |   8 +-
>  drivers/platform/x86/amd/hsmp/hwmon.c  | 122 +++++++++++++++++++++++++
>  drivers/platform/x86/amd/hsmp/plat.c   |   5 +
>  6 files changed, 147 insertions(+), 1 deletion(-)
>  create mode 100644 drivers/platform/x86/amd/hsmp/hwmon.c
>=20
> diff --git a/Documentation/arch/x86/amd_hsmp.rst b/Documentation/arch/x86=
/amd_hsmp.rst
> index 2fd917638e42..3ef3e0a71df9 100644
> --- a/Documentation/arch/x86/amd_hsmp.rst
> +++ b/Documentation/arch/x86/amd_hsmp.rst
> @@ -116,6 +116,14 @@ for socket with ID00 is given below::
>  =09=09=09})
>  =09=09}
> =20
> +HSMP HWMON interface
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +HSMP power sensors are registered with the hwmon interface. A separate h=
wmon
> +directory is created for each socket and the following files are generat=
ed
> +within the hwmon directory.
> +- power1_input (read only)
> +- power1_cap_max (read only)
> +- power1_cap (read, write)
> =20
>  An example
>  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> diff --git a/drivers/platform/x86/amd/hsmp/Makefile b/drivers/platform/x8=
6/amd/hsmp/Makefile
> index 0759bbcd13f6..ce8342e71f50 100644
> --- a/drivers/platform/x86/amd/hsmp/Makefile
> +++ b/drivers/platform/x86/amd/hsmp/Makefile
> @@ -6,6 +6,7 @@
> =20
>  obj-$(CONFIG_AMD_HSMP)=09=09=09+=3D hsmp_common.o
>  hsmp_common-y=09=09=09=09:=3D hsmp.o
> +hsmp_common-$(CONFIG_HWMON)=09=09+=3D hwmon.o
>  obj-$(CONFIG_AMD_HSMP_PLAT)=09=09+=3D amd_hsmp.o
>  amd_hsmp-y=09=09=09=09:=3D plat.o
>  obj-$(CONFIG_AMD_HSMP_ACPI)=09=09+=3D hsmp_acpi.o
> diff --git a/drivers/platform/x86/amd/hsmp/acpi.c b/drivers/platform/x86/=
amd/hsmp/acpi.c
> index 12f4950afcd9..93b413e0a6e6 100644
> --- a/drivers/platform/x86/amd/hsmp/acpi.c
> +++ b/drivers/platform/x86/amd/hsmp/acpi.c
> @@ -281,6 +281,10 @@ static int init_acpi(struct device *dev)
>  =09=09=09dev_err(dev, "Failed to init metric table\n");
>  =09}
> =20
> +=09ret =3D hsmp_create_sensor(dev, sock_ind);
> +=09if (ret)
> +=09=09dev_err(dev, "Failed to register HSMP sensors with hwmon\n");
> +
>  =09return ret;
>  }
> =20
> diff --git a/drivers/platform/x86/amd/hsmp/hsmp.h b/drivers/platform/x86/=
amd/hsmp/hsmp.h
> index 7877cb97993b..02eeebfcb165 100644
> --- a/drivers/platform/x86/amd/hsmp/hsmp.h
> +++ b/drivers/platform/x86/amd/hsmp/hsmp.h
> @@ -12,6 +12,7 @@
> =20
>  #include <linux/compiler_types.h>
>  #include <linux/device.h>
> +#include <linux/hwmon.h>
>  #include <linux/miscdevice.h>
>  #include <linux/pci.h>
>  #include <linux/semaphore.h>
> @@ -25,7 +26,7 @@
>  #define HSMP_DEVNODE_NAME=09"hsmp"
>  #define ACPI_HSMP_DEVICE_HID    "AMDI0097"
> =20
> -#define DRIVER_VERSION=09=09"2.4"
> +#define DRIVER_VERSION=09=09"2.5"
> =20
>  struct hsmp_mbaddr_info {
>  =09u32 base_addr;
> @@ -63,4 +64,9 @@ int hsmp_misc_register(struct device *dev);
>  int hsmp_get_tbl_dram_base(u16 sock_ind);
>  ssize_t hsmp_metric_tbl_read(struct hsmp_socket *sock, char *buf, size_t=
 size);
>  struct hsmp_plat_device *get_hsmp_pdev(void);
> +#if IS_REACHABLE(CONFIG_HWMON)
> +int hsmp_create_sensor(struct device *dev, u16 sock_ind);
> +#else
> +int hsmp_create_sensor(struct device *dev, u16 sock_ind) { return 0; }
> +#endif
>  #endif /* HSMP_H */
> diff --git a/drivers/platform/x86/amd/hsmp/hwmon.c b/drivers/platform/x86=
/amd/hsmp/hwmon.c
> new file mode 100644
> index 000000000000..93827c38f169
> --- /dev/null
> +++ b/drivers/platform/x86/amd/hsmp/hwmon.c
> @@ -0,0 +1,122 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * AMD HSMP hwmon support
> + * Copyright (c) 2025, AMD.
> + * All Rights Reserved.
> + *
> + * This file provides hwmon implementation for HSMP interface.
> + */
> +
> +#include <asm/amd_hsmp.h>
> +
> +#include <linux/device.h>
> +#include <linux/err.h>
> +#include <linux/hwmon.h>
> +#include <linux/types.h>
> +
> +#include "hsmp.h"
> +
> +#define HSMP_HWMON_NAME=09=09"amd_hsmp_hwmon"
> +
> +static int hsmp_hwmon_write(struct device *dev, enum hwmon_sensor_types =
type,
> +=09=09=09    u32 attr, int channel, long val)
> +{
> +=09u16 sock_ind =3D (uintptr_t)dev_get_drvdata(dev);
> +=09struct hsmp_message msg =3D {};
> +
> +=09if (type !=3D hwmon_power)
> +=09=09return -EOPNOTSUPP;
> +
> +=09if (attr !=3D hwmon_power_cap)
> +=09=09return -EOPNOTSUPP;
> +
> +=09msg.num_args =3D 1;
> +=09/* Convert the power value to mWatt from =C2=B5Watt */
> +=09msg.args[0] =3D val / 1000;

MICROWATT_PER_MILLIWATT, don't forget to add the #include. Comment is=20
unnecessary then.

> +=09msg.msg_id =3D HSMP_SET_SOCKET_POWER_LIMIT;
> +=09msg.sock_ind =3D sock_ind;
> +=09return hsmp_send_message(&msg);
> +}
> +
> +static int hsmp_hwmon_read(struct device *dev,
> +=09=09=09   enum hwmon_sensor_types type,
> +=09=09=09   u32 attr, int channel, long *val)
> +{
> +=09u16 sock_ind =3D (uintptr_t)dev_get_drvdata(dev);
> +=09struct hsmp_message msg =3D {};
> +=09int ret;
> +
> +=09if (type !=3D hwmon_power)
> +=09=09return -EOPNOTSUPP;
> +
> +=09msg.sock_ind =3D sock_ind;
> +=09msg.response_sz =3D 1;
> +
> +=09switch (attr) {
> +=09case hwmon_power_input:
> +=09=09msg.msg_id =3D HSMP_GET_SOCKET_POWER;
> +=09=09break;
> +=09case hwmon_power_cap:
> +=09=09msg.msg_id =3D HSMP_GET_SOCKET_POWER_LIMIT;
> +=09=09break;
> +=09case hwmon_power_cap_max:
> +=09=09msg.msg_id =3D HSMP_GET_SOCKET_POWER_LIMIT_MAX;
> +=09=09break;
> +=09default:
> +=09=09return -EOPNOTSUPP;
> +=09}
> +
> +=09ret =3D hsmp_send_message(&msg);
> +=09if (!ret)
> +=09=09/* Convert the power value to =C2=B5Watt from mWatt */
> +=09=09*val =3D msg.args[0] * 1000;

Ditto.

> +
> +=09return ret;
> +}
> +
> +static umode_t hsmp_hwmon_is_visble(const void *data,
> +=09=09=09=09    enum hwmon_sensor_types type,
> +=09=09=09=09    u32 attr, int channel)
> +{
> +=09if (type !=3D hwmon_power)
> +=09=09return 0;
> +
> +=09switch (attr) {
> +=09case hwmon_power_input:
> +=09=09return 0444;
> +=09case hwmon_power_cap:
> +=09=09return 0644;
> +=09case hwmon_power_cap_max:
> +=09=09return 0444;
> +=09default:
> +=09=09return 0;
> +=09}
> +}
> +
> +static const struct hwmon_ops hsmp_hwmon_ops =3D {
> +=09.read =3D hsmp_hwmon_read,
> +=09.is_visible =3D hsmp_hwmon_is_visble,
> +=09.write=09=3D hsmp_hwmon_write,
> +};
> +
> +static const struct hwmon_channel_info * const hsmp_info[] =3D {
> +=09HWMON_CHANNEL_INFO(power, HWMON_P_INPUT | HWMON_P_CAP | HWMON_P_CAP_M=
AX),
> +=09NULL
> +};
> +
> +static const struct hwmon_chip_info hsmp_chip_info =3D {
> +=09.ops =3D &hsmp_hwmon_ops,
> +=09.info =3D hsmp_info,
> +};
> +
> +int hsmp_create_sensor(struct device *dev, u16 sock_ind)
> +{
> +=09struct device *hwmon_dev;
> +
> +=09hwmon_dev =3D devm_hwmon_device_register_with_info(dev, HSMP_HWMON_NA=
ME,
> +=09=09=09=09=09=09=09 (void *)(uintptr_t)sock_ind,
> +=09=09=09=09=09=09=09 &hsmp_chip_info,
> +=09=09=09=09=09=09=09 NULL);
> +=09return PTR_ERR_OR_ZERO(hwmon_dev);
> +}
> +EXPORT_SYMBOL_NS(hsmp_create_sensor, "AMD_HSMP");
> diff --git a/drivers/platform/x86/amd/hsmp/plat.c b/drivers/platform/x86/=
amd/hsmp/plat.c
> index 4f03fdf988c1..0881d7e01936 100644
> --- a/drivers/platform/x86/amd/hsmp/plat.c
> +++ b/drivers/platform/x86/amd/hsmp/plat.c
> @@ -189,6 +189,11 @@ static int init_platform_device(struct device *dev)
>  =09=09=09if (ret)
>  =09=09=09=09dev_err(dev, "Failed to init metric table\n");
>  =09=09}
> +
> +=09=09/* Register with hwmon interface for reporting power */
> +=09=09ret =3D hsmp_create_sensor(dev, i);
> +=09=09if (ret)
> +=09=09=09dev_err(dev, "Failed to register HSMP sensors with hwmon\n");
>  =09}
> =20
>  =09return 0;
>=20

--=20
 i.

--8323328-1581851198-1746019216=:7433--
