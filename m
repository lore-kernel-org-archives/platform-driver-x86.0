Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E380F229B38
	for <platform-driver-x86@vger.kernel.org>; Mon, 30 Mar 2026 15:10:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774883452; cv=none; b=C2d+cmMRPOw3z5WeJh5xFPJfJGdWGAyx9Y7SrtXrC5pKhfZ+rEvmxjPwj8txHieHCAPHXXKwtTPpZsSAGDPlYhO588st4sHzHEM5eNnr0H9ayTtlzPI4ljclNyqu2IL3SpkWMRBlpnuwtPOD+iGBY5Zgl/+nnl4YfB1lEu1O6po=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774883452; c=relaxed/simple;
	bh=JdLBBUdbb1H3CDpGjW+yiWDTxapaJFPo3J3sdtjQdB8=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=sPsyo6F4JqH6FVYMUTY1QWcK4nrRleRzWV2o6JyRNvy0SKThtdf+Sg03pVwa8kF81tM0hQRMEKbP0CcCslnan/R6snDo1cZXoqo8Y67qmkdue/H4mCAVPuuBmFTg/BjqrJTNs187zUAORDONRlbc+TVHdgEJfwEXA8PNaAZUEis=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Juqj4Gxp; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Juqj4Gxp"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774883450; x=1806419450;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=JdLBBUdbb1H3CDpGjW+yiWDTxapaJFPo3J3sdtjQdB8=;
  b=Juqj4GxpII/oJDMBKxnuBNZQU5SrIj1fU7Mc9VgkVdN4MeHXVajVI5Ys
   COFQvsb5JSLLo0vP2rNisD9BEc3K8uD8QP4QVAkwoQhbHMS4Vk08KZYnT
   Q0mKGHkJy4XyqIMJdCZP98PtmMEsCN4Pm2tVaBHl4UOMgvVZe/HdkS/zg
   6PmGNByrWOc6FHpySI0MMOcgjqL5b73uTwG3dI/y2ep2/UbLImwCfVY3H
   P6/BwMAOGFvwDmCNDFiy0Zu3gE53gP65Sy+76Zy2Na2yKBz7w+eaZWW2o
   hbwrEKzyneJxh8+F7YTY/xxzWY2FYPG9PZYGEEyb65mxBKOKSH9QjdyD0
   A==;
X-CSE-ConnectionGUID: XDzi8yjnRD6MeI0uCCFQWw==
X-CSE-MsgGUID: BqfBbSw4QhymvxsAuILzpA==
X-IronPort-AV: E=McAfee;i="6800,10657,11743"; a="98489204"
X-IronPort-AV: E=Sophos;i="6.23,150,1770624000"; 
   d="scan'208";a="98489204"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Mar 2026 08:10:45 -0700
X-CSE-ConnectionGUID: HXtI9ON2T2eEEmMiOLbMVA==
X-CSE-MsgGUID: ZiligN74Qu2tF5W57qZuYQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,150,1770624000"; 
   d="scan'208";a="225254075"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.153])
  by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Mar 2026 08:10:41 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Mon, 30 Mar 2026 18:10:35 +0300 (EEST)
To: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
cc: Hans de Goede <hansg@kernel.org>, platform-driver-x86@vger.kernel.org, 
    mario.limonciello@amd.com, Yijun.Shen@Dell.com, Sanket.Goswami@amd.com
Subject: Re: [PATCH v3 1/7] platform/x86/amd/pmf: Add util layer and userspace
 misc device interface
In-Reply-To: <21d9dd9b-0ab1-4c36-af3a-77f94afa02da@amd.com>
Message-ID: <977410c1-452a-2bea-3ef4-fa9b2d29da48@linux.intel.com>
References: <20260301131124.1370565-1-Shyam-sundar.S-k@amd.com> <20260301131124.1370565-2-Shyam-sundar.S-k@amd.com> <86b8f4be-dfe7-afeb-7390-17b75bf438e7@linux.intel.com> <21d9dd9b-0ab1-4c36-af3a-77f94afa02da@amd.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323328-1156116031-1774883435=:968"

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323328-1156116031-1774883435=:968
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE

