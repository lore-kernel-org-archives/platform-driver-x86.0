Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A71DC42A8A
	for <platform-driver-x86@vger.kernel.org>; Mon, 11 Nov 2024 08:40:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731314406; cv=none; b=XItlEKalERRBT9FUk4PFRJ3RoXpllKFPVMiPoSYtArUKrqjSyM7CftSU4QDzw0xn0sgL2KPjgANXI3NWHt7BTQpnp8dtx7ST81Xx3mr3ZF49rGj/kf6G+ijoZ1xCyauANtLqruR5q9xiLcEL/bc7ZWWPLUwEHnALG3DTlUfGh+g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731314406; c=relaxed/simple;
	bh=4NHXiLIs9oOuTEOnh7IYhOnDzhQmdUDRzKhARn91o7o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Ur9zeOJrbclePXoVNYng53Qf2VqBTLbHPwYBrdFfQRfFc7tWQXYMC9HxYLqyCthpHNUuLocAl55LHvNbITpeSxiikyTg/70Es5vrdnOdOtRj8pzonViTUo0slIPTiF+aR8n0ET9faDGwSApqHfiOs/34uWLzn+dH6Mw/ioB3emA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=IoGj37mC; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="IoGj37mC"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1731314405; x=1762850405;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=4NHXiLIs9oOuTEOnh7IYhOnDzhQmdUDRzKhARn91o7o=;
  b=IoGj37mCJ9b/dnnYNmlHd1HKFf9bpYKVFvK2MeDHbLdVX/ii+a9UOQ+y
   EhzeAWGLwt+pDArjBl7QpP/VkDMfTbDrKfULUXGXgMoahOq1n6WZmdQs6
   Cfuxo12wQ6AuzMDLMdLrlIZZ4Fnfzt6FL5fgiAdogpeVYJSJx17u/SP9f
   xdOj1ZsVvxNoQpPx/9QtyWzHznNv+DQ98C6wNDINd0VY9IaMIh0MfmUd9
   hi5FAlXk8jpBkKuOLQ8KVMCSALcfdjekgCEdzfeRc2bBMBqu/lPr8B027
   ct5FnYoVNlrxHGuCnAmBNgRsI6XYpl2Dy6IzUmStiNwbSLI4iSbydoqaY
   Q==;
X-CSE-ConnectionGUID: /Jkad8YqRNukp46T+RiTfw==
X-CSE-MsgGUID: VUGz9FOJS1upiRgZDYV07Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="31277418"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="31277418"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Nov 2024 00:40:04 -0800
X-CSE-ConnectionGUID: 7yKNsBN7RlScrUt7moYPdw==
X-CSE-MsgGUID: tIhaUIoKQ0KxbFIqzpxTXA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,144,1728975600"; 
   d="scan'208";a="87278924"
Received: from smile.fi.intel.com ([10.237.72.154])
  by fmviesa010.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Nov 2024 00:40:02 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.98)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1tAPxn-0000000DWxQ-2eBW;
	Mon, 11 Nov 2024 10:39:59 +0200
Date: Mon, 11 Nov 2024 10:39:59 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: "Michael J. Ruhl" <michael.j.ruhl@intel.com>
Cc: intel-xe@lists.freedesktop.org, platform-driver-x86@vger.kernel.org,
	david.e.box@linux.intel.com, ilpo.jarvinen@linux.intel.com,
	hdegoede@redhat.com, rodrigo.vivi@intel.com,
	lucas.demarchi@intel.com
Subject: Re: [PATCH 2/2] drm/xe/vsec: Support BMG devices
Message-ID: <ZzHC338WnoYgVYTA@smile.fi.intel.com>
References: <20241108201955.2048085-1-michael.j.ruhl@intel.com>
 <20241108201955.2048085-2-michael.j.ruhl@intel.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20241108201955.2048085-2-michael.j.ruhl@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Fri, Nov 08, 2024 at 03:19:54PM -0500, Michael J. Ruhl wrote:
> The Battlemage (BMG) discrete graphics card supports the
> Platform, Monitoring Technology (PMT) feature directly
> on the primary PCI device.
> 
> Utilize the PMT callback API to add support for the BMG
> devices.

...

> +	drmm_mutex_init(&xe->drm, &xe->pmt.lock);
> +

No error checks? What's the point of the (second) 'm' then?

...

> +/*
> + * Copyright © 2024 Intel Corporation
> + */

Can be one line.

> +#include <linux/bitfield.h>
> +#include <linux/bits.h>
> +#include <linux/cleanup.h>

+ errno.h

> +#include <linux/intel_vsec.h>
> +#include <linux/module.h>
> +#include <linux/mutex.h>
> +#include <linux/pci.h>

+ types.h

> +#include "xe_device.h"
> +#include "xe_device_types.h"
> +#include "xe_drv.h"
> +#include "xe_mmio.h"
> +#include "xe_platform_types.h"
> +#include "xe_pm.h"
> +#include "xe_vsec.h"

+ blank line?

> +#include "regs/xe_pmt.h"

...


I would add a comment here explaining that it's not a PCI ID,
while looking as that.

> +#define BMG_DEVICE_ID 0xE2F8

...

> +static int guid_decode(u32 guid, int *index, u32 *offset)

xe_guid_decode() to avoid any possible churn in the future due to namespace
collision.

...

> +++ b/drivers/gpu/drm/xe/xe_vsec.h


> +/*
> + * Copyright © 2024 Intel Corporation
> + */

One line?

-- 
With Best Regards,
Andy Shevchenko


