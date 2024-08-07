Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C80C1DF69D
	for <platform-driver-x86@vger.kernel.org>; Wed,  7 Aug 2024 12:38:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723034287; cv=none; b=iDsinCvfnriZZznAESCbNZR+1jI3MquU3QxzwnHrYmqpYEf/aJssW3mZcA0MaDbhx/R3ockzeAWCqIDsaCcSJpUlWQa0vAWC4grpmlztpSyKHubHS4ZzGt8oxIJqOTXp6ZaMQ6rL5Xz/rb5IHdrGWTsAGCXhCqH56FpcDR4kd0s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723034287; c=relaxed/simple;
	bh=Oz3etpfplwDt4EcYXkQrKMuXvR5UqanJ7FmI+c8oQsU=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=XkFt4kkqE8geik4iro+5J+Jiln+qdDq7MURlq99xw1YKBI96xuzoS82P0HoEEY/1SepgfM90y3OcKgGCu2juhL4GBdrRZK4oT7b49M54t70yEHH2GEx3lnLItZy3boZOx1pAV1o0E3JiiT8u3GbA2WDCRk8hJbqJv7Uj7bvyZp4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=RVTAfkmM; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="RVTAfkmM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1723034285; x=1754570285;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=Oz3etpfplwDt4EcYXkQrKMuXvR5UqanJ7FmI+c8oQsU=;
  b=RVTAfkmMD9HkrwGnu9YQcSBdkaN1Shm77DBtqpBbwzmi/uM7omE/Qubq
   bacA+rpNZ0rAjv7oePtJTHS5sF3KkOqCqtFTQlGiq5MKyQebIVHIsuxbK
   dI+VIuT2LsvoP+1u1EJ3T41bRFapJwaQJhmpQHW3lapPpYeHGgtdo8H9A
   IdN4vOAKB3MgyIdgzrrqVqx/aTSKlblFjd9opK2MX6qw06sGMV7FqCkJi
   4Q52STzyc17wXi4FvtdZz7DmvOFdsUUQpUZqiJAtRIZZSKQT5LjS8ypBD
   5AFoYbdvgu2HcUizUmjQAGaAO0QjWcMLFUAJ0aVw0TineL8lgWRcYC0lJ
   w==;
X-CSE-ConnectionGUID: 5rI3tHqLQkmzthr1bAoqvQ==
X-CSE-MsgGUID: 0gkjd3fGQyOSmDIiuQ8seg==
X-IronPort-AV: E=McAfee;i="6700,10204,11157"; a="43621600"
X-IronPort-AV: E=Sophos;i="6.09,269,1716274800"; 
   d="scan'208";a="43621600"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Aug 2024 05:38:04 -0700
X-CSE-ConnectionGUID: ghZaPurQREiPTp8xwmSWPw==
X-CSE-MsgGUID: rNngyygUT0qB/P33xvOwfQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,269,1716274800"; 
   d="scan'208";a="94414378"
Received: from ijarvine-desk1.ger.corp.intel.com (HELO localhost) ([10.245.244.202])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Aug 2024 05:38:03 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Wed, 7 Aug 2024 15:37:58 +0300 (EEST)
To: Suma Hegde <suma.hegde@amd.com>
cc: platform-driver-x86@vger.kernel.org, Hans de Goede <hdegoede@redhat.com>, 
    Naveen Krishna Chatradhi <naveenkrishna.chatradhi@amd.com>
Subject: Re: [v3 09/11] platform/x86/amd/hsmp: Move read() and is_bin_visible()
 to respective files
In-Reply-To: <20240720174552.946255-9-suma.hegde@amd.com>
Message-ID: <7f5726af-1f0d-23e5-7294-fe0ed5550496@linux.intel.com>
References: <20240720174552.946255-1-suma.hegde@amd.com> <20240720174552.946255-9-suma.hegde@amd.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Sat, 20 Jul 2024, Suma Hegde wrote:

> The .read() and .is_bin_visibile() need to be handled differently in acpi

ACPI

> and platform drivers, due to the way the sysfs files are created.
> 
> This is in preparation to using .dev_groups instead of dynamic sysfs
> creation. The sysfs at this point is not functional, it will be enabled in
> the next patch.

What does the last sentence mean? If it means that after this commit (w/o 
the next one), sysfs is no longer working, it's not acceptable way to 
construct a patch series. We never intentionally split patches such that 
there's breakage/loss of features in the intermediate state. Thus, 
reconsider how to split things differently so nothing breaks (if nothing 
else helps, just merge the two patches together, this series is already 
much better than the one large move changes was so it shouldn't be a big 
problem).

...If it means something else, you probably should rephrase the sentence.

-- 
 i.

