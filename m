Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3AE0628850B
	for <platform-driver-x86@vger.kernel.org>; Thu, 29 Jan 2026 12:25:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769689547; cv=none; b=kyxk5eJgE8GJM0PfPXNIO8CtBO3VjLfnAXutXOimReDEXoYV11+YoQvppPz5PihNfhSKtiiG7wC8luBtj2c2PialYsHbkdPljWxRBnOd/rwEtWHS+kIQA3kf+cVUe3lZbt8RV+5LIXimduIAMdPb02aPZBMaXS3OXeE+LSRBnro=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769689547; c=relaxed/simple;
	bh=zmdlT1mZj2JwezDDw/3/TxWJowbOuDN8QJm+TqyZjEw=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=Z1d9jFvIMmB16X1bDGo9CbAKHkI1k721gewoLVnYS2Ty14EOtGg1O6zqtAkGX+w/DdK8yGfL2sMtL4gpgFWN3+3NP2nVM7oY5f463gjpnZ46MbaqLprHzR6FBjzYYnI4Pfv9dq8QMQnv6DSkQq0IDAZJWatiVFsNj9h5tF2vAZI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lVMUCD0c; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lVMUCD0c"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769689546; x=1801225546;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=zmdlT1mZj2JwezDDw/3/TxWJowbOuDN8QJm+TqyZjEw=;
  b=lVMUCD0cs6ToCpG6DLoBp5yM7PVKxk6jzbYkHYbcyjFiytqeJf80B42O
   gAJqOiHcVv1smi45kFIyoXTh1j7IQjnNQ43XQ5liLYxWu+WkQxFDpDEV/
   QtTtjx9ZqJKyyFJc99+skERFeP29mn+tqID51KjhyNHgKM9J1e4dX9vz2
   JwW56GSYsH7WIO4BUXF/byB1qrbCdiDtKhQNslnuVnXpfj+crahig9Aeb
   mbRt3VRB9BPxG5yqbWlj3ZXwB3o4vHLmUubhWsT1VUVA8xFbKCp1iTS7r
   3VfD+cWDMtJMkaH/M8BOHALjQcIIjF9iUO6QfNvYvSnk5BCBtv4Pmd2m6
   g==;
X-CSE-ConnectionGUID: H3kT8sWRSEyp0fzUuPsdNg==
X-CSE-MsgGUID: BBdyVSgeT1mjMeKu3/HMKg==
X-IronPort-AV: E=McAfee;i="6800,10657,11685"; a="70644469"
X-IronPort-AV: E=Sophos;i="6.21,260,1763452800"; 
   d="scan'208";a="70644469"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Jan 2026 04:25:46 -0800
X-CSE-ConnectionGUID: ZH8fFZHjTjqWFlsJ+x2TFQ==
X-CSE-MsgGUID: Kk7LksjWQCiShpPEGz8PRw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,260,1763452800"; 
   d="scan'208";a="208345803"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.172])
  by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Jan 2026 04:25:43 -0800
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Thu, 29 Jan 2026 14:25:39 +0200 (EET)
To: David McFarland <corngood@gmail.com>, 
    "Rafael J. Wysocki" <rafael@kernel.org>, Hans de Goede <hansg@kernel.org>, 
    Alex Hung <alexhung@gmail.com>
cc: platform-driver-x86@vger.kernel.org
Subject: Re: [PATCH v2] platform/x86/intel: disable wakeup_mode during
 hibernation
In-Reply-To: <20260120161100.29342-2-corngood@gmail.com>
Message-ID: <93b91d70-061b-4db0-a82b-2da5cab67fbd@linux.intel.com>
References: <20260120141758.3496-1-corngood@gmail.com> <20260120161100.29342-2-corngood@gmail.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Tue, 20 Jan 2026, David McFarland wrote:

+ Rafael who introduced priv->wakeup_mode (and happens to be PM 
maintainer).

+ Alex (that scripts/get_maintainer.pl shows as the maintainer).

Hi David,

Thanks for the patch.

Please make v3 submission with all the relevant people as receipients 
(once you've addresses the feedback).

> Without this change I get the problem described in the linked bug:
> 
> > Wakeup event detected during hibernation, rolling back

Please rephrase this such that you explain the problem first without 
referring to the bugzilla. The Closes tag should still remain in place but 
this changelog should describe to problem too without requiring other 
sources to understand the problem.

Please avoid phrases like "This change" or "This patch" or "I"; use 
imperative tone.

The quoted warning probably doesn't have "> " so it can be removed, just 
indent it by a few spaces.

> The docs for the 'freeze' event say:
> 
> > Analogous to @suspend(), but it should not enable the device to signal wakeup
> > events or change its power state.

Here, describe to solution. Something along the lines of:

Add a freeze handler ...

> I've been running with this change for several months on my Dell
> Precision 3680.  I haven't tested on any other systems.
> 
> Closes: https://bugzilla.kernel.org/show_bug.cgi?id=218634

This is missing Signed-off-by tag. We can only apply patches that are 
signed off by the submitter (please see 
Documentation/process/submitting-patches.rst).

You probably should also add a Fixes tag as well.

> ---
> v1 -> v2: fixed bugzilla link
> 
>  drivers/platform/x86/intel/hid.c | 10 +++++++++-
>  1 file changed, 9 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/platform/x86/intel/hid.c b/drivers/platform/x86/intel/hid.c
> index 560cc063198e..3a9561665b9b 100644
> --- a/drivers/platform/x86/intel/hid.c
> +++ b/drivers/platform/x86/intel/hid.c
> @@ -419,6 +419,14 @@ static int intel_hid_pl_suspend_handler(struct device *device)
>  	return 0;
>  }
>  
> +static int intel_hid_pl_freeze_handler(struct device *device)
> +{
> +	struct intel_hid_priv *priv = dev_get_drvdata(device);
> +
> +	priv->wakeup_mode = false;
> +	return intel_hid_pl_suspend_handler(device);
> +}
> +
>  static int intel_hid_pl_resume_handler(struct device *device)
>  {
>  	intel_hid_pm_complete(device);
> @@ -433,7 +441,7 @@ static int intel_hid_pl_resume_handler(struct device *device)
>  static const struct dev_pm_ops intel_hid_pl_pm_ops = {
>  	.prepare = intel_hid_pm_prepare,
>  	.complete = intel_hid_pm_complete,
> -	.freeze  = intel_hid_pl_suspend_handler,
> +	.freeze  = intel_hid_pl_freeze_handler,
>  	.thaw  = intel_hid_pl_resume_handler,
>  	.restore  = intel_hid_pl_resume_handler,
>  	.suspend  = intel_hid_pl_suspend_handler,

-- 
 i.

