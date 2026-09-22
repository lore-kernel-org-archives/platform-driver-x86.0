Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.6])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56D7B4E01E4;
	Tue, 22 Sep 2026 10:30:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.6
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790073056; cv=none; b=lFUC1jtGv9pS2CzKuhwamBZdSdnSxlylXz17zxVGzSxit+av0Ba52B5Ygz5dDkYy8VJTihZvCch+chzhTwKpDsCWRNot1ehQse8DBYxNLMFtHV95Ls1zeYBxJdWjhiWTVN2su7YhSUwi7eo//y+IBduIGna5OGWue470hztGMdY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790073056; c=relaxed/simple;
	bh=rVx1Ga7x8BB7Zg2M0CRdnA2F5rr3KdLyeWxelvYMHFw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IRAoKkVzf2KrlhQJTd7IsNXZOX3Y7/uoyZC9+H8nuAKa3kjgUtmBHwcjFvoo0u4pATvqgCGejHHxxGS69YXyc74QdpYw/z0yWUaH7kkePkajyLmd33F2NT9LBUshOvaJaQE+lUMDnzlBjwD51iGp41PjDRbH0LS5Em6KHbxxcHQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hGyJckl7; arc=none smtp.client-ip=192.198.163.6
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hGyJckl7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790073055; x=1821609055;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=rVx1Ga7x8BB7Zg2M0CRdnA2F5rr3KdLyeWxelvYMHFw=;
  b=hGyJckl7aR5SfL1JGMOxLqVVa/bZ0uWBGxzp76MYQjv0xaAczdyTSwnf
   o4PaBWUf8tet30Wcxn0pGHclh14TS7bhCX/nM1+KjqOD3ZEPv6rHztGEZ
   rR64HCVQZ3h3IUPcSStjtIwVKsP7zr4VwZc929QN1yYGRUR/JvQhPON3Y
   +YXT0XFtYl4LwSRyHTfEpZOIPfkBfgzhZN04TeeScSMh8G9Malh6AMmoS
   YoBNn7Nxy+joQaglRABjlu99AVG2CobDSnKEPRZxnZxp/NjdoVDgPkd6d
   fLPmBP8pfdHVFHtvckcxZs03TM5Qc/AgMwJDWwQhy0RGGEiNUn2Q4qEV+
   A==;
X-CSE-ConnectionGUID: 7aRFEUObRoiYSLNCHl5Y6A==
X-CSE-MsgGUID: v+4Tl/rwQ+evX+AWrUQrZA==
X-IronPort-AV: E=McAfee;i="6800,10657,11912"; a="1164185"
X-IronPort-AV: E=Sophos;i="6.27,116,1787036400"; 
   d="scan'208";a="1164185"
Received: from fmviesa012.fm.intel.com ([10.60.135.152])
  by fmvoesa116.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Sep 2026 03:30:53 -0700
X-CSE-ConnectionGUID: Kz5491BaRBSQ0kKLpKPzIg==
X-CSE-MsgGUID: bONz6f9cQtSVZtD98Mi9kQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,116,1787036400"; 
   d="scan'208";a="4062790"
Received: from black.igk.intel.com ([10.91.253.5])
  by fmviesa012.fm.intel.com with ESMTP; 22 Sep 2026 03:30:50 -0700
Received: by black.igk.intel.com (Postfix, from userid 1008)
	id 1ACFC99; Tue, 22 Sep 2026 12:30:45 +0200 (CEST)
Date: Tue, 22 Sep 2026 12:30:45 +0200
From: Heikki Krogerus <heikki.krogerus@linux.intel.com>
To: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Cc: Maximilian Luz <luzmaximilian@gmail.com>,
	Hans de Goede <hansg@kernel.org>,
	Ilpo =?iso-8859-1?Q?J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Matthew Brost <matthew.brost@intel.com>,
	Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>,
	Rodrigo Vivi <rodrigo.vivi@intel.com>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>, brgl@kernel.org,
	platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org,
	intel-xe@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
	driver-core@lists.linux.dev
Subject: Re: [PATCH v8 3/5] drm/xe/i2c: use
 device_create_managed_software_node()
Message-ID: <arJY1TMBIZCy8E7n@black.igk.intel.com>
References: <20260716-swnode-remove-on-dev-unreg-v8-0-5c2b8cc38c28@oss.qualcomm.com>
 <20260716-swnode-remove-on-dev-unreg-v8-3-5c2b8cc38c28@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260716-swnode-remove-on-dev-unreg-v8-3-5c2b8cc38c28@oss.qualcomm.com>

