Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 293E8423A9A;
	Tue, 28 Apr 2026 13:00:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777381251; cv=none; b=PjC+aQfJ1Q3i9ZR6ekdyV+U7x0dsHQcCYS98hwOEs8NdRNPvYFy/w2eUSn3y6iC3vTUidoqXYNtbommV6Q8luHRr0poPv2dzRZJERCetzSNlW2mkX3A8GlMjpq8ntb6CfapJDWx6q3BmY92rZWK3Q6bMWEDW+ZMnSL3RBhECe3M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777381251; c=relaxed/simple;
	bh=Z84WGBB82M60su0bSoihMKxExgLORjNmtPJwzyPsr4s=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=NHhGMe6STATe9yNBEhUC0c7wxAKrCnVevySRKn9mO9bkoyJOBiYpsm5am9YsrF/nmKoYvtWZp09pkFiLn1mh4QCRunMcR9zvbdjqfdiw54S/6f5yf2inHRgjuYq3mr/QTpJoIhggWKt0+m3bPcHXlscuU1ftZep51imlGIsTKEY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=U9mWW661; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="U9mWW661"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1777381243; x=1808917243;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=Z84WGBB82M60su0bSoihMKxExgLORjNmtPJwzyPsr4s=;
  b=U9mWW661fux1642I3nBU1IPiXpt7neipDZoGCIPFm7MOaWbTHDpmB54j
   sCSgg1WW5RTJAcd2D/sd2TkbwY7zipS3v1azrYtBFSlghFYkUHslWkdp0
   bNbRTSjUWW67LDmzo3VL++HLAcpc7MC2IiI7KY7ovoWm5/Ls3hQqnBseb
   TdkydtpoGnU7i5MRIkdKl5CvpH3HN6Id8zmeQX3QhUR1e5r2Ms8ZQvijp
   p21E/8BmTiEz1UhJqtB2qQz6Wypmt4O6eF+4E0wqbEY91L/YOK9ecgTTI
   cnVLqkDv7hYrEJ+A298yIK/8v14f5fPSx1vgszAqMkdn33J4fz1A1Ejqd
   A==;
X-CSE-ConnectionGUID: 9cBdqepMQk+/w34MG/0K6g==
X-CSE-MsgGUID: DetZoRwvS2qpQ2cRtqN7LQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11769"; a="89667509"
X-IronPort-AV: E=Sophos;i="6.23,204,1770624000"; 
   d="scan'208";a="89667509"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Apr 2026 06:00:37 -0700
X-CSE-ConnectionGUID: 94GNMGVtR2+rw53/KOhhYw==
X-CSE-MsgGUID: mVgfa0vBTWOAG+zX1gw4Pw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,204,1770624000"; 
   d="scan'208";a="230796399"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.1])
  by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Apr 2026 06:00:35 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Tue, 28 Apr 2026 16:00:31 +0300 (EEST)
To: Mark Pearson <mpearson-lenovo@squebb.ca>
cc: Hans de Goede <hansg@kernel.org>, platform-driver-x86@vger.kernel.org, 
    ibm-acpi-devel@lists.sourceforge.net, LKML <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] platform/x86: thinkpad_acpi: Add sysfs to display HWDD
 raw
In-Reply-To: <20260428125327.1196296-1-mpearson-lenovo@squebb.ca>
Message-ID: <75ad46f0-2c1f-9831-eff6-92df477f7db8@linux.intel.com>
References: <mpearson-lenovo@squebb.ca> <20260428125327.1196296-1-mpearson-lenovo@squebb.ca>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Tue, 28 Apr 2026, Mark Pearson wrote:

> The Lenovo diagnostics and support team have requested a mechanism
> to get the raw data from the HWDD commands to support customer debug
> situations.
> 
> Add a sysfs entry to display the raw data.
> 
> As it shouldn't be needed in normal operation, add a hwdd_raw_enable
> module parameter for when it is needed

Wouldn't debugfs be more appropriate for things like this? By using it, 
you can avoid adding the module parameter as well.

-- 
 i.

> Signed-off-by: Mark Pearson <mpearson-lenovo@squebb.ca>
> ---
>  drivers/platform/x86/lenovo/thinkpad_acpi.c | 31 +++++++++++++++++++++
>  1 file changed, 31 insertions(+)
> 
> diff --git a/drivers/platform/x86/lenovo/thinkpad_acpi.c b/drivers/platform/x86/lenovo/thinkpad_acpi.c
> index e1cee42a1683..299cc4022e96 100644
> --- a/drivers/platform/x86/lenovo/thinkpad_acpi.c
> +++ b/drivers/platform/x86/lenovo/thinkpad_acpi.c
> @@ -406,6 +406,7 @@ static enum {
>  
>  static int experimental;
>  static u32 dbg_level;
> +static bool hwdd_raw_enable;
>  
>  static struct workqueue_struct *tpacpi_wq;
>  
> @@ -11217,18 +11218,44 @@ static ssize_t hwdd_status_show(struct device *dev,
>  
>  	return sysfs_emit(buf, "0\n");
>  }
> +
> +/* sysfs type-c damage detection raw data */
> +static ssize_t hwdd_raw_show(struct device *dev,
> +			     struct device_attribute *attr,
> +			     char *buf)
> +{
> +	unsigned int damage_status;
> +	int err;
> +
> +	if (!ucdd_supported)
> +		return -ENODEV;
> +
> +	/* Get USB TYPE-C damage status */
> +	err = hwdd_command(HWDD_GET_DMG_USBC, &damage_status);
> +	if (err)
> +		return err;
> +
> +	return sysfs_emit(buf, "0x%x\n", damage_status);
> +}
> +
> +static DEVICE_ATTR_RO(hwdd_raw);
>  static DEVICE_ATTR_RO(hwdd_status);
>  static DEVICE_ATTR_RO(hwdd_detail);
>  
>  static struct attribute *hwdd_attributes[] = {
>  	&dev_attr_hwdd_status.attr,
>  	&dev_attr_hwdd_detail.attr,
> +	&dev_attr_hwdd_raw.attr,
>  	NULL
>  };
>  
>  static umode_t hwdd_attr_is_visible(struct kobject *kobj,
>  				struct attribute *attr, int n)
>  {
> +	/* Only display hwdd_raw if debug option has been set */
> +	if (attr == &dev_attr_hwdd_raw.attr && !hwdd_raw_enable)
> +		return 0;
> +
>  	return hwdd_support_available ? attr->mode : 0;
>  }
>  
> @@ -11956,6 +11983,10 @@ static int __init set_ibm_param(const char *val, const struct kernel_param *kp)
>  	return -EINVAL;
>  }
>  
> +module_param(hwdd_raw_enable, bool, 0444);
> +MODULE_PARM_DESC(hwdd_raw_enable,
> +		 "Enables hwdd raw output sysfs interface");
> +
>  module_param(experimental, int, 0444);
>  MODULE_PARM_DESC(experimental,
>  		 "Enables experimental features when non-zero");
> 
