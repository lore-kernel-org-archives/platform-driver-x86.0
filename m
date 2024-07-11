Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A337A15F3FB
	for <platform-driver-x86@vger.kernel.org>; Thu, 11 Jul 2024 11:09:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720696170; cv=none; b=IyUBHDIXW/yy5jWOg8GX6fnWEz1smRLKJ6Mrp+zcocqSjPAG/llOjESr5fF1fYmpuMdOadfy9JtQKLwCBtWw8KqYsBiKK9Elv32L7qWMQ/XwL+cX5QekMal04DaAAnP8Ok3fnUI30T0r9go7dS1+/XwyDhI/uWfXwHn/iPAov/I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720696170; c=relaxed/simple;
	bh=pUsjHmdpeGyR+jyakS29x0bMaPCEoglr9gBKFV1Xtv8=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=E4ag5Ljfc9ZYeyT/0rv+wHxmucTgupYPTA4u23Qjs22oMzyFBZ0GrsP21lNK+eSJeth6KEdL+Mxq83qnDXCcYxq7IjOJHMotyCOoNHrxPNi4vLlEhOBiCp7KDWfs2SiTuBXD9ILdKJm24jXUIYkF/NMv6v5IWSzD437SMW4kK2U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kEHGmDAv; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kEHGmDAv"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1720696169; x=1752232169;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=pUsjHmdpeGyR+jyakS29x0bMaPCEoglr9gBKFV1Xtv8=;
  b=kEHGmDAvstatXU0OLb2PPpL+H0YKykR95zb/7U83EzXYJ1Kai6+dZuag
   PXwCVUiEpvrdd/LyVY1n6BEkA8qXu7j/EuP+6lHWPkkbfQphF9pqdgrgk
   3CVS+sUL4rxTDttbqAhtiH+ap9FEa7zITDxIJDiZhcfcqBjpdqOSf5m97
   jDM13HOyFCQMEi15LCza6RHTNkIkhi1iaA6l5meC8eDZN/mHtTQTr/ZFI
   e3SlM0y+aKDtWTpSvreWn685T5fzRFyv6tABGzTiw6luOuptMm20P8DYD
   ZVnam4G9wU9UBXSnykVJYWjiG03HIzmYylSyZvgIUKBcADoweolaSRrOl
   g==;
X-CSE-ConnectionGUID: PUuUAyJNT66K/PubU+zr0g==
X-CSE-MsgGUID: MmUIH1/RTh6ICaIdO9uOvQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11129"; a="28660923"
X-IronPort-AV: E=Sophos;i="6.09,199,1716274800"; 
   d="scan'208";a="28660923"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jul 2024 04:09:28 -0700
X-CSE-ConnectionGUID: AC/agRDhQmqQ4kaPr9Pv8w==
X-CSE-MsgGUID: OwJT6WYjQW67s8fvUjjhyg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,199,1716274800"; 
   d="scan'208";a="53467797"
Received: from ijarvine-desk1.ger.corp.intel.com (HELO localhost) ([10.245.247.127])
  by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jul 2024 04:09:26 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Thu, 11 Jul 2024 14:09:22 +0300 (EEST)
To: "Michael J. Ruhl" <michael.j.ruhl@intel.com>
cc: intel-xe@lists.freedesktop.org, platform-driver-x86@vger.kernel.org, 
    david.e.box@linux.intel.com, matthew.brost@intel.com
Subject: Re: [PATCH v6 1/6] platform/x86/intel/vsec.h: Move to
 include/linux
In-Reply-To: <20240710192249.3915396-2-michael.j.ruhl@intel.com>
Message-ID: <bf1a5405-e1a6-4a51-48ee-c1b694ceb59b@linux.intel.com>
References: <20240710192249.3915396-1-michael.j.ruhl@intel.com> <20240710192249.3915396-2-michael.j.ruhl@intel.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323328-1958086072-1720696162=:6262"

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323328-1958086072-1720696162=:6262
Content-Type: text/plain; charset=ISO-8859-15
Content-Transfer-Encoding: QUOTED-PRINTABLE

