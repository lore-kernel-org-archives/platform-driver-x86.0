Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE1DC18CBE6
	for <platform-driver-x86@vger.kernel.org>; Thu, 29 Aug 2024 10:47:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724928462; cv=none; b=OhEkr680ldeasCL+IBVLu2A37Wcvc1xbdUSpiMVdvZiDIsg/LN64SLz4XcwW9jSh/svCVPF1lKp4r/2Jo2oQMua88SjmMh9o9WU5NZLoX2i9qbPGOIOA6xjtfLgn76az7BTb1cAOXN9zPpAtmAu4wv2shhOyLKQBbibsSPl3A7k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724928462; c=relaxed/simple;
	bh=gN3+C9yqZ2PfDnCHDAk74d9jSjqBvXjEnTg7PYheQKk=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=hQI8RX1ozbJ+FAZjPyNZ9nanAhqv9RtS6VAku1Y4zBSUW5ACizYhrZufff3RJLE9y9JbtkH3MIwtF1FO++3TXZH3mP50ii1AFAjWr89U4AeJTZk7fFMuLgrsQezC5fIxPzBFKxDy+HMBk7QaQjS9YIwFPCApvhpEiPIb6hkZyQM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=G1fgJuwe; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="G1fgJuwe"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1724928460; x=1756464460;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=gN3+C9yqZ2PfDnCHDAk74d9jSjqBvXjEnTg7PYheQKk=;
  b=G1fgJuweELHLt3bEWM0OIJpOpF8h1CZysiGLwtgL2LC9HgSpq28WhRZl
   g+kly8PgmrKwwE8QZzshqpDNxJtJQKwTupIaG6oy6UsZTamdeZFhrMqTX
   Ai4btkH4dpR73Yr0otS+NNbuV/jZ1zyRNskSC3k/3Yi88Ji9TDG6IQWlL
   4eB4GIiwWlsyZUrihTUamWQ5ceIj6hU/9TtZvqjc3Wmyy8MZhXP4nTRpk
   C+Ktu+AoBpKsDqvqd5uOXzdm+2g76YiDAZ/SoeS5qjPk6cH9QBfG4LCi1
   cx+VpYROZUjPx19gMRneP+h6ZA8PvGoXduSt8hRDgnrmK+ItaoLaEC8Pd
   g==;
X-CSE-ConnectionGUID: 9+/EtQpZSnyagnnv35N8Zw==
X-CSE-MsgGUID: ZwqDSn08TE6UmeVnThbM7Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11178"; a="48895279"
X-IronPort-AV: E=Sophos;i="6.10,185,1719903600"; 
   d="scan'208";a="48895279"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Aug 2024 03:47:39 -0700
X-CSE-ConnectionGUID: jIa4lMG8Rr6CsPTWqvtSLg==
X-CSE-MsgGUID: RPNUoXBoRMeNVw9+ZQG3bg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,185,1719903600"; 
   d="scan'208";a="86757422"
Received: from ijarvine-desk1.ger.corp.intel.com (HELO localhost) ([10.245.245.59])
  by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Aug 2024 03:47:37 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Thu, 29 Aug 2024 13:47:33 +0300 (EEST)
To: Suma Hegde <suma.hegde@amd.com>
cc: platform-driver-x86@vger.kernel.org, Hans de Goede <hdegoede@redhat.com>, 
    Naveen Krishna Chatradhi <naveenkrishna.chatradhi@amd.com>
Subject: Re: [v6 10/10] platform/x86/amd/hsmp: Use dev_groups in the driver
 structure
In-Reply-To: <20240829060617.1548658-10-suma.hegde@amd.com>
Message-ID: <f8ee3512-a2df-7e5a-9769-4c77c65d423c@linux.intel.com>
References: <20240829060617.1548658-1-suma.hegde@amd.com> <20240829060617.1548658-10-suma.hegde@amd.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Thu, 29 Aug 2024, Suma Hegde wrote:

