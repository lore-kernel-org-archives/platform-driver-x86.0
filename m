Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BAC83D16FD;
	Mon, 11 May 2026 17:38:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778521117; cv=none; b=FtpYjeO/yriPbhPHoE5qjp4OAWJnOYk4owH3PKFzyulIkkYYusYlhg5SCZzluqdC3wm9VrttnDilwu6AkwbjzjdLM6SNu8YgJ77c9MjzKClCoRX/lqIIftJ9M9iHg6J6VGdeTfPg4ps2NaDCnm2TDsWgMNzdQ87PR87KmY5/qaY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778521117; c=relaxed/simple;
	bh=nHcVkKfhFF+X3gqOjdsQoO7EnjM12dAR0t6+kvQ16/A=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=o5lEB8rpP1xY/EeFLLq32KOs3je5oIK8FepUc/tkKFV6zXYrV4gh7JRrW8e1WFFGllnpaOWmGMuv6X+CIgaa5F7ywaxNoBbA+T2jl3oN8OrzqSwMTYhN0zloQoTqC9YgxnJnrYGd30czmDvB2OQ2+7uC0Fwj+hQJ2FaGbb23KzY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fbRJ9EiP; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fbRJ9EiP"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778521117; x=1810057117;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=nHcVkKfhFF+X3gqOjdsQoO7EnjM12dAR0t6+kvQ16/A=;
  b=fbRJ9EiPlkb6JI5S8i3GfQcYXwQA5J7bEivYYDMe4dVHem+jN5sUmkCe
   Nc4SE1HulS+xLfA+/egAtj+TACtorr1Z/qK/q77F6kCqPCVyN2l2sf4aF
   My02yj8wH/vVkCl0iPYahMnGegb/TrgO2OhILQ2kSClIxCGPxqUJuGYNW
   mHwrkyjKHMwzTsg+q6V0Mj4I0ptFF+FXhd+QOwopA9yX62ZHcdGanXdQ3
   faPf7Smn/i7iv6ZTQywy7cKkiwSvvInDjZG1+BbMWvwkDX4v09vS7cTMX
   0x0sxlsGFCov1n8eqJZdFX7rSQnYvSeyMKld7PxP78fzWlVQ70UdJK23k
   g==;
X-CSE-ConnectionGUID: 0sJ0gRP6TPuULmQW5SqNZA==
X-CSE-MsgGUID: WjtWvaGkRbO5VcQiyOBHlA==
X-IronPort-AV: E=McAfee;i="6800,10657,11783"; a="79314998"
X-IronPort-AV: E=Sophos;i="6.23,229,1770624000"; 
   d="scan'208";a="79314998"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 May 2026 10:38:37 -0700
X-CSE-ConnectionGUID: jrjOcpCqRvmApRbwePHLTw==
X-CSE-MsgGUID: FYzb2oHMQWyderX/lwlCXw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,229,1770624000"; 
   d="scan'208";a="261006895"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.28])
  by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 May 2026 10:38:32 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Mon, 11 May 2026 20:38:28 +0300 (EEST)
To: Muralidhara M K <muralidhara.mk@amd.com>
cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
    "Rafael J. Wysocki" <rafael@kernel.org>, 
    platform-driver-x86@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, 
    driver-core@lists.linux.dev, 
    Muthusamy Ramalingam <muthusamy.ramalingam@amd.com>
Subject: Re: [PATCH v2 2/7] platform/x86/amd/hsmp: Add metrics table support
 for Family 1Ah Model 50h-5Fh
In-Reply-To: <20260427155129.545327-3-muralidhara.mk@amd.com>
Message-ID: <eea60cbe-1200-6c42-cfb6-f5eea88242ab@linux.intel.com>
References: <20260427155129.545327-1-muralidhara.mk@amd.com> <20260427155129.545327-3-muralidhara.mk@amd.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Mon, 27 Apr 2026, Muralidhara M K wrote:

> Define the UAPI structures hsmp_metric_table_zen6_iod,
> hsmp_metric_table_zen6_ccd and the top-level hsmp_metric_table_zen6
> to describe the per-IOD and per-CCD metrics layout for AMD Family 1Ah
> Model 50h-5Fh processors (HSMP protocol version 7).  These structures
> allow userspace tools to interpret the raw metric table binary exposed
> via sysfs.
> 
> Widen the ACPI driver protocol version checks from
> == HSMP_PROTO_VER6 to >= HSMP_PROTO_VER6 so the metric table
> sysfs binary attribute is also created for protocol version 7 and
> future versions.
> 
> Co-developed-by: Muthusamy Ramalingam <muthusamy.ramalingam@amd.com>
> Signed-off-by: Muthusamy Ramalingam <muthusamy.ramalingam@amd.com>
> Signed-off-by: Muralidhara M K <muralidhara.mk@amd.com>
> ---

> diff --git a/drivers/platform/x86/amd/hsmp/acpi.c b/drivers/platform/x86/amd/hsmp/acpi.c
> index 97ed71593bdf..8044df862275 100644
> --- a/drivers/platform/x86/amd/hsmp/acpi.c
> +++ b/drivers/platform/x86/amd/hsmp/acpi.c
> @@ -244,7 +244,7 @@ static ssize_t hsmp_metric_tbl_acpi_read(struct file *filp, struct kobject *kobj
>  static umode_t hsmp_is_sock_attr_visible(struct kobject *kobj,
>  					 const struct bin_attribute *battr, int id)
>  {
> -	if (hsmp_pdev->proto_ver == HSMP_PROTO_VER6)
> +	if (hsmp_pdev->proto_ver >= HSMP_PROTO_VER6)
>  		return battr->attr.mode;
>  
>  	return 0;
> @@ -491,7 +491,7 @@ static int init_acpi(struct device *dev)
>  		return ret;
>  	}
>  
> -	if (hsmp_pdev->proto_ver == HSMP_PROTO_VER6) {
> +	if (hsmp_pdev->proto_ver >= HSMP_PROTO_VER6) {
>  		ret = hsmp_get_tbl_dram_base(sock_ind);
>  		if (ret)
>  			dev_info(dev, "Failed to init metric table\n");

I'm trying to understand is changing these checks safe at this point of 
series, or should it be the last patch of the series? What will occur on 
v7 hw when this patch is applied but not the rest of the series, are the 
tables returned binary combatible with v6?

-- 
 i.

