Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3750B23755
	for <platform-driver-x86@vger.kernel.org>; Fri,  5 Jan 2024 09:31:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WcfV1EZc"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1704447108; x=1735983108;
  h=date:from:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=cL/7ynf0G8ORTeLGDQysAxLl+kCG67XoYDjfx7oyntc=;
  b=WcfV1EZcaKTLSjccNL47mfv++l6rljmgY1e0tSVT+sXMjspsx9iykj9a
   5xcs00xA66Q5j1bOp4mlTVqZtfDxe/HBf1+YNLPXLhM6fpmKvbnJHqemP
   6n+Eh5MzYvHDpemWqWfAVVoQGu7rm20ThsyMsVSa14hOILT7TaGbKZDMs
   6c1IxiTjmHMyLHeOodcwbvXh/By9dDTxispv3P0HL7IhStWYHY3evOI96
   iynuQO4+HWheqqO2APEIxy/m3nIUAZE0kFkbiv+fQJga4UoJBX1zIQkjh
   oRydO2CcNWDlJMgEKLAR5G9zEaJxTck5Mq/t6IMa+zXwPoxETsuFX41Xg
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10943"; a="400233464"
X-IronPort-AV: E=Sophos;i="6.04,333,1695711600"; 
   d="scan'208";a="400233464"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Jan 2024 01:31:47 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10943"; a="851089612"
X-IronPort-AV: E=Sophos;i="6.04,333,1695711600"; 
   d="scan'208";a="851089612"
Received: from gchung-mobl.gar.corp.intel.com ([10.252.52.104])
  by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Jan 2024 01:31:46 -0800
Date: Fri, 5 Jan 2024 11:31:44 +0200 (EET)
From: =?ISO-8859-15?Q?Ilpo_J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>
To: Suma Hegde <suma.hegde@amd.com>
cc: platform-driver-x86@vger.kernel.org, Hans de Goede <hdegoede@redhat.com>, 
    Naveen Krishna Chatradhi <nchatrad@amd.com>
Subject: Re: [PATCH v4 6/9] platform/x86/amd/hsmp: Add support for ACPI based
 probing
In-Reply-To: <20240105074618.1667898-7-suma.hegde@amd.com>
Message-ID: <8f6cfe66-77c5-d6fd-797-13a97ff94f5@linux.intel.com>
References: <20240105074618.1667898-1-suma.hegde@amd.com> <20240105074618.1667898-7-suma.hegde@amd.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Fri, 5 Jan 2024, Suma Hegde wrote:

> ACPI table provides mailbox base address and register offset
> information. The base address is provided as part of CRS method
> and mailbox offsets are provided through DSD table.
> Sockets are differentiated by UIDs.
> 
> Signed-off-by: Suma Hegde <suma.hegde@amd.com>
> Signed-off-by: Naveen Krishna Chatradhi <nchatrad@amd.com>
> ---
> Changes since v3:
> 1. Add hsmp_create_acpi_sysfs_if() and
>    hsmp_create_non_acpi_sysfs_if() separately
> 2. Change hardcoded value 16 in is_acpi_hsmp_uuid() to UUID_SIZE
> 3. Change commit message
> Changes since v2:
> 1. Change EINVAL to ENODEV in hsmp_read_acpi_dsd()
> 2. Change EINVAL to ENOENT in hsmp_read_acpi_dsd()
> 3. Use resource_size() in hsmp_resource()
> Changes since v1:
> 1. Define amd_hsmp_acpi_rdwr() for doing mailbox memory mapped io
> 2. Add a check to see if mailbox register offsets are set in
>    hsmp_read_acpi_dsd()
> 3. Add a check to see if sock->mbinfo.base_addr sockck->mbinfo.size are
>    set in hsmp_read_acpi_crs()
> 4. Change order of the statements in switch case ACPI_RESOURCE_TYPE_FIXED_MEMORY32
>    in hsmp_resource()
> 5. Add hsmp_test() after hsmp_parse_acpi_table() call
> 6. Add r.end < r.start check in hsmp_resource()
> 7. Add !dsd error check in hsmp_read_acpi_dsd