> Signed-off-by: Suma Hegde <suma.hegde@amd.com>
> Reviewed-by: Naveen Krishna Chatradhi <naveenkrishna.chatradhi@amd.com>
> ---
> Changes since v2:
> None
> Changes since v1:
> 1. Change is_visible to is_bin_visible in commit message
> 1. Add parenthesis around read and is_bin_visible in commit message
> 2. Change plat_dev to hsmp_pdev, hsmp_device to mdev
> 3. Remove unnecessary if, else conditions in hsmp_is_sock_attr_visible
> 4. Change un cached to un-cached
> 
>  drivers/platform/x86/amd/hsmp/acpi.c | 41 ++++++++++++++++++++
>  drivers/platform/x86/amd/hsmp/hsmp.c | 37 ------------------
>  drivers/platform/x86/amd/hsmp/plat.c | 57 ++++++++++++++++++++++++++++
>  3 files changed, 98 insertions(+), 37 deletions(-)
> 
> diff --git a/drivers/platform/x86/amd/hsmp/acpi.c b/drivers/platform/x86/amd/hsmp/acpi.c
> index 86100943aadc..7cb38c8dc627 100644
> --- a/drivers/platform/x86/amd/hsmp/acpi.c
> +++ b/drivers/platform/x86/amd/hsmp/acpi.c
> @@ -11,6 +11,7 @@
>  
>  #include "hsmp.h"
>  
> +#include <asm/amd_hsmp.h>
>  #include <asm/amd_nb.h>
>  
>  #include <linux/acpi.h>
> @@ -214,6 +215,8 @@ static int hsmp_parse_acpi_table(struct device *dev, u16 sock_ind)
>  
>  	sema_init(&sock->hsmp_sem, 1);
>  
> +	dev_set_drvdata(dev, sock);
> +
>  	/* Read MP1 base address from CRS method */
>  	ret = hsmp_read_acpi_crs(sock);
>  	if (ret)
> @@ -246,6 +249,44 @@ static int hsmp_create_acpi_sysfs_if(struct device *dev)
>  	return devm_device_add_group(dev, attr_grp);
>  }
>  
> +ssize_t hsmp_metric_tbl_read(struct file *filp, struct kobject *kobj,
> +			     struct bin_attribute *bin_attr, char *buf,
> +			     loff_t off, size_t count)
> +{
> +	struct device *dev = container_of(kobj, struct device, kobj);
> +	struct hsmp_socket *sock = dev_get_drvdata(dev);
> +	struct hsmp_message msg = { 0 };
> +	int ret;
> +
> +	if (!sock)
> +		return -EINVAL;
> +
> +	/* Do not support lseek(), reads entire metric table */
> +	if (count < bin_attr->size) {
> +		dev_err(sock->dev, "Wrong buffer size\n");
> +		return -EINVAL;
> +	}
> +
> +	msg.msg_id      = HSMP_GET_METRIC_TABLE;
> +	msg.sock_ind    = sock->sock_ind;
> +
> +	ret = hsmp_send_message(&msg);
> +	if (ret)
> +		return ret;
> +	memcpy_fromio(buf, sock->metric_tbl_addr, bin_attr->size);
> +
> +	return bin_attr->size;
> +}
> +
> +umode_t hsmp_is_sock_attr_visible(struct kobject *kobj,
> +				  struct bin_attribute *battr, int id)
> +{
> +	if (hsmp_pdev.proto_ver == HSMP_PROTO_VER6)
> +		return battr->attr.mode;
> +
> +	return 0;
> +}
> +
>  static int init_acpi(struct device *dev)
>  {
>  	u16 sock_ind;
> diff --git a/drivers/platform/x86/amd/hsmp/hsmp.c b/drivers/platform/x86/amd/hsmp/hsmp.c
> index 119a1f8895ca..c906723ae2f2 100644
> --- a/drivers/platform/x86/amd/hsmp/hsmp.c
> +++ b/drivers/platform/x86/amd/hsmp/hsmp.c
> @@ -274,34 +274,6 @@ long hsmp_ioctl(struct file *fp, unsigned int cmd, unsigned long arg)
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
>  static int hsmp_get_tbl_dram_base(u16 sock_ind)
>  {
>  	struct hsmp_socket *sock = &hsmp_pdev.sock[sock_ind];
> @@ -335,15 +307,6 @@ static int hsmp_get_tbl_dram_base(u16 sock_ind)
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
>  static int hsmp_init_metric_tbl_bin_attr(struct bin_attribute **hattrs, u16 sock_ind)
>  {
>  	struct bin_attribute *hattr = &hsmp_pdev.sock[sock_ind].hsmp_attr;
> diff --git a/drivers/platform/x86/amd/hsmp/plat.c b/drivers/platform/x86/amd/hsmp/plat.c
> index 3bce2c570f2b..c2b83363713f 100644
> --- a/drivers/platform/x86/amd/hsmp/plat.c
> +++ b/drivers/platform/x86/amd/hsmp/plat.c
> @@ -11,6 +11,7 @@
>  
>  #include "hsmp.h"
>  
> +#include <asm/amd_hsmp.h>
>  #include <asm/amd_nb.h>
>  
>  #include <linux/device.h>
> @@ -90,6 +91,62 @@ static int hsmp_create_non_acpi_sysfs_if(struct device *dev)
>  	return device_add_groups(dev, hsmp_attr_grps);
>  }
>  
> +ssize_t hsmp_metric_tbl_read(struct file *filp, struct kobject *kobj,
> +			     struct bin_attribute *bin_attr, char *buf,
> +			     loff_t off, size_t count)
> +{
> +	struct hsmp_message msg = { 0 };
> +	struct hsmp_socket *sock;
> +	u8 sock_ind;
> +	int ret;
> +
> +	ret = kstrtou8(bin_attr->private, 10, &sock_ind);
> +	if (ret)
> +		return ret;
> +
> +	if (sock_ind >= hsmp_pdev.num_sockets)
> +		return -EINVAL;
> +
> +	sock = &hsmp_pdev.sock[sock_ind];
> +	if (!sock)
> +		return -EINVAL;
> +
> +	/* Do not support lseek(), reads entire metric table */
> +	if (count < bin_attr->size) {
> +		dev_err(sock->dev, "Wrong buffer size\n");
> +		return -EINVAL;
> +	}
> +
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
> +umode_t hsmp_is_sock_attr_visible(struct kobject *kobj,
> +				  struct bin_attribute *battr, int id)
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
>  static inline bool is_f1a_m0h(void)
>  {
>  	if (boot_cpu_data.x86 == 0x1A && boot_cpu_data.x86_model <= 0x0F)
> 
