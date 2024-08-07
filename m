Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 602571097B
	for <platform-driver-x86@vger.kernel.org>; Wed,  7 Aug 2024 19:23:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723058633; cv=none; b=BTaWzBLgiGSR9XSKWsGozh4ce/yO+SWB9nCoFQdJZqA8XftvFV01mFUUwGaQeGsOZY9zAirsMKHpa6DUd2fmLPPwZCbHJvQNHKgQCu4gDQHeXP1/mJhiWWmptfHI5IvwA57Gfb9WSURlr4q70zlk9zga5Ys5M358SwCsnaYv6k0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723058633; c=relaxed/simple;
	bh=8LzK6azEHATpOLeXjoOqaAysh7uhfyh9UO9UMIg9As8=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Wk3x6zUNmQjTroCp18OIpf9bk8+hobDTaO/FHBwq7Ewkuk5QPKyMiCTmn/vG0Za0cGSpTsLbkWWxuqgpqI8Nbeefx8ijZju9J5fGlmeUxTaQ6llAX0ozGDJVuijO62GeDQanVqlyfgjgzEKC4rLB6GhMFe9klPBlCVfsv7OmrlE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fqyiKhsd; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fqyiKhsd"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1723058631; x=1754594631;
  h=message-id:subject:from:reply-to:to:cc:date:in-reply-to:
   references:content-transfer-encoding:mime-version;
  bh=8LzK6azEHATpOLeXjoOqaAysh7uhfyh9UO9UMIg9As8=;
  b=fqyiKhsdlr41pG9BGgQ3Jo3sUQIwHjVwlbnHHea8fBTi5/rM5g9eSNIn
   s1B1CEoVZ5pZ9eDVNKDy6EAEeNDGJXcHRL9u24DeAONvd3iPcr3+Ne7Ly
   D2nZWPJE/7m5N2nIS5ck647c8FJ9SQEij2XB0lVn7ti4xzFGucGfkyon9
   R+Oe+PzMSpACYq1MpX6CgDG27/fQvYtdzeSNKen1gydMM4dQ7E5VyGK+s
   f2Jx0kMm/w5gICQkI47y0T/k7OAnb09P4I1NTny+nXvmzuHaPNafbsyAD
   hDaFYex61JGWICA5JAFkwPwa6i1MXqLpS4oTajhHnj1APpjqp135KXukV
   w==;
X-CSE-ConnectionGUID: cR5dpWSxQ9ycDX3effQAwg==
X-CSE-MsgGUID: jIRIXR8DS5udhj+hRteWCA==
X-IronPort-AV: E=McAfee;i="6700,10204,11157"; a="31784370"
X-IronPort-AV: E=Sophos;i="6.09,270,1716274800"; 
   d="scan'208";a="31784370"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Aug 2024 12:23:51 -0700
X-CSE-ConnectionGUID: I7aAIGmERoO6fnLA+N3JXQ==
X-CSE-MsgGUID: scly6jlDSuORhVgmM99dbg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,270,1716274800"; 
   d="scan'208";a="57042715"
Received: from linux.intel.com ([10.54.29.200])
  by fmviesa010.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Aug 2024 12:23:51 -0700
Received: from [10.54.75.156] (debox1-desk1.jf.intel.com [10.54.75.156])
	by linux.intel.com (Postfix) with ESMTP id 6A31A20CFECD;
	Wed,  7 Aug 2024 12:23:50 -0700 (PDT)
Message-ID: <46e51821abbeb15ab9efdfa29fd469d2cf171e98.camel@linux.intel.com>
Subject: Re: [PATCH v9 4/6] drm/xe/vsec: Support BMG devices
From: "David E. Box" <david.e.box@linux.intel.com>
Reply-To: david.e.box@linux.intel.com
To: "Michael J. Ruhl" <michael.j.ruhl@intel.com>, 
	intel-xe@lists.freedesktop.org, platform-driver-x86@vger.kernel.org, 
	ilpo.jarvinen@linux.intel.com, matthew.brost@intel.com, 
	andriy.shevchenko@linux.intel.com
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Date: Wed, 07 Aug 2024 12:23:50 -0700
In-Reply-To: <20240725122346.4063913-5-michael.j.ruhl@intel.com>
References: <20240725122346.4063913-1-michael.j.ruhl@intel.com>
	 <20240725122346.4063913-5-michael.j.ruhl@intel.com>
