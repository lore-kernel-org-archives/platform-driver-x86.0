Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5391C41C6A
	for <platform-driver-x86@vger.kernel.org>; Wed,  6 May 2026 13:35:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778074517; cv=none; b=dAhNgxEG0o21KesZvsQe7+M+zcwT0aHSxuK+GIqcSjwIsrYtpPBbCsQZojiNMnCjHQE4BvLljOhJfDvRUNlhlue6/RVA/81/IL2hTf1ymndPNRRJGn6/IwTsxJQbKLXbK8/vs9SDiFt5V3QdGKUvVmImIBqj+YNKgGxDXMm1OM0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778074517; c=relaxed/simple;
	bh=vGIYZ/d9hnlCJlkBW9wiImJs4HiMNLuZNeX16eRZ5NY=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=u5+5as0cXEN9gNt1GBn6d4dNgXIvn8yTbgZ9TpjsSRz5DWNIIBo2v5zcwoCGN7ng1Cra+88PrE0taUBZ4c6oKsr+AzLh04IVXd50OrJVFdrfMMYq4HoDLHL6zOvW9X7QQg3zpZZztgxlIvwSumq7xbPgKRJT8R7PxMmK+hVKCBA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ldDNqA6C; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ldDNqA6C"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778074516; x=1809610516;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=vGIYZ/d9hnlCJlkBW9wiImJs4HiMNLuZNeX16eRZ5NY=;
  b=ldDNqA6C13PhGKJSyOQP5IW6zWV1chdkMg2/fS7ijphchxbtysNbbA98
   dF237KW7evrFdjG/bfKEwuYHz0CJ43G+D0p8qL8s+m0c4sDvRCt08fYve
   ANBFzWRa6rD/jlpdETw0rv6zgRmuB6ANIHdpAAYfKAtclGnLwLMS8AqAa
   2q2BLVBB4BuRs9zmi/YYLnYCfkiinagzbNW2OLBqfDKaLJdnZudONT9lz
   VR/j7RBaDoP4jCcx5v1n9F6hRWLKzb+xvs9ikud4Qp4V7G6JyqPQQMQOY
   gd9k0G6yTj14nTUU0kcJynjdpKQKF0TBph9IUIquYmLOyefriZaoL71MA
   A==;
X-CSE-ConnectionGUID: /cuL5t3wROe6Ygsbsirr+w==
X-CSE-MsgGUID: /K59ortfTj+NNeAaBVT9JQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11777"; a="78722137"
X-IronPort-AV: E=Sophos;i="6.23,219,1770624000"; 
   d="scan'208";a="78722137"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 May 2026 06:35:14 -0700
X-CSE-ConnectionGUID: gJPlGRFbRL2DmZyhgND8yg==
X-CSE-MsgGUID: bVptd0MtRg2A7Ye3353lVw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,219,1770624000"; 
   d="scan'208";a="259572896"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.231])
  by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 May 2026 06:35:12 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Wed, 6 May 2026 16:35:08 +0300 (EEST)
To: "LevitatingBusinessMan (Rein Fernhout)" <me@levitati.ng>
cc: hmh@hmh.eng.br, mpearson-lenovo@squebb.ca, 
    platform-driver-x86@vger.kernel.org, hansg@kernel.org
Subject: Re: [PATCH] platform/x86: thinkpad_acpi: Don't report non-present
 second fan on models with quirk
In-Reply-To: <20260411153452.1168082-1-me@levitati.ng>
Message-ID: <03466fa7-90d8-1094-7c4d-34e65ddb7904@linux.intel.com>
References: <20260411153452.1168082-1-me@levitati.ng>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Sat, 11 Apr 2026, LevitatingBusinessMan (Rein Fernhout) wrote:

> Some models report a second-fan with speed 65535 indicating that this fan is not present.
> 
> A previous fix (a10d50983f7be) disabled these fans.

Please see Documentation/process/submitting-patches.rst how to format 
commit references correctly.

> 
> However, the else branch still enables the fan on some models with a quirk enabled.
> 
> Namely the P15v Gen 1 has such a quirk, introduced in e8637dfca15e0.
> 
> Although it appears the P15 Gen 1 does have a second fan, the P15v Gen 1 does not (reporting speed 65535).
> 
> I think in all cases, this can be solved by never enabling the fan if it is detected and the reported speed reads 65535.
> 
> To do so, we only run the else branch if no fan was detected.

Please fold the changelog paragraphs at 72 chars.

This change should have a Fixes tag.

I cannot apply patches without sign off, again, please see 
Documentation/process/submitting-patches.rst.

> ---
>  drivers/platform/x86/lenovo/thinkpad_acpi.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/platform/x86/lenovo/thinkpad_acpi.c b/drivers/platform/x86/lenovo/thinkpad_acpi.c
> index 8982d92dfd97..282a0c54ce0c 100644
> --- a/drivers/platform/x86/lenovo/thinkpad_acpi.c
> +++ b/drivers/platform/x86/lenovo/thinkpad_acpi.c
> @@ -8948,7 +8948,7 @@ static int __init fan_init(struct ibm_init_struct *iibm)
>  				/* fan control not currently available for ns ECFW */
>  				tp_features.second_fan_ctl = !fan_with_ns_addr;
>  				pr_info("secondary fan control detected & enabled\n");
> -			} else {
> +			} else if (res < 0) {

As this is now clearly an error handling block, it should be the first one 
to follow the call so you should switch to order of the code blocks.

>  				/* Fan not auto-detected */
>  				tp_features.second_fan = 0;

Unrelated to this patch, I don't know why is this line necessary at all.
It was cleared earlier in the same function (and even that clearing is 
probably not considering the default initial value which implies it should 
already be 0).

>  				if (quirks & TPACPI_FAN_2FAN) {

It might be cleaner to put this entire 2nd fan init to own function as 
could return early from it when no 2nd fan is detected.

-- 
 i.