On Mon, 30 Mar 2026, Shyam Sundar S K wrote:

> Hi Ilpo,
>=20
> Ack to all the comments in the series.
>=20
> On 3/25/2026 19:35, Ilpo J=C3=A4rvinen wrote:
> > On Sun, 1 Mar 2026, Shyam Sundar S K wrote:
> >=20
> >> Add a util layer to AMD PMF that exposes a minimal userspace interface
> >> via a misc character device for metrics monitoring and feature discove=
ry.
> >>
> >> This creates /dev/amdpmf_interface with basic ioctl support to retriev=
e
> >> PMF metrics such as:
> >> *Power source and power slider position
> >> *Platform type, lid state, and user presence
> >> *Skin temperature and ambient light
> >> *BIOS input parameters (1-10)
> >> *Graphics workload metrics
> >> *CPU C-state residency (average and maximum)
> >> *Socket power consumption
> >>
> >> The interface enables smoother integration with userspace tools such a=
s
> >> AMD SystemDeck [1], which is widely used for monitoring and controllin=
g
> >> power and thermal behavior on AMD platforms. These tools help designer=
s
> >> keep major components within thermal limits to ensure proper operation
> >> and enhance overall system stability and reliability.
> >>
> >> The feature is gated behind the CONFIG_AMD_PMF_UTIL_SUPPORT Kconfig
> >> option, allowing it to be disabled if not needed. The implementation
> >> uses existing PMF infrastructure to populate data from the TA (Trusted
> >> Application) shared memory buffer.
> >>
> >> Link: https://docs.amd.com/v/u/en-US/68773_0.50 [1]
> >>
> >> Co-developed-by: Sanket Goswami <Sanket.Goswami@amd.com>
> >> Signed-off-by: Sanket Goswami <Sanket.Goswami@amd.com>
> >> Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
> >> ---
> >>  drivers/platform/x86/amd/pmf/Kconfig  |  10 ++
> >>  drivers/platform/x86/amd/pmf/Makefile |   2 +
> >>  drivers/platform/x86/amd/pmf/core.c   |   5 +
> >>  drivers/platform/x86/amd/pmf/pmf.h    |   9 ++
> >>  drivers/platform/x86/amd/pmf/util.c   | 174 +++++++++++++++++++++++++=
+
> >>  include/uapi/linux/amd-pmf.h          | 115 +++++++++++++++++
> >>  6 files changed, 315 insertions(+)
> >>  create mode 100644 drivers/platform/x86/amd/pmf/util.c
> >>  create mode 100644 include/uapi/linux/amd-pmf.h
> >>
> >> diff --git a/drivers/platform/x86/amd/pmf/Kconfig b/drivers/platform/x=
86/amd/pmf/Kconfig
> >> index 25b8f7ae3abd..ad21f679b8ab 100644
> >> --- a/drivers/platform/x86/amd/pmf/Kconfig
> >> +++ b/drivers/platform/x86/amd/pmf/Kconfig
> >> @@ -30,3 +30,13 @@ config AMD_PMF_DEBUG
> >>  =09 in the PMF config store.
> >> =20
> >>  =09 Say Y here to enable more debug logs and Say N here if you are no=
t sure.
> >> +
> >> +config AMD_PMF_UTIL_SUPPORT
> >> +=09bool "AMD PMF Util layer support"
> >> +=09depends on AMD_PMF
> >> +=09help
> >> +=09Enabling this option provides a character device for userspace to =
capture
> >> +=09PMF features (Smart PC Builder, Auto Mode, Static Power Slider, Dy=
namic
> >> +=09Power Slider AC/DC) along with PMF metrics from the AMD PMF driver=
=2E
> >> +
> >> +=09Say Y here to enable it and Say N here if you are not sure.
> >> diff --git a/drivers/platform/x86/amd/pmf/Makefile b/drivers/platform/=
x86/amd/pmf/Makefile
> >> index 5978464e0eb7..bf7aad80b9e9 100644
> >> --- a/drivers/platform/x86/amd/pmf/Makefile
> >> +++ b/drivers/platform/x86/amd/pmf/Makefile
> >> @@ -8,3 +8,5 @@ obj-$(CONFIG_AMD_PMF)=09=09+=3D amd-pmf.o
> >>  amd-pmf-y =09=09=09:=3D core.o acpi.o sps.o \
> >>  =09=09=09=09   auto-mode.o cnqf.o \
> >>  =09=09=09=09   tee-if.o spc.o
> >> +# Build util.c only when AMD_PMF_UTIL_SUPPORT is enabled
> >> +amd-pmf-$(CONFIG_AMD_PMF_UTIL_SUPPORT) +=3D util.o
> >> diff --git a/drivers/platform/x86/amd/pmf/core.c b/drivers/platform/x8=
6/amd/pmf/core.c
> >> index b9e5a2cf3aae..919d02f30aae 100644
> >> --- a/drivers/platform/x86/amd/pmf/core.c
> >> +++ b/drivers/platform/x86/amd/pmf/core.c
> >> @@ -634,6 +634,10 @@ static int amd_pmf_probe(struct platform_device *=
pdev)
> >> =20
> >>  =09pmf_device =3D dev->dev;
> >> =20
> >> +=09err =3D amd_pmf_cdev_register(dev);
> >> +=09if (err)
> >> +=09=09dev_warn(dev->dev, "failed to register util interface: %d\n", e=
rr);
> >> +
> >>  =09dev_info(dev->dev, "registered PMF device successfully\n");
> >> =20
> >>  =09return 0;
> >> @@ -646,6 +650,7 @@ static void amd_pmf_remove(struct platform_device =
*pdev)
> >>  =09amd_pmf_deinit_features(dev);
> >>  =09if (is_apmf_func_supported(dev, APMF_FUNC_SBIOS_HEARTBEAT_V2))
> >>  =09=09amd_pmf_notify_sbios_heartbeat_event_v2(dev, ON_UNLOAD);
> >> +=09amd_pmf_cdev_unregister();
> >>  =09apmf_acpi_deinit(dev);
> >>  =09amd_pmf_dbgfs_unregister(dev);
> >>  }
> >> diff --git a/drivers/platform/x86/amd/pmf/pmf.h b/drivers/platform/x86=
/amd/pmf/pmf.h
> >> index 69fef7448744..6f61076a9386 100644
> >> --- a/drivers/platform/x86/amd/pmf/pmf.h
> >> +++ b/drivers/platform/x86/amd/pmf/pmf.h
> >> @@ -928,4 +928,13 @@ int amd_pmf_tee_init(struct amd_pmf_dev *dev, con=
st uuid_t *uuid);
> >>  void amd_pmf_tee_deinit(struct amd_pmf_dev *dev);
> >>  int amd_pmf_start_policy_engine(struct amd_pmf_dev *dev);
> >> =20
> >> +/* Util Layer */
> >> +#if IS_ENABLED(CONFIG_AMD_PMF_UTIL_SUPPORT)
> >> +int amd_pmf_cdev_register(struct amd_pmf_dev *dev);
> >> +void amd_pmf_cdev_unregister(void);
> >> +#else
> >> +static inline int amd_pmf_cdev_register(struct amd_pmf_dev *dev) { re=
turn 0; }
> >> +static inline void amd_pmf_cdev_unregister(void) {}
> >> +#endif
> >> +
> >>  #endif /* PMF_H */
> >> diff --git a/drivers/platform/x86/amd/pmf/util.c b/drivers/platform/x8=
6/amd/pmf/util.c
> >> new file mode 100644
> >> index 000000000000..c6837caa44e0
> >> --- /dev/null
> >> +++ b/drivers/platform/x86/amd/pmf/util.c
> >> @@ -0,0 +1,174 @@
> >> +// SPDX-License-Identifier: GPL-2.0-or-later
> >> +/*
> >> + * AMD Platform Management Framework Util Layer
> >> + *
> >> + * Copyright (c) 2026, Advanced Micro Devices, Inc.
> >> + * All Rights Reserved.
> >> + *
> >> + * Authors: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
> >> + *=09=09=09 Sanket Goswami <Sanket.Goswami@amd.com>
> >> + */
> >> +
> >> +#include <linux/amd-pmf.h>
> >> +#include <linux/miscdevice.h>
> >> +#include <linux/mutex.h>
> >> +#include <linux/uaccess.h>
> >> +
> >> +#include "pmf.h"
> >> +
> >> +/* Convert BIOS input control code to array index (0-9) */
> >> +static int amd_pmf_get_bios_idx(u32 control_code)
> >> +{
> >> +=09if (control_code >=3D IOCTL_BIOS_INPUT_1 && control_code <=3D IOCT=
L_BIOS_INPUT_10)
> >> +=09=09return control_code - IOCTL_BIOS_INPUT_1;
> >> +
> >> +=09return -EINVAL;
> >> +}
> >> +
> >> +static long long amd_pmf_populate_bios_input(struct ta_pmf_enact_tabl=
e *in, u32 control_code)
> >> +{
> >> +=09u32 idx;
> >> +
> >> +=09idx =3D amd_pmf_get_bios_idx(control_code);
> >> +
> >> +=09return (idx < 2) ? in->ev_info.bios_input_1[idx] : in->ev_info.bio=
s_input_2[idx - 2];
> >> +}
> >> +
> >> +static long long amd_pmf_device_state(struct ta_pmf_enact_table *in, =
u32 control_code)
> >> +{
> >> +=09switch (control_code) {
> >> +=09case IOCTL_PLATFORM_TYPE:
> >> +=09=09return in->ev_info.platform_type;
> >> +=09case IOCTL_LAPTOP_PLACEMENT:
> >> +=09=09return in->ev_info.device_state;
> >> +=09case IOCTL_LID_STATE:
> >> +=09=09return in->ev_info.lid_state;
> >> +=09case IOCTL_USER_PRESENCE:
> >> +=09=09return in->ev_info.user_present;
> >> +=09default:
> >> +=09=09return -EINVAL;
> >> +=09}
> >> +}
> >> +
> >> +static int amd_pmf_populate_data(struct device *dev, void __user *arg=
p)
> >> +{
> >> +=09struct amd_pmf_ioctl_info output =3D {0};
> >> +=09struct ta_pmf_shared_memory *ta_sm =3D NULL;
> >> +=09struct ta_pmf_enact_table *in =3D NULL;
> >> +=09struct amd_pmf_dev *pdev;
> >> +
> >> +=09pdev =3D dev_get_drvdata(dev);
> >> +=09if (!pdev)
> >> +=09=09return -EINVAL;
> >> +
> >> +=09memset(pdev->shbuf, 0, pdev->policy_sz);
> >> +=09ta_sm =3D pdev->shbuf;
> >> +=09in =3D &ta_sm->pmf_input.enact_table;
> >> +
> >> +=09if (copy_from_user(&output, argp, sizeof(output)))
> >> +=09=09return -EFAULT;
> >> +
> >> +=09switch (output.control_code) {
> >> +=09case IOCTL_POWER_SOURCE:
> >> +=09=09output.val =3D in->ev_info.power_source;
> >> +=09=09break;
> >> +=09case IOCTL_POWER_SLIDER_POSITION:
> >> +=09=09output.val =3D in->ev_info.power_slider;
> >> +=09=09break;
> >> +=09case IOCTL_SKIN_TEMP:
> >> +=09=09/* Convert from centi-degrees to degrees Celsius */
> >> +=09=09output.val =3D in->ev_info.skin_temperature / 100;
> >> +=09=09break;
> >> +=09case IOCTL_PLATFORM_TYPE ... IOCTL_LID_STATE:
> >> +=09case IOCTL_USER_PRESENCE:
> >> +=09=09output.val =3D amd_pmf_device_state(in, output.control_code);
> >> +=09=09break;
> >> +=09case IOCTL_BIOS_INPUT_1 ... IOCTL_BIOS_INPUT_10:
> >> +=09=09output.val =3D amd_pmf_populate_bios_input(in, output.control_c=
ode);
> >> +=09=09break;
> >> +=09case IOCTL_GFX_WORKLOAD:
> >> +=09=09output.val =3D in->ev_info.gfx_busy;
> >> +=09=09break;
> >> +=09case IOCTL_AMBIENT_LIGHT:
> >> +=09=09output.val =3D in->ev_info.ambient_light;
> >> +=09=09break;
> >> +=09case IOCTL_AVG_C0_RES:
> >> +=09=09output.val =3D in->ev_info.avg_c0residency;
> >> +=09=09break;
> >> +=09case IOCTL_MAX_C0_RES:
> >> +=09=09output.val =3D in->ev_info.max_c0residency;
> >> +=09=09break;
> >> +=09case IOCTL_SOCKET_POWER:
> >> +=09=09output.val =3D in->ev_info.socket_power;
> >> +=09=09break;
> >> +=09default:
> >> +=09=09return -EINVAL;
> >> +=09}
> >> +
> >> +=09if (copy_to_user(argp, &output, sizeof(output)))
> >> +=09=09return -EFAULT;
> >> +
> >> +=09return 0;
> >> +}
> >> +
> >> +#if IS_ENABLED(CONFIG_AMD_PMF_UTIL_SUPPORT)
> >> +static struct amd_pmf_dev *pmf_dev_handle;
> >> +static DEFINE_MUTEX(pmf_util_lock);
> >> +
> >> +static long amd_pmf_set_ioctl(struct file *filp, unsigned int cmd, un=
signed long arg)
> >> +{
> >> +=09struct amd_pmf_dev *pdev =3D filp->private_data;
> >> +=09void __user *argp =3D (void __user *)arg;
> >> +
> >> +=09if (cmd !=3D IOCTL_PMF_POPULATE_DATA)
> >> +=09=09return -EINVAL;
> >> +
> >> +=09guard(mutex)(&pmf_util_lock);
> >> +=09return amd_pmf_populate_data(pdev->dev, argp);
> >> +}
> >> +
> >> +static int amd_pmf_open(struct inode *inode, struct file *filp)
> >> +{
> >> +=09guard(mutex)(&pmf_util_lock);
> >> +=09if (!pmf_dev_handle)
> >> +=09=09return -ENODEV;
> >> +
> >> +=09filp->private_data =3D pmf_dev_handle;
> >> +=09return 0;
> >> +}
> >> +
> >> +static const struct file_operations pmf_if_ops =3D {
> >> +=09.owner          =3D THIS_MODULE,
> >> +=09.open           =3D amd_pmf_open,
> >> +=09.unlocked_ioctl =3D amd_pmf_set_ioctl,
> >> +};
> >> +
> >> +static struct miscdevice amd_pmf_util_if =3D {
> >> +=09.minor=09=09=3D MISC_DYNAMIC_MINOR,
> >> +=09.name=09=09=3D "amdpmf_interface",
> >> +=09.fops=09=09=3D &pmf_if_ops,
> >> +};
> >> +
> >> +int amd_pmf_cdev_register(struct amd_pmf_dev *dev)
> >> +{
> >> +=09int ret;
> >> +
> >> +=09guard(mutex)(&pmf_util_lock);
> >> +=09pmf_dev_handle =3D dev;
> >> +=09ret =3D misc_register(&amd_pmf_util_if);
> >> +=09if (ret)
> >> +=09=09pmf_dev_handle =3D NULL;
> >> +
> >> +=09return ret;
> >> +}
> >> +
> >> +void amd_pmf_cdev_unregister(void)
> >> +{
> >> +=09guard(mutex)(&pmf_util_lock);
> >> +=09pmf_dev_handle =3D NULL;
> >> +=09misc_deregister(&amd_pmf_util_if);
> >> +}
> >> +#else
> >> +int amd_pmf_cdev_register(struct amd_pmf_dev *dev) { return 0; }
> >> +void amd_pmf_cdev_unregister(void) {}
> >> +#endif
> >> diff --git a/include/uapi/linux/amd-pmf.h b/include/uapi/linux/amd-pmf=
=2Eh
> >> new file mode 100644
> >> index 000000000000..d29431c67eaa
> >> --- /dev/null
> >> +++ b/include/uapi/linux/amd-pmf.h
> >> @@ -0,0 +1,115 @@
> >> +/* SPDX-License-Identifier: GPL-2.0-or-later WITH Linux-syscall-note =
*/
> >> +/*
> >> + * AMD Platform Management Framework (PMF) UAPI Header
> >> + *
> >> + * Copyright (c) 2026, Advanced Micro Devices, Inc.
> >> + * All Rights Reserved.
> >> + *
> >> + * This file defines the user-space API for interacting with the AMD =
PMF
> >> + * driver. It provides ioctl interfaces to query platform-specific me=
trics
> >> + * such as power source, slider position, platform type, laptop place=
ment,
> >> + * and various BIOS input/output parameters.
> >> + */
> >> +
> >> +#ifndef _UAPI_LINUX_AMD_PMF_H
> >> +#define _UAPI_LINUX_AMD_PMF_H
> >> +
> >> +#include <linux/ioctl.h>
> >> +#include <linux/types.h>
> >> +
> >> +/**
> >> + * AMD_PMF_IOC_MAGIC - Magic number for AMD PMF ioctl commands
> >> + *
> >> + * This magic number uniquely identifies AMD PMF ioctl operations.
> >> + */
> >> +#define AMD_PMF_IOC_MAGIC=09'p'
> >> +
> >> +/**
> >> + * IOCTL_PMF_POPULATE_DATA - ioctl command to retrieve PMF metrics da=
ta
> >> + *
> >> + * This ioctl command is used to populate the amd_pmf_ioctl_info stru=
cture
> >> + * with the requested metrics data based on the control_code provided=
=2E
> >> + */
> >> +#define IOCTL_PMF_POPULATE_DATA=09=09_IOWR(AMD_PMF_IOC_MAGIC, 0x00, s=
truct amd_pmf_ioctl_info)
> >> +
> >> +/**
> >> + * enum pmf_ioctl_id - Control codes for PMF ioctl operations
> >> + * @IOCTL_POWER_SOURCE: Query current power source (AC/DC)
> >> + * @IOCTL_POWER_SLIDER_POSITION: Query current power slider position
> >> + * @IOCTL_PLATFORM_TYPE: Query current platform/form factor type
> >> + * @IOCTL_LAPTOP_PLACEMENT: Query laptop physical placement state
> >> + * @IOCTL_LID_STATE: Query laptop lid open/close state
> >> + * @IOCTL_HETERO_STATE: Query heterogeneous computing state
> >> + * @IOCTL_SKIN_TEMP: Query skin temperature sensor reading
> >> + * @IOCTL_USER_PRESENCE: Query user presence detection state
> >> + * @IOCTL_DISPLAY_NUM: Query number of active displays
> >> + * @IOCTL_USER_ENGAGED: Query user engagement state
> >> + * @IOCTL_BIOS_INPUT_1: Query BIOS input parameter 1
> >> + * @IOCTL_BIOS_INPUT_2: Query BIOS input parameter 2
> >> + * @IOCTL_BIOS_INPUT_3: Query BIOS input parameter 3
> >> + * @IOCTL_BIOS_INPUT_4: Query BIOS input parameter 4
> >> + * @IOCTL_BIOS_INPUT_5: Query BIOS input parameter 5
> >> + * @IOCTL_BIOS_INPUT_6: Query BIOS input parameter 6
> >> + * @IOCTL_BIOS_INPUT_7: Query BIOS input parameter 7
> >> + * @IOCTL_BIOS_INPUT_8: Query BIOS input parameter 8
> >> + * @IOCTL_BIOS_INPUT_9: Query BIOS input parameter 9
> >> + * @IOCTL_BIOS_INPUT_10: Query BIOS input parameter 10
> >> + * @IOCTL_GFX_WORKLOAD: Query current graphics workload type
> >> + * @IOCTL_AMBIENT_LIGHT: Query ambient light sensor reading
> >> + * @IOCTL_AVG_C0_RES: Query average C0 residency
> >> + * @IOCTL_MAX_C0_RES: Query maximum C0 residency
> >> + * @IOCTL_SOCKET_POWER: Query current socket power consumption
> >> + * @IOCTL_TA_BIN_VER: Query Trusted Application binary version
> >> + *
> >> + * These control codes are used with the IOCTL_PMF_POPULATE_DATA ioct=
l
> >> + * to specify which metrics data to retrieve from the AMD PMF driver.
> >> + */
> >> +enum pmf_ioctl_id {
> >> +=09IOCTL_POWER_SOURCE,
> >> +=09IOCTL_POWER_SLIDER_POSITION,
> >> +=09IOCTL_PLATFORM_TYPE,
> >> +=09IOCTL_LAPTOP_PLACEMENT,
> >> +=09IOCTL_LID_STATE,
> >> +=09IOCTL_HETERO_STATE,
> >> +=09IOCTL_SKIN_TEMP,
> >> +=09IOCTL_USER_PRESENCE,
> >> +=09IOCTL_DISPLAY_NUM,
> >> +=09IOCTL_USER_ENGAGED,
> >> +=09IOCTL_BIOS_INPUT_1,
> >> +=09IOCTL_BIOS_INPUT_2,
> >> +=09IOCTL_BIOS_INPUT_3,
> >> +=09IOCTL_BIOS_INPUT_4,
> >> +=09IOCTL_BIOS_INPUT_5,
> >> +=09IOCTL_BIOS_INPUT_6,
> >> +=09IOCTL_BIOS_INPUT_7,
> >> +=09IOCTL_BIOS_INPUT_8,
> >> +=09IOCTL_BIOS_INPUT_9,
> >> +=09IOCTL_BIOS_INPUT_10,
> >> +=09IOCTL_GFX_WORKLOAD,
> >> +=09IOCTL_AMBIENT_LIGHT =3D 29,
> >> +=09IOCTL_AVG_C0_RES =3D 36,
> >> +=09IOCTL_MAX_C0_RES,
> >> +=09IOCTL_SOCKET_POWER =3D 50,
> >> +=09IOCTL_TA_BIN_VER
> >> +};
> >> +
> >> +/**
> >> + * struct amd_pmf_ioctl_info - Structure for PMF ioctl data exchange
> >> + * @control_code: Input parameter specifying which data to query (enu=
m pmf_ioctl_id)
> >> + * @feature_supported: Output flag indicating if the queried feature =
is supported
> >> + * @feature_version: Output field containing the feature version numb=
er
> >> + * @val: Output field containing the queried value
> >> + *
> >> + * This structure is used with the IOCTL_PMF_POPULATE_DATA ioctl comm=
and
> >> + * to exchange data between user space and the AMD PMF kernel driver.
> >> + * The user provides the control_code to specify the query type, and =
the
> >> + * driver populates the remaining fields with the response data.
> >> + */
> >> +struct amd_pmf_ioctl_info {
> >> +=09int control_code; /* In */
> >> +=09bool feature_supported; /* Out */
> >> +=09unsigned long feature_version; /* Out */
> >> +=09long long val; /* Out */
> >=20
> > I somehow seem to now recall that Hans suggested that the interface sho=
uld=20
> > be a struct which encodes many/all values...
> >=20
> > Yes, it seems so. This is what he said:
> >=20
> > https://lore.kernel.org/all/6104959e-0214-492d-8ceb-c7376d3b1121@kernel=
=2Eorg/
> >=20
> >=20
>=20
> Double chekcing - You mean to say, I should move the enum members into
> the amd_pmf_ioctl_info struct? i.e.
>=20
> struct amd_pmf_ioctl_info {
>     /* Size field for versioning - must be first */
>     u64 size;
>=20
>     /* Version and feature info */
>     __u32 version;
>     __u32 features_supported;
>     __u32 features_enabled;
>     __u32 platform_type;
>=20
>     /* Power and state info */
>     __u32 power_source;
>     __u32 laptop_placement;
>     __u32 lid_state;
>     __u32 user_presence;
>     __u32 slider_position;
>=20
>     /* Thermal and power metrics */
>     __s32 skin_temp;
>     __u32 gfx_busy;
>     __s32 ambient_light;
>     __u32 avg_c0_residency;
>     __u32 max_c0_residency;
>     __u32 socket_power;
>=20
> ...
>=20
>     /* BIOS parameters */
>     __s64 bios_input[10];
>     __s64 bios_output[10];
>=20
> ...
>=20
>     /* Reserved for future expansion */
>     __u64 reserved[8];
> };

Yes, the point was that a result of the query covers more than one=20
value (all of them).

--=20
 i.
--8323328-1156116031-1774883435=:968--
