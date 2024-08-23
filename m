Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B844B46556
	for <platform-driver-x86@vger.kernel.org>; Fri, 23 Aug 2024 13:54:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724421301; cv=none; b=Z5O2pG7Pyc0KVGKWibLgQn+gXhuGOsdgkMLB9Snce4fg3BZz8vZTNpXiXtITXWZKDJpP20ovECBsUC6pGtuTLLSLkUSJT+Y+pTajcC/kEC7PuU7dM+PaaUSVZtmpO9yxuxN5TJ+Frovb3rOly/k2Jk41OQWzIh/IhGmWNWgNhOo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724421301; c=relaxed/simple;
	bh=JvjQ0F2A0MYclMkvBxMy5CR4fScMV45ypoK540rD2QM=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=lefDyUVXF7FcdblgeG2ZfbPme74AavB+qfv1IlNNp6g/HhhKXHLe+OwSAAQJ/sGqIcvCTGmvxF5FZIfiSEX99HkiMVoXCiJDjW+X2uJdvx5vL0PQ0MvcnJdWZcNLxWEKTd8NgQugDfAitSdRjxuRHGWJ+N2ce4x1emnq/ecejlk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=g3Ed2pC2; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="g3Ed2pC2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1724421299; x=1755957299;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=JvjQ0F2A0MYclMkvBxMy5CR4fScMV45ypoK540rD2QM=;
  b=g3Ed2pC2kvEKxiQeAfnlJuVlRGzjZxJZ2XKV8/EDhfWImumuZw3L9Zam
   wyrHipO11VMcri90Jx55TFLElh41XYfttnpBBDOpuHlIHeXXBqhaFzzrl
   atX98wA88uwiZnALo9jAqQvqQIYRRjIAy10OOW4ZwKREiUP514gMCBGVh
   VFBEpltoa6lAQeVKzewz2vOAUudz3H8EK9BoZM0+HwYckNC5QFLHVgIRm
   yXItK2REobI1cKp0HmZVDXUjvUURDuUK2e0bY08U+Z8TCMHxIakCT5Ffl
   yUBcAIdWCcPh6HMdgtxHsoXhdeZ7zfC4otJR4HtsrJSYwzgZDuFyYrzD5
   w==;
X-CSE-ConnectionGUID: zU+W44PIT2qRAshVi0sDFA==
X-CSE-MsgGUID: E/eh4cEWSHCLW/5LH/CU2Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11172"; a="33513297"
X-IronPort-AV: E=Sophos;i="6.10,170,1719903600"; 
   d="scan'208";a="33513297"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Aug 2024 06:54:58 -0700
X-CSE-ConnectionGUID: NIYTzx1STdmChWQ2T+HIhA==
X-CSE-MsgGUID: CATdnAknQY+cXqvpHrKHog==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,170,1719903600"; 
   d="scan'208";a="62104634"
Received: from ijarvine-desk1.ger.corp.intel.com (HELO localhost) ([10.245.245.2])
  by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Aug 2024 06:54:57 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Fri, 23 Aug 2024 16:54:53 +0300 (EEST)
To: Suma Hegde <suma.hegde@amd.com>
cc: platform-driver-x86@vger.kernel.org, Hans de Goede <hdegoede@redhat.com>, 
    Naveen Krishna Chatradhi <naveenkrishna.chatradhi@amd.com>
Subject: Re: [v5 11/11] platform/x86/amd/hsmp: Fix potential spectre issue
In-Reply-To: <20240823075543.884265-11-suma.hegde@amd.com>
Message-ID: <b26f3a01-7c5d-70f8-88fa-2128a8aa18ea@linux.intel.com>
References: <20240823075543.884265-1-suma.hegde@amd.com> <20240823075543.884265-11-suma.hegde@amd.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Fri, 23 Aug 2024, Suma Hegde wrote:

> Fix below warning caused by smatch by using array_index_nospec()
> to clamp the index within the range.
> "warn: potential spectre issue 'plat_dev.sock' [r] (local cap)"

While the warning have always been bogus for these code paths because
those are not user controllable values, I suspect the warning might no 
longer trigger at all. I suspect the warning is tied to kstr*() which is 
no longer used.

Also, it should be hsmp_pdev but please retest if this patch can be 
dropped from this series (no need to resend the entire series because of 
that, just mention if this patch can be left out).

-- 
 i.


> 
> Signed-off-by: Suma Hegde <suma.hegde@amd.com>
> Reviewed-by: Naveen Krishna Chatradhi <naveenkrishna.chatradhi@amd.com>
> ---
> Changes since v4:
> None
> 
> Changes since v3:
> None
> 
> Changes since v2:
> None
> 
> Changes since v1:
> Change plat_dev to hsmp_pdev
> 
>  drivers/platform/x86/amd/hsmp/acpi.c | 3 +++
>  drivers/platform/x86/amd/hsmp/plat.c | 3 +++
>  2 files changed, 6 insertions(+)
> 
> diff --git a/drivers/platform/x86/amd/hsmp/acpi.c b/drivers/platform/x86/amd/hsmp/acpi.c
> index f2bfc5981590..16a82b8bce28 100644
> --- a/drivers/platform/x86/amd/hsmp/acpi.c
> +++ b/drivers/platform/x86/amd/hsmp/acpi.c
> @@ -18,6 +18,7 @@
>  #include <linux/ioport.h>
>  #include <linux/kstrtox.h>
>  #include <linux/module.h>
> +#include <linux/nospec.h>
>  #include <linux/platform_device.h>
>  #include <linux/sysfs.h>
>  #include <linux/uuid.h>
> @@ -272,6 +273,8 @@ static int init_acpi(struct device *dev)
>  	if (sock_ind >= hsmp_pdev.num_sockets)
>  		return -EINVAL;
>  
> +	sock_ind = array_index_nospec(sock_ind, hsmp_pdev.num_sockets);
> +
>  	ret = hsmp_parse_acpi_table(dev, sock_ind);
>  	if (ret) {
>  		dev_err(dev, "Failed to parse ACPI table\n");
> diff --git a/drivers/platform/x86/amd/hsmp/plat.c b/drivers/platform/x86/amd/hsmp/plat.c
> index d55c984a9a5a..8fb395e91806 100644
> --- a/drivers/platform/x86/amd/hsmp/plat.c
> +++ b/drivers/platform/x86/amd/hsmp/plat.c
> @@ -15,6 +15,7 @@
>  #include <linux/device.h>
>  #include <linux/module.h>
>  #include <linux/pci.h>
> +#include <linux/nospec.h>
>  #include <linux/platform_device.h>
>  #include <linux/sysfs.h>
>  
> @@ -79,6 +80,8 @@ static ssize_t hsmp_metric_tbl_read(struct file *filp, struct kobject *kobj,
>  	if (sock_ind >= hsmp_pdev.num_sockets)
>  		return -EINVAL;
>  
> +	sock_ind = array_index_nospec(sock_ind, hsmp_pdev.num_sockets);
> +
>  	sock = &hsmp_pdev.sock[sock_ind];
>  	if (!sock)
>  		return -EINVAL;
> 

