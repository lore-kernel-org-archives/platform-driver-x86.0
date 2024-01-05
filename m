Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C59BB241F1
	for <platform-driver-x86@vger.kernel.org>; Fri,  5 Jan 2024 09:38:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QGM9zUJq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1704447482; x=1735983482;
  h=date:from:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=lBvbxXrTxVEzvJ8TJvDu3Reig2TZ7YlkTGcUUC6jVXg=;
  b=QGM9zUJqoZ5FIsO8LVYAOx1zOOFSGxr2d25Q68ya4AlTVjqbloCr8DH3
   Skd4FqH57wUkfl9E+e7VBVL3pAtzqxQMBlQ04w6BSt4KJJXMUy2nSWhEp
   RZne9VwKJ+udfzegYq8WOnyPqByxvVac/JZYr5YoCsxtEAXSUQcY20NY8
   aLpD8idnTsFob19l42wwn38CSco+wvC8TPjtNgweMDBeTzOMKrCjMamyJ
   NVw3R2oh5l+5rDdYKUdsaryjflX4npyuuaDbV5NBLNeo9igZF4DWsZqJK
   lPytCtWlBRRhGUc89gNB2pBaoaIz5z9xDSxl1TOeAX2vgfCBeCYMDY7im
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10943"; a="4285111"
X-IronPort-AV: E=Sophos;i="6.04,333,1695711600"; 
   d="scan'208";a="4285111"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Jan 2024 01:38:01 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.04,333,1695711600"; 
   d="scan'208";a="15195483"
Received: from gchung-mobl.gar.corp.intel.com ([10.252.52.104])
  by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Jan 2024 01:38:00 -0800
Date: Fri, 5 Jan 2024 11:37:58 +0200 (EET)
From: =?ISO-8859-15?Q?Ilpo_J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>
To: Suma Hegde <suma.hegde@amd.com>
cc: platform-driver-x86@vger.kernel.org, Hans de Goede <hdegoede@redhat.com>, 
    Naveen Krishna Chatradhi <nchatrad@amd.com>
Subject: Re: [PATCH v4 9/9] platform/x86/amd/hsmp: Change devm_kzalloc() to
 devm_kcalloc()
In-Reply-To: <20240105074618.1667898-10-suma.hegde@amd.com>
Message-ID: <29f4398-7c7a-528f-c13e-d7875f544e6b@linux.intel.com>
References: <20240105074618.1667898-1-suma.hegde@amd.com> <20240105074618.1667898-10-suma.hegde@amd.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Fri, 5 Jan 2024, Suma Hegde wrote:

> Use the standard array allocation variant of devm memory allocation
> APIs.
> 
> Also remove extra parenthesis around hsmp_get_tbl_dram_base()
> and add a space in a comment.
> 
> Signed-off-by: Suma Hegde <suma.hegde@amd.com>
> Reviewed-by: Naveen Krishna Chatradhi <nchatrad@amd.com>
> ---
> Changes since v3:
> New patch, based on Ilpos review comments and additional cosmetic changes.
> 
>  drivers/platform/x86/amd/hsmp.c | 18 ++++++++++--------
>  1 file changed, 10 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/platform/x86/amd/hsmp.c b/drivers/platform/x86/amd/hsmp.c
> index 99bebb0ca5a9..f2247885c547 100644
> --- a/drivers/platform/x86/amd/hsmp.c
> +++ b/drivers/platform/x86/amd/hsmp.c
> @@ -643,12 +643,12 @@ static int hsmp_init_metric_tbl_bin_attr(struct bin_attribute **hattrs, u16 sock
>  	hattrs[0]		= hattr;
>  
>  	if (plat_dev.proto_ver == HSMP_PROTO_VER6)
> -		return (hsmp_get_tbl_dram_base(sock_ind));
> +		return hsmp_get_tbl_dram_base(sock_ind);
>  	else
>  		return 0;
>  }
>  
> -/* One bin sysfs for metrics table*/
> +/* One bin sysfs for metrics table */
>  #define NUM_HSMP_ATTRS		1
>  
>  static int hsmp_create_attr_list(struct attribute_group *attr_grp,

Please put these two into own change.

> @@ -657,8 +657,9 @@ static int hsmp_create_attr_list(struct attribute_group *attr_grp,
>  	struct bin_attribute **hsmp_bin_attrs;
>  
>  	/* Null terminated list of attributes */
> -	hsmp_bin_attrs = devm_kzalloc(dev, sizeof(struct bin_attribute *) *
> -				      (NUM_HSMP_ATTRS + 1), GFP_KERNEL);
> +	hsmp_bin_attrs = devm_kcalloc(dev, NUM_HSMP_ATTRS + 1,
> +				      sizeof(struct bin_attribute *),

While at it, it's better to match these sizeof()s with destination 
variable using sizeof(*hsmp_bin_attrs) construct.

> +				      GFP_KERNEL);
>  	if (!hsmp_bin_attrs)
>  		return -ENOMEM;
>  
> @@ -673,8 +674,9 @@ static int hsmp_create_non_acpi_sysfs_if(struct device *dev)
>  	struct attribute_group *attr_grp;
>  	u16 i;
>  
> -	hsmp_attr_grps = devm_kzalloc(dev, sizeof(struct attribute_group *) *
> -				      (plat_dev.num_sockets + 1), GFP_KERNEL);
> +	hsmp_attr_grps = devm_kcalloc(dev, plat_dev.num_sockets + 1,
> +				      sizeof(struct attribute_group *),
> +				      GFP_KERNEL);
>  	if (!hsmp_attr_grps)
>  		return -ENOMEM;
>  
> @@ -804,8 +806,8 @@ static int hsmp_pltdrv_probe(struct platform_device *pdev)
>  	 * on each probe.
>  	 */
>  	if (!plat_dev.is_probed) {
> -		plat_dev.sock = devm_kzalloc(&pdev->dev,
> -					     (plat_dev.num_sockets * sizeof(struct hsmp_socket)),
> +		plat_dev.sock = devm_kcalloc(&pdev->dev, plat_dev.num_sockets,
> +					     sizeof(struct hsmp_socket),
>  					     GFP_KERNEL);
>  		if (!plat_dev.sock)
>  			return -ENOMEM;
> 

-- 
 i.

