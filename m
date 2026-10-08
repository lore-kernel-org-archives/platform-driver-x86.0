Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 106EE46DFF6;
	Thu,  8 Oct 2026 11:58:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791460698; cv=none; b=lD+qv+S1t1evkxt1XvVTe8PFSEiZTF3CDsSa9QzNF6pZKZt0MXl6BtYJQ7K69i3Dxb4F/HiCIryKn4kVXLjXw6N2iBTtOm1EEgF2ij9rRXBhCVtIyOgptd5ozBbgWklqR0lCIqEXBbt2ClElZVgbpM+ISec7eeD/8jIW25LXa14=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791460698; c=relaxed/simple;
	bh=QW656aZrKePz96ky3msNoBPX0EXK7DxqAh+Po0M75KY=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=lhfPRULOtEWPUbcwpwiLbMRa3BslYh3DTZxgbk4qSMGkl0zayrfqI6Nn8glnoYh2VV0mtynHZFimaRkA22TeMeEkxXkNYB0ogupMYAC602bXDnXAZsAjcb27ePM8V5+YWjD00apbtxZsEbpn8RahRGIEdVCxEfbmI6vRCQ5TYVA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=X6AzId9o; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="X6AzId9o"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791460697; x=1822996697;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=QW656aZrKePz96ky3msNoBPX0EXK7DxqAh+Po0M75KY=;
  b=X6AzId9oMW1HcZU+KLwj0VOQmsmVy6Ou1rNWdjNeYU1QWRub2DmY1sT0
   0rGbaIGYHmQGwsJ2Mj+nsqPyvQyTZAol+x+AiuIH2UKTsUpABJlZXdAQv
   Tt0aKFRgk6soOy60tiuIXOGz5UsCX6MN5pLYbyeY6A2Dum9cfkZgcidNA
   yCa5ibF1FMIqRrVr5rscAXP1adVlvfcrIjxq0EBZCHyQ55BO4/C4aULhh
   EqZZMlqnE9l0biZMViZFoEKGAxqD6k3n56Sf3OSEq9x/Rn8LlIBrrTwhV
   4+PqhT4Ba3ZUwEGTIPbZ9QlBPaVHtomnCQCJ2MxSf+lMHDdRbjX8kx8fv
   A==;
X-CSE-ConnectionGUID: jjEBL96kSQSXNCrRNPjlqQ==
X-CSE-MsgGUID: mh9EwEItRbSMGu/Z3LQaXQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11928"; a="125716"
X-IronPort-AV: E=Sophos;i="6.27,146,1787036400"; 
   d="scan'208";a="125716"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Oct 2026 04:58:17 -0700
X-CSE-ConnectionGUID: 0d0aHGBwQw2zv4lNz8LzjA==
X-CSE-MsgGUID: 2NaIShYTRIKFklUbohexTQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,146,1787036400"; 
   d="scan'208";a="378815"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.140])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Oct 2026 04:58:14 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Thu, 8 Oct 2026 14:58:11 +0300 (EEST)
To: Muralidhara M K <muralidhara.mk@amd.com>
cc: platform-driver-x86@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v7 3/4] platform/x86/amd/hsmp: Hide server-only attributes
 on client platforms
In-Reply-To: <20260924154947.1706669-4-muralidhara.mk@amd.com>
Message-ID: <370cbc28-0628-fef7-cc35-b1b70f8fc9fc@linux.intel.com>
References: <20260924154947.1706669-1-muralidhara.mk@amd.com> <20260924154947.1706669-4-muralidhara.mk@amd.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Thu, 24 Sep 2026, Muralidhara M K wrote:

