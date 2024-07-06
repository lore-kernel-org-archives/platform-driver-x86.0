Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 561EA6A33A
	for <platform-driver-x86@vger.kernel.org>; Sat,  6 Jul 2024 13:32:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720272722; cv=none; b=pSHjBS/BGlq/6du6nhWqduFwxbaxf/UlXRAx6yaCyTxPuOROt7fDdlokPzay4fI+yulVR0UJEIn7VC7jaYHR/T9r51qEf3GgDuSUi44ij7SVf3gqcAt7A012ZIi4H08swzo84Z9EkF9O02hXlyzH26ZevktEzFcThzj7MfIgEmU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720272722; c=relaxed/simple;
	bh=ZhH+lB8/ZbbcXbDhd1ruikCeO+Ks2bilp6M42Ew+R2A=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=O0R+Zv0Ui9zfT6uDrfBtyn89SyJ6FxGMzEzSszPkXOJDz2pERvZU71KQ593ZrrR5Tzu65kIIla9PPd+iLg/Cj5HtxIKYW57x2QFpccRzpiuiTbGYSDtAS/Z9peiNrnY/un6Qm66SPgcNL20h7z9JKNe7WE3+IgbFrvEP4Cne7ls=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=CK3FlPCP; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CK3FlPCP"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1720272720; x=1751808720;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version:content-id;
  bh=ZhH+lB8/ZbbcXbDhd1ruikCeO+Ks2bilp6M42Ew+R2A=;
  b=CK3FlPCP+wIcBFmpbVSNujqEL8+vvOhdGS0Kye5end7hg91tl+1JK4rg
   gFaWeKEyc5jtFD+M2f5qZUFexVTbvzBHJdwXuivGRA4v0KoH5tqluGEDY
   h0Jpi/OZ8+8194RhydQBZ64VY+OWu1CoQdm8+AEUQnXVi8lxss1OT36vs
   k4XeW1bYZ64hkWjTLnwAPU+MTaQ1YHR2UTGhOY9A3I/sQCHFVFmpJY24A
   n0x9L0/smJXUDSPh2WspGYodNp6b4q9ZEMnv+Uf0/3G0F6unyTNkS3E2j
   DD93kWMQkQy0Z8HA86VNxTpeSMQ0M/GfKxYUqD6RbIH6MQkbW1DPbIh/h
   Q==;
X-CSE-ConnectionGUID: yeeirZNJRSa5HSGKLn/9CQ==
X-CSE-MsgGUID: JPETCBc+TKKWNvJGl1ATBQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11125"; a="17663833"
X-IronPort-AV: E=Sophos;i="6.09,187,1716274800"; 
   d="scan'208";a="17663833"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Jul 2024 06:32:00 -0700
X-CSE-ConnectionGUID: WkHh+OPAQGGC+BEpK6H7nA==
X-CSE-MsgGUID: XzVcF9umReWF5YCb+ixKog==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,187,1716274800"; 
   d="scan'208";a="47820586"
Received: from ijarvine-desk1.ger.corp.intel.com (HELO localhost) ([10.245.247.111])
  by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Jul 2024 06:31:57 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Sat, 6 Jul 2024 16:31:53 +0300 (EEST)
To: "Michael J. Ruhl" <michael.j.ruhl@intel.com>
cc: intel-xe@lists.freedesktop.org, platform-driver-x86@vger.kernel.org, 
    david.e.box@linux.intel.com, matthew.brost@intel.com
Subject: Re: [PATCH v5 4/6] drm/xe/vsec: Support BMG devices
In-Reply-To: <20240701141730.3585133-5-michael.j.ruhl@intel.com>
Message-ID: <71c3782f-47af-f351-1399-0e43c2691d40@linux.intel.com>
References: <20240701141730.3585133-1-michael.j.ruhl@intel.com> <20240701141730.3585133-5-michael.j.ruhl@intel.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/mixed; BOUNDARY="8323328-15796492-1720271946=:72188"
Content-ID: <e0b228b9-b710-6392-a455-b099e2a28953@linux.intel.com>

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323328-15796492-1720271946=:72188
Content-Type: text/plain; CHARSET=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Content-ID: <fe8effc8-86b4-3796-f174-354840e68e20@linux.intel.com>

On Mon, 1 Jul 2024, Michael J. Ruhl wrote:

> Utilize the PMT callback API to add support for the BMG
> devices.
>=20
> Signed-off-by: Michael J. Ruhl <michael.j.ruhl@intel.com>
> ---
>  drivers/gpu/drm/xe/Makefile          |   1 +
>  drivers/gpu/drm/xe/xe_device.c       |   5 +
>  drivers/gpu/drm/xe/xe_device_types.h |   6 +
>  drivers/gpu/drm/xe/xe_vsec.c         | 221 +++++++++++++++++++++++++++
>  drivers/gpu/drm/xe/xe_vsec.h         |  13 ++
>  5 files changed, 246 insertions(+)
>  create mode 100644 drivers/gpu/drm/xe/xe_vsec.c
>  create mode 100644 drivers/gpu/drm/xe/xe_vsec.h
>=20
> diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
> index b1e03bfe4a68..5860d6db1598 100644
> --- a/drivers/gpu/drm/xe/Makefile
> +++ b/drivers/gpu/drm/xe/Makefile
> @@ -129,6 +129,7 @@ xe-y +=3D xe_bb.o \
>  =09xe_vm.o \
>  =09xe_vram.o \
>  =09xe_vram_freq.o \
> +=09xe_vsec.o \
>  =09xe_wait_user_fence.o \
>  =09xe_wa.o \
>  =09xe_wopcm.o
> diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_devic=
e.c
> index cfda7cb5df2c..05a666c7bbb7 100644
> --- a/drivers/gpu/drm/xe/xe_device.c
> +++ b/drivers/gpu/drm/xe/xe_device.c
> @@ -53,6 +53,7 @@
>  #include "xe_ttm_sys_mgr.h"
>  #include "xe_vm.h"
>  #include "xe_vram.h"
> +#include "xe_vsec.h"
>  #include "xe_wait_user_fence.h"
> =20
>  static int xe_file_open(struct drm_device *dev, struct drm_file *file)
> @@ -317,6 +318,8 @@ struct xe_device *xe_device_create(struct pci_dev *pd=
ev,
>  =09=09goto err;
>  =09}
> =20
> +=09drmm_mutex_init(&xe->drm, &xe->pmt.lock);
> +
>  =09err =3D xe_display_create(xe);
>  =09if (WARN_ON(err))
>  =09=09goto err;
> @@ -692,6 +695,8 @@ int xe_device_probe(struct xe_device *xe)
>  =09for_each_gt(gt, xe, id)
>  =09=09xe_gt_sanitize_freq(gt);
> =20
> +=09xe_vsec_init(xe);
> +
>  =09return devm_add_action_or_reset(xe->drm.dev, xe_device_sanitize, xe);
> =20
>  err_fini_display:
> diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe=
_device_types.h
> index c37be471d11c..11513d8f3a8b 100644
> --- a/drivers/gpu/drm/xe/xe_device_types.h
> +++ b/drivers/gpu/drm/xe/xe_device_types.h
> @@ -451,6 +451,12 @@ struct xe_device {
>  =09=09struct mutex lock;
>  =09} d3cold;
> =20
> +=09/** @pmt: Support the PMT driver callback interface */
> +=09struct {
> +=09=09/** @pmt.lock: protect access for telemetry data */
> +=09=09struct mutex lock;
> +=09} pmt;
> +
>  =09/**
>  =09 * @pm_callback_task: Track the active task that is running in either
>  =09 * the runtime_suspend or runtime_resume callbacks.
> diff --git a/drivers/gpu/drm/xe/xe_vsec.c b/drivers/gpu/drm/xe/xe_vsec.c
> new file mode 100644
> index 000000000000..dfd42153bc76
> --- /dev/null
> +++ b/drivers/gpu/drm/xe/xe_vsec.c
> @@ -0,0 +1,221 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Copyright =C2=A9 2022 - 2024 Intel Corporation
> + */
> +#include <linux/intel_vsec.h>
> +#include <linux/pci.h>
> +
> +#include "xe_device.h"
> +#include "xe_device_types.h"
> +#include "xe_drv.h"
> +#include "xe_mmio.h"
> +#include "xe_platform_types.h"
> +#include "xe_pm.h"
> +#include "xe_vsec.h"
> +
> +#define SOC_BASE=09=090x280000
> +
> +#define BMG_PMT_BASE=09=090xDB000
> +#define BMG_DISCOVERY_OFFSET=09(SOC_BASE + BMG_PMT_BASE)
> +
> +#define BMG_TELEMETRY_BASE=090xE0000
> +#define BMG_TELEMETRY_OFFSET=09(SOC_BASE + BMG_TELEMETRY_BASE)
> +
> +#define BMG_DEVICE_ID 0xE2F8
> +
> +#define GFX_BAR=09=09=090
> +
> +#define SG_REMAP_INDEX1=09=09XE_REG(SOC_BASE + 0x08)
> +#define SG_REMAP_ACCESS(_mem)=09((_mem) << 24)