Autocrypt: addr=david.e.box@linux.intel.com; prefer-encrypt=mutual;
 keydata=mQENBF2w2YABCACw5TpqmFTR6SgsrNqZE8ro1q2lUgVZda26qIi8GeHmVBmu572RfPydisEpCK246rYM5YY9XAps810ZxgFlLyBqpE/rxB4Dqvh04QePD6fQNui/QCSpyZ6j9F8zl0zutOjfNTIQBkcar28hazL9I8CGnnMko21QDl4pkrq1dgLSgl2r2N1a6LJ2l8lLnQ1NJgPAev4BWo4WAwH2rZ94aukzAlkFizjZXmB/6em+lhinTR9hUeXpTwcaAvmCHmrUMxeOyhx+csO1uAPUjxL7olj2J83dv297RrpjMkDyuUOv8EJlPjvVogJF1QOd5MlkWdj+6vnVDRfO8zUwm2pqg25DABEBAAG0KkRhdmlkIEUuIEJveCA8ZGF2aWQuZS5ib3hAbGludXguaW50ZWwuY29tPokBTgQTAQgAOBYhBBFoZ8DYRC+DyeuV6X7Mry1gl3p/BQJdsNmAAhsDBQsJCAcCBhUKCQgLAgQWAgMBAh4BAheAAAoJEH7Mry1gl3p/NusIAK9z1xnXphedgZMGNzifGUs2UUw/xNl91Q9qRaYGyNYATI6E7zBYmynsUL/4yNFnXK8P/I7WMffiLoMqmUvNp9pG6oYYj8ouvbCexS21jgw54I3m61M+wTokieRIO/GettVlCGhz7YHlHtGGqhzzWB3CGPSJMwsouDPvyFFE+28p5d2v9l6rXSb7T297Kh50VX9Ele8QEKngrG+Z/u2lr/bHEhvx24vI8ka22cuTaZvThYMwLTSC4kq9L9WgRv31JBSa1pcbcHLOCoUl0RaQwe6J8w9hN2uxCssHrrfhSA4YjxKNIIp3YH4IpvzuDR3AadYz1klFTnEOxIM7fvQ2iGu5AQ0EXbDZgAEIAPGbL3wvbYUDGMoBSN89GtiC6ybWo28JSiYIN5N9LhDTwfWROenkRvmTESaE5fAM24sh8S0h+F+eQ7j/E/RF3pM31gSovTKw0Pxk7GorK
	FSa25CWemxSV97zV8fVegGkgfZkBMLUId+AYCD1d2R+tndtgjrHtVq/AeN0N09xv/d3a+Xzc4ib/SQh9mM50ksqiDY70EDe8hgPddYH80jHJtXFVA7Ar1ew24TIBF2rxYZQJGLe+Mt2zAzxOYeQTCW7WumD/ZoyMm7bg46/2rtricKnpaACM7M0r7g+1gUBowFjF4gFqY0tbLVQEB/H5e9We/C2zLG9r5/Lt22dj7I8A6kAEQEAAYkBNgQYAQgAIBYhBBFoZ8DYRC+DyeuV6X7Mry1gl3p/BQJdsNmAAhsMAAoJEH7Mry1gl3p/Z/AH/Re8YwzY5I9ByPM56B3Vkrh8qihZjsF7/WB14Ygl0HFzKSkSMTJ+fvZv19bk3lPIQi5lUBuU5rNruDNowCsnvXr+sFxFyTbXw0AQXIsnX+EkMg/JO+/V/UszZiqZPkvHsQipCFVLod/3G/yig9RUO7A/1efRi0E1iJAa6qHrPqE/kJANbz/x+9wcx1VfFwraFXbdT/P2JeOcW/USW89wzMRmOo+AiBSnTI4xvb1s/TxSfoLZvtoj2MR+2PW1zBALWYUKHOzhfFKs3cMufwIIoQUPVqGVeH+u6Asun6ZpNRxdDONop+uEXHe6q6LzI/NnczqoZQLhM8d1XqokYax/IZ4=
