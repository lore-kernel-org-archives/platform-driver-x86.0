Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E107133E1
	for <platform-driver-x86@vger.kernel.org>; Sun, 13 Jul 2025 23:13:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752448394; cv=none; b=BcZBgf5YCKczKYMJvrjYQonThg8emIFgg6h0MTpqpzoB29ZzzrQZCcwatFiCfgMYd6tW2F2vcNaJ00dggXGknmlDuCTF8ZynvZksYgmuP5pDpHj6XkWnjNosrFnttKJPe6HPcAE7LjXGmsLBKpZC2Sxr7oSvtaCQG5wNqxmmViw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752448394; c=relaxed/simple;
	bh=bsc5yuO44Vn8ysvCDuPrj5Nyc3QNo2rMH8fmlH4Nm5I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=X0DLkqzHKCpkl2a+89Ko44XhTFcd6PUnC3gxpBdRJb6po6uEwzBOj6xDp4dvXerjmD1I35w1iGB1pyEzVu/rNbt3ouORlkItatmm0HpRU3me2NLBbZqHlGbNy3yX/kqD4i2gbh0sAjnySI1j6A3zEaZBOxjvbdnGg5FGLX/sdLQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=m/iKEtlW; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="m/iKEtlW"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1752448393; x=1783984393;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=bsc5yuO44Vn8ysvCDuPrj5Nyc3QNo2rMH8fmlH4Nm5I=;
  b=m/iKEtlWJjx20CGOJcb8AvNDZ0UWk2ZfPwXLo+zJcRgK5XFWnSesFmHq
   6G+J9MhS+pfr5mv9EsmeKzZyDc2s9aF7tsEbHT5rJqSweIoGHkWAiGoZA
   gGr7yDG/DJ0NF/FZbS4474JZsb7Q317AHbxPNkOFn/ZbdRMlJp4A+WPUq
   /NUANjwHTQTWAURlBePdLyC2pkyavr/aeVWTnsp7EKWS7sR8Jd+QBdLBP
   irV4cDJK5FuausGjM7G97dc92S24zMoJzGES1OL+eGjP6QrVxAw6ROYjH
   DCoaChl8AwfXQrF/o4j6LsrwfVWLRGW4EBaFo8ro8ChiMeDZ31TRZO3nI
   g==;
X-CSE-ConnectionGUID: 5N/Myj7BQjml3fduRvSfMQ==
X-CSE-MsgGUID: 6NfHTbdcT7ueznaJ1kfMoQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11491"; a="54578452"
X-IronPort-AV: E=Sophos;i="6.16,309,1744095600"; 
   d="scan'208";a="54578452"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jul 2025 16:13:12 -0700
X-CSE-ConnectionGUID: UzoSjz7CRMS+bXMuX6iV8w==
X-CSE-MsgGUID: wmTgx9pNRzuiMjOEUt8iMw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,309,1744095600"; 
   d="scan'208";a="194006006"
Received: from aschofie-mobl2.amr.corp.intel.com (HELO localhost) ([10.124.223.14])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jul 2025 16:13:11 -0700
Date: Sun, 13 Jul 2025 16:13:09 -0700
From: David Box <david.e.box@linux.intel.com>
To: "Michael J. Ruhl" <michael.j.ruhl@intel.com>
Cc: platform-driver-x86@vger.kernel.org, intel-xe@lists.freedesktop.org, 
	hdegoede@redhat.com, ilpo.jarvinen@linux.intel.com, lucas.demarchi@intel.com, 
	rodrigo.vivi@intel.com, thomas.hellstrom@linux.intel.com, airlied@gmail.com, 
	simona@ffwll.ch
Subject: Re: [PATCH v8 03/13] drm/xe: Correct BMG VSEC header sizing
Message-ID: <tyep67rdjk3yxnkxebzkcrhpsje3u5zl2vafaswqlv4vlsfujc@uy7k6drfu2kg>
References: <20250713172943.7335-1-michael.j.ruhl@intel.com>
 <20250713172943.7335-4-michael.j.ruhl@intel.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250713172943.7335-4-michael.j.ruhl@intel.com>

On Sun, Jul 13, 2025 at 01:29:33PM -0400, Michael J. Ruhl wrote:
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
>  drivers/gpu/drm/xe/xe_vsec.c | 19 ++++---------------
>  1 file changed, 4 insertions(+), 15 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_vsec.c b/drivers/gpu/drm/xe/xe_vsec.c
> index d279e0ace7d7..8f23a27871b6 100644
> --- a/drivers/gpu/drm/xe/xe_vsec.c
> +++ b/drivers/gpu/drm/xe/xe_vsec.c
> @@ -33,30 +33,19 @@ static struct intel_vsec_header bmg_telemetry = {
>  	.offset = BMG_DISCOVERY_OFFSET,
>  };
>  
> -static struct intel_vsec_header bmg_punit_crashlog = {
> +static struct intel_vsec_header bmg_crashlog = {
>  	.rev = 1,
>  	.length = 0x10,
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
> -	.rev = 1,
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

Reviewed-by: David E. Box <david.e.box@linux.intel.com>
