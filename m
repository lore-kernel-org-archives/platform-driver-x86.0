Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 754A419E82A
	for <platform-driver-x86@vger.kernel.org>; Fri, 11 Jul 2025 17:59:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752256769; cv=none; b=teIW8GO962vaZ5alO1kXrR7mVbjo/0lbDj07DSUwu1cx3/sedTAvNq8GoVBZX/x7d3noLcAX+nGboM/acsk7ip5/z4Lu6zAJ6Q7Tx+bX+oTyEWfHCloynocifmKzhNfmnd8fIVPUe8peUDz84Ml98cRMsU3P1Uad9iU64SY76jE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752256769; c=relaxed/simple;
	bh=1bTQwRRh18JSkJub71DKitek5MhQp3+2ZFn1Tin5Q9Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kTmbK7SSPvnkprIc6GgoNaDF913NocZMFN/SZjSt6SW0Gr8wMjYBOzYrCbU0SYpLUnONfz/W4Hl1A7zygKSls7PAadwqpBn8O2sYxFB5uVUrQaKrWrrsvJ7Qa+CSajzvfKk816KjIDMo5EN6izl31HJnQuwtYh/VPjwYFfzgf/4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jtdCMPt+; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jtdCMPt+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1752256768; x=1783792768;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=1bTQwRRh18JSkJub71DKitek5MhQp3+2ZFn1Tin5Q9Y=;
  b=jtdCMPt+XYBmql27U+Ccs7jNdcFFXk78GA6HGvNCE6dSjweVjnEDmly6
   ASNNZqnrxrZ7B4dQsa+RSlt4B1REyIF0mayEdpjMkoKbtQ+nL8xXG6y/r
   1KRQMuCFYJ7Cy9K/j2sB/PnYOF+bauBgJ/6lUFTR208lvCteuuiaSNVVl
   BomGmdmTeVAI7meOYvnbrdRh9lKo7/bxjGMFr8aC+f5MxgDZgyEBp+3Yr
   GoDBdn/DNxcw9H0Xs4Y8aXwTkIFmnLXxyXFLNnSIp9TcUyt5N3/zDu0rU
   /pK8XW+BQyoK9+m/F5e9Sde1STOIwKnhSjLNkQ7Dva1mxAznS/CyP1hc3
   g==;
X-CSE-ConnectionGUID: KJXT4etoSAKwSqtWA7vO1A==
X-CSE-MsgGUID: T/bLl4Z3T8eksVTRGoz13Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11491"; a="65258907"
X-IronPort-AV: E=Sophos;i="6.16,304,1744095600"; 
   d="scan'208";a="65258907"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jul 2025 10:59:27 -0700
X-CSE-ConnectionGUID: P93YnsvzT5G/Mn6Zu4QBhQ==
X-CSE-MsgGUID: lQ+y4e9oT9ePECtoxO3Alg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,304,1744095600"; 
   d="scan'208";a="180115514"
Received: from mgerlach-mobl1.amr.corp.intel.com (HELO localhost) ([10.124.222.101])
  by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jul 2025 10:59:26 -0700
Date: Fri, 11 Jul 2025 10:59:25 -0700
From: David Box <david.e.box@linux.intel.com>
To: "Michael J. Ruhl" <michael.j.ruhl@intel.com>
Cc: platform-driver-x86@vger.kernel.org, intel-xe@lists.freedesktop.org, 
	hdegoede@redhat.com, ilpo.jarvinen@linux.intel.com, lucas.demarchi@intel.com, 
	rodrigo.vivi@intel.com, thomas.hellstrom@linux.intel.com, airlied@gmail.com, 
	simona@ffwll.ch
Subject: Re: [PATCH v7 02/12] drm/xe: Correct BMG VSEC header sizing
Message-ID: <lfvgatgvexvot7a2x336rdv2vps3o3so5pty7n4mw4u5ze6boz@giw6rw5auo7d>
References: <20250709184458.298283-1-michael.j.ruhl@intel.com>
 <20250709184458.298283-3-michael.j.ruhl@intel.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250709184458.298283-3-michael.j.ruhl@intel.com>

On Wed, Jul 09, 2025 at 02:44:48PM -0400, Michael J. Ruhl wrote:
> The intel_vsec_header information for the crashlog feature is
> incorrect.
> 
> Update the VSEC header with correct sizing and count.
> 
> Since the crashlog entries are "merged" (num_entries = 2), the
> separate capabilities entries must be merged as well.
> 
> Acked-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
> Fixes: 0c45e76fcc62 ("drm/xe/vsec: Support BMG devices")
> Signed-off-by: Michael J. Ruhl <michael.j.ruhl@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_vsec.c | 20 +++++---------------
>  1 file changed, 5 insertions(+), 15 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_vsec.c b/drivers/gpu/drm/xe/xe_vsec.c
> index 3e573b0b7ebd..67238fc57a4d 100644
> --- a/drivers/gpu/drm/xe/xe_vsec.c
> +++ b/drivers/gpu/drm/xe/xe_vsec.c
> @@ -32,28 +32,18 @@ static struct intel_vsec_header bmg_telemetry = {
>  	.offset = BMG_DISCOVERY_OFFSET,
>  };
>  
> -static struct intel_vsec_header bmg_punit_crashlog = {
> -	.length = 0x10,
> +static struct intel_vsec_header bmg_crashlog = {
> +	.length = 0x18,

This doesn't look right. The length field is meant to represent the size
of the entire DVSEC, and it should remain 0x10 even for Crashlog.

This field really ought to be validated in vsec.c, but I see that it
isn’t currently. The rev field, which also isn’t set here, determines the
length. When rev is 1, the length is 0x10. vsec does a basic revision
check when reading the capability from config space but doesn’t validate
this driver-provided structure. That’s a gap I’ll take care of
separately.

For now, even though this length value isn’t actually read by vsec.c,
it should still be set correctly to 0x10. Also, add the rev field here
and set it to 1. I see multiple headers missing the rev. That should be
fixed in a separate patch ahead of this one. All Intel DVEC capabilities
use revision 1.

David

>  	.id = VSEC_ID_CRASHLOG,
> -	.num_entries = 1,
> -	.entry_size = 4,
> +	.num_entries = 2,
> +	.entry_size = 6,
>  	.tbir = 0,
>  	.offset = BMG_DISCOVERY_OFFSET + 0x60,
>  };
>  
> -static struct intel_vsec_header bmg_oobmsm_crashlog = {
> -	.length = 0x10,
> -	.id = VSEC_ID_CRASHLOG,
> -	.num_entries = 1,
> -	.entry_size = 4,
> -	.tbir = 0,
> -	.offset = BMG_DISCOVERY_OFFSET + 0x78,
> -};
> -
>  static struct intel_vsec_header *bmg_capabilities[] = {
>  	&bmg_telemetry,
> -	&bmg_punit_crashlog,
> -	&bmg_oobmsm_crashlog,
> +	&bmg_crashlog,
>  	NULL
>  };
>  
> -- 
> 2.50.0
> 
> 