Organization: David E. Box
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.50.4 (3.50.4-1.fc39) 
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

Hi Mike,

Reviewed-by: David E. Box <david.e.box@linux.intel.com>

On Thu, 2024-07-25 at 08:23 -0400, Michael J. Ruhl wrote:
> Utilize the PMT callback API to add support for the BMG
> devices.
>=20
> Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
> Signed-off-by: Michael J. Ruhl <michael.j.ruhl@intel.com>
> ---
> =C2=A0drivers/gpu/drm/xe/Makefile=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 |=C2=A0=C2=A0 1 +
> =C2=A0drivers/gpu/drm/xe/xe_device.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =
|=C2=A0=C2=A0 5 +
> =C2=A0drivers/gpu/drm/xe/xe_device_types.h |=C2=A0=C2=A0 6 +
> =C2=A0drivers/gpu/drm/xe/xe_vsec.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 | 222 +++++++++++++++++++++++++++
> =C2=A0drivers/gpu/drm/xe/xe_vsec.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 |=C2=A0 13 ++
> =C2=A05 files changed, 247 insertions(+)
> =C2=A0create mode 100644 drivers/gpu/drm/xe/xe_vsec.c
> =C2=A0create mode 100644 drivers/gpu/drm/xe/xe_vsec.h
>=20
> diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
> index 1ff9602a52f6..a3c044b46fed 100644
> --- a/drivers/gpu/drm/xe/Makefile
> +++ b/drivers/gpu/drm/xe/Makefile
> @@ -112,6 +112,7 @@ xe-y +=3D xe_bb.o \
> =C2=A0	xe_vm.o \
> =C2=A0	xe_vram.o \
> =C2=A0	xe_vram_freq.o \
> +	xe_vsec.o \
> =C2=A0	xe_wait_user_fence.o \
> =C2=A0	xe_wa.o \
> =C2=A0	xe_wopcm.o
> diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_devic=
e.c
> index 1aba6f9eaa19..0bdfbe849e64 100644
> --- a/drivers/gpu/drm/xe/xe_device.c
> +++ b/drivers/gpu/drm/xe/xe_device.c
> @@ -53,6 +53,7 @@
> =C2=A0#include "xe_ttm_sys_mgr.h"
> =C2=A0#include "xe_vm.h"
> =C2=A0#include "xe_vram.h"
> +#include "xe_vsec.h"
> =C2=A0#include "xe_wait_user_fence.h"
> =C2=A0#include "xe_wa.h"
> =C2=A0
> @@ -370,6 +371,8 @@ struct xe_device *xe_device_create(struct pci_dev *pd=
ev,
> =C2=A0		goto err;
> =C2=A0	}
> =C2=A0
> +	drmm_mutex_init(&xe->drm, &xe->pmt.lock);
> +
> =C2=A0	err =3D xe_display_create(xe);
> =C2=A0	if (WARN_ON(err))
> =C2=A0		goto err;
> @@ -745,6 +748,8 @@ int xe_device_probe(struct xe_device *xe)
> =C2=A0	for_each_gt(gt, xe, id)
> =C2=A0		xe_gt_sanitize_freq(gt);
> =C2=A0
> +	xe_vsec_init(xe);
> +
> =C2=A0	return devm_add_action_or_reset(xe->drm.dev, xe_device_sanitize, x=
e);
> =C2=A0
> =C2=A0err_fini_display:
> diff --git a/drivers/gpu/drm/xe/xe_device_types.h
> b/drivers/gpu/drm/xe/xe_device_types.h
> index 5b7292a9a66d..2509d7428f2d 100644
> --- a/drivers/gpu/drm/xe/xe_device_types.h
> +++ b/drivers/gpu/drm/xe/xe_device_types.h
> @@ -458,6 +458,12 @@ struct xe_device {
> =C2=A0		struct mutex lock;
> =C2=A0	} d3cold;
> =C2=A0
> +	/** @pmt: Support the PMT driver callback interface */
> +	struct {
> +		/** @pmt.lock: protect access for telemetry data */
> +		struct mutex lock;
> +	} pmt;
> +
> =C2=A0	/**
> =C2=A0	 * @pm_callback_task: Track the active task that is running in eit=
her
> =C2=A0	 * the runtime_suspend or runtime_resume callbacks.
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
> +#define SOC_BASE		0x280000
> +
> +#define BMG_PMT_BASE		0xDB000
> +#define BMG_DISCOVERY_OFFSET	(SOC_BASE + BMG_PMT_BASE)
> +
> +#define BMG_TELEMETRY_BASE	0xE0000
> +#define BMG_TELEMETRY_OFFSET	(SOC_BASE + BMG_TELEMETRY_BASE)
> +
> +#define BMG_DEVICE_ID 0xE2F8
> +
> +#define GFX_BAR			0
> +
> +#define SG_REMAP_INDEX1		XE_REG(SOC_BASE + 0x08)
> +#define SG_REMAP_BITS		GENMASK(31, 24)
> +
> +static struct intel_vsec_header bmg_telemetry =3D {
> +	.length =3D 0x10,
> +	.id =3D VSEC_ID_TELEMETRY,
> +	.num_entries =3D 2,
> +	.entry_size =3D 4,
> +	.tbir =3D GFX_BAR,
> +	.offset =3D BMG_DISCOVERY_OFFSET,
> +};
> +
> +static struct intel_vsec_header *bmg_capabilities[] =3D {
> +	&bmg_telemetry,
> +	NULL
> +};
> +
> +enum xe_vsec {
> +	XE_VSEC_UNKNOWN =3D 0,
> +	XE_VSEC_BMG,
> +};
> +
> +static struct intel_vsec_platform_info xe_vsec_info[] =3D {
> +	[XE_VSEC_BMG] =3D {
> +		.caps =3D VSEC_CAP_TELEMETRY,
> +		.headers =3D bmg_capabilities,
> +	},
> +	{ }
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
> +#define GUID_TELEM_ITERATION	GENMASK(3, 0)
> +#define GUID_SEGMENT		GENMASK(7, 4)
> +#define GUID_SOC_SKU		GENMASK(11, 8)
> +#define GUID_DEVICE_ID		GENMASK(27, 12)
> +#define GUID_CAP_TYPE		GENMASK(29, 28)
> +#define GUID_RECORD_ID		GENMASK(31, 30)
> +
> +#define PUNIT_TELEMETRY_OFFSET		0x0200
> +#define PUNIT_WATCHER_OFFSET		0x14A0
> +#define OOBMSM_0_WATCHER_OFFSET		0x18D8
> +#define OOBMSM_1_TELEMETRY_OFFSET	0x1000
> +
> +enum record_id {
> +	PUNIT,
> +	OOBMSM_0,
> +	OOBMSM_1
> +};
> +
> +enum capability {
> +	CRASHLOG,
> +	TELEMETRY,
> +	WATCHER
> +};
> +
> +static int guid_decode(u32 guid, int *index, u32 *offset)
> +{
> +	u32 record_id =3D FIELD_GET(GUID_RECORD_ID, guid);
> +	u32 cap_type=C2=A0 =3D FIELD_GET(GUID_CAP_TYPE, guid);
> +	u32 device_id =3D FIELD_GET(GUID_DEVICE_ID, guid);
> +
> +	if (device_id !=3D BMG_DEVICE_ID)
> +		return -ENODEV;
> +
> +	if (record_id > OOBMSM_1 || cap_type > WATCHER)
> +		return -EINVAL;
> +
> +	*offset =3D 0;
> +
> +	if (cap_type =3D=3D CRASHLOG) {
> +		*index =3D record_id =3D=3D PUNIT ? 2 : 4;
> +		return 0;
> +	}
> +
> +	switch (record_id) {
> +	case PUNIT:
> +		*index =3D 0;
> +		if (cap_type =3D=3D TELEMETRY)
> +			*offset =3D PUNIT_TELEMETRY_OFFSET;
> +		else
> +			*offset =3D PUNIT_WATCHER_OFFSET;
> +		break;
> +
> +	case OOBMSM_0:
> +		*index =3D 1;
> +		if (cap_type =3D=3D WATCHER)
> +			*offset =3D OOBMSM_0_WATCHER_OFFSET;
> +		break;
> +
> +	case OOBMSM_1:
> +		*index =3D 1;
> +		if (cap_type =3D=3D TELEMETRY)
> +			*offset =3D OOBMSM_1_TELEMETRY_OFFSET;
> +		break;
> +	}
> +
> +	return 0;
> +}
> +
> +static int xe_pmt_telem_read(struct pci_dev *pdev, u32 guid, u64 *data, =
u32
> count)
> +{
> +	struct xe_device *xe =3D pdev_to_xe_device(pdev);
> +	void __iomem *telem_addr =3D xe->mmio.regs + BMG_TELEMETRY_OFFSET;
> +	u32 mem_region;
> +	u32 offset;
> +	int ret;
> +
> +	ret =3D guid_decode(guid, &mem_region, &offset);
> +	if (ret)
> +		return ret;
> +
> +	telem_addr +=3D offset;
> +
> +	mutex_lock(&xe->pmt.lock);
> +
> +	/* indicate that we are not at an appropriate power level */
> +	ret =3D -ENODATA;
> +	if (xe_pm_runtime_get_if_active(xe) > 0) {
> +		/* set SoC re-mapper index register based on GUID memory
> region */
> +		xe_mmio_rmw32(xe->tiles[0].primary_gt, SG_REMAP_INDEX1,
> SG_REMAP_BITS,
> +			=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 FIELD_PREP(SG_REMAP_BITS, mem_region))=
;
> +
> +		memcpy_fromio(data, telem_addr, count);
> +		ret =3D count;
> +		xe_pm_runtime_put(xe);
> +	}
> +	mutex_unlock(&xe->pmt.lock);
> +
> +	return ret;
> +}
> +
> +struct pmt_callbacks xe_pmt_cb =3D {
> +	.read_telem =3D xe_pmt_telem_read,
> +};
> +
> +static const int vsec_platforms[] =3D {
> +	[XE_BATTLEMAGE] =3D XE_VSEC_BMG,
> +};
> +
> +static enum xe_vsec get_platform_info(struct xe_device *xe)
> +{
> +	if (xe->info.platform > XE_BATTLEMAGE)
> +		return XE_VSEC_UNKNOWN;
> +
> +	return vsec_platforms[xe->info.platform];
> +}
> +
> +/**
> + * xe_vsec_init - Initialize resources and add intel_vsec auxiliary
> + * interface
> + * @xe: valid xe instance
> + */
> +void xe_vsec_init(struct xe_device *xe)
> +{
> +	struct intel_vsec_platform_info *info;
> +	struct device *dev =3D xe->drm.dev;
> +	struct pci_dev *pdev =3D to_pci_dev(dev);
> +	enum xe_vsec platform;
> +
> +	platform =3D get_platform_info(xe);
> +	if (platform =3D=3D XE_VSEC_UNKNOWN)
> +		return;
> +
> +	info =3D &xe_vsec_info[platform];
> +	if (!info->headers)
> +		return;
> +
> +	switch (platform) {
> +	case XE_VSEC_BMG:
> +		info->priv_data =3D &xe_pmt_cb;
> +		break;
> +	default:
> +		break;
> +	}
> +
> +	/*
> +	 * Register a VSEC. Cleanup is handled using device managed
> +	 * resources.
> +	 */
> +	intel_vsec_register(pdev, info);
> +}
> +MODULE_IMPORT_NS(INTEL_VSEC);
> diff --git a/drivers/gpu/drm/xe/xe_vsec.h b/drivers/gpu/drm/xe/xe_vsec.h
> new file mode 100644
> index 000000000000..3fd29a21cad6
> --- /dev/null
> +++ b/drivers/gpu/drm/xe/xe_vsec.h
> @@ -0,0 +1,13 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +/*
> + * Copyright =C2=A9 2022 - 2024 Intel Corporation
> + */
> +
> +#ifndef _XE_VSEC_H_
> +#define _XE_VSEC_H_
> +
> +struct xe_device;
> +
> +void xe_vsec_init(struct xe_device *xe);
> +
> +#endif