> Move out of device_add_group() variants, instead assign static array of
> attribute groups to .dev_groups in platform_driver structure.
> Then use is_visible to enable only the necessary files on the platform.
> 
> .read() and .is_bin_visibile() have slightly different
> implemetations on ACPI and non-ACPI system, so move them
> to respective files.
> 
> Signed-off-by: Suma Hegde <suma.hegde@amd.com>
> Reviewed-by: Naveen Krishna Chatradhi <naveenkrishna.chatradhi@amd.com>
> ---
> Changes since v5:
> Assign integer directly to .private.
> 
> Changes since v4:
> Change ->private from string pointer to u16 pointer.
> 
> Changes since v3:
> This patch and next patch(9th and 10th patch in v3 series) are merged
> and commit description is updated.
> 
> Changes since v2:
> None
> 
> Changes since v1:
> 1. Change is_visible to is_bin_visible in commit message
> 1. Add parenthesis around read and is_bin_visible in commit message
> 2. Change plat_dev to hsmp_pdev, hsmp_device to mdev
> 3. Remove unnecessary if, else conditions in hsmp_is_sock_attr_visible
> 4. Change un cached to un-cached
> 
>  drivers/platform/x86/amd/hsmp/acpi.c |  74 +++++++++++----
>  drivers/platform/x86/amd/hsmp/hsmp.c |  77 +---------------
>  drivers/platform/x86/amd/hsmp/hsmp.h |   8 +-
>  drivers/platform/x86/amd/hsmp/plat.c | 131 +++++++++++++++++++++------
>  4 files changed, 165 insertions(+), 125 deletions(-)
> 
> diff --git a/drivers/platform/x86/amd/hsmp/acpi.c b/drivers/platform/x86/amd/hsmp/acpi.c
> index 196c5eaa2ac7..239083750e2b 100644
> --- a/drivers/platform/x86/amd/hsmp/acpi.c
> +++ b/drivers/platform/x86/amd/hsmp/acpi.c
> @@ -9,6 +9,7 @@
>  
>  #define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
>  
> +#include <asm/amd_hsmp.h>
>  #include <asm/amd_nb.h>
>  
>  #include <linux/acpi.h>
> @@ -211,6 +212,8 @@ static int hsmp_parse_acpi_table(struct device *dev, u16 sock_ind)
>  
>  	sema_init(&sock->hsmp_sem, 1);
>  
> +	dev_set_drvdata(dev, sock);
> +
>  	/* Read MP1 base address from CRS method */
>  	ret = hsmp_read_acpi_crs(sock);
>  	if (ret)
> @@ -220,27 +223,42 @@ static int hsmp_parse_acpi_table(struct device *dev, u16 sock_ind)
>  	return hsmp_read_acpi_dsd(sock);
>  }
>  
> -static int hsmp_create_acpi_sysfs_if(struct device *dev)
> +static ssize_t hsmp_metric_tbl_read(struct file *filp, struct kobject *kobj,
> +				    struct bin_attribute *bin_attr, char *buf,
> +				    loff_t off, size_t count)
>  {
> -	struct attribute_group *attr_grp;
> -	u16 sock_ind;
> +	struct device *dev = container_of(kobj, struct device, kobj);
> +	struct hsmp_socket *sock = dev_get_drvdata(dev);
> +	struct hsmp_message msg = { 0 };
>  	int ret;
>  
> -	attr_grp = devm_kzalloc(dev, sizeof(struct attribute_group), GFP_KERNEL);
> -	if (!attr_grp)
> -		return -ENOMEM;
> +	if (!sock)
> +		return -EINVAL;
>  
> -	attr_grp->is_bin_visible = hsmp_is_sock_attr_visible;
> +	/* Do not support lseek(), reads entire metric table */
> +	if (count < bin_attr->size) {
> +		dev_err(sock->dev, "Wrong buffer size\n");
> +		return -EINVAL;
> +	}
>  
> -	ret = hsmp_get_uid(dev, &sock_ind);
> -	if (ret)
> -		return ret;
> +	msg.msg_id      = HSMP_GET_METRIC_TABLE;
> +	msg.sock_ind    = sock->sock_ind;
>  
> -	ret = hsmp_create_attr_list(attr_grp, dev, sock_ind);
> +	ret = hsmp_send_message(&msg);
>  	if (ret)
>  		return ret;
> +	memcpy_fromio(buf, sock->metric_tbl_addr, bin_attr->size);
> +
> +	return bin_attr->size;
> +}