> Most ACPI sysfs device attributes are wired to hardcoded server
> message IDs (HSMP_GET_SOCKET_POWER and friends); hwmon power
> attributes registered from init_acpi() have the same problem. On a
> Family 1Ah client platform these numeric IDs resolve against enum
> hsmp_client_message_ids instead, and mostly collide with unrelated
> client commands, e.g. HSMP_GET_SOCKET_POWER (4) is
> HSMP_CLIENT_GET_METRICS_TABLE_VER on the client side.
> 
> Hide the affected ACPI sysfs attributes on client platforms except
> smu_fw_version and protocol_version, which report the same data in
> both tables. Forward-declare hattr_smu_fw_version and
> hattr_protocol_version ahead of their HSMP_DEV_ATTR() definitions.
> Skip hsmp_create_sensor() in init_acpi() on client platforms for the
> same reason.
> 
> The metrics_bin sysfs binary attribute has the same visibility problem:
> hsmp_is_sock_attr_visible() gates it on hsmp_pdev->proto_ver against
> HSMP_PROTO_VER6 with no is_client_platform() check. Exclude client
> platforms outright there too, matching the ACPI sysfs attributes
> above: the client set has its own telemetry table, read only through
> HSMP_IOCTL_GET_TELEMETRY_DATA.
> 
> Signed-off-by: Muralidhara M K <muralidhara.mk@amd.com>
> ---
>  drivers/platform/x86/amd/hsmp/acpi.c | 29 ++++++++++++++++++++++++----
>  1 file changed, 25 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/platform/x86/amd/hsmp/acpi.c b/drivers/platform/x86/amd/hsmp/acpi.c
> index 8b4bf57c3485..d775ea8ba603 100644
> --- a/drivers/platform/x86/amd/hsmp/acpi.c
> +++ b/drivers/platform/x86/amd/hsmp/acpi.c
> @@ -300,16 +300,31 @@ static umode_t hsmp_is_sock_attr_visible(struct kobject *kobj,
>  	 * so that userspace which expects the file to exist gets a clear
>  	 * -EOPNOTSUPP from the read handler instead of -ENOENT, and is
>  	 * pointed at HSMP_IOCTL_GET_TELEMETRY_DATA as the supported path.
> +	 * The client set has its own telemetry table, read only through
> +	 * HSMP_IOCTL_GET_TELEMETRY_DATA; never show this file there.
>  	 */
> -	if (hsmp_pdev->proto_ver >= HSMP_PROTO_VER6)
> +	if (!is_client_platform() && hsmp_pdev->proto_ver >= HSMP_PROTO_VER6)
>  		return battr->attr.mode;
>  
>  	return 0;
>  }
>  
> +/* Defined below by HSMP_DEV_ATTR(); same message ID in both message tables */
> +static struct hsmp_sys_attr hattr_smu_fw_version;
> +static struct hsmp_sys_attr hattr_protocol_version;
> +
>  static umode_t hsmp_is_sock_dev_attr_visible(struct kobject *kobj,
>  					     struct attribute *attr, int id)
>  {
> +	/*
> +	 * smu_fw_version and protocol_version map to the same data in both
> +	 * message tables. Every other attribute here uses server-only
> +	 * message IDs that resolve to unrelated client commands.
> +	 */
> +	if (is_client_platform() && attr != &hattr_smu_fw_version.dattr.attr &&
> +	    attr != &hattr_protocol_version.dattr.attr)
> +		return 0;
> +
>  	return attr->mode;
>  }
>  
> @@ -564,9 +579,15 @@ static int init_acpi(struct device *dev)
>  			dev_info(dev, "Failed to init metric table\n");
>  	}
>  
> -	ret = hsmp_create_sensor(dev, sock_ind);
> -	if (ret)
> -		dev_info(dev, "Failed to register HSMP sensors with hwmon\n");
> +	/*
> +	 * hwmon attributes use server-only message IDs, which resolve to
> +	 * unrelated client commands on client platforms.
> +	 */
> +	if (!is_client_platform()) {
> +		ret = hsmp_create_sensor(dev, sock_ind);
> +		if (ret)
> +			dev_info(dev, "Failed to register HSMP sensors with hwmon\n");
> +	}
>  
>  	dev_set_drvdata(dev, &hsmp_pdev->sock[sock_ind]);

This series still feels misordered.

Can we like introduce is_client_platform() first, then add all these 
checks before adding the client support in the first place? This 
same ordering problem applies to the client/server check in patch 2 as 
well.

And would structs in patch 4 also needed earlier? This is not as bad 
problem as the above ordering one but I'd tend to think we'd want to 
introduce the struct before HSMP_CLIENT_GET_METRICS_TABLE actually works 
which is after patch 1, right?

-- 
 i.