On Wed, 10 Jul 2024, Michael J. Ruhl wrote:

> From: "David E. Box" <david.e.box@linux.intel.com>
>=20
> Some drivers outside of PDX86 need access to the vsec header. Move it to
> include/linux to make it easier to include.
>=20
> Reviewed-by: Michael J. Ruhl <michael.j.ruhl@intel.com>
> Signed-off-by: David E. Box <david.e.box@linux.intel.com>
> ---
>  MAINTAINERS                                   |  1 +
>  drivers/platform/x86/intel/pmc/core_ssram.c   |  2 +-
>  drivers/platform/x86/intel/pmt/class.c        |  2 +-
>  drivers/platform/x86/intel/pmt/class.h        |  2 +-
>  drivers/platform/x86/intel/pmt/crashlog.c     |  2 +-
>  drivers/platform/x86/intel/pmt/telemetry.c    |  2 +-
>  drivers/platform/x86/intel/sdsi.c             |  3 +-
>  drivers/platform/x86/intel/tpmi.c             |  3 +-
>  drivers/platform/x86/intel/vsec.c             |  7 ++--
>  .../vsec.h =3D> include/linux/intel_vsec.h      | 32 +++++++++++++++++--
>  10 files changed, 40 insertions(+), 16 deletions(-)
>  rename drivers/platform/x86/intel/vsec.h =3D> include/linux/intel_vsec.h=
 (71%)
>=20
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 782fb49059e7..832ab1a0011e 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -11426,6 +11426,7 @@ INTEL VENDOR SPECIFIC EXTENDED CAPABILITIES DRIVE=
R
>  M:=09David E. Box <david.e.box@linux.intel.com>
>  S:=09Supported
>  F:=09drivers/platform/x86/intel/vsec.*

This can probably change to .c as the other file is now moved under=20
include/.

