Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E90035AC07
	for <platform-driver-x86@vger.kernel.org>; Fri, 10 Jul 2026 18:07:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783706839; cv=none; b=cNzjzX1zXzGBfpa+cDMYqTu4hd2wpnMejzvQpd9Aix8TUN3dL4MnMgu9V0NxktafdeGs4Uxapia2eXAPlJlPQIRUZxL7O1wmvM6in847WGlj1hIxmUDE65eHp0HpjxYezbYou7ivL/Q67jIvP5fgPMFqLC9z0iSx93FvFc8PUp0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783706839; c=relaxed/simple;
	bh=9aeQ5iiiYghxqlW0ttzVw097SJHvMbmjKlZMnsA7HdY=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=tWY/ahvna+PaC+6/Bilj3KJPMRwpUGfJ5/tx1I5uo6a3CppX/nSs9ZVr4MvOOzno5BaGL0eFdYXjPbMwJNTAWJJU6UYUOG3LsTInwZWCMWq/Sciswzjh5IgRLGWs6jbpMkMcPx/1dkBdkiByPRB661i7PbdrUtgJ7yUPWXuxsAg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kvbYdw2e; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kvbYdw2e"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1783706837; x=1815242837;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=9aeQ5iiiYghxqlW0ttzVw097SJHvMbmjKlZMnsA7HdY=;
  b=kvbYdw2eSxLLSHgWNP/ASXMwEsqPCobXiJydQE3sVgiSsivysKDx/1ql
   xWtoOGHOdjtcXmhMans+m/B+GfTn9DaC2ecMMgo0jxqQINV4fMyX6yCkP
   uFWnH6WzynXEbGszN1uX3TRJtJxfVHt9QpbP9aUe1E4MIW3itGFxUYF79
   gbba8kO9VmUTQ3oY5HPcCuLH6XV3Gl2079wmb98HqJ2ouz9cvz9DHjS4s
   kBcTLVNR0fjfPKXkYHnvO+I4yUC89Fn9/FsJDSXr8LTYlDid4a9TVR/QQ
   FucwU6AVMEcB8Hebf55eVfrCoOl6e5QnXRalViQasf2nVxDm2g4NMec1c
   w==;
X-CSE-ConnectionGUID: QqyjRwYBTD+/6ul/tyGStg==
X-CSE-MsgGUID: C2otCEijTuG+DxTjpe5eyw==
X-IronPort-AV: E=McAfee;i="6800,10657,11841"; a="95562977"
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; 
   d="scan'208";a="95562977"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jul 2026 11:07:08 -0700
X-CSE-ConnectionGUID: Mlw77awnT9WfDy/SpE0FIw==
X-CSE-MsgGUID: 6y1qGgWfRlyFQy8MCNIFeQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; 
   d="scan'208";a="250525180"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.169])
  by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jul 2026 11:07:05 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Fri, 10 Jul 2026 21:07:01 +0300 (EEST)
To: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
cc: Hans de Goede <hansg@kernel.org>, platform-driver-x86@vger.kernel.org, 
    Patil.Reddy@amd.com, mario.limonciello@amd.com
Subject: Re: [PATCH 3/5] platform/x86/amd/pmf: Move metrics code to dedicated
 file
In-Reply-To: <cb39c233-d162-b75e-620d-6cfd329f342a@linux.intel.com>
Message-ID: <03079c16-6f6b-cf44-7caf-3507827ace7a@linux.intel.com>
References: <20260710174219.2522269-1-Shyam-sundar.S-k@amd.com> <20260710174219.2522269-4-Shyam-sundar.S-k@amd.com> <cb39c233-d162-b75e-620d-6cfd329f342a@linux.intel.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323328-1106502991-1783706821=:1178"

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323328-1106502991-1783706821=:1178
Content-Type: text/plain; charset=ISO-8859-15
Content-Transfer-Encoding: QUOTED-PRINTABLE

On Fri, 10 Jul 2026, Ilpo J=E4rvinen wrote:

