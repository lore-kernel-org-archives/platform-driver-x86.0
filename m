Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1B793115B2
	for <platform-driver-x86@vger.kernel.org>; Tue, 19 Aug 2025 08:23:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755591841; cv=none; b=I5HT+gOdPTY+rWPmNXYZIRZE8kt1KGeMyY7VjKGzF6NeW1CQvJxF3vdIo5aVWKTr3gxOfc8n0wLD44wG1arLgSFkenGt2I+AW8h+BLDaXr5Xi6Fv1ImuabwS7KB3Hmgs6ScXuHU0i8K2RZZx4dRPClUBuxm7EwttfZIHtnQcdg0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755591841; c=relaxed/simple;
	bh=kmqRhdfH0BXLU/dltH10kRxFK5fw3C59Jyl+804GcZw=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=DdUCyVGhGfaGZheCaMlguqtd8M9nF20POVbFJKKng8yg09QZ/BHJnYh+W5NGl0El9ElcfskXBzG8UCDOnh0CScVgXD1xy/a9nxnXsniyl/dWW7Bx/8hDR9owErWOYr8UBIBGPBvU1r2jeGv4vJw0U4va7eIx9uNe++hEqGhdWts=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GOIjOjtc; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GOIjOjtc"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1755591840; x=1787127840;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=kmqRhdfH0BXLU/dltH10kRxFK5fw3C59Jyl+804GcZw=;
  b=GOIjOjtc8NPpH1NEbl8xf0mkaaQwjckSfK1GYDAMWh86FNDXuytVmgkW
   X8CMZfnSIiA/yq24yuGcGKmnZehRyo4kr5r1QPzYCMaxnA3w4OJrMwRFB
   lUKxCk0wSP9tE1ksZi84kDmr1AE5PUId2TMO8KMgmNKczdtEA2gMXRuls
   fdn9f+Vh/7i0SloWqYops/Ava023SlhdP8u28vLD5w0H/zZvMQUSy0ebZ
   Ir/Hq7eDEuMwaD2DxGgXe2DZ3o6oDmX7QJyCFWRE/Ub3/4xes/5Xj1vy9
   +E7TZAHcdmRLKAScIehMRRW5rY+E08saj/i+BwIG64slpp3lpSfO8tIee
   A==;
X-CSE-ConnectionGUID: dn38AxqsQjKpSGrRdl2jdA==
X-CSE-MsgGUID: +LbM2LYATk6V939E35ecAA==
X-IronPort-AV: E=McAfee;i="6800,10657,11526"; a="80423398"
X-IronPort-AV: E=Sophos;i="6.17,300,1747724400"; 
   d="scan'208";a="80423398"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Aug 2025 01:23:59 -0700
X-CSE-ConnectionGUID: 9Icb9NL/QTuMU7ph6nQJYg==
X-CSE-MsgGUID: lQNcEiwkQKOfS+Q46XysdA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,300,1747724400"; 
   d="scan'208";a="167693166"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.120])
  by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Aug 2025 01:23:57 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Tue, 19 Aug 2025 11:23:53 +0300 (EEST)
To: Suma Hegde <suma.hegde@amd.com>
cc: platform-driver-x86@vger.kernel.org, Hans de Goede <hdegoede@redhat.com>, 
    Naveen Krishna Chatradhi <naveenkrishna.chatradhi@amd.com>
Subject: Re: [PATCH v2 1/4] platform/x86/amd/hsmp: Use mutex to synchronize
 ACPI based probe
In-Reply-To: <20250723051251.3009625-2-suma.hegde@amd.com>
Message-ID: <6a754baa-e61b-1807-c399-004a6f43c2f2@linux.intel.com>
References: <20250723051251.3009625-1-suma.hegde@amd.com> <20250723051251.3009625-2-suma.hegde@amd.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Wed, 23 Jul 2025, Suma Hegde wrote:

> The hsmp_acpi_probe() function is called for each socket. When
> asynchronous probing is enabled, it can lead to race conditions
> due to multiple probes accessing shared data (hsmp_pdev->sock
> and the hsmp_pdev->is_probed variable), which may cause potential
> issues.
> 
> To resolve these issues, a guard mutex has been introduced to ensure
> synchronized execution.
> 
> Suggested-by: Hans de Goede <hdegoede@redhat.com>
> Signed-off-by: Suma Hegde <suma.hegde@amd.com>
> Reviewed-by: Naveen Krishna Chatradhi <naveenkrishna.chatradhi@amd.com>

I guess Fixes tag would be in order for this and some other patches in 
the series too.

-- 
 i.

> ---
> Changes since v1:
> 1. Guard the remove() also
> 2. Update commit description
> 
>  drivers/platform/x86/amd/hsmp/acpi.c | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/drivers/platform/x86/amd/hsmp/acpi.c b/drivers/platform/x86/amd/hsmp/acpi.c
> index d974c2289f5a..b981ae3157ea 100644
> --- a/drivers/platform/x86/amd/hsmp/acpi.c
> +++ b/drivers/platform/x86/amd/hsmp/acpi.c
> @@ -13,6 +13,7 @@
>  
>  #include <linux/acpi.h>
>  #include <linux/array_size.h>
> +#include <linux/cleanup.h>
>  #include <linux/bits.h>
>  #include <linux/bitfield.h>
>  #include <linux/device.h>
> @@ -20,6 +21,7 @@
>  #include <linux/ioport.h>
>  #include <linux/kstrtox.h>
>  #include <linux/module.h>
> +#include <linux/mutex.h>
>  #include <linux/platform_device.h>
>  #include <linux/sysfs.h>
>  #include <linux/uuid.h>
> @@ -44,6 +46,8 @@ struct hsmp_sys_attr {
>  	u32 msg_id;
>  };
>  
> +static DEFINE_MUTEX(hsmp_lock);
> +
>  static int amd_hsmp_acpi_rdwr(struct hsmp_socket *sock, u32 offset,
>  			      u32 *value, bool write)
>  {
> @@ -584,6 +588,7 @@ static int hsmp_acpi_probe(struct platform_device *pdev)
>  	hsmp_pdev = get_hsmp_pdev();
>  	if (!hsmp_pdev)
>  		return -ENOMEM;
> +	guard(mutex)(&hsmp_lock);
>  
>  	if (!hsmp_pdev->is_probed) {
>  		hsmp_pdev->num_sockets = amd_num_nodes();
> @@ -620,6 +625,7 @@ static int hsmp_acpi_probe(struct platform_device *pdev)
>  
>  static void hsmp_acpi_remove(struct platform_device *pdev)
>  {
> +	guard(mutex)(&hsmp_lock);
>  	/*
>  	 * We register only one misc_device even on multi-socket system.
>  	 * So, deregister should happen only once.
> 
