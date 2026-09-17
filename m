Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E00534BE433
	for <platform-driver-x86@vger.kernel.org>; Thu, 17 Sep 2026 09:57:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789639087; cv=none; b=Ke+OMXcSY6U1tZcLTKsTRGpcwxe91yBCZPVGt7gXJOQvIDFsJc9k8lFJOXf0J/9i+uXZ2MblFCFpFPv33XbMCZl5W9yGRs5KbRWQlwIxXPQuEvJQ7iuh6LrsZRe9Fc8BKei32nzwIgBXHxffEtcqwXENXm0RnQqonWAucMSa2t0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789639087; c=relaxed/simple;
	bh=704lDvwiUJAT+9HP13Bp5IbIzhw2Gq/3QRfkri9KUI4=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=SU86qkZZA3K6tzXXW8rUWoy/vf6OrNMOixc0UtxeiJfSL7sresmY3JHEIKZXX/eSqLp6LgTKRawgOdMrm61EpF4gQObtlld93iVEO6CH+Uhnk4/6u4tUSwq4r2S11E0OvtK+MNhey7+X7t6gjrHCPONjGgCUbwNtfbANVy9QPfc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ZCucATOQ; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZCucATOQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789639074; x=1821175074;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=704lDvwiUJAT+9HP13Bp5IbIzhw2Gq/3QRfkri9KUI4=;
  b=ZCucATOQDGjBepSxf12k1yNempTFJd1N/uiuSx75b+q2tIw0PSKKOL4y
   iYjh3Vcm6SqXIKWYb37jFlnL+d5258LqBTohDx+wqCHtS3tr2J9Bqaa5x
   J7AOgpPpZ+9GuC2sinpepJPIzG8WPKpzTGpfo7gjlpuB+G91wvaZxQ5Yp
   9zlT833X/PDSa+NW0LcHgAVy8mHCYkjPjp01iArA8zqe/MBvPNcpck73l
   cABGYMPCE5YQQmIsh3atZ4zXwU2NHFAme44Yu+S+K75YSFh82L4UxqPl1
   g1DXWlW7HPtAiUqn2NLTohcBQF7qY5YA4gVv9aBVHKv14iTx9YU97s2bh
   Q==;
X-CSE-ConnectionGUID: sbqe0KEmRFCXBAey43/o6g==
X-CSE-MsgGUID: rUcoA4RbQ1yIiaHop7gfZQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11905"; a="115581591"
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="115581591"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Sep 2026 02:57:46 -0700
X-CSE-ConnectionGUID: 3ALJsjb8Tr2Nu75qa9Pcug==
X-CSE-MsgGUID: lGZcJOQlQzC0KhgwLVaKOw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="275641091"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.62])
  by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Sep 2026 02:57:42 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Thu, 17 Sep 2026 12:57:38 +0300 (EEST)
To: "Michael J. Ruhl" <michael.j.ruhl@intel.com>
cc: platform-driver-x86@vger.kernel.org, intel-xe@lists.freedesktop.org, 
    Hans de Goede <hansg@kernel.org>, matthew.brost@intel.com, 
    rodrigo.vivi@intel.com, thomas.hellstrom@linux.intel.com, 
    airlied@gmail.com, simona@ffwll.ch, david.e.box@linux.intel.com, 
    anoop.c.vijay@intel.com, badal.nilawar@intel.com, 
    matthew.d.roper@intel.com, james.ausmus@intel.com, karthik.poosa@intel.com
Subject: Re: [PATCH v9 09/20] drm/xe/vsec: Add DOC text for VSEC
In-Reply-To: <20260916201139.2374531-31-michael.j.ruhl@intel.com>
Message-ID: <054c50bc-7fc7-c5f1-e650-5233048b9188@linux.intel.com>
References: <20260916201139.2374531-22-michael.j.ruhl@intel.com> <20260916201139.2374531-31-michael.j.ruhl@intel.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Wed, 16 Sep 2026, Michael J. Ruhl wrote:

> Add the necessary files and text to use the DOC system.
> 
> Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
> Signed-off-by: Michael J. Ruhl <michael.j.ruhl@intel.com>
> ---
>  Documentation/gpu/xe/index.rst   |  1 +
>  Documentation/gpu/xe/xe_vsec.rst | 14 ++++++++++++++
>  drivers/gpu/drm/xe/xe_vsec.c     | 23 +++++++++++++++++++++++
>  3 files changed, 38 insertions(+)
>  create mode 100644 Documentation/gpu/xe/xe_vsec.rst
> 
> diff --git a/Documentation/gpu/xe/index.rst b/Documentation/gpu/xe/index.rst
> index 0247a255f7e6..89f013418cf5 100644
> --- a/Documentation/gpu/xe/index.rst
> +++ b/Documentation/gpu/xe/index.rst
> @@ -36,3 +36,4 @@ The display, or :ref:`drm-kms`, support for drm/xe is provided by
>     xe_configfs
>     xe_gt_stats
>     xe_sigid
> +   xe_vsec
> diff --git a/Documentation/gpu/xe/xe_vsec.rst b/Documentation/gpu/xe/xe_vsec.rst
> new file mode 100644
> index 000000000000..1a87548489ea
> --- /dev/null
> +++ b/Documentation/gpu/xe/xe_vsec.rst
> @@ -0,0 +1,14 @@
> +.. SPDX-License-Identifier: (GPL-2.0+ OR MIT)
> +
> +=====
> +VSEC
> +=====
> +
> +.. kernel-doc:: drivers/gpu/drm/xe/xe_vsec.c
> +   :doc: VSEC
> +
> +Internal API
> +============
> +
> +.. kernel-doc:: drivers/gpu/drm/xe/xe_vsec.c
> +   :internal:
> diff --git a/drivers/gpu/drm/xe/xe_vsec.c b/drivers/gpu/drm/xe/xe_vsec.c
> index 1cb9a78ee0ef..ca5d02dce818 100644
> --- a/drivers/gpu/drm/xe/xe_vsec.c
> +++ b/drivers/gpu/drm/xe/xe_vsec.c
> @@ -19,6 +19,17 @@
>  
>  #include "regs/xe_pmt.h"
>  
> +/**
> + * DOC: VSEC
> + *
> + * Some GPUs support the PMT feature.  For those that do, this API provides
> + * probe, discovery and usage (control and access) for GPUs that have PMT.
> + *
> + * PMT is usually accessed through a PCI function.  However, that is not always
> + * available, so the PMT intel_vsec_register() function can be used to setup up
> + * PMT usage.
> + */
> +
>  /* PMT GUID value for BMG devices.  NOTE: this is NOT a PCI id */
>  #define BMG_DEVICE_ID 0xE2F8
>  
> @@ -140,6 +151,18 @@ static int xe_guid_decode(u32 guid, int *index, u32 *offset)
>  	return 0;
>  }
>  
> +/**
> + * xe_pmt_telem_read - Given a device and a PMT GUID, read data into a buffer
> + * @dev: valid Xe device
> + * @guid: PMT GUID (from the PMT discovery struct)
> + * @data: buffer to place data in
> + * @user_offset: a user offset relative to the beginning of the data to read
> + * @count: bytes to read
> + *
> + * Return:
> + * * -EINVAL for VF and PMT WATCHER requests
> + * * count   number of bytes read on success

Please also check sashiko's comment on the set of return values.

-- 
 i.