Is this perhaps your custom version of FIELD_PREP(SG_REMAP_BITS, _mem)?
If so, just use FIELD_PREP() directly at the only caller.

> +#define SG_REMAP_BITS=09=09GENMASK(31, 24)

Missing include for GENMASK().

> +
> +static struct intel_vsec_header bmg_telemetry =3D {
> +=09.length =3D 0x10,
> +=09.id =3D VSEC_ID_TELEMETRY,
> +=09.num_entries =3D 2,
> +=09.entry_size =3D 4,
> +=09.tbir =3D GFX_BAR,
> +=09.offset =3D BMG_DISCOVERY_OFFSET,
> +};
> +
> +static struct intel_vsec_header *bmg_capabilities[] =3D {
> +=09&bmg_telemetry,
> +=09NULL
> +};
> +
> +enum xe_vsec {
> +=09XE_VSEC_UNKNOWN =3D 0,
> +=09XE_VSEC_BMG,
> +};
> +
> +static struct intel_vsec_platform_info xe_vsec_info[] =3D {
> +=09[XE_VSEC_BMG] =3D {
> +=09=09.caps =3D VSEC_CAP_TELEMETRY,
> +=09=09.headers =3D bmg_capabilities,
> +=09},
> +=09{ }
> +};
> +
> +/* GUID Decode information */
> +#define GUID_TELEM_ITERATION GENMASK(3, 0)
> +#define GUID_SEGMENT GENMASK(7, 4)
> +#define GUID_SOC_SKU GENMASK(11, 8)
> +#define GUID_DEVICE_ID GENMASK(27, 12)
> +#define GUID_CAP_TYPE GENMASK(29, 28)
> +#define GUID_RECORD_ID GENMASK(31, 30)

Please align these with tabs

> +#define PUNIT_TELEMETRY_OFFSET 0x0200
> +#define PUNIT_WATCHER_OFFSET 0X14A0

X -> x

> +#define OOBMSM_0_WATCHER_OFFSET 0x18D8
> +#define OOBMSM_1_TELEMETRY_OFFSET 0x1000

Also align all of these.

