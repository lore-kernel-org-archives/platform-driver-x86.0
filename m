Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7750612882C
	for <platform-driver-x86@vger.kernel.org>; Tue, 16 Apr 2024 12:24:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713270255; cv=none; b=gvlN+cCnhctDTHZ7HgJ5OZ5lAkcmIwW0ceyZO+ZCO4g7w2ri9VkCgyUmTGeKEim0k0MeWkS8jX2aqqWKgfN7CkCKqWQZl990qX4HXlozfnW+bRXuqR2o/V40X0bo5wK4z6iXPfRLdn/CX9My4XhlrxUb8/7Tb9cfP0grtWcyLss=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713270255; c=relaxed/simple;
	bh=0EZdWOtP7NM8STvjjkFvfUlIITqK44hbFtD7FIgDxrc=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=ukgiF8dW+PYGGMQbt/LrUsQQNA3XV33EqHJA526x3swAi/lbAb8xr2X18wpXV9I9xPGTYMSMzrGufnPB7Cte7HRSxK8K+kz7Xyc+J7wHdc5de6h5omvwXqaSYhYGrdY+oTkqdEWKQzBKqaWHj2ThgXmnh6gulhnM5aILGMRuzYI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kv3+m0gk; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kv3+m0gk"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1713270254; x=1744806254;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=0EZdWOtP7NM8STvjjkFvfUlIITqK44hbFtD7FIgDxrc=;
  b=kv3+m0gkeP0NQpu59BF94hJ7B/XRrXvmoi52ILHXGogU6RWeJ/cYbF5R
   PoyIkwlhhFO8E2lw/YKCLKCDgWL7kXqR5mA4R5YiggqlG0bngCqrMIMod
   IGa+shoNCBdTS2cW62GQQhEjkzNAOECVmcvHEzOCFs/lz3Dbb6egkF4aA
   fFhyYFd5qJHbjuN4p5Ma6sEk/fk9hrXW90vtlwtGrclKAQaot4MUgvSqa
   9QzhK6OEbzX8Pg1z3CtNI1uE23pKVYQ++9KRJCUPH5q4hdo7g4KjmNL3T
   j/IOi+H9ZkywKSINKNkVgornhjMRiAeAt2iBjHs9USwYs/MZC5ToxPPKA
   A==;
X-CSE-ConnectionGUID: htCcB7iuR7O8LWdgVXiobw==
X-CSE-MsgGUID: wFstz3cZR4WdzxS3EgIHzw==
X-IronPort-AV: E=McAfee;i="6600,9927,11045"; a="31183722"
X-IronPort-AV: E=Sophos;i="6.07,206,1708416000"; 
   d="scan'208";a="31183722"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Apr 2024 05:24:13 -0700
X-CSE-ConnectionGUID: 05r7othMR5Kso51Y6bM9ig==
X-CSE-MsgGUID: 75uak4xxRIWlGr2z/bTc7w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,206,1708416000"; 
   d="scan'208";a="22657458"
Received: from ijarvine-desk1.ger.corp.intel.com (HELO localhost) ([10.245.247.34])
  by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Apr 2024 05:24:11 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Tue, 16 Apr 2024 15:24:06 +0300 (EEST)
To: Mario Limonciello <mario.limonciello@amd.com>
cc: Hans de Goede <hdegoede@redhat.com>, 
    "open list:X86 PLATFORM DRIVERS" <platform-driver-x86@vger.kernel.org>, 
    Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
Subject: Re: [PATCH] platform/x86/amd: Extend Framework 13 quirk to more
 BIOSes
In-Reply-To: <20240410141046.433-1-mario.limonciello@amd.com>
Message-ID: <ace9e5fe-0565-b24d-5394-ba4bd9f4305c@linux.intel.com>
References: <20240410141046.433-1-mario.limonciello@amd.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Wed, 10 Apr 2024, Mario Limonciello wrote:

> BIOS 03.05 still hasn't fixed the spurious IRQ1 issue.  As it's still
> being worked on there is still a possiblitiy that it won't need to
> apply to future BIOS releases.

Hi Mario,

Could you explain/confirm what the second sentence is supposed to mean? 
Mainly I mean "it won't need to apply to future", did you perhaps mean it 
might need to be applied still to some future versions too besides this 
one because the fix is still being worked on, or what?

There's also "possiblitiy" typo, in case you end up rewriting the message 
and send v2.

-- 
 i.


> Add a quirk for BIOS 03.05 as well.
> 
> Signed-off-by: Mario Limonciello <mario.limonciello@amd.com>
> ---
>  drivers/platform/x86/amd/pmc/pmc-quirks.c | 9 +++++++++
>  1 file changed, 9 insertions(+)
> 
> diff --git a/drivers/platform/x86/amd/pmc/pmc-quirks.c b/drivers/platform/x86/amd/pmc/pmc-quirks.c
> index b456370166b6..b4f49720c87f 100644
> --- a/drivers/platform/x86/amd/pmc/pmc-quirks.c
> +++ b/drivers/platform/x86/amd/pmc/pmc-quirks.c
> @@ -208,6 +208,15 @@ static const struct dmi_system_id fwbug_list[] = {
>  			DMI_MATCH(DMI_BIOS_VERSION, "03.03"),
>  		}
>  	},
> +	{
> +		.ident = "Framework Laptop 13 (Phoenix)",
> +		.driver_data = &quirk_spurious_8042,
> +		.matches = {
> +			DMI_MATCH(DMI_SYS_VENDOR, "Framework"),
> +			DMI_MATCH(DMI_PRODUCT_NAME, "Laptop 13 (AMD Ryzen 7040Series)"),
> +			DMI_MATCH(DMI_BIOS_VERSION, "03.05"),
> +		}
> +	},
>  	{}
>  };
>  
> 
