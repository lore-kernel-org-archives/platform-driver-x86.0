Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2AF4918E75F
	for <platform-driver-x86@vger.kernel.org>; Tue, 20 Aug 2024 13:26:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724160396; cv=none; b=GKZ2LWHpWnbMCzkTT0me0IGvVGaP/XsM3HhEBEuKBGeHctdhC4CCTeQjVl8et9aqBt03eRV1fKm6y4IQJQLlLVlEzXwAPm4R5SWqHDLE5MVCiI5SmVAd0EcZE+wRCp3HriRe+V4qzzh2BNy+IGsC39FpNrTcXNnHWp5UtaCp8Y4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724160396; c=relaxed/simple;
	bh=yEs0rBWgH0vK/TtRv9ttJffQ6iWFdoujkgr7TRjFMKo=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=mUZ6IGX/I05DKzky76r9ZpPMIiPh/wVbdOaqeuJzxLPliblnTUlQPUtRkYVtI8jnwuB3qMsgQGVvALpPRfNP1aPwaKXa2NNYSSih4yjDiOP3DMIfRaCykrRGRYyNJrG6oVy7feaHOEXMMT4iF1Bqwfxp//7ILE3d1UyOcUsjJx8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HTUcjVCX; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HTUcjVCX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1724160394; x=1755696394;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=yEs0rBWgH0vK/TtRv9ttJffQ6iWFdoujkgr7TRjFMKo=;
  b=HTUcjVCXEwNJ5Qku6rCsrtdD/jAX5RbZswG3Nkd3K5Nm/9iIzAAqcO34
   uqUjb7BwnrhtR1G54MBcUQEFs9NOeYGnwJSniCzONAYtMA0+PKWoW661n
   5ZZbWdBENk7qGjaZ+MD7RwiiBjV8JnQTUvb8eMXoYTThudmCbzq+alRq8
   q8cBcOZqq6vmwBam0FK6yzMFTyfKvOpgNFz1HVWcMYMRTMGn6qcug7Sg2
   DIvKe+BGpfmJVkuFpOIcFb13u0ZWxYZOllsoBMntKZ+xpbl79OKQKnAQj
   DiYk/wEJ68P4f1dzunsAxSEzMMpgkqwyU499PtpZVRFqtqXmnL8sQXh3u
   w==;
X-CSE-ConnectionGUID: FH7VRXmfQbmx6hPDnMykew==
X-CSE-MsgGUID: tOfS1tZlQuW8wtQWoCAbmQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11170"; a="26329146"
X-IronPort-AV: E=Sophos;i="6.10,162,1719903600"; 
   d="scan'208";a="26329146"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Aug 2024 06:26:33 -0700
X-CSE-ConnectionGUID: D6UH5K5nSJ6bGb81TzlREQ==
X-CSE-MsgGUID: GfzBBJw0QciB15UdLvYCWA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,162,1719903600"; 
   d="scan'208";a="65417614"
Received: from ijarvine-desk1.ger.corp.intel.com (HELO localhost) ([10.245.245.102])
  by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Aug 2024 06:26:31 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Tue, 20 Aug 2024 16:26:27 +0300 (EEST)
To: Suma Hegde <suma.hegde@amd.com>
cc: platform-driver-x86@vger.kernel.org, ilpo.jarvinen@linux.intel.com, 
    hdegoede@redhat.com, 
    Naveen Krishna Chatradhi <naveenkrishna.chatradhi@amd.com>
Subject: Re: [v4 10/11] platform/x86/amd/hsmp: Use dev_groups in the driver
 structure