> @@ -442,58 +648,85 @@ static int hsmp_init_metric_tbl_bin_attr(struct bin_attribute **hattrs, u16 sock
>  /* One bin sysfs for metrics table*/
>  #define NUM_HSMP_ATTRS		1
>  
> -static int hsmp_create_sysfs_interface(void)
> +static int hsmp_create_attr_list(struct attribute_group *attr_grp,
> +				 struct device *dev, u16 sock_ind)
>  {
> -	const struct attribute_group **hsmp_attr_grps;
>  	struct bin_attribute **hsmp_bin_attrs;
> +
> +	/* Null terminated list of attributes */
> +	hsmp_bin_attrs = devm_kzalloc(dev, sizeof(struct bin_attribute *) *
> +				      (NUM_HSMP_ATTRS + 1), GFP_KERNEL);
> +	if (!hsmp_bin_attrs)
> +		return -ENOMEM;
> +
> +	attr_grp->bin_attrs = hsmp_bin_attrs;
> +
> +	return hsmp_init_metric_tbl_bin_attr(hsmp_bin_attrs, sock_ind);
> +}
> +
> +static int hsmp_create_non_acpi_sysfs_if(struct device *dev)
> +{
> +	const struct attribute_group **hsmp_attr_grps;
>  	struct attribute_group *attr_grp;
> -	int ret;
>  	u16 i;
>  
>  	/* String formatting is currently limited to u8 sockets */
>  	if (WARN_ON(plat_dev.num_sockets > U8_MAX))
>  		return -ERANGE;
>  
> -	hsmp_attr_grps = devm_kzalloc(plat_dev.sock[0].dev, sizeof(struct attribute_group *) *
> +	hsmp_attr_grps = devm_kzalloc(dev, sizeof(struct attribute_group *) *
>  				      (plat_dev.num_sockets + 1), GFP_KERNEL);
>  	if (!hsmp_attr_grps)
>  		return -ENOMEM;
>  
>  	/* Create a sysfs directory for each socket */
>  	for (i = 0; i < plat_dev.num_sockets; i++) {
> -		attr_grp = devm_kzalloc(plat_dev.sock[i].dev, sizeof(struct attribute_group),
> +		attr_grp = devm_kzalloc(dev, sizeof(struct attribute_group),
>  					GFP_KERNEL);
>  		if (!attr_grp)
>  			return -ENOMEM;
>  
>  		snprintf(plat_dev.sock[i].name, HSMP_ATTR_GRP_NAME_SIZE, "socket%u", (u8)i);
> -		attr_grp->name = plat_dev.sock[i].name;
> -
> -		/* Null terminated list of attributes */
> -		hsmp_bin_attrs = devm_kzalloc(plat_dev.sock[i].dev, sizeof(struct bin_attribute *) *
> -					      (NUM_HSMP_ATTRS + 1), GFP_KERNEL);
> -		if (!hsmp_bin_attrs)
> -			return -ENOMEM;
> -
> -		attr_grp->bin_attrs		= hsmp_bin_attrs;
> +		attr_grp->name			= plat_dev.sock[i].name;
>  		attr_grp->is_bin_visible	= hsmp_is_sock_attr_visible;
>  		hsmp_attr_grps[i]		= attr_grp;
>  
> -		/* Now create the leaf nodes */
> -		ret = hsmp_init_metric_tbl_bin_attr(hsmp_bin_attrs, i);
> -		if (ret)
> -			return ret;
> +		hsmp_create_attr_list(attr_grp, dev, i);
>  	}
> -	return devm_device_add_groups(plat_dev.sock[0].dev, hsmp_attr_grps);
> +
> +	return devm_device_add_groups(dev, hsmp_attr_grps);
>  }

Can this refactoring of existing code be put into own patch, it would make 
this patch smaller?

> -static int hsmp_cache_proto_ver(void)
> +static int hsmp_create_acpi_sysfs_if(struct device *dev)
> +{
> +	struct attribute_group *attr_grp;
> +	u16 sock_ind;
> +	int ret;
> +
> +	attr_grp = devm_kzalloc(dev, sizeof(struct attribute_group), GFP_KERNEL);
> +	if (!attr_grp)
> +		return -ENOMEM;
> +
> +	attr_grp->is_bin_visible = hsmp_is_sock_attr_visible;
> +	ret = hsmp_get_uid(dev, &sock_ind);
> +	if (ret)
> +		return ret;

Is it intentional you don't provide .name here? hsmp_get_uid() gets you a 
socket id if I read your code correctly so wouldn't be more consistent to 
generate the "socket%u" name based on that?

> +	ret = hsmp_create_attr_list(attr_grp, dev, sock_ind);
> +	if (ret)
> +		return ret;
> +
> +	return devm_device_add_group(dev, attr_grp);
> +}


-- 
 i.