> On Fri, 10 Jul 2026, Shyam Sundar S K wrote:
>=20
> > Refactor metrics related code from core.c into a new metrics.c file
> > to improve code organization and maintainability. The metrics
> > functionality is evolving with new platform support, warranting a
> > separate file.
> >=20
> > No functional changes.
> >=20
> > Co-developed-by: Patil Rajesh Reddy <Patil.Reddy@amd.com>
> > Signed-off-by: Patil Rajesh Reddy <Patil.Reddy@amd.com>
> > Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
> > ---
> >  drivers/platform/x86/amd/pmf/Makefile  |   2 +-
> >  drivers/platform/x86/amd/pmf/core.c    | 156 +--------------------
> >  drivers/platform/x86/amd/pmf/metrics.c | 179 +++++++++++++++++++++++++
> >  drivers/platform/x86/amd/pmf/pmf.h     |   3 +
> >  4 files changed, 185 insertions(+), 155 deletions(-)
> >  create mode 100644 drivers/platform/x86/amd/pmf/metrics.c
> >=20
> > diff --git a/drivers/platform/x86/amd/pmf/Makefile b/drivers/platform/x=
86/amd/pmf/Makefile
> > index bf7aad80b9e9..8cac51182433 100644
> > --- a/drivers/platform/x86/amd/pmf/Makefile
> > +++ b/drivers/platform/x86/amd/pmf/Makefile
> > @@ -7,6 +7,6 @@
> >  obj-$(CONFIG_AMD_PMF)=09=09+=3D amd-pmf.o
> >  amd-pmf-y =09=09=09:=3D core.o acpi.o sps.o \
> >  =09=09=09=09   auto-mode.o cnqf.o \
> > -=09=09=09=09   tee-if.o spc.o
> > +=09=09=09=09   tee-if.o spc.o metrics.o
> >  # Build util.c only when AMD_PMF_UTIL_SUPPORT is enabled
> >  amd-pmf-$(CONFIG_AMD_PMF_UTIL_SUPPORT) +=3D util.o
> > diff --git a/drivers/platform/x86/amd/pmf/core.c b/drivers/platform/x86=
/amd/pmf/core.c
> > index 7c5a1ec3d7fc..c0a21808b867 100644
> > --- a/drivers/platform/x86/amd/pmf/core.c
> > +++ b/drivers/platform/x86/amd/pmf/core.c
> > @@ -55,7 +55,7 @@
> >  #define DELAY_MAX_US=093000
> > =20
> >  /* override Metrics Table sample size time (in ms) */
> > -static int metrics_table_loop_ms =3D 1000;
> > +int metrics_table_loop_ms =3D 1000;
> >  module_param(metrics_table_loop_ms, int, 0644);
> >  MODULE_PARM_DESC(metrics_table_loop_ms, "Metrics Table sample size tim=
e (default =3D 1000ms)");
> > =20
> > @@ -68,8 +68,6 @@ static bool smart_pc_support =3D true;
> >  module_param(smart_pc_support, bool, 0444);
> >  MODULE_PARM_DESC(smart_pc_support, "Smart PC Support (default =3D true=
)");
> > =20
> > -static struct device *pmf_device;
> > -
> >  static int amd_pmf_pwr_src_notify_call(struct notifier_block *nb, unsi=
gned long event, void *data)
> >  {
> >  =09struct amd_pmf_dev *pmf =3D container_of(nb, struct amd_pmf_dev, pw=
r_src_notifier);
> > @@ -138,37 +136,6 @@ int amd_pmf_get_power_source(void)
> >  =09=09return POWER_SOURCE_DC;
> >  }
> > =20
> > -static void amd_pmf_get_metrics(struct work_struct *work)
> > -{
> > -=09struct amd_pmf_dev *dev =3D container_of(work, struct amd_pmf_dev, =
work_buffer.work);
> > -=09ktime_t time_elapsed_ms;
> > -=09int socket_power;
> > -
> > -=09guard(mutex)(&dev->update_mutex);
> > -
> > -=09/* Transfer table contents */
> > -=09memset(dev->buf, 0, sizeof(dev->m_table));
> > -=09amd_pmf_send_cmd(dev, SET_TRANSFER_TABLE, SET_CMD, METRICS_TABLE_ID=
, NULL);
> > -=09memcpy(&dev->m_table, dev->buf, sizeof(dev->m_table));
> > -
> > -=09time_elapsed_ms =3D ktime_to_ms(ktime_get()) - dev->start_time;
> > -=09/* Calculate the avg SoC power consumption */
> > -=09socket_power =3D dev->m_table.apu_power + dev->m_table.dgpu_power;
> > -
> > -=09if (dev->amt_enabled) {
> > -=09=09/* Apply the Auto Mode transition */
> > -=09=09amd_pmf_trans_automode(dev, socket_power, time_elapsed_ms);
> > -=09}
> > -
> > -=09if (dev->cnqf_enabled) {
> > -=09=09/* Apply the CnQF transition */
> > -=09=09amd_pmf_trans_cnqf(dev, socket_power, time_elapsed_ms);
> > -=09}
> > -
> > -=09dev->start_time =3D ktime_to_ms(ktime_get());
> > -=09schedule_delayed_work(&dev->work_buffer, msecs_to_jiffies(metrics_t=
able_loop_ms));
> > -}
> > -
> >  static inline u32 amd_pmf_reg_read(struct amd_pmf_dev *dev, int reg_of=
fset)
> >  {
> >  =09return ioread32(dev->regbase + reg_offset);
> > @@ -297,125 +264,6 @@ static const struct pci_device_id pmf_pci_ids[] =
=3D {
> >  =09{ }
> >  };
> > =20
> > -int amd_pmf_set_dram_addr(struct amd_pmf_dev *dev, bool alloc_buffer)
> > -{
> > -=09u64 phys_addr;
> > -=09u32 hi, low;
> > -
> > -=09/* Get Metrics Table Address */
> > -=09if (alloc_buffer) {
> > -=09=09switch (dev->cpu_id) {
> > -=09=09case AMD_CPU_ID_PS:
> > -=09=09case AMD_CPU_ID_RMB:
> > -=09=09=09dev->mtable_size =3D sizeof(dev->m_table);
> > -=09=09=09break;
> > -=09=09case PCI_DEVICE_ID_AMD_1AH_M20H_ROOT:
> > -=09=09case PCI_DEVICE_ID_AMD_1AH_M60H_ROOT:
> > -=09=09=09dev->mtable_size =3D sizeof(dev->m_table_v2);
> > -=09=09=09break;
> > -=09=09default:
> > -=09=09=09dev_err(dev->dev, "Invalid CPU id: 0x%x", dev->cpu_id);
> > -=09=09}
> > -
> > -=09=09dev->buf =3D devm_kzalloc(dev->dev, dev->mtable_size, GFP_KERNEL=
);
> > -=09=09if (!dev->buf)
> > -=09=09=09return -ENOMEM;
> > -=09}
> > -
> > -=09phys_addr =3D virt_to_phys(dev->buf);
> > -=09hi =3D phys_addr >> 32;
> > -=09low =3D phys_addr & GENMASK(31, 0);
> > -
> > -=09amd_pmf_send_cmd(dev, SET_DRAM_ADDR_HIGH, SET_CMD, hi, NULL);
> > -=09amd_pmf_send_cmd(dev, SET_DRAM_ADDR_LOW, SET_CMD, low, NULL);
> > -
> > -=09return 0;
> > -}
> > -
> > -int amd_pmf_init_metrics_table(struct amd_pmf_dev *dev)
> > -{
> > -=09int ret;
> > -
> > -=09INIT_DELAYED_WORK(&dev->work_buffer, amd_pmf_get_metrics);
> > -
> > -=09ret =3D amd_pmf_set_dram_addr(dev, true);
> > -=09if (ret)
> > -=09=09return ret;
> > -
> > -=09/*
> > -=09 * Start collecting the metrics data after a small delay
> > -=09 * or else, we might end up getting stale values from PMFW.
> > -=09 */
> > -=09schedule_delayed_work(&dev->work_buffer, msecs_to_jiffies(metrics_t=
able_loop_ms * 3));
> > -
> > -=09return 0;
> > -}
> > -
> > -static int is_npu_metrics_supported(struct amd_pmf_dev *pdev)
> > -{
> > -=09switch (pdev->cpu_id) {
> > -=09case PCI_DEVICE_ID_AMD_1AH_M20H_ROOT:
> > -=09case PCI_DEVICE_ID_AMD_1AH_M60H_ROOT:
> > -=09=09return 0;
> > -=09default:
> > -=09=09return -EOPNOTSUPP;
> > -=09}
> > -}
> > -
> > -static int amd_pmf_get_smu_metrics(struct amd_pmf_dev *dev, struct amd=
_pmf_npu_metrics *data)
> > -{
> > -=09int ret, i;
> > -
> > -=09guard(mutex)(&dev->metrics_mutex);
> > -
> > -=09ret =3D is_npu_metrics_supported(dev);
> > -=09if (ret)
> > -=09=09return ret;
> > -
> > -=09ret =3D amd_pmf_set_dram_addr(dev, true);
> > -=09if (ret)
> > -=09=09return ret;
> > -
> > -=09memset(dev->buf, 0, dev->mtable_size);
> > -
> > -=09/* Send SMU command to get NPU metrics */
> > -=09ret =3D amd_pmf_send_cmd(dev, SET_TRANSFER_TABLE, SET_CMD, METRICS_=
TABLE_ID, NULL);
> > -=09if (ret) {
> > -=09=09dev_err(dev->dev, "SMU command failed to get NPU metrics: %d\n",=
 ret);
> > -=09=09return ret;
> > -=09}
> > -
> > -=09memcpy(&dev->m_table_v2, dev->buf, dev->mtable_size);
> > -
> > -=09data->npuclk_freq =3D dev->m_table_v2.npuclk_freq;
> > -=09for (i =3D 0; i < ARRAY_SIZE(data->npu_busy); i++)
> > -=09=09data->npu_busy[i] =3D dev->m_table_v2.npu_busy[i];
> > -=09data->npu_power =3D dev->m_table_v2.npu_power;
> > -=09data->mpnpuclk_freq =3D dev->m_table_v2.mpnpuclk_freq;
> > -=09data->npu_reads =3D dev->m_table_v2.npu_reads;
> > -=09data->npu_writes =3D dev->m_table_v2.npu_writes;
> > -
> > -=09return 0;
> > -}
> > -
> > -int amd_pmf_get_npu_data(struct amd_pmf_npu_metrics *info)
> > -{
> > -=09struct amd_pmf_dev *pdev;
> > -
> > -=09if (!info)
> > -=09=09return -EINVAL;
> > -
> > -=09if (!pmf_device)
> > -=09=09return -ENODEV;
> > -
> > -=09pdev =3D dev_get_drvdata(pmf_device);
> > -=09if (!pdev)
> > -=09=09return -ENODEV;
> > -
> > -=09return amd_pmf_get_smu_metrics(pdev, info);
> > -}
> > -EXPORT_SYMBOL_NS_GPL(amd_pmf_get_npu_data, "AMD_PMF");
> > -
> >  static int amd_pmf_reinit_ta(struct amd_pmf_dev *pdev)
> >  {
> >  =09bool status;
> > @@ -678,7 +526,7 @@ static int amd_pmf_probe(struct platform_device *pd=
ev)
> >  =09if (is_apmf_func_supported(dev, APMF_FUNC_SBIOS_HEARTBEAT_V2))
> >  =09=09amd_pmf_notify_sbios_heartbeat_event_v2(dev, ON_LOAD);
> > =20
> > -=09pmf_device =3D dev->dev;
> > +=09amd_pmf_set_device(dev->dev);
> > =20
> >  =09err =3D amd_pmf_cdev_register(dev);
> >  =09if (err)
> > diff --git a/drivers/platform/x86/amd/pmf/metrics.c b/drivers/platform/=
x86/amd/pmf/metrics.c
> > new file mode 100644
> > index 000000000000..bb4f9127c655
> > --- /dev/null
> > +++ b/drivers/platform/x86/amd/pmf/metrics.c
> > @@ -0,0 +1,179 @@
> > +// SPDX-License-Identifier: GPL-2.0-or-later
> > +/*
> > + * AMD Platform Management Framework Driver - Metrics Support
> > + *
> > + * Copyright (c) 2026, Advanced Micro Devices, Inc.
> > + * All Rights Reserved.
> > + *
> > + * Authors: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
> > + *=09    Patil Rajesh Reddy <Patil.Reddy@amd.com>
> > + */
> > +
> > +#include <linux/bits.h>
> > +#include <linux/cleanup.h>
> > +#include <linux/container_of.h>
> > +#include <linux/device.h>
> > +#include <linux/device/devres.h>
> > +#include <linux/io.h>
> > +#include <linux/ktime.h>
> > +#include <linux/string.h>
> > +#include <linux/workqueue.h>
> > +
> > +#include "pmf.h"
> > +
> > +static struct device *pmf_device;
> > +
> > +static void amd_pmf_get_metrics(struct work_struct *work)
> > +{
> > +=09struct amd_pmf_dev *dev =3D container_of(work, struct amd_pmf_dev, =
work_buffer.work);
> > +=09ktime_t time_elapsed_ms;
> > +=09int socket_power;
> > +
> > +=09guard(mutex)(&dev->update_mutex);
> > +
> > +=09/* Transfer table contents */
> > +=09memset(dev->buf, 0, sizeof(dev->m_table));
> > +=09amd_pmf_send_cmd(dev, SET_TRANSFER_TABLE, SET_CMD, METRICS_TABLE_ID=
, NULL);
> > +=09memcpy(&dev->m_table, dev->buf, sizeof(dev->m_table));
> > +
> > +=09time_elapsed_ms =3D ktime_to_ms(ktime_get()) - dev->start_time;
> > +=09/* Calculate the avg SoC power consumption */
> > +=09socket_power =3D dev->m_table.apu_power + dev->m_table.dgpu_power;
> > +
> > +=09if (dev->amt_enabled) {
> > +=09=09/* Apply the Auto Mode transition */
> > +=09=09amd_pmf_trans_automode(dev, socket_power, time_elapsed_ms);
> > +=09}
> > +
> > +=09if (dev->cnqf_enabled) {
> > +=09=09/* Apply the CnQF transition */
> > +=09=09amd_pmf_trans_cnqf(dev, socket_power, time_elapsed_ms);
> > +=09}
> > +
> > +=09dev->start_time =3D ktime_to_ms(ktime_get());
> > +=09schedule_delayed_work(&dev->work_buffer, msecs_to_jiffies(metrics_t=
able_loop_ms));
> > +}
> > +
> > +int amd_pmf_set_dram_addr(struct amd_pmf_dev *dev, bool alloc_buffer)
> > +{
> > +=09u64 phys_addr;
> > +=09u32 hi, low;
> > +
> > +=09/* Get Metrics Table Address */
> > +=09if (alloc_buffer) {
> > +=09=09switch (dev->cpu_id) {
> > +=09=09case AMD_CPU_ID_PS:
> > +=09=09case AMD_CPU_ID_RMB:
> > +=09=09=09dev->mtable_size =3D sizeof(dev->m_table);
> > +=09=09=09break;
> > +=09=09case PCI_DEVICE_ID_AMD_1AH_M20H_ROOT:
> > +=09=09case PCI_DEVICE_ID_AMD_1AH_M60H_ROOT:
> > +=09=09=09dev->mtable_size =3D sizeof(dev->m_table_v2);
> > +=09=09=09break;
> > +=09=09default:
> > +=09=09=09dev_err(dev->dev, "Invalid CPU id: 0x%x", dev->cpu_id);
> > +=09=09}
> > +
> > +=09=09dev->buf =3D devm_kzalloc(dev->dev, dev->mtable_size, GFP_KERNEL=
);
> > +=09=09if (!dev->buf)
> > +=09=09=09return -ENOMEM;
> > +=09}
> > +
> > +=09phys_addr =3D virt_to_phys(dev->buf);
> > +=09hi =3D phys_addr >> 32;
> > +=09low =3D phys_addr & GENMASK(31, 0);
>=20
> upper/lower_32_bits(). Don't forget to add the header.

Ah, this was a move patch so you may want to do that conversion in own=20
patch (it will be easier for me to review moves using diff trickery if=20
there is as little other changes as possible).

--
 i.

> > +
> > +=09amd_pmf_send_cmd(dev, SET_DRAM_ADDR_HIGH, SET_CMD, hi, NULL);
> > +=09amd_pmf_send_cmd(dev, SET_DRAM_ADDR_LOW, SET_CMD, low, NULL);
> > +
> > +=09return 0;
> > +}
> > +
> > +int amd_pmf_init_metrics_table(struct amd_pmf_dev *dev)
> > +{
> > +=09int ret;
> > +
> > +=09INIT_DELAYED_WORK(&dev->work_buffer, amd_pmf_get_metrics);
> > +
> > +=09ret =3D amd_pmf_set_dram_addr(dev, true);
> > +=09if (ret)
> > +=09=09return ret;
> > +
> > +=09/*
> > +=09 * Start collecting the metrics data after a small delay
> > +=09 * or else, we might end up getting stale values from PMFW.
> > +=09 */
> > +=09schedule_delayed_work(&dev->work_buffer, msecs_to_jiffies(metrics_t=
able_loop_ms * 3));
> > +
> > +=09return 0;
> > +}
> > +
> > +void amd_pmf_set_device(struct device *p_device)
> > +{
> > +=09pmf_device =3D p_device;
> > +}
> > +
> > +static int is_npu_metrics_supported(struct amd_pmf_dev *pdev)
> > +{
> > +=09switch (pdev->cpu_id) {
> > +=09case PCI_DEVICE_ID_AMD_1AH_M20H_ROOT:
> > +=09case PCI_DEVICE_ID_AMD_1AH_M60H_ROOT:
> > +=09=09return 0;
> > +=09default:
> > +=09=09return -EOPNOTSUPP;
> > +=09}
> > +}
> > +
> > +static int amd_pmf_get_smu_metrics(struct amd_pmf_dev *dev, struct amd=
_pmf_npu_metrics *data)
> > +{
> > +=09int ret, i;
> > +
> > +=09guard(mutex)(&dev->metrics_mutex);
> > +
> > +=09ret =3D is_npu_metrics_supported(dev);
> > +=09if (ret)
> > +=09=09return ret;
> > +
> > +=09ret =3D amd_pmf_set_dram_addr(dev, true);
> > +=09if (ret)
> > +=09=09return ret;
> > +
> > +=09memset(dev->buf, 0, dev->mtable_size);
> > +
> > +=09/* Send SMU command to get NPU metrics */
> > +=09ret =3D amd_pmf_send_cmd(dev, SET_TRANSFER_TABLE, SET_CMD, METRICS_=
TABLE_ID, NULL);
> > +=09if (ret) {
> > +=09=09dev_err(dev->dev, "SMU command failed to get NPU metrics: %d\n",=
 ret);
> > +=09=09return ret;
> > +=09}
> > +
> > +=09memcpy(&dev->m_table_v2, dev->buf, dev->mtable_size);
> > +
> > +=09data->npuclk_freq =3D dev->m_table_v2.npuclk_freq;
> > +=09for (i =3D 0; i < ARRAY_SIZE(data->npu_busy); i++)
>=20
> Typically developers always forget these, ARRAY_SIZE() and dev_*()=20
> printing need headers.
>=20
> Check also types.h. I had 4th one in my mind but seem to have forgotten i=
t=20
> while typing...
>=20
> > +=09=09data->npu_busy[i] =3D dev->m_table_v2.npu_busy[i];
> > +=09data->npu_power =3D dev->m_table_v2.npu_power;
> > +=09data->mpnpuclk_freq =3D dev->m_table_v2.mpnpuclk_freq;
> > +=09data->npu_reads =3D dev->m_table_v2.npu_reads;
> > +=09data->npu_writes =3D dev->m_table_v2.npu_writes;
> > +
> > +=09return 0;
> > +}
> > +
> > +int amd_pmf_get_npu_data(struct amd_pmf_npu_metrics *info)
> > +{
> > +=09struct amd_pmf_dev *pdev;
> > +
> > +=09if (!info)
> > +=09=09return -EINVAL;
> > +
> > +=09if (!pmf_device)
> > +=09=09return -ENODEV;
> > +
> > +=09pdev =3D dev_get_drvdata(pmf_device);
> > +=09if (!pdev)
> > +=09=09return -ENODEV;
> > +
> > +=09return amd_pmf_get_smu_metrics(pdev, info);
> > +}
> > +EXPORT_SYMBOL_NS_GPL(amd_pmf_get_npu_data, "AMD_PMF");
> > diff --git a/drivers/platform/x86/amd/pmf/pmf.h b/drivers/platform/x86/=
amd/pmf/pmf.h
> > index 088edfab08f0..4873685c84ad 100644
> > --- a/drivers/platform/x86/amd/pmf/pmf.h
> > +++ b/drivers/platform/x86/amd/pmf/pmf.h
> > @@ -137,6 +137,8 @@ struct cookie_header {
> >  #define METRICS_TABLE_ID=097
> >  #define BIOS_OUTPUT_MAX=09=0910
> > =20
> > +extern int metrics_table_loop_ms;
> > +
> >  typedef void (*apmf_event_handler_t)(acpi_handle handle, u32 event, vo=
id *data);
> > =20
> >  static const uuid_t amd_pmf_ta_uuid[] __used =3D { UUID_INIT(0xd9b39bf=
2, 0x66bd, 0x4154, 0xaf, 0xb8,
> > @@ -864,6 +866,7 @@ int amd_pmf_set_dram_addr(struct amd_pmf_dev *dev, =
bool alloc_buffer);
> >  int amd_pmf_notify_sbios_heartbeat_event_v2(struct amd_pmf_dev *dev, u=
8 flag);
> >  u32 fixp_q88_fromint(u32 val);
> >  int is_apmf_bios_input_notifications_supported(struct amd_pmf_dev *pde=
v);
> > +void amd_pmf_set_device(struct device *p_device);
> > =20
> >  /* SPS Layer */
> >  int amd_pmf_get_pprof_modes(struct amd_pmf_dev *pmf);
> >=20
>=20
>=20
--8323328-1106502991-1783706821=:1178--
