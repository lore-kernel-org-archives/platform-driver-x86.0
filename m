Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93DE81A071C
	for <platform-driver-x86@vger.kernel.org>; Fri, 17 Jan 2025 16:30:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737131438; cv=none; b=lgINL6mKEScv7DUih0ZuXOrGYQwBhE2iprXYHPg0GKnE+kjbLqdGOBph29JOywA9rpASaj+A7ilQgJ0A1iqsKqh05C/+945B92CBS2H0CdRuURxCaned+QUWHEOhNLEiCPkmoO3tIyBnKpPaojkiq4W+hswinoPUp2Ow64Zx0Jk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737131438; c=relaxed/simple;
	bh=kU5ZmrgpEhndtKlJ6s+Cszvsun+I4o7NQwQl+mAsW20=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=KkMv4niyQRVP4U/oQPkKx+gcYh8es7t1j55Lwaft/NUntNWmRsXT2jvOdWXP/bX8mMdGLXQAa1ODRI3zGwGp3dkjVp5mPo45NSHQqkKwikSsqXYwsepKK6sIgWfsZcie22qramyeafGo2B2xVvwHXR/azmTzoDZ5K91tG7Dyu8M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=M3yVE+uk; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="M3yVE+uk"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1737131436; x=1768667436;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=kU5ZmrgpEhndtKlJ6s+Cszvsun+I4o7NQwQl+mAsW20=;
  b=M3yVE+ukTBe2Hmz8Q6eBpk093EeRaLh1sDCv2aw67LoFPaaSdvasdLfW
   6RAf1o3qJoki2YtzTxi1xF/iQq3y2rhVqSI8CyH8Lo3ueRYWPnunLIt/m
   ovtHrR+GljByLZI20xQAw0+wLfBojryN9xEta4LG25kOwPjvzSOvIaHwX
   05hdyjqOi/CGbMnIDmYaZDz6/imUMT0ZgJNUp0PI9S3bTMSgScWt/6zdd
   P7Wrg97AV/HV5q9FMH1jrGHNYGqNHidApgEhR7BDkgwKkEibWTL4VW5eU
   NOwmC4VXnXvBO9lY07ErqXxPMfGwAgOAffgupXJ4lwjgkxky3z00jOCjI
   Q==;
X-CSE-ConnectionGUID: lk5fI4oqTtiCVbsFBHdjow==
X-CSE-MsgGUID: CTn2mLE9SdyV9LKG7T/EIQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11318"; a="37449549"
X-IronPort-AV: E=Sophos;i="6.13,212,1732608000"; 
   d="scan'208";a="37449549"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jan 2025 08:30:29 -0800
X-CSE-ConnectionGUID: LMolijBVRNukHsmXcWKLuw==
X-CSE-MsgGUID: V90AjF8pS9CH3JWLB82vPQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,212,1732608000"; 
   d="scan'208";a="106394673"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.76])
  by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jan 2025 08:30:26 -0800
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Fri, 17 Jan 2025 18:30:22 +0200 (EET)
To: Matheus Polkorny <mpolkorny@gmail.com>
cc: hmh@hmh.eng.br, Hans de Goede <hdegoede@redhat.com>, 
    ibm-acpi-devel@lists.sourceforge.net, platform-driver-x86@vger.kernel.org
Subject: Re: [PATCH] Fix brace and parentheses in thinkpad_acpi.c
In-Reply-To: <20250116045217.575059-1-mpolkorny@gmail.com>
Message-ID: <66715687-2e3a-d249-8eeb-921daf2b1f64@linux.intel.com>
References: <20250116045217.575059-1-mpolkorny@gmail.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Thu, 16 Jan 2025, Matheus Polkorny wrote:

Hi Matheus,

You need to add the correct prefix(es) to the shortlog in the subject. 
Please see what the existing commits use in 'git log' of the file as the 
prefix (there might be variation at times, so try to pick the most 
common prefix that makes sense).

> This patch addresses checkpatch diagnostics related to
> coding style in thinkpad_acpi.c:
> 
> - Ensures open braces '{' for function definitions are placed on
> the next line

I don't see any change in your patch which relates to this??

> - Fixes parentheses usage in conditionals, ensuring proper readability
> 
> Reported by checkpatch.pl:
> ERROR: open brace '{' following function definitions go on the next line
> 
> Signed-off-by: Matheus Polkorny <mpolkorny@gmail.com>
> ---
>  drivers/platform/x86/thinkpad_acpi.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/platform/x86/thinkpad_acpi.c b/drivers/platform/x86/thinkpad_acpi.c
> index 2cfb2ac3f465..7a693092f398 100644
> --- a/drivers/platform/x86/thinkpad_acpi.c
> +++ b/drivers/platform/x86/thinkpad_acpi.c
> @@ -9519,14 +9519,14 @@ static int tpacpi_battery_set(int what, int battery, int value)
>  
>  	switch (what) {
>  	case THRESHOLD_START:
> -		if ACPI_FAILURE(tpacpi_battery_acpi_eval(SET_START, &ret, param)) {
> +		if (ACPI_FAILURE(tpacpi_battery_acpi_eval(SET_START, &ret, param))) {
>  			pr_err("failed to set charge threshold on battery %d",
>  					battery);
>  			return -ENODEV;
>  		}
>  		return 0;
>  	case THRESHOLD_STOP:
> -		if ACPI_FAILURE(tpacpi_battery_acpi_eval(SET_STOP, &ret, param)) {
> +		if (ACPI_FAILURE(tpacpi_battery_acpi_eval(SET_STOP, &ret, param))) {
>  			pr_err("failed to set stop threshold: %d", battery);
>  			return -ENODEV;
>  		}
> @@ -9608,7 +9608,7 @@ static int tpacpi_battery_probe(int battery)
>  	 * 8) Check for support
>  	 */
>  	if (acpi_has_method(hkey_handle, GET_START)) {
> -		if ACPI_FAILURE(tpacpi_battery_acpi_eval(GET_START, &ret, battery)) {
> +		if (ACPI_FAILURE(tpacpi_battery_acpi_eval(GET_START, &ret, battery))) {
>  			pr_err("Error probing battery %d\n", battery);
>  			return -ENODEV;
>  		}
> @@ -9627,7 +9627,7 @@ static int tpacpi_battery_probe(int battery)
>  		}
>  	}
>  	if (acpi_has_method(hkey_handle, GET_STOP)) {
> -		if ACPI_FAILURE(tpacpi_battery_acpi_eval(GET_STOP, &ret, battery)) {
> +		if (ACPI_FAILURE(tpacpi_battery_acpi_eval(GET_STOP, &ret, battery))) {
>  			pr_err("Error probing battery stop; %d\n", battery);
>  			return -ENODEV;
>  		}
> 

-- 
 i.