In-Reply-To: <20240820102941.1813163-10-suma.hegde@amd.com>
Message-ID: <5880e689-11aa-a95d-d660-ae205d84113b@linux.intel.com>
References: <20240820102941.1813163-1-suma.hegde@amd.com> <20240820102941.1813163-10-suma.hegde@amd.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Tue, 20 Aug 2024, Suma Hegde wrote:

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
>  drivers/platform/x86/amd/hsmp/hsmp.c |  77 +--------------
>  drivers/platform/x86/amd/hsmp/hsmp.h |   8 +-
>  drivers/platform/x86/amd/hsmp/plat.c | 135 ++++++++++++++++++++++-----
>  4 files changed, 170 insertions(+), 124 deletions(-)
> 
> diff --git a/drivers/platform/x86/amd/hsmp/acpi.c b/drivers/platform/x86/amd/hsmp/acpi.c
> index 6aa7810ebc71..81d49dee3f9b 100644
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
> @@ -217,6 +218,8 @@ static int hsmp_parse_acpi_table(struct device *dev, u16 sock_ind)
>  
>  	sema_init(&sock->hsmp_sem, 1);
>  
> +	dev_set_drvdata(dev, sock);
> +
>  	/* Read MP1 base address from CRS method */
>  	ret = hsmp_read_acpi_crs(sock);
>  	if (ret)
> @@ -226,27 +229,42 @@ static int hsmp_parse_acpi_table(struct device *dev, u16 sock_ind)
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
>  
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
> @@ -281,9 +299,36 @@ static int init_acpi(struct device *dev)
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
> @@ -327,10 +372,6 @@ static int hsmp_acpi_probe(struct platform_device *pdev)
>  		return ret;
>  	}
>  
> -	ret = hsmp_create_acpi_sysfs_if(&pdev->dev);
> -	if (ret)
> -		dev_err(&pdev->dev, "Failed to create HSMP sysfs interface\n");
> -
>  	if (!hsmp_pdev.is_probed) {
>  		hsmp_pdev.mdev.name	= HSMP_CDEV_NAME;
>  		hsmp_pdev.mdev.minor	= MISC_DYNAMIC_MINOR;
> @@ -366,6 +407,7 @@ static struct platform_driver amd_hsmp_driver = {
>  	.driver		= {
>  		.name	= DRIVER_NAME,
>  		.acpi_match_table = amd_hsmp_acpi_ids,
> +		.dev_groups = hsmp_groups,
>  	},
>  };
>  
> diff --git a/drivers/platform/x86/amd/hsmp/hsmp.c b/drivers/platform/x86/amd/hsmp/hsmp.c
> index 32adf6a1415b..5daf86de9a9d 100644
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
> index 90d76070c93a..a202597fe0cc 100644
> --- a/drivers/platform/x86/amd/hsmp/hsmp.h
> +++ b/drivers/platform/x86/amd/hsmp/hsmp.h
> @@ -57,14 +57,8 @@ struct hsmp_plat_device {
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
> +int hsmp_get_tbl_dram_base(u16 sock_ind);
>  #endif /* HSMP_H */
> diff --git a/drivers/platform/x86/amd/hsmp/plat.c b/drivers/platform/x86/amd/hsmp/plat.c
> index bc1f2693c04e..a0f2fb6750a1 100644
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
> @@ -61,36 +62,117 @@ static const struct file_operations hsmp_fops = {
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
> +	struct hsmp_message msg = { 0 };
> +	struct hsmp_socket *sock;
> +	u8 sock_ind;
> +	int ret;
>  
> -	hsmp_attr_grps = devm_kcalloc(dev, hsmp_pdev.num_sockets + 1,
> -				      sizeof(*hsmp_attr_grps),
> -				      GFP_KERNEL);
> -	if (!hsmp_attr_grps)
> -		return -ENOMEM;
> +	ret = kstrtou8(bin_attr->private, 10, &sock_ind);

Why is ->private a string?

-- 
 i.

> +	if (ret)
> +		return ret;
>  
> -	/* Create a sysfs directory for each socket */
> -	for (i = 0; i < hsmp_pdev.num_sockets; i++) {
> -		attr_grp = devm_kzalloc(dev, sizeof(struct attribute_group),
> -					GFP_KERNEL);
> -		if (!attr_grp)
> -			return -ENOMEM;
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
> +	u8 sock_ind;
> +	int ret;
> +
> +	ret = kstrtou8(battr->private, 10, &sock_ind);
> +	if (ret)
> +		return ret;
> +
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
> +	.private = #index, \
> +	.read = hsmp_metric_tbl_read, \
> +	.size = sizeof(struct hsmp_metric_table), \
> +}; \
> +static struct bin_attribute _list[] = { \
> +	&attr##index, \
> +	NULL \
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
> @@ -141,6 +223,12 @@ static int init_platform_device(struct device *dev)
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
> @@ -162,10 +250,6 @@ static int hsmp_pltdrv_probe(struct platform_device *pdev)
>  		return ret;
>  	}
>  
> -	ret = hsmp_create_non_acpi_sysfs_if(&pdev->dev);
> -	if (ret)
> -		dev_err(&pdev->dev, "Failed to create HSMP sysfs interface\n");
> -
>  	hsmp_pdev.mdev.name	= HSMP_CDEV_NAME;
>  	hsmp_pdev.mdev.minor	= MISC_DYNAMIC_MINOR;
>  	hsmp_pdev.mdev.fops	= &hsmp_fops;
> @@ -186,6 +270,7 @@ static struct platform_driver amd_hsmp_driver = {
>  	.remove_new	= hsmp_pltdrv_remove,
>  	.driver		= {
>  		.name	= DRIVER_NAME,
> +		.dev_groups = hsmp_groups,
>  	},
>  };
>  
> 
