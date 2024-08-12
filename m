Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15E871514C1
	for <platform-driver-x86@vger.kernel.org>; Mon, 12 Aug 2024 09:01:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723453291; cv=none; b=bbfhltg6sBi6rAWj03V7e0+SzxzHzro98nQlwMWjZtLrUQbOlyrg32Kn+YKJrNldjYDsIbNu8cUvY0SJW5bmZvemT+9pMVkL1515uQdTUtaeQRrPI29uh17JA2TQ50UofDZupYgUbtWEZ6EWrcmleQ7BlIsDON8KJIEBim9qkg8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723453291; c=relaxed/simple;
	bh=qjTzfTwtLhckuHPs0qFGYt3x/KkWHSgVzTL9JJAhLzY=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=XwZRctFWRf8f0Smcwa7LTCD7QHgwyDLkLDjGYJrfgtJ0xk01mODG7xsKH1uZtqjAIfVSVksdgL9PRKsNSHYjIpP6iLtquyiGZ7qK+Qp+x7w9GqpyJ673ZOxNUGCDZQ7StbkhS3ecAFKaiIdsUJ8l8BHGjRUjMLJn5e+gCWbaa/8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=NibDaVMZ; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NibDaVMZ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1723453290; x=1754989290;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version:content-id;
  bh=qjTzfTwtLhckuHPs0qFGYt3x/KkWHSgVzTL9JJAhLzY=;
  b=NibDaVMZEwaEOuLWqYceVnDmSJ6z23Q4anEYTQpk4HndIltp1KzkgLOR
   x4Kf71jQO9ibVjb9Ej/EA3PefyfdloAImapMPi3ttpflAUCZYZEJ5DZxl
   HTGmxIqjXZ7cZvHBotUKxCSHIAVeCESqvR/GyAssNlw+xWXaEM4gFM+Rh
   gyqwzAK2tqdhfchky5uIBoGkXYMy6m+Z1uFACUE+U+ohEbYoFuYrA/VwS
   IUEXxZN/hNwrSwZeNNd6vAK+eYA3iufGcQkz0sYYojv2Nm34vBiEBsIRJ
   X2oXhqar75YNnMNI0M8RvvZCjS4htrcZhfoEa+lct7quR/X0tI+T7ITyi
   A==;
X-CSE-ConnectionGUID: 6lSQ+FGuRheZwXUx7NnOcg==
X-CSE-MsgGUID: 8Ys8tgXqSK2X4OcBnAUPig==
X-IronPort-AV: E=McAfee;i="6700,10204,11161"; a="46951988"
X-IronPort-AV: E=Sophos;i="6.09,282,1716274800"; 
   d="scan'208";a="46951988"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Aug 2024 02:01:29 -0700
X-CSE-ConnectionGUID: ush61KxoTNy9FiNNJqS97A==
X-CSE-MsgGUID: F1G8Hct3S+mQ9vANk3qdaw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,282,1716274800"; 
   d="scan'208";a="62593163"
Received: from ijarvine-desk1.ger.corp.intel.com (HELO localhost) ([10.245.244.25])
  by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Aug 2024 02:01:27 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Mon, 12 Aug 2024 12:01:24 +0300 (EEST)
To: "Michael J. Ruhl" <michael.j.ruhl@intel.com>
cc: intel-xe@lists.freedesktop.org, platform-driver-x86@vger.kernel.org, 
    david.e.box@linux.intel.com, matthew.brost@intel.com, 
    Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
    Rodrigo Vivi <rodrigo.vivi@intel.com>
Subject: Re: [PATCH v9 4/6] drm/xe/vsec: Support BMG devices
In-Reply-To: <20240725122346.4063913-5-michael.j.ruhl@intel.com>
Message-ID: <0b6c37b3-297c-46f9-c0d9-b930d466744c@linux.intel.com>
References: <20240725122346.4063913-1-michael.j.ruhl@intel.com> <20240725122346.4063913-5-michael.j.ruhl@intel.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/mixed; BOUNDARY="8323328-681436799-1723452136=:1039"
Content-ID: <917613f6-ddc8-50e9-3487-9c5d04e256c4@linux.intel.com>

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323328-681436799-1723452136=:1039
Content-Type: text/plain; CHARSET=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Content-ID: <bc0ff490-7568-dcde-975b-95f122dea2b4@linux.intel.com>

On Thu, 25 Jul 2024, Michael J. Ruhl wrote:

> Utilize the PMT callback API to add support for the BMG
> devices.

The shortlog and commit message are a bit terse on details what this=20
change is about, it's all hidden into the acronyms :-).

> Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
> Signed-off-by: Michael J. Ruhl <michael.j.ruhl@intel.com>
> ---

> diff --git a/drivers/gpu/drm/xe/xe_vsec.c b/drivers/gpu/drm/xe/xe_vsec.c
> new file mode 100644
> index 000000000000..2c967aaa4072
> --- /dev/null
> +++ b/drivers/gpu/drm/xe/xe_vsec.c
> @@ -0,0 +1,222 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Copyright =C2=A9 2022 - 2024 Intel Corporation
> + */
> +#include <linux/bitfield.h>
> +#include <linux/bits.h>
> +#include <linux/intel_vsec.h>
> +#include <linux/module.h>
> +#include <linux/mutex.h>
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
> +#define SG_REMAP_BITS=09=09GENMASK(31, 24)
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
> +/*
> + * The GUID will have the following bits to decode:
> + *
> + * X(4bits) - {Telemetry space iteration number (0,1,..)}
> + * X(4bits) - Segment (SEGMENT_INDEPENDENT-0, Client-1, Server-2)
> + * X(4bits) - SOC_SKU
> + * XXXX(16bits)=E2=80=93 Device ID =E2=80=93 changes for each down bin S=
KU=E2=80=99s
> + * X(2bits) - Capability Type (Crashlog-0, Telemetry Aggregator-1, Watch=
er-2)
> + * X(2bits) - Record-ID (0-PUNIT, 1-OOBMSM_0, 2-OOBMSM_1)
> + */
> +#define GUID_TELEM_ITERATION=09GENMASK(3, 0)
> +#define GUID_SEGMENT=09=09GENMASK(7, 4)
> +#define GUID_SOC_SKU=09=09GENMASK(11, 8)
> +#define GUID_DEVICE_ID=09=09GENMASK(27, 12)
> +#define GUID_CAP_TYPE=09=09GENMASK(29, 28)
> +#define GUID_RECORD_ID=09=09GENMASK(31, 30)
> +
> +#define PUNIT_TELEMETRY_OFFSET=09=090x0200
> +#define PUNIT_WATCHER_OFFSET=09=090x14A0
> +#define OOBMSM_0_WATCHER_OFFSET=09=090x18D8
> +#define OOBMSM_1_TELEMETRY_OFFSET=090x1000
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
> +static int guid_decode(u32 guid, int *index, u32 *offset)
> +{
> +=09u32 record_id =3D FIELD_GET(GUID_RECORD_ID, guid);
> +=09u32 cap_type  =3D FIELD_GET(GUID_CAP_TYPE, guid);
> +=09u32 device_id =3D FIELD_GET(GUID_DEVICE_ID, guid);
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
> +=09=09else
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
> +static int xe_pmt_telem_read(struct pci_dev *pdev, u32 guid, u64 *data, =
u32 count)
> +{
> +=09struct xe_device *xe =3D pdev_to_xe_device(pdev);
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
> +
> +=09/* indicate that we are not at an appropriate power level */
> +=09ret =3D -ENODATA;
> +=09if (xe_pm_runtime_get_if_active(xe) > 0) {

xe_pm_runtime_get_if_active() returns bool so > 0 looks odd. In fact,=20
active > 0 compare is already done by that called function so perhaps you=
=20
mixed up what kind of value is returned by xe_pm_runtime_get_if_active().

Also, I'd restructure this logic with guard & use of reverse logic.

=09guard(mutex)(&xe->pmt.lock);

=09/* indicate that we are not at an appropriate power level */
=09if (!xe_pm_runtime_get_if_active(xe))
=09=09return -ENODATA;

=09... the rest of the code de-indented by one level (minus the=20
=09mutex_unlock() which is no longer needed because guard() is used).

With those fixed, I think this one is ready to go so after fixing, please=
=20
add:

Reviewed-by: Ilpo J=C3=A4rvinen <ilpo.jarvinen@linux.intel.com>


> +=09=09/* set SoC re-mapper index register based on GUID memory region */
> +=09=09xe_mmio_rmw32(xe->tiles[0].primary_gt, SG_REMAP_INDEX1, SG_REMAP_B=
ITS,
> +=09=09=09      FIELD_PREP(SG_REMAP_BITS, mem_region));
> +
> +=09=09memcpy_fromio(data, telem_addr, count);
> +=09=09ret =3D count;
> +=09=09xe_pm_runtime_put(xe);
> +=09}
> +=09mutex_unlock(&xe->pmt.lock);
> +
> +=09return ret;
> +}

--=20
 i.
--8323328-681436799-1723452136=:1039--