Tail of these functions looks 100% identical so why you're moving 
it entirely into per-driver files?

> -	return devm_device_add_group(dev, attr_grp);
> +static umode_t hsmp_is_sock_attr_visible(struct kobject *kobj,
> +					 struct bin_attribute *battr, int id)
> +{
> +	if (hsmp_pdev.proto_ver == HSMP_PROTO_VER6)
> +		return battr->attr.mode;
> +
> +	return 0;
>  }
>  
>  static int init_acpi(struct device *dev)
> @@ -275,9 +293,36 @@ static int init_acpi(struct device *dev)
>  		return ret;
>  	}
>  
> +	if (hsmp_pdev.proto_ver == HSMP_PROTO_VER6) {
> +		ret = hsmp_get_tbl_dram_base(sock_ind);
> +		if (ret)
> +			dev_err(dev, "Failed to init metric table\n");
> +	}
> +
>  	return ret;
>  }
>  
> +static struct bin_attribute  hsmp_metric_tbl_attr = {
> +	.attr = { .name = HSMP_METRICS_TABLE_NAME, .mode = 0444},
> +	.read = hsmp_metric_tbl_read,
> +	.size = sizeof(struct hsmp_metric_table),
> +};
> +
> +static struct bin_attribute *hsmp_attr_list[] = {
> +	&hsmp_metric_tbl_attr,
> +	NULL
> +};
> +
> +static struct attribute_group hsmp_attr_grp = {
> +	.bin_attrs = hsmp_attr_list,
> +	.is_bin_visible = hsmp_is_sock_attr_visible,
> +};
> +
> +static const struct attribute_group *hsmp_groups[] = {
> +	&hsmp_attr_grp,
> +	NULL
> +};
> +
>  static const struct acpi_device_id amd_hsmp_acpi_ids[] = {
>  	{ACPI_HSMP_DEVICE_HID, 0},
>  	{}
> @@ -306,10 +351,6 @@ static int hsmp_acpi_probe(struct platform_device *pdev)
>  		return ret;
>  	}
>  
> -	ret = hsmp_create_acpi_sysfs_if(&pdev->dev);
> -	if (ret)
> -		dev_err(&pdev->dev, "Failed to create HSMP sysfs interface\n");
> -
>  	if (!hsmp_pdev.is_probed) {
>  		ret = hsmp_misc_register(&pdev->dev);
>  		if (ret)
> @@ -338,6 +379,7 @@ static struct platform_driver amd_hsmp_driver = {
>  	.driver		= {
>  		.name	= DRIVER_NAME,
>  		.acpi_match_table = amd_hsmp_acpi_ids,
> +		.dev_groups = hsmp_groups,
>  	},
>  };
>  
> diff --git a/drivers/platform/x86/amd/hsmp/hsmp.c b/drivers/platform/x86/amd/hsmp/hsmp.c
> index 8c8e361b1feb..019802fb3cb4 100644
> --- a/drivers/platform/x86/amd/hsmp/hsmp.c
> +++ b/drivers/platform/x86/amd/hsmp/hsmp.c
> @@ -278,35 +278,7 @@ long hsmp_ioctl(struct file *fp, unsigned int cmd, unsigned long arg)
>  	return 0;
>  }
>  
> -ssize_t hsmp_metric_tbl_read(struct file *filp, struct kobject *kobj,
> -			     struct bin_attribute *bin_attr, char *buf,
> -			     loff_t off, size_t count)
> -{
> -	struct hsmp_socket *sock = bin_attr->private;
> -	struct hsmp_message msg = { 0 };
> -	int ret;
> -
> -	if (!sock)
> -		return -EINVAL;
> -
> -	/* Do not support lseek(), reads entire metric table */
> -	if (count < bin_attr->size) {
> -		dev_err(sock->dev, "Wrong buffer size\n");
> -		return -EINVAL;
> -	}
> -
> -	msg.msg_id	= HSMP_GET_METRIC_TABLE;
> -	msg.sock_ind	= sock->sock_ind;
> -
> -	ret = hsmp_send_message(&msg);
> -	if (ret)
> -		return ret;
> -	memcpy_fromio(buf, sock->metric_tbl_addr, bin_attr->size);
> -
> -	return bin_attr->size;
> -}
> -
> -static int hsmp_get_tbl_dram_base(u16 sock_ind)
> +int hsmp_get_tbl_dram_base(u16 sock_ind)
>  {
>  	struct hsmp_socket *sock = &hsmp_pdev.sock[sock_ind];
>  	struct hsmp_message msg = { 0 };
> @@ -339,53 +311,6 @@ static int hsmp_get_tbl_dram_base(u16 sock_ind)
>  	return 0;
>  }
>  
> -umode_t hsmp_is_sock_attr_visible(struct kobject *kobj,
> -				  struct bin_attribute *battr, int id)
> -{
> -	if (hsmp_pdev.proto_ver == HSMP_PROTO_VER6)
> -		return battr->attr.mode;
> -	else
> -		return 0;
> -}
> -
> -static int hsmp_init_metric_tbl_bin_attr(struct bin_attribute **hattrs, u16 sock_ind)
> -{
> -	struct bin_attribute *hattr = &hsmp_pdev.sock[sock_ind].hsmp_attr;
> -
> -	sysfs_bin_attr_init(hattr);
> -	hattr->attr.name	= HSMP_METRICS_TABLE_NAME;
> -	hattr->attr.mode	= 0444;
> -	hattr->read		= hsmp_metric_tbl_read;
> -	hattr->size		= sizeof(struct hsmp_metric_table);
> -	hattr->private		= &hsmp_pdev.sock[sock_ind];
> -	hattrs[0]		= hattr;
> -
> -	if (hsmp_pdev.proto_ver == HSMP_PROTO_VER6)
> -		return hsmp_get_tbl_dram_base(sock_ind);
> -	else
> -		return 0;
> -}
> -
> -/* One bin sysfs for metrics table */
> -#define NUM_HSMP_ATTRS		1
> -
> -int hsmp_create_attr_list(struct attribute_group *attr_grp,
> -			  struct device *dev, u16 sock_ind)
> -{
> -	struct bin_attribute **hsmp_bin_attrs;
> -
> -	/* Null terminated list of attributes */
> -	hsmp_bin_attrs = devm_kcalloc(dev, NUM_HSMP_ATTRS + 1,
> -				      sizeof(*hsmp_bin_attrs),
> -				      GFP_KERNEL);
> -	if (!hsmp_bin_attrs)
> -		return -ENOMEM;
> -
> -	attr_grp->bin_attrs = hsmp_bin_attrs;
> -
> -	return hsmp_init_metric_tbl_bin_attr(hsmp_bin_attrs, sock_ind);
> -}
> -
>  int hsmp_cache_proto_ver(u16 sock_ind)
>  {
>  	struct hsmp_message msg = { 0 };
> diff --git a/drivers/platform/x86/amd/hsmp/hsmp.h b/drivers/platform/x86/amd/hsmp/hsmp.h
> index 9ab50bc74676..c4148fc2530c 100644
> --- a/drivers/platform/x86/amd/hsmp/hsmp.h
> +++ b/drivers/platform/x86/amd/hsmp/hsmp.h
> @@ -57,16 +57,10 @@ struct hsmp_plat_device {
>  
>  extern struct hsmp_plat_device hsmp_pdev;
>  
> -ssize_t hsmp_metric_tbl_read(struct file *filp, struct kobject *kobj,
> -			     struct bin_attribute *bin_attr, char *buf,
> -			     loff_t off, size_t count);
>  int hsmp_cache_proto_ver(u16 sock_ind);
> -umode_t hsmp_is_sock_attr_visible(struct kobject *kobj,
> -				  struct bin_attribute *battr, int id);
> -int hsmp_create_attr_list(struct attribute_group *attr_grp,
> -			  struct device *dev, u16 sock_ind);
>  int hsmp_test(u16 sock_ind, u32 value);
>  long hsmp_ioctl(struct file *fp, unsigned int cmd, unsigned long arg);
>  void hsmp_misc_deregister(void);
>  int hsmp_misc_register(struct device *dev);
> +int hsmp_get_tbl_dram_base(u16 sock_ind);
>  #endif /* HSMP_H */
> diff --git a/drivers/platform/x86/amd/hsmp/plat.c b/drivers/platform/x86/amd/hsmp/plat.c
> index be5bb8fe346c..3b9875c371a1 100644
> --- a/drivers/platform/x86/amd/hsmp/plat.c
> +++ b/drivers/platform/x86/amd/hsmp/plat.c
> @@ -9,6 +9,7 @@
>  
>  #define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
>  
> +#include <asm/amd_hsmp.h>
>  #include <asm/amd_nb.h>
>  
>  #include <linux/device.h>
> @@ -61,36 +62,111 @@ static const struct file_operations hsmp_fops = {
>  	.compat_ioctl	= hsmp_ioctl,
>  };
>  
> -static int hsmp_create_non_acpi_sysfs_if(struct device *dev)
> +static ssize_t hsmp_metric_tbl_read(struct file *filp, struct kobject *kobj,
> +				    struct bin_attribute *bin_attr, char *buf,
> +				    loff_t off, size_t count)
>  {
> -	const struct attribute_group **hsmp_attr_grps;
> -	struct attribute_group *attr_grp;
> -	u16 i;
> -
> -	hsmp_attr_grps = devm_kcalloc(dev, hsmp_pdev.num_sockets + 1,
> -				      sizeof(*hsmp_attr_grps),
> -				      GFP_KERNEL);
> -	if (!hsmp_attr_grps)
> -		return -ENOMEM;
> +	struct hsmp_message msg = { 0 };
> +	struct hsmp_socket *sock;
> +	u16 sock_ind;
> +	int ret;
>  
> -	/* Create a sysfs directory for each socket */
> -	for (i = 0; i < hsmp_pdev.num_sockets; i++) {
> -		attr_grp = devm_kzalloc(dev, sizeof(struct attribute_group),
> -					GFP_KERNEL);
> -		if (!attr_grp)
> -			return -ENOMEM;
> +	sock_ind = (u16)(uintptr_t)bin_attr->private;

One cast is enough.

> +	if (sock_ind >= hsmp_pdev.num_sockets)
> +		return -EINVAL;
>  
> -		snprintf(hsmp_pdev.sock[i].name, HSMP_ATTR_GRP_NAME_SIZE, "socket%u", (u8)i);
> -		attr_grp->name			= hsmp_pdev.sock[i].name;
> -		attr_grp->is_bin_visible	= hsmp_is_sock_attr_visible;
> -		hsmp_attr_grps[i]		= attr_grp;
> +	sock = &hsmp_pdev.sock[sock_ind];
> +	if (!sock)
> +		return -EINVAL;
>  
> -		hsmp_create_attr_list(attr_grp, dev, i);
> +	/* Do not support lseek(), reads entire metric table */
> +	if (count < bin_attr->size) {
> +		dev_err(sock->dev, "Wrong buffer size\n");
> +		return -EINVAL;
>  	}
>  
> -	return device_add_groups(dev, hsmp_attr_grps);
> +	msg.msg_id	= HSMP_GET_METRIC_TABLE;
> +	msg.sock_ind	= sock_ind;
> +
> +	ret = hsmp_send_message(&msg);
> +	if (ret)
> +		return ret;
> +	memcpy_fromio(buf, sock->metric_tbl_addr, bin_attr->size);
> +
> +	return bin_attr->size;
> +}
> +
> +static umode_t hsmp_is_sock_attr_visible(struct kobject *kobj,
> +					 struct bin_attribute *battr, int id)
> +{
> +	u16 sock_ind;
> +
> +	sock_ind = (u16)(uintptr_t)battr->private;

One cast is enough.

> +	if (id == 0 && sock_ind >= hsmp_pdev.num_sockets)
> +		return SYSFS_GROUP_INVISIBLE;
> +
> +	if (hsmp_pdev.proto_ver == HSMP_PROTO_VER6)
> +		return battr->attr.mode;
> +
> +	return 0;
> +}
> +
> +/*
> + * AMD supports maximum of 8 sockets in a system.
> + * Static array of 8 + 1(for NULL) elements is created below
> + * to create sysfs groups for sockets.
> + * is_bin_visible function is used to show / hide the necessary groups.
> + */
> +#define HSMP_BIN_ATTR(index, _list) \
> +static struct bin_attribute attr##index = { \
> +	.attr = { .name = HSMP_METRICS_TABLE_NAME, .mode = 0444}, \
> +	.private = (void *)index, \
> +	.read = hsmp_metric_tbl_read, \
> +	.size = sizeof(struct hsmp_metric_table), \
> +}; \
> +static struct bin_attribute _list[] = { \
> +	&attr##index, \
> +	NULL \

Align the continuation backslashes to right with tabs so this will be 
less heavy to read when the backslasher are no longer mixed with the 
actual definition.

>  }
>  
> +HSMP_BIN_ATTR(0, *sock0_attr_list);
> +HSMP_BIN_ATTR(1, *sock1_attr_list);
> +HSMP_BIN_ATTR(2, *sock2_attr_list);
> +HSMP_BIN_ATTR(3, *sock3_attr_list);
> +HSMP_BIN_ATTR(4, *sock4_attr_list);
> +HSMP_BIN_ATTR(5, *sock5_attr_list);
> +HSMP_BIN_ATTR(6, *sock6_attr_list);
> +HSMP_BIN_ATTR(7, *sock7_attr_list);
> +
> +#define HSMP_BIN_ATTR_GRP(index, _list, _name) \
> +static struct attribute_group sock##index##_attr_grp = { \
> +	.bin_attrs = _list, \
> +	.is_bin_visible = hsmp_is_sock_attr_visible, \
> +	.name = #_name, \

Same here about the backslash alignment.

-- 
 i.



> +}
> +
> +HSMP_BIN_ATTR_GRP(0, sock0_attr_list, socket0);
> +HSMP_BIN_ATTR_GRP(1, sock1_attr_list, socket1);
> +HSMP_BIN_ATTR_GRP(2, sock2_attr_list, socket2);
> +HSMP_BIN_ATTR_GRP(3, sock3_attr_list, socket3);
> +HSMP_BIN_ATTR_GRP(4, sock4_attr_list, socket4);
> +HSMP_BIN_ATTR_GRP(5, sock5_attr_list, socket5);
> +HSMP_BIN_ATTR_GRP(6, sock6_attr_list, socket6);
> +HSMP_BIN_ATTR_GRP(7, sock7_attr_list, socket7);
> +
> +static const struct attribute_group *hsmp_groups[] = {
> +	&sock0_attr_grp,
> +	&sock1_attr_grp,
> +	&sock2_attr_grp,
> +	&sock3_attr_grp,
> +	&sock4_attr_grp,
> +	&sock5_attr_grp,
> +	&sock6_attr_grp,
> +	&sock7_attr_grp,
> +	NULL
> +};
> +
>  static inline bool is_f1a_m0h(void)
>  {
>  	if (boot_cpu_data.x86 == 0x1A && boot_cpu_data.x86_model <= 0x0F)
> @@ -141,6 +217,12 @@ static int init_platform_device(struct device *dev)
>  			dev_err(dev, "Failed to read HSMP protocol version\n");
>  			return ret;
>  		}
> +
> +		if (hsmp_pdev.proto_ver == HSMP_PROTO_VER6) {
> +			ret = hsmp_get_tbl_dram_base(i);
> +			if (ret)
> +				dev_err(dev, "Failed to init metric table\n");
> +		}
>  	}
>  
>  	return 0;
> @@ -162,10 +244,6 @@ static int hsmp_pltdrv_probe(struct platform_device *pdev)
>  		return ret;
>  	}
>  
> -	ret = hsmp_create_non_acpi_sysfs_if(&pdev->dev);
> -	if (ret)
> -		dev_err(&pdev->dev, "Failed to create HSMP sysfs interface\n");
> -
>  	return hsmp_misc_register(&pdev->dev);
>  }
>  
> @@ -179,6 +257,7 @@ static struct platform_driver amd_hsmp_driver = {
>  	.remove_new	= hsmp_pltdrv_remove,
>  	.driver		= {
>  		.name	= DRIVER_NAME,
> +		.dev_groups = hsmp_groups,
>  	},
>  };
>  
> 