> +
> +enum record_id {
> +=09PUNIT,
> +=09OOBMSM_0,
> +=09OOBMSM_1
> +};
> +
> +enum capability {
> +=09CRASHLOG,
> +=09TELEMETRY,
> +=09WATCHER
> +};
> +
> +/*
> + * The GUID will have the following bits to decode (high bits first):
> + *
> + * X(2bits) - Record-ID (0-PUNIT, 1-OOBMSM_0, 2-OOBMSM_1)
> + * X(2bits) - Capability Type (Crashlog-0, Telemetry Aggregator-1, Watch=
er-2)
> + * XXXX(16bits)=E2=80=93 Device ID =E2=80=93 changes for each down bin S=
KU=E2=80=99s (0xE2F8 for BMG)
> + * X(4bits) - SOC_SKU (SKU_INDEPENDENT-0, X3-1, X2-2, G31-3),
> + * X(4bits) - Segment (SEGMENT_INDEPENDENT-0, Client-1, Server-2)
> + * X(4bits) - {Telemetry space iteration number (0,1,..)}

I'd put these where the GENMASK() are defined.

> + *

Extra line

> + */
> +static int guid_decode(u32 guid, int *index, u32 *offset)
> +{
> +=09u32 record_id =3D FIELD_GET(GUID_RECORD_ID, guid);
> +=09u32 cap_type  =3D FIELD_GET(GUID_CAP_TYPE, guid);
> +=09u32 device_id =3D FIELD_GET(GUID_DEVICE_ID, guid);

Missing include for FIELD_GET().

> +
> +=09if (device_id !=3D BMG_DEVICE_ID)
> +=09=09return -ENODEV;
> +
> +=09if (record_id > OOBMSM_1 || cap_type > WATCHER)
> +=09=09return -EINVAL;
> +
> +=09*offset =3D 0;
> +
> +=09if (cap_type =3D=3D CRASHLOG) {
> +=09=09*index =3D record_id =3D=3D PUNIT ? 2 : 4;
> +=09=09return 0;
> +=09}
> +
> +=09switch (record_id) {
> +=09case PUNIT:
> +=09=09*index =3D 0;
> +=09=09if (cap_type =3D=3D TELEMETRY)
> +=09=09=09*offset =3D PUNIT_TELEMETRY_OFFSET;
> +=09=09else /* if (cap_type =3D=3D WATCHER) */

Code is commented out???

> +=09=09=09*offset =3D PUNIT_WATCHER_OFFSET;
> +=09=09break;
> +
> +=09case OOBMSM_0:
> +=09=09*index =3D 1;
> +=09=09if (cap_type =3D=3D WATCHER)
> +=09=09=09*offset =3D OOBMSM_0_WATCHER_OFFSET;
> +=09=09break;
> +
> +=09case OOBMSM_1:
> +=09=09*index =3D 1;
> +=09=09if (cap_type =3D=3D TELEMETRY)
> +=09=09=09*offset =3D OOBMSM_1_TELEMETRY_OFFSET;
> +=09=09break;
> +=09}
> +
> +=09return 0;
> +}
> +
> +static int xe_pmt_telem_read(void *args, u32 guid, u64 *data, u32 count)
> +{
> +=09struct xe_device *xe =3D pdev_to_xe_device((struct pci_dev *)args);

Casting from void * is not required, but I suspect what you want here=20
instead of cast is container_of().

> +=09void __iomem *telem_addr =3D xe->mmio.regs + BMG_TELEMETRY_OFFSET;
> +=09u32 mem_region;
> +=09u32 offset;
> +=09int ret;
> +
> +=09ret =3D guid_decode(guid, &mem_region, &offset);
> +=09if (ret)
> +=09=09return ret;
> +
> +=09telem_addr +=3D offset;
> +
> +=09mutex_lock(&xe->pmt.lock);

Missing include.

> +=09/* indicate that we are not at an appropriate power level */
> +=09ret =3D -ENODATA;
> +=09if (xe_pm_runtime_get_if_active(xe) > 0) {
> +=09=09/* set SoC re-mapper index register based on guid memory region */

GUID

> +=09=09xe_mmio_rmw32(xe->tiles[0].primary_gt, SG_REMAP_INDEX1, SG_REMAP_B=
ITS,
> +=09=09=09      SG_REMAP_ACCESS(mem_region));
> +
> +=09=09memcpy_fromio(data, telem_addr, count);
> +=09=09ret =3D count;
> +=09=09xe_pm_runtime_put(xe);
> +=09}
> +=09mutex_unlock(&xe->pmt.lock);
> +
> +=09return ret;
> +}
> +
> +struct pmt_callbacks xe_pmt_cb =3D {
> +=09.read_telem =3D xe_pmt_telem_read,
> +};
> +
> +static const int vsec_platforms[] =3D {
> +=09[XE_BATTLEMAGE] =3D XE_VSEC_BMG,
> +};
> +
> +static enum xe_vsec get_platform_info(struct xe_device *xe)
> +{
> +=09if (xe->info.platform > XE_BATTLEMAGE)
> +=09=09return XE_VSEC_UNKNOWN;
> +
> +=09return vsec_platforms[xe->info.platform];
> +}
> +
> +/**
> + * xe_vsec_init - Initialize resources and add intel_vsec auxiliary
> + * interface
> + * @xe: valid xe instance
> + */
> +void xe_vsec_init(struct xe_device *xe)
> +{
> +=09struct intel_vsec_platform_info *info;
> +=09struct device *dev =3D xe->drm.dev;
> +=09struct pci_dev *pdev =3D to_pci_dev(dev);
> +=09enum xe_vsec platform;
> +
> +=09platform =3D get_platform_info(xe);
> +=09if (platform =3D=3D XE_VSEC_UNKNOWN)
> +=09=09return;
> +
> +=09info =3D &xe_vsec_info[platform];
> +=09if (!info->headers)
> +=09=09return;
> +
> +=09switch (platform) {
> +=09case XE_VSEC_BMG:
> +=09=09info->priv_data =3D &xe_pmt_cb;
> +=09=09break;
> +=09default:
> +=09=09break;
> +=09}
> +
> +=09/*
> +=09 * Register a VSEC. Cleanup is handled using device managed
> +=09 * resources.
> +=09 */
> +=09intel_vsec_register(pdev, info);
> +}
> +MODULE_IMPORT_NS(INTEL_VSEC);

Missing include.

--=20
 i.
--8323328-15796492-1720271946=:72188--
