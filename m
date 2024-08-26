Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D19CF194ACD
	for <platform-driver-x86@vger.kernel.org>; Mon, 26 Aug 2024 16:27:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724689632; cv=none; b=C4O0nlmb/G0LVfLFuFiObrkPwA1rKUp7JwQchBOMS3s5goN2jisK+kg6T99HRfbgzZ6s2Bl49oCmW/P9Z7G9RvWkrwXsn0Ye0tHxgyGhsRc8304cqolCcP89zkJlGjkcPQV9+iZaJ5TsDkWPkolbFnVrYJt9xNOT3DTpWrIeqcY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724689632; c=relaxed/simple;
	bh=OM8wDnSm2pKUt/16NAe0qFh6zFLVxNmqkxMEYUjygCU=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=nxlMF9aJrf6iEuIt6mhbaeoxujGegFDNp35Y3HcizT/3bee98RiK8q+xGTAIY+d5PlEd1RxXpNtEmpWc+Fx/PblQKshIIMxZ6HRMAlBqnRv/dIyMlp9TBoLm/dy7Ef/k6YPdklJ+W52HX7Y8ddWh7ib29MfIiWRVQcs1jy+5Dqw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=THu+8BJG; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="THu+8BJG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1724689630; x=1756225630;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=OM8wDnSm2pKUt/16NAe0qFh6zFLVxNmqkxMEYUjygCU=;
  b=THu+8BJG8sEixGN3xwSrJb3rJNaHr9Qc6ze+Zt5YpSsq48b3Ul6m9iLJ
   MjLf3Smu2hgswzi3MobzZ+dbcU+WFTLvSp1fvBRDfND84uVdusIqwH5Gi
   oMNzGd8OxAnzBSuZmfMRRkEAkDYHY+nUCIJyYuS9scbmUByveFVDctFx6
   H8BWvbJYNi10D548I31AJYXSm3n1JNjM3v2Fs/v0jXi1uRefHojopQMK+
   8MkwEhAyDED8R2ts7dMr/PaBqF2gOCcOiObG2kYDhV8+bnxQEV1f1SM+O
   RHFbd1TdnzHktQduBvEmAE+O93ueKwPf8fmi5j5G+BAESPJASgAve4jkq
   w==;
X-CSE-ConnectionGUID: QYrd+5W2Sk+fZvBgspXixQ==
X-CSE-MsgGUID: 3df67zBgTHaDq3Pl5pGgTA==
X-IronPort-AV: E=McAfee;i="6700,10204,11176"; a="33693574"
X-IronPort-AV: E=Sophos;i="6.10,178,1719903600"; 
   d="scan'208";a="33693574"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Aug 2024 09:27:10 -0700
X-CSE-ConnectionGUID: 34/XlGcZSlyyKjyOlXHUFA==
X-CSE-MsgGUID: r++l+uclS82Fr4s6ko+yEQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,178,1719903600"; 
   d="scan'208";a="67386645"
Received: from ijarvine-desk1.ger.corp.intel.com (HELO localhost) ([10.245.245.174])
  by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Aug 2024 09:27:08 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Mon, 26 Aug 2024 19:27:03 +0300 (EEST)
To: Suma Hegde <suma.hegde@amd.com>
cc: platform-driver-x86@vger.kernel.org, Hans de Goede <hdegoede@redhat.com>, 
    Naveen Krishna Chatradhi <naveenkrishna.chatradhi@amd.com>
Subject: Re: [v5 10/11] platform/x86/amd/hsmp: Use dev_groups in the driver
 structure
In-Reply-To: <20240823075543.884265-10-suma.hegde@amd.com>
Message-ID: <b0b9b9f4-8822-ecf4-f11d-4258a0f50a79@linux.intel.com>
References: <20240823075543.884265-1-suma.hegde@amd.com> <20240823075543.884265-10-suma.hegde@amd.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Fri, 23 Aug 2024, Suma Hegde wrote:

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

> diff --git a/drivers/platform/x86/amd/hsmp/plat.c b/drivers/platform/x86/amd/hsmp/plat.c
> index 74be46a64c05..d55c984a9a5a 100644
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
> @@ -22,6 +23,8 @@
>  #define DRIVER_NAME		"amd_hsmp"
>  #define DRIVER_VERSION		"2.3"
>  
> +static u16 sock_numbers[MAX_AMD_SOCKETS] = {0, 1, 2, 3, 4, 5, 6, 7};
> +
>  /*
>   * To access specific HSMP mailbox register, s/w writes the SMN address of HSMP mailbox
>   * register into the SMN_INDEX register, and reads/writes the SMN_DATA reg.
> @@ -61,36 +64,115 @@ static const struct file_operations hsmp_fops = {
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
> +	if (!bin_attr->private)
> +		return -EINVAL;
> +	sock_ind = *(u16 *)(bin_attr->private);
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
>  }
>  
> +static umode_t hsmp_is_sock_attr_visible(struct kobject *kobj,
> +					 struct bin_attribute *battr, int id)
> +{
> +	u16 sock_ind;
> +
> +	if (!battr->private)
> +		return 0;
> +	sock_ind = *(u16 *)(battr->private);
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
> +	.private = &sock_numbers[index], \

While this is not wrong and I won't oppose if you want to do it this 
way, .private could hold the integer directly (casts will be necessary
to get it in/out w/o warnings).

-- 
 i.