> +F:=09include/linux/intel_vsec.h
> =20
>  INTEL VIRTUAL BUTTON DRIVER
>  M:=09AceLan Kao <acelan.kao@canonical.com>
> diff --git a/drivers/platform/x86/intel/pmc/core_ssram.c b/drivers/platfo=
rm/x86/intel/pmc/core_ssram.c
> index 1bde86c54eb9..baddaaec25ee 100644
> --- a/drivers/platform/x86/intel/pmc/core_ssram.c
> +++ b/drivers/platform/x86/intel/pmc/core_ssram.c
> @@ -9,11 +9,11 @@
>   */
> =20
>  #include <linux/cleanup.h>
> +#include <linux/intel_vsec.h>
>  #include <linux/pci.h>
>  #include <linux/io-64-nonatomic-lo-hi.h>
> =20
>  #include "core.h"
> -#include "../vsec.h"
>  #include "../pmt/telemetry.h"
> =20
>  #define SSRAM_HDR_SIZE=09=090x100
> diff --git a/drivers/platform/x86/intel/pmt/class.c b/drivers/platform/x8=
6/intel/pmt/class.c
> index 4b53940a64e2..d7939b28e937 100644
> --- a/drivers/platform/x86/intel/pmt/class.c
> +++ b/drivers/platform/x86/intel/pmt/class.c
> @@ -9,12 +9,12 @@
>   */
> =20
>  #include <linux/kernel.h>
> +#include <linux/intel_vsec.h>
>  #include <linux/io-64-nonatomic-lo-hi.h>
>  #include <linux/module.h>
>  #include <linux/mm.h>
>  #include <linux/pci.h>
> =20
> -#include "../vsec.h"
>  #include "class.h"
> =20
>  #define PMT_XA_START=09=091
> diff --git a/drivers/platform/x86/intel/pmt/class.h b/drivers/platform/x8=
6/intel/pmt/class.h
> index d23c63b73ab7..d6f9ccaf28c8 100644
> --- a/drivers/platform/x86/intel/pmt/class.h
> +++ b/drivers/platform/x86/intel/pmt/class.h
> @@ -2,13 +2,13 @@
>  #ifndef _INTEL_PMT_CLASS_H
>  #define _INTEL_PMT_CLASS_H
> =20
> +#include <linux/intel_vsec.h>
>  #include <linux/xarray.h>
>  #include <linux/types.h>
>  #include <linux/bits.h>
>  #include <linux/err.h>
>  #include <linux/io.h>
> =20
> -#include "../vsec.h"
>  #include "telemetry.h"
> =20
>  /* PMT access types */
> diff --git a/drivers/platform/x86/intel/pmt/crashlog.c b/drivers/platform=
/x86/intel/pmt/crashlog.c
> index 4014c02cafdb..9079d5dffc03 100644
> --- a/drivers/platform/x86/intel/pmt/crashlog.c
> +++ b/drivers/platform/x86/intel/pmt/crashlog.c
> @@ -9,6 +9,7 @@
>   */
> =20
>  #include <linux/auxiliary_bus.h>
> +#include <linux/intel_vsec.h>
>  #include <linux/kernel.h>
>  #include <linux/module.h>
>  #include <linux/pci.h>
> @@ -16,7 +17,6 @@
>  #include <linux/uaccess.h>
>  #include <linux/overflow.h>
> =20
> -#include "../vsec.h"
>  #include "class.h"
> =20
>  /* Crashlog discovery header types */
> diff --git a/drivers/platform/x86/intel/pmt/telemetry.c b/drivers/platfor=
m/x86/intel/pmt/telemetry.c
> index 09258564dfc4..3478f891ea0b 100644
> --- a/drivers/platform/x86/intel/pmt/telemetry.c
> +++ b/drivers/platform/x86/intel/pmt/telemetry.c
> @@ -9,6 +9,7 @@
>   */
> =20
>  #include <linux/auxiliary_bus.h>
> +#include <linux/intel_vsec.h>
>  #include <linux/kernel.h>
>  #include <linux/module.h>
>  #include <linux/pci.h>
> @@ -16,7 +17,6 @@
>  #include <linux/uaccess.h>
>  #include <linux/overflow.h>
> =20
> -#include "../vsec.h"
>  #include "class.h"
> =20
>  #define TELEM_SIZE_OFFSET=090x0
> diff --git a/drivers/platform/x86/intel/sdsi.c b/drivers/platform/x86/int=
el/sdsi.c
> index 277e4f4b20ac..9d137621f0e6 100644
> --- a/drivers/platform/x86/intel/sdsi.c
> +++ b/drivers/platform/x86/intel/sdsi.c
> @@ -12,6 +12,7 @@
>  #include <linux/bits.h>
>  #include <linux/bitfield.h>
>  #include <linux/device.h>
> +#include <linux/intel_vsec.h>
>  #include <linux/iopoll.h>
>  #include <linux/kernel.h>
>  #include <linux/module.h>
> @@ -22,8 +23,6 @@
>  #include <linux/types.h>
>  #include <linux/uaccess.h>
> =20
> -#include "vsec.h"
> -
>  #define ACCESS_TYPE_BARID=09=092
>  #define ACCESS_TYPE_LOCAL=09=093
> =20
> diff --git a/drivers/platform/x86/intel/tpmi.c b/drivers/platform/x86/int=
el/tpmi.c
> index 6c0cbccd80bb..b9fa1cbfdcf7 100644
> --- a/drivers/platform/x86/intel/tpmi.c
> +++ b/drivers/platform/x86/intel/tpmi.c
> @@ -51,6 +51,7 @@
>  #include <linux/debugfs.h>
>  #include <linux/delay.h>
>  #include <linux/intel_tpmi.h>
> +#include <linux/intel_vsec.h>
>  #include <linux/io.h>
>  #include <linux/iopoll.h>
>  #include <linux/module.h>
> @@ -59,8 +60,6 @@
>  #include <linux/sizes.h>
>  #include <linux/string_helpers.h>
> =20
> -#include "vsec.h"
> -
>  /**
>   * struct intel_tpmi_pfs_entry - TPMI PM Feature Structure (PFS) entry
>   * @tpmi_id:=09TPMI feature identifier (what the feature is and its data=
 format).
> diff --git a/drivers/platform/x86/intel/vsec.c b/drivers/platform/x86/int=
el/vsec.c
> index 0fdfaf3a4f5c..2b46807f868b 100644
> --- a/drivers/platform/x86/intel/vsec.c
> +++ b/drivers/platform/x86/intel/vsec.c
> @@ -17,14 +17,13 @@
>  #include <linux/bits.h>
>  #include <linux/cleanup.h>
>  #include <linux/delay.h>
> -#include <linux/kernel.h>
>  #include <linux/idr.h>
> +#include <linux/intel_vsec.h>
> +#include <linux/kernel.h>
>  #include <linux/module.h>
>  #include <linux/pci.h>
>  #include <linux/types.h>
> =20
> -#include "vsec.h"
> -
>  #define PMT_XA_START=09=09=090
>  #define PMT_XA_MAX=09=09=09INT_MAX
>  #define PMT_XA_LIMIT=09=09=09XA_LIMIT(PMT_XA_START, PMT_XA_MAX)
> @@ -341,7 +340,7 @@ static bool intel_vsec_walk_vsec(struct pci_dev *pdev=
,
>  void intel_vsec_register(struct pci_dev *pdev,
>  =09=09=09 struct intel_vsec_platform_info *info)
>  {
> -=09if (!pdev || !info)
> +=09if (!pdev || !info || !info->headers)
>  =09=09return;
> =20
>  =09intel_vsec_walk_header(pdev, info);
> diff --git a/drivers/platform/x86/intel/vsec.h b/include/linux/intel_vsec=
=2Eh
> similarity index 71%
> rename from drivers/platform/x86/intel/vsec.h
> rename to include/linux/intel_vsec.h
> index e23e76129691..1a287541a2f9 100644
> --- a/drivers/platform/x86/intel/vsec.h
> +++ b/include/linux/intel_vsec.h
> @@ -1,6 +1,6 @@
>  /* SPDX-License-Identifier: GPL-2.0 */
> -#ifndef _VSEC_H
> -#define _VSEC_H
> +#ifndef _INTEL_VSEC_H
> +#define _INTEL_VSEC_H
> =20
>  #include <linux/auxiliary_bus.h>
>  #include <linux/bits.h>
> @@ -67,7 +67,14 @@ enum intel_vsec_quirks {
>  =09VSEC_QUIRK_EARLY_HW     =3D BIT(4),
>  };
> =20
> -/* Platform specific data */
> +/**
> + * struct intel_vsec_platform_info - Platform specific data
> + * @parent:    parent device in the auxbus chain
> + * @headers:   list of headers to define the PMT client devices to creat=
e
> + * @caps:      bitmask of PMT capabilities for the given headers
> + * @quirks:    bitmask of VSEC device quirks
> + * @base_addr: allow a base address to be specified (rather than derived=
)
> + */
>  struct intel_vsec_platform_info {
>  =09struct device *parent;
>  =09struct intel_vsec_header **headers;
> @@ -76,6 +83,18 @@ struct intel_vsec_platform_info {
>  =09u64 base_addr;
>  };
> =20
> +/**
> + * struct intel_sec_device - Auxbus specific device information
> + * @auxdev:        auxbus device struct for auxbus access
> + * @pcidev:        pci device associated with the device
> + * @resource:      any resources shared by the parent
> + * @ida:           id reference
> + * @num_resources: number of resources
> + * @id:            xarrray id

xarray

Reviewed-by: Ilpo J=E4rvinen <ilpo.jarvinen@linux.intel.com>

--=20
 i.
--8323328-1958086072-1720696162=:6262--
