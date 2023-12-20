Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0EB7C4777A
	for <platform-driver-x86@vger.kernel.org>; Wed, 20 Dec 2023 17:19:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Ik1lZIW6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1703092744; x=1734628744;
  h=date:from:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=ZLtI30JRigrQqScz1Q+Pond/kKQibLoVWN92f1tuRqQ=;
  b=Ik1lZIW64vv6X/ejagBb/H7epBPtDj0wzNxqxmt5v7xSCk4X+mboiJez
   Mz18vjnamK5NYcJBPQR/tQMwq6pig/NJAvAD2pj+fo1VkG6sQoVgg9SnN
   L1s0vuoHmwkxzbthSZbbAZ6D548fYGt6skYvHTkEmmeEe2tCyLv+ezg5/
   t2/YrKukvjBoE/ci9T7hNq6SrRAvsK/wkwrNEVp9vdPNjQbNDCoBhSASu
   N9fCWRqfobX8v7WBVYPoIPTmchVqVZMpDZlBc1XsORRYLhmT4Mk6RMDqv
   W7EE8bJcHZLc7+TfTKfBfZ0xymfxfRS6h6WY76AYOdCItwKlrDNA2u9XR
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10930"; a="2683911"
X-IronPort-AV: E=Sophos;i="6.04,291,1695711600"; 
   d="scan'208";a="2683911"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Dec 2023 09:19:03 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10930"; a="1023542345"
X-IronPort-AV: E=Sophos;i="6.04,291,1695711600"; 
   d="scan'208";a="1023542345"
Received: from alobakin-mobl.ger.corp.intel.com ([10.252.50.56])
  by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Dec 2023 09:19:00 -0800
Date: Wed, 20 Dec 2023 19:18:58 +0200 (EET)
From: =?ISO-8859-15?Q?Ilpo_J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>
To: Suma Hegde <suma.hegde@amd.com>
cc: platform-driver-x86@vger.kernel.org, Hans de Goede <hdegoede@redhat.com>, 
    Naveen Krishna Chatradhi <nchatrad@amd.com>
Subject: Re: [PATCH v2 5/7] platform/x86: Move dev from platdev to
 hsmp_socket
In-Reply-To: <20231220165528.1351200-6-suma.hegde@amd.com>
Message-ID: <56f87e20-6aa-ee4f-27ec-5d219426586e@linux.intel.com>
References: <20231220165528.1351200-1-suma.hegde@amd.com> <20231220165528.1351200-6-suma.hegde@amd.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-207011531-1703092741=:1807"

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-207011531-1703092741=:1807
Content-Type: text/plain; charset=ISO-8859-15
Content-Transfer-Encoding: 8BIT

On Wed, 20 Dec 2023, Suma Hegde wrote:

> On an ACPI enabled platforms the probe is called for each socket
> and the struct dev is different for each socket. This change
> will help in handling both ACPI and non-ACPI platforms.
> 
> Also change pr_err to dev_err API.
> 
> Signed-off-by: Suma Hegde <suma.hegde@amd.com>
> Signed-off-by: Naveen Krishna Chatradhi <nchatrad@amd.com>
> Reviewed-by: Hans de Goede <hdegoede@redhat.com>
> 
> Changes since v1:
> Add "Reviewed-by: Hans de Goede <hdegoede@redhat.com>"
> 
> ---

Just noticed this... Please put the version history under --- line because 
then you'll save us maintainers time, if you put it above that separator, 
the tools will not cut it away automatically.

