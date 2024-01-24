Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBC9B64AB3
	for <platform-driver-x86@vger.kernel.org>; Wed, 24 Jan 2024 12:29:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706099400; cv=none; b=lgxA9cLrM/N3OkRz0yn5Iz/wGQ2/30AWLq3VYsCJQix9SKOdhZo/jUp3GUHq0DEwH6BWwo+38ozqnDLPkCbwJB/hq7dwCb41zMVmJhmVfewGOp7sGmfAZaeAg2SOKm+uG+mb+wAF32/zngdt/lt8P0OoRp782tYDRdG/tEJH2OA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706099400; c=relaxed/simple;
	bh=RJzwkVYs7GDeROeKO8Ekf4bECO0pXcd7eB3rOHHMN4o=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=YbKb43BQsy0J3FfLILH6IikJVjufi4QGtc1+9Gyug9IZbY2+JIHxvu1SCrRbKBDyiUu4n3i8fooJhwENLAT9tyn+z9BUlLS3qoGAfYzMX+jQcj1i5PUMb7SKIRzdiOVERNy392RiP8NTeVQ2dTGL4M+SXn2tnxnEUTeaWv4hRoY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=SeIHUbl5; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SeIHUbl5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1706099399; x=1737635399;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=RJzwkVYs7GDeROeKO8Ekf4bECO0pXcd7eB3rOHHMN4o=;
  b=SeIHUbl5HJ2Y9erRs0B7SK2xgRCMGU/+F5Qs2nwhLIAKIYCNVgPO46NB
   2L6oFUdz+ofP6YCSfXsbtsdQ8Qi1IXFMIgPIA8BHJ85WtE0c3HLchVrIa
   9OPJtcWC/GYR9Zs6jD/UQKYONNNO50VOc8eCaw9LDuVZ0E5p/8nA2cutG
   m5iffsXPUaUJoKPMK8jpAwxrnFvxDoHU0H82I2LNxWmf9ckJ8GJ9KAxCW
   ItUX/ILB8gJH3iK3UYgzDe/eEmLAtPF+0WQsh2NjF61+/N1VHoYlLaZ9Z
   XyZdobMlivOMoRV023B2OQRHAuqxkQy2QG40VaWwON5oKNMJGdmhlpNQd
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10962"; a="726376"
X-IronPort-AV: E=Sophos;i="6.05,216,1701158400"; 
   d="scan'208";a="726376"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Jan 2024 04:29:58 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,216,1701158400"; 
   d="scan'208";a="28094494"
Received: from ijarvine-desk1.ger.corp.intel.com (HELO localhost) ([10.246.48.46])
  by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Jan 2024 04:29:56 -0800
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Wed, 24 Jan 2024 14:29:51 +0200 (EET)
To: Suma Hegde <suma.hegde@amd.com>
cc: platform-driver-x86@vger.kernel.org, Hans de Goede <hdegoede@redhat.com>, 
    Naveen Krishna Chatradhi <nchatrad@amd.com>
Subject: Re: [PATCH v5 10/11] platform/x86/amd/hsmp: Change devm_kzalloc()
 to devm_kcalloc()
In-Reply-To: <20240106022532.1746932-10-suma.hegde@amd.com>
Message-ID: <641892c6-f5d3-ad81-d915-89b5d739b362@linux.intel.com>
References: <20240106022532.1746932-1-suma.hegde@amd.com> <20240106022532.1746932-10-suma.hegde@amd.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Sat, 6 Jan 2024, Suma Hegde wrote:

> Use the standard array allocation variant of devm memory allocation
> APIs.
> 
> Signed-off-by: Suma Hegde <suma.hegde@amd.com>
> Signed-off-by: Naveen Krishna Chatradhi <nchatrad@amd.com>
> ---
> Changes since v4:
> 1. Change sizeof(struct bin_attribute *) to sizeof(*hsmp_bin_attrs)
> 2. Change sizeof(struct attribute_group *) to sizeof(*hsmp_attr_grps)
> 3. Split some of the changes to 11th patch in this v5 series
> 
> Changes since v3:
> New patch, based on Ilpos review comments and additional cosmetic changes.
>  drivers/platform/x86/amd/hsmp.c | 14 ++++++++------
>  1 file changed, 8 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/platform/x86/amd/hsmp.c b/drivers/platform/x86/amd/hsmp.c
> index 99bebb0ca5a9..ccf7cd8f98f6 100644
> --- a/drivers/platform/x86/amd/hsmp.c
> +++ b/drivers/platform/x86/amd/hsmp.c
> @@ -657,8 +657,9 @@ static int hsmp_create_attr_list(struct attribute_group *attr_grp,
>  	struct bin_attribute **hsmp_bin_attrs;
>  
>  	/* Null terminated list of attributes */
> -	hsmp_bin_attrs = devm_kzalloc(dev, sizeof(struct bin_attribute *) *
> -				      (NUM_HSMP_ATTRS + 1), GFP_KERNEL);
> +	hsmp_bin_attrs = devm_kcalloc(dev, NUM_HSMP_ATTRS + 1,
> +				      sizeof(*hsmp_bin_attrs),
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
> +				      sizeof(*hsmp_attr_grps),
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

I wonder why the sizeof() of the target isn't used in this case like in 
the other cases?

-- 
 i.

