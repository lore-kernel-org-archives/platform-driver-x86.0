Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F262833E1
	for <platform-driver-x86@vger.kernel.org>; Sun, 13 Jul 2025 23:11:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752448280; cv=none; b=geB6MRwHuO7DnTeT02Tj84q3O89mU8gl9I8sg6sdmCjeavjVZx7tDvwJOi/FkObNDOYT/bKpevukOnrHLchmE6XDXruVdHz9Es3fEjGubSlIgSpmS6DOcEUTUIzQY/j4KnFxdcOWPgLL3jJve+1Bvqes5IyQemQt6VlKdx6Bp0s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752448280; c=relaxed/simple;
	bh=CUXIGkGD1aFyG/NGFy2WbONwyL4ePeMKWdOYmnEhcJM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jslqDHbSlyC6oyMx1t9wC617ADs6VJ/+NCO+wYYVFkz+ldY8Gf9y+JgOUZwr0jK7S0s42l3Oe6kZ3k7wqeJIz3HCKK8Jnd+Kvune/plQRq2QDx9Gj5s9PIFFiyy/OGo4mL7P5MhNiEO6aO95AG5v3dAtbiPFHz2fTI+VGgEedYQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lZ2B1Q7n; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lZ2B1Q7n"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1752448279; x=1783984279;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=CUXIGkGD1aFyG/NGFy2WbONwyL4ePeMKWdOYmnEhcJM=;
  b=lZ2B1Q7nD+g3Ez59monrbKx1TQZSBn9SjWP0mJjMZ2hrZnVCeGsxwfmy
   V8ERc4qRXnS/5g3adPviST7X/dAOxOAuNFFyMuHvXw/G2JoyMlcdM9ifX
   dy93qX2Z6YBbqTpW54A22uMwUKHCIC99SaWSzQC8BCClmxGFCdhqM94uw
   uuVI0PjyOLyiHxvBfMCvcCxW7GyKZtTTsiUgXAexcLTxUUYwRFJhliPPX
   vjOm4agCBYap9tD6binLGtfRr3eWuWI1WO9eE8RfXTH8gim7gxzWRxIiE
   n6io71Gx73e5YbZzU2yvwjcre6rqxKUgS582ZqFgrRAXh5xMbWKcv1bNh
   A==;
X-CSE-ConnectionGUID: aZnZ7i4qTRGFE2dMxcYjtQ==
X-CSE-MsgGUID: oP1AeQmMSGuxz9c/GIgzIA==
X-IronPort-AV: E=McAfee;i="6800,10657,11491"; a="53863123"
X-IronPort-AV: E=Sophos;i="6.16,309,1744095600"; 
   d="scan'208";a="53863123"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jul 2025 16:11:18 -0700
X-CSE-ConnectionGUID: he2Mr6fzT3io+k/ki5dj+Q==
X-CSE-MsgGUID: J49c6kbwTbCR+Th+aIE/JQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,309,1744095600"; 
   d="scan'208";a="157286001"
Received: from aschofie-mobl2.amr.corp.intel.com (HELO localhost) ([10.124.223.14])
  by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jul 2025 16:11:18 -0700
Date: Sun, 13 Jul 2025 16:11:16 -0700
From: David Box <david.e.box@linux.intel.com>
To: "Michael J. Ruhl" <michael.j.ruhl@intel.com>
Cc: platform-driver-x86@vger.kernel.org, intel-xe@lists.freedesktop.org, 
	hdegoede@redhat.com, ilpo.jarvinen@linux.intel.com, lucas.demarchi@intel.com, 
	rodrigo.vivi@intel.com, thomas.hellstrom@linux.intel.com, airlied@gmail.com, 
	simona@ffwll.ch
Subject: Re: [PATCH v8 02/13] drm/xe: Correct the rev value for the DVSEC
 entries
Message-ID: <lesyxbnx5qgtnfmr3gtilxbpjn4wik3ltw3cjwlwxlpsci73ne@n2mrx6vxmhx5>
References: <20250713172943.7335-1-michael.j.ruhl@intel.com>
 <20250713172943.7335-3-michael.j.ruhl@intel.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250713172943.7335-3-michael.j.ruhl@intel.com>

On Sun, Jul 13, 2025 at 01:29:32PM -0400, Michael J. Ruhl wrote:
> By definition, the Designated Vendor Specific Extended Capability
> (DVSEC) revision should be 1.
> 
> Add the rev value to be correct.
> 
> Fixes: 0c45e76fcc62 ("drm/xe/vsec: Support BMG devices")
> Signed-off-by: Michael J. Ruhl <michael.j.ruhl@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_vsec.c | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/xe_vsec.c b/drivers/gpu/drm/xe/xe_vsec.c
> index 3e573b0b7ebd..d279e0ace7d7 100644
> --- a/drivers/gpu/drm/xe/xe_vsec.c
> +++ b/drivers/gpu/drm/xe/xe_vsec.c
> @@ -24,6 +24,7 @@
>  #define BMG_DEVICE_ID 0xE2F8
>  
>  static struct intel_vsec_header bmg_telemetry = {
> +	.rev = 1,
>  	.length = 0x10,
>  	.id = VSEC_ID_TELEMETRY,
>  	.num_entries = 2,
> @@ -33,6 +34,7 @@ static struct intel_vsec_header bmg_telemetry = {
>  };
>  
>  static struct intel_vsec_header bmg_punit_crashlog = {
> +	.rev = 1,
>  	.length = 0x10,
>  	.id = VSEC_ID_CRASHLOG,
>  	.num_entries = 1,
> @@ -42,6 +44,7 @@ static struct intel_vsec_header bmg_punit_crashlog = {
>  };
>  
>  static struct intel_vsec_header bmg_oobmsm_crashlog = {
> +	.rev = 1,
>  	.length = 0x10,
>  	.id = VSEC_ID_CRASHLOG,
>  	.num_entries = 1,
> -- 
> 2.50.0
> 
> 

Reviewed-by: David E. Box <david.e.box@linux.intel.com>