On Thu, Jul 16, 2026 at 02:31:38PM +0200, Bartosz Golaszewski wrote:
> This driver intentionally uses the fine-grained approach to creating
> platform devices. It assigns a software node as the primary firmware
> node of the device it creates. Ahead of improving the reference counting
> of platform device software nodes, switch to using
> device_create_managed_software_node(). This way, we create a dynamic
> software node whose life-time is tied to the device to which it's
> assigned.
> 
> Reviewed-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>
> Acked-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

What happened to this one? I can see the commit 0f485f88656a
("drm/xe/i2c: use device_create_managed_software_node()"), but not the
code change?

There is no revert and there are no other commits touching this part
of the driver, so it's as if the patch was never actually applied?

Thanks,

> ---
>  drivers/gpu/drm/xe/xe_i2c.c | 22 ++++++++--------------
>  drivers/gpu/drm/xe/xe_i2c.h |  1 -
>  2 files changed, 8 insertions(+), 15 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_i2c.c b/drivers/gpu/drm/xe/xe_i2c.c
> index 3d80eafb9a1318996d10db11e14af4cfde07ba55..af6e973e5e68125a9c006bb646447ca6e377a6e6 100644
> --- a/drivers/gpu/drm/xe/xe_i2c.c
> +++ b/drivers/gpu/drm/xe/xe_i2c.c
> @@ -93,13 +93,8 @@ static int xe_i2c_register_adapter(struct xe_i2c *i2c)
>  {
>  	struct pci_dev *pci = to_pci_dev(i2c->drm_dev);
>  	struct platform_device *pdev;
> -	struct fwnode_handle *fwnode;
>  	int ret;
>  
> -	fwnode = fwnode_create_software_node(xe_i2c_adapter_properties, NULL);
> -	if (IS_ERR(fwnode))
> -		return PTR_ERR(fwnode);
> -
>  	/*
>  	 * Not using platform_device_register_full() here because we don't have
>  	 * a handle to the platform_device before it returns. xe_i2c_notifier()
> @@ -107,10 +102,14 @@ static int xe_i2c_register_adapter(struct xe_i2c *i2c)
>  	 * platform_device_register_full() is done.
>  	 */
>  	pdev = platform_device_alloc(adapter_name, pci_dev_id(pci));
> -	if (!pdev) {
> -		ret = -ENOMEM;
> -		goto err_fwnode_remove;
> -	}
> +	if (!pdev)
> +		return -ENOMEM;
> +
> +	ret = device_create_managed_software_node(&pdev->dev,
> +						  xe_i2c_adapter_properties,
> +						  NULL);
> +	if (ret)
> +		goto err_pdev_put;
>  
>  	if (i2c->adapter_irq) {
>  		struct resource res;
> @@ -123,8 +122,6 @@ static int xe_i2c_register_adapter(struct xe_i2c *i2c)
>  	}
>  
>  	pdev->dev.parent = i2c->drm_dev;
> -	platform_device_set_fwnode(pdev, fwnode);
> -	i2c->adapter_node = fwnode;
>  	i2c->pdev = pdev;
>  
>  	ret = platform_device_add(pdev);
> @@ -135,8 +132,6 @@ static int xe_i2c_register_adapter(struct xe_i2c *i2c)
>  
>  err_pdev_put:
>  	platform_device_put(pdev);
> -err_fwnode_remove:
> -	fwnode_remove_software_node(fwnode);
>  
>  	return ret;
>  }
> @@ -144,7 +139,6 @@ static int xe_i2c_register_adapter(struct xe_i2c *i2c)
>  static void xe_i2c_unregister_adapter(struct xe_i2c *i2c)
>  {
>  	platform_device_unregister(i2c->pdev);
> -	fwnode_remove_software_node(i2c->adapter_node);
>  }
>  
>  /**
> diff --git a/drivers/gpu/drm/xe/xe_i2c.h b/drivers/gpu/drm/xe/xe_i2c.h
> index 425d8160835f4648891ff75f2a9c06284241710e..b28229f056c5a664e1d41dc0cc1978782fe1c2f1 100644
> --- a/drivers/gpu/drm/xe/xe_i2c.h
> +++ b/drivers/gpu/drm/xe/xe_i2c.h
> @@ -30,7 +30,6 @@ struct xe_i2c_endpoint {
>  };
>  
>  struct xe_i2c {
> -	struct fwnode_handle *adapter_node;
>  	struct platform_device *pdev;
>  	struct i2c_adapter *adapter;
>  	struct i2c_client *client[XE_I2C_MAX_CLIENTS];
> 
> -- 
> 2.47.3

-- 
heikki
