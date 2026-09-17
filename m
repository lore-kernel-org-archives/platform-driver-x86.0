Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75CCD490BEE
	for <platform-driver-x86@vger.kernel.org>; Thu, 17 Sep 2026 09:56:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789638993; cv=none; b=clzHGxPyfJPTfA1qPLYiGLRctwTHV50kKSWrw92Y1VApdKxO9LDmAWZ3NOFNHSoHihOA4Vd22JTDrT/ez/KQJP+hBpV9XuvGlxTRausIYIk/6zDDTXuytxrG+BmmbyIwUmF4aRzKo/lfRnDugnW0DZsFBLi+AeTPj+SS2/NnJRM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789638993; c=relaxed/simple;
	bh=XHthUUBv8aC4b/pOgdLB0Pd5CfyRHYHmbdtCdn80mHo=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=kaW0nvLohgPQcycwMKb3qHt7bLX9wgMPnrAnv6fSDBqIOBkRi3MHTFdrIPzAQuJixYhxYivKQH15tBhpl5xZ6uZvZVyt++5RjSJV7QLXd0isqN/tSQA+fIVZFrW1+ffNDt86IFdF9bbXyfqk0tLWjO/yi1SKQ4Xxta9yx1RcpuM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ASHagjHS; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ASHagjHS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789638985; x=1821174985;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=XHthUUBv8aC4b/pOgdLB0Pd5CfyRHYHmbdtCdn80mHo=;
  b=ASHagjHS+MeNjXMEUO3R5FvjFEet2t5dG9LO0omonvDsjwwLvPcQXVoC
   yWOqvRMMOdu8iTENGCCpyvBqgOJmU/IYXX1XWbgkPDtBPe6l1jmbzMBbi
   sr/6ii60WydcDv63Pnrf/9V4zL4qgGm7UdPoyqmIIsYp4qJLY/Awf6xyj
   VGblT0aQmGz+k9rMrAl/RGWX+wz3vP/gsTHVK5SX6V+1o7hLqzMV156JQ
   EfXe9yID1+YCdsZiZU/fOsFVrL+TSemmD/xIlpFomNu5SjcBJnWFvQJJO
   VIsHFbUv54eHysv2UEW9SbAgsDrm/dIlM8sozp/BRxjh3qJL/KXnPW1HJ
   w==;
X-CSE-ConnectionGUID: zMYJ2p6ySYy3OwueU5vjIA==
X-CSE-MsgGUID: mKtizDLCRQeFq171RWQGGw==
X-IronPort-AV: E=McAfee;i="6800,10657,11905"; a="100641915"
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="100641915"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Sep 2026 02:56:19 -0700
X-CSE-ConnectionGUID: OzEt0MIyRt+NVButa3HVuQ==
X-CSE-MsgGUID: mEDQHYl5RMezoZMlXQgllQ==
X-ExtLoop1: 1
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.62])
  by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Sep 2026 02:56:14 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Thu, 17 Sep 2026 12:56:09 +0300 (EEST)
To: "Michael J. Ruhl" <michael.j.ruhl@intel.com>
cc: platform-driver-x86@vger.kernel.org, intel-xe@lists.freedesktop.org, 
    Hans de Goede <hansg@kernel.org>, matthew.brost@intel.com, 
    rodrigo.vivi@intel.com, thomas.hellstrom@linux.intel.com, 
    airlied@gmail.com, simona@ffwll.ch, david.e.box@linux.intel.com, 
    anoop.c.vijay@intel.com, badal.nilawar@intel.com, 
    matthew.d.roper@intel.com, james.ausmus@intel.com, karthik.poosa@intel.com
Subject: Re: [PATCH v9 09/20] drm/xe/vsec: Add DOC text for VSEC
In-Reply-To: <20260916201139.2374531-31-michael.j.ruhl@intel.com>
Message-ID: <9f6b61e5-a100-a27d-d8e8-b7327608721f@linux.intel.com>
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

Wrong grammar: "setup up"

(Found by sashiko.)

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
> + */
>  int xe_pmt_telem_read(struct device *dev, u32 guid, u64 *data, loff_t user_offset,
>  		      u32 count)
>  {
> 

-- 
 i.