>  drivers/platform/x86/amd/hsmp.c | 42 +++++++++++++++++----------------
>  1 file changed, 22 insertions(+), 20 deletions(-)
> 
> diff --git a/drivers/platform/x86/amd/hsmp.c b/drivers/platform/x86/amd/hsmp.c
> index 6beca5787e55..3508399c6aa9 100644
> --- a/drivers/platform/x86/amd/hsmp.c
> +++ b/drivers/platform/x86/amd/hsmp.c
> @@ -69,13 +69,13 @@ struct hsmp_socket {
>  	struct semaphore hsmp_sem;
>  	char name[HSMP_ATTR_GRP_NAME_SIZE];
>  	struct pci_dev *root;
> +	struct device *dev;
>  	u16 sock_ind;
>  };
>  
>  struct hsmp_plat_device {
>  	struct miscdevice hsmp_device;
>  	struct hsmp_socket *sock;
> -	struct device *dev;
>  	u32 proto_ver;
>  	u16 num_sockets;
>  };
> @@ -278,8 +278,9 @@ static int hsmp_test(u16 sock_ind, u32 value)
>  
>  	/* Check the response value */
>  	if (msg.args[0] != (value + 1)) {
> -		pr_err("Socket %d test message failed, Expected 0x%08X, received 0x%08X\n",
> -		       sock_ind, (value + 1), msg.args[0]);
> +		dev_err(plat_dev.sock[sock_ind].dev,
> +			"Socket %d test message failed, Expected 0x%08X, received 0x%08X\n",
> +			sock_ind, (value + 1), msg.args[0]);
>  		return -EBADE;
>  	}
>  
> @@ -358,12 +359,12 @@ static ssize_t hsmp_metric_tbl_read(struct file *filp, struct kobject *kobj,
>  
>  	/* Do not support lseek(), reads entire metric table */
>  	if (count < bin_attr->size) {
> -		dev_err(plat_dev.dev, "Wrong buffer size\n");
> +		dev_err(sock->dev, "Wrong buffer size\n");
>  		return -EINVAL;
>  	}
>  
>  	if (!sock) {
> -		dev_err(plat_dev.dev, "Failed to read attribute private data\n");
> +		dev_err(sock->dev, "Failed to read attribute private data\n");
>  		return -EINVAL;
>  	}
>  
> @@ -399,13 +400,13 @@ static int hsmp_get_tbl_dram_base(u16 sock_ind)
>  	 */
>  	dram_addr = msg.args[0] | ((u64)(msg.args[1]) << 32);
>  	if (!dram_addr) {
> -		dev_err(plat_dev.dev, "Invalid DRAM address for metric table\n");
> +		dev_err(sock->dev, "Invalid DRAM address for metric table\n");
>  		return -ENOMEM;
>  	}
> -	sock->metric_tbl_addr = devm_ioremap(plat_dev.dev, dram_addr,
> +	sock->metric_tbl_addr = devm_ioremap(sock->dev, dram_addr,
>  					     sizeof(struct hsmp_metric_table));
>  	if (!sock->metric_tbl_addr) {
> -		dev_err(plat_dev.dev, "Failed to ioremap metric table addr\n");
> +		dev_err(sock->dev, "Failed to ioremap metric table addr\n");
>  		return -ENOMEM;
>  	}
>  	return 0;
> @@ -453,14 +454,15 @@ static int hsmp_create_sysfs_interface(void)
>  	if (WARN_ON(plat_dev.num_sockets > U8_MAX))
>  		return -ERANGE;
>  
> -	hsmp_attr_grps = devm_kzalloc(plat_dev.dev, sizeof(struct attribute_group *) *
> +	hsmp_attr_grps = devm_kzalloc(plat_dev.sock[0].dev, sizeof(struct attribute_group *) *
>  				      (plat_dev.num_sockets + 1), GFP_KERNEL);
>  	if (!hsmp_attr_grps)
>  		return -ENOMEM;
>  
>  	/* Create a sysfs directory for each socket */
>  	for (i = 0; i < plat_dev.num_sockets; i++) {
> -		attr_grp = devm_kzalloc(plat_dev.dev, sizeof(struct attribute_group), GFP_KERNEL);
> +		attr_grp = devm_kzalloc(plat_dev.sock[i].dev, sizeof(struct attribute_group),
> +					GFP_KERNEL);
>  		if (!attr_grp)
>  			return -ENOMEM;
>  
> @@ -468,7 +470,7 @@ static int hsmp_create_sysfs_interface(void)
>  		attr_grp->name = plat_dev.sock[i].name;
>  
>  		/* Null terminated list of attributes */
> -		hsmp_bin_attrs = devm_kzalloc(plat_dev.dev, sizeof(struct bin_attribute *) *
> +		hsmp_bin_attrs = devm_kzalloc(plat_dev.sock[i].dev, sizeof(struct bin_attribute *) *
>  					      (NUM_HSMP_ATTRS + 1), GFP_KERNEL);
>  		if (!hsmp_bin_attrs)
>  			return -ENOMEM;
> @@ -482,7 +484,7 @@ static int hsmp_create_sysfs_interface(void)
>  		if (ret)
>  			return ret;
>  	}
> -	return devm_device_add_groups(plat_dev.dev, hsmp_attr_grps);
> +	return devm_device_add_groups(plat_dev.sock[0].dev, hsmp_attr_grps);
>  }
>  
>  static int hsmp_cache_proto_ver(void)
> @@ -501,7 +503,7 @@ static int hsmp_cache_proto_ver(void)
>  	return ret;
>  }
>  
> -static int initialize_platdev(void)
> +static int initialize_platdev(struct device *dev)
>  {
>  	int ret, i;
>  
> @@ -510,6 +512,7 @@ static int initialize_platdev(void)
>  			return -ENODEV;
>  		plat_dev.sock[i].root			= node_to_amd_nb(i)->root;
>  		plat_dev.sock[i].sock_ind		= i;
> +		plat_dev.sock[i].dev			= dev;
>  		plat_dev.sock[i].mbinfo.base_addr	= SMN_HSMP_BASE;
>  		plat_dev.sock[i].mbinfo.msg_id_off	= SMN_HSMP_MSG_ID;
>  		plat_dev.sock[i].mbinfo.msg_resp_off    = SMN_HSMP_MSG_RESP;
> @@ -519,9 +522,9 @@ static int initialize_platdev(void)
>  		/* Test the hsmp interface on each socket */
>  		ret = hsmp_test(i, 0xDEADBEEF);
>  		if (ret) {
> -			pr_err("HSMP test message failed on Fam:%x model:%x\n",
> -			       boot_cpu_data.x86, boot_cpu_data.x86_model);
> -			pr_err("Is HSMP disabled in BIOS ?\n");
> +			dev_err(dev, "HSMP test message failed on Fam:%x model:%x\n",
> +				boot_cpu_data.x86, boot_cpu_data.x86_model);
> +			dev_err(dev, "Is HSMP disabled in BIOS ?\n");
>  			return ret;
>  		}
>  	}
> @@ -538,9 +541,8 @@ static int hsmp_pltdrv_probe(struct platform_device *pdev)
>  				     GFP_KERNEL);
>  	if (!plat_dev.sock)
>  		return -ENOMEM;
> -	plat_dev.dev = &pdev->dev;
>  
> -	ret = initialize_platdev();
> +	ret = initialize_platdev(&pdev->dev);

It would feel a bit more natural to pass pdev to initialize_platdev() and 
deref ->dev only inside it but this is not a correctness issue.

Reviewed-by: Ilpo Järvinen <ilpo.jarvinen@linux.intel.com>


-- 
 i.

--8323329-207011531-1703092741=:1807--
