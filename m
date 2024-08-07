Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69E9E1D4159
	for <platform-driver-x86@vger.kernel.org>; Wed,  7 Aug 2024 12:50:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723035057; cv=none; b=J3g26M+gjL6ai2xePaOsEODQMY561iKCVhkRfpnPV54rKGiAkAzXT+shJKos20iUSW5aUU56guvzTPFlgJ4x1IoWC5BcCpw7fc+VAZsqVn8DO82UfZwym+RfgPuZdFRbPN0YjRSod7b/Vukfv1E6djZ5Bsx1j+5h2+ae4nA4ZzM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723035057; c=relaxed/simple;
	bh=Dmnw2uRHWLQqfvEe/+KKNGTwctI00SotuawCqoE6q3Y=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=onTB+iZOhb0p1XiX3TLaLaKBfLtff2n9xMh+9ZFESBV3ZAvKmspHlH8k3tq2FN0yAScJaB/SV8VyB2CYllsHV2TiO1dGgsCQR+UzTPpxc+W6DYiv38Wp6nM4pgfhvCqBrffJIhQAZfyTdt4UeWlGnFmrVsePt+S/KE4NKIO4Ysc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=iUtA4dKC; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="iUtA4dKC"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1723035054; x=1754571054;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=Dmnw2uRHWLQqfvEe/+KKNGTwctI00SotuawCqoE6q3Y=;
  b=iUtA4dKCuE87VUV4ozOr5nxqSIfu6pyr4cpZioqKsiDqC9eNrGV6vtqM
   UBnzxwGEy2PphrpKEYxgVD2i2x7qKDarMhPGINQlaaLysdU9mgJx0tAZM
   V5cyjBIWJmndJRU52yqEf6V8zvDdAbkugNOUT5Pba/1OyEjQZjD7GK8tc
   +ew69jp4AyryGSMuUBmT8ZIXf2Ddw58TUP/0Co3s771oVV/PhEjtuy87/
   ZnmkBpJnn9nFX+a6/ECOswyusxLU5rPJT30wUd7EmUvQb9J4+t1+zu3Yx
   /mspZ47rsBQ9Wqn33a873undLcOrNWzWks9+vpQA78IBlbANX6qkZfcHf
   A==;
X-CSE-ConnectionGUID: 2a7YWl8sRu2DyNXlBxKBXA==
X-CSE-MsgGUID: gQnCNTBuT9e3WIcdU9dlKw==
X-IronPort-AV: E=McAfee;i="6700,10204,11157"; a="20977966"
X-IronPort-AV: E=Sophos;i="6.09,269,1716274800"; 
   d="scan'208";a="20977966"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Aug 2024 05:50:50 -0700
X-CSE-ConnectionGUID: 9TdnFeg9RhOAiVxLj0jg5A==
X-CSE-MsgGUID: H98aTXAWTGeqCYY9U5/LbA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,269,1716274800"; 
   d="scan'208";a="56789293"
Received: from ijarvine-desk1.ger.corp.intel.com (HELO localhost) ([10.245.244.202])
  by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Aug 2024 05:50:38 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Wed, 7 Aug 2024 15:50:34 +0300 (EEST)
To: Suma Hegde <suma.hegde@amd.com>
cc: platform-driver-x86@vger.kernel.org, Hans de Goede <hdegoede@redhat.com>, 
    Naveen Krishna Chatradhi <naveenkrishna.chatradhi@amd.com>
Subject: Re: [v3 04/11] platform/x86/amd/hsmp: Move platform device specific
 code to plat.c
In-Reply-To: <20240720174552.946255-4-suma.hegde@amd.com>
Message-ID: <559394d2-8886-33ed-5299-d2301879544e@linux.intel.com>
References: <20240720174552.946255-1-suma.hegde@amd.com> <20240720174552.946255-4-suma.hegde@amd.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Sat, 20 Jul 2024, Suma Hegde wrote:

> Move platform device part to plat.c.
> 
> No functinality/logical changes.
> Common code which can be used by ACPI and platform device
> remains in hsmp.c.
> ACPI code in hsmp.c will be moved to acpi.c in next patch.
>
> Signed-off-by: Suma Hegde <suma.hegde@amd.com>
> Reviewed-by: Naveen Krishna Chatradhi <naveenkrishna.chatradhi@amd.com>
> ---
> Changes since v2:
> None
> Changes since v1:
> 1. Include new header file device.h in plat.c
> 2. Arrange headers in alphabetical order
> 3. Add an empty line between asm/ and linux/ headers
>  
>  drivers/platform/x86/amd/hsmp/Makefile |   2 +-
>  drivers/platform/x86/amd/hsmp/hsmp.c   | 350 ++-----------------------
>  drivers/platform/x86/amd/hsmp/hsmp.h   |  17 ++
>  drivers/platform/x86/amd/hsmp/plat.c   | 338 ++++++++++++++++++++++++
>  4 files changed, 371 insertions(+), 336 deletions(-)
>  create mode 100644 drivers/platform/x86/amd/hsmp/plat.c
> 
> diff --git a/drivers/platform/x86/amd/hsmp/Makefile b/drivers/platform/x86/amd/hsmp/Makefile
> index fda64906a5e8..fb8ba04b2f0d 100644
> --- a/drivers/platform/x86/amd/hsmp/Makefile
> +++ b/drivers/platform/x86/amd/hsmp/Makefile
> @@ -5,4 +5,4 @@
>  #
>  
>  obj-$(CONFIG_AMD_HSMP)		+= amd_hsmp.o
> -amd_hsmp-objs			:= hsmp.o
> +amd_hsmp-objs			:= hsmp.o plat.o
> diff --git a/drivers/platform/x86/amd/hsmp/hsmp.c b/drivers/platform/x86/amd/hsmp/hsmp.c
> index 2c9ba51b9614..d15a978ff71e 100644
> --- a/drivers/platform/x86/amd/hsmp/hsmp.c
> +++ b/drivers/platform/x86/amd/hsmp/hsmp.c
> @@ -12,16 +12,9 @@
>  #include "hsmp.h"
>  
>  #include <asm/amd_hsmp.h>
> -#include <asm/amd_nb.h>
> -#include <linux/delay.h>
> -#include <linux/module.h>
> -#include <linux/pci.h>
> -#include <linux/platform_device.h>
> -#include <linux/acpi.h>
>  
> -#define DRIVER_NAME		"amd_hsmp"
> -#define DRIVER_VERSION		"2.2"
> -#define ACPI_HSMP_DEVICE_HID	"AMDI0097"
> +#include <linux/acpi.h>
> +#include <linux/delay.h>
>  
>  /* HSMP Status / Error codes */
>  #define HSMP_STATUS_NOT_READY	0x00
> @@ -36,45 +29,12 @@
>  #define HSMP_WR			true
>  #define HSMP_RD			false
>  
> -/*
> - * To access specific HSMP mailbox register, s/w writes the SMN address of HSMP mailbox
> - * register into the SMN_INDEX register, and reads/writes the SMN_DATA reg.
> - * Below are required SMN address for HSMP Mailbox register offsets in SMU address space
> - */
> -#define SMN_HSMP_BASE		0x3B00000
> -#define SMN_HSMP_MSG_ID		0x0010534
> -#define SMN_HSMP_MSG_ID_F1A_M0H	0x0010934
> -#define SMN_HSMP_MSG_RESP	0x0010980
> -#define SMN_HSMP_MSG_DATA	0x00109E0
> -
> -#define HSMP_INDEX_REG		0xc4
> -#define HSMP_DATA_REG		0xc8
> -
>  /* These are the strings specified in ACPI table */
>  #define MSG_IDOFF_STR		"MsgIdOffset"
>  #define MSG_ARGOFF_STR		"MsgArgOffset"
>  #define MSG_RESPOFF_STR		"MsgRspOffset"
>  
> -static struct hsmp_plat_device plat_dev;
> -
> -static int amd_hsmp_pci_rdwr(struct hsmp_socket *sock, u32 offset,
> -			     u32 *value, bool write)
> -{
> -	int ret;
> -
> -	if (!sock->root)
> -		return -ENODEV;
> -
> -	ret = pci_write_config_dword(sock->root, HSMP_INDEX_REG,
> -				     sock->mbinfo.base_addr + offset);
> -	if (ret)
> -		return ret;
> -
> -	ret = (write ? pci_write_config_dword(sock->root, HSMP_DATA_REG, *value)
> -		     : pci_read_config_dword(sock->root, HSMP_DATA_REG, value));
> -
> -	return ret;
> -}
> +struct hsmp_plat_device plat_dev;
>  
>  static void amd_hsmp_acpi_rdwr(struct hsmp_socket *sock, u32 offset,
>  			       u32 *value, bool write)
> @@ -253,7 +213,7 @@ int hsmp_send_message(struct hsmp_message *msg)
>  }
>  EXPORT_SYMBOL_GPL(hsmp_send_message);
>  
> -static int hsmp_test(u16 sock_ind, u32 value)
> +int hsmp_test(u16 sock_ind, u32 value)
>  {
>  	struct hsmp_message msg = { 0 };
>  	int ret;
> @@ -283,7 +243,7 @@ static int hsmp_test(u16 sock_ind, u32 value)
>  	return ret;
>  }
>  
> -static long hsmp_ioctl(struct file *fp, unsigned int cmd, unsigned long arg)
> +long hsmp_ioctl(struct file *fp, unsigned int cmd, unsigned long arg)
>  {
>  	int __user *arguser = (int  __user *)arg;
>  	struct hsmp_message msg = { 0 };
> @@ -339,12 +299,6 @@ static long hsmp_ioctl(struct file *fp, unsigned int cmd, unsigned long arg)
>  	return 0;
>  }
>  
> -static const struct file_operations hsmp_fops = {
> -	.owner		= THIS_MODULE,
> -	.unlocked_ioctl	= hsmp_ioctl,
> -	.compat_ioctl	= hsmp_ioctl,
> -};
> -
>  /* This is the UUID used for HSMP */
>  static const guid_t acpi_hsmp_uuid = GUID_INIT(0xb74d619d, 0x5707, 0x48bd,
>  						0xa6, 0x9f, 0x4e, 0xa2,
> @@ -520,9 +474,9 @@ static int hsmp_parse_acpi_table(struct device *dev, u16 sock_ind)
>  	return hsmp_read_acpi_dsd(sock);
>  }
>  
> -static ssize_t hsmp_metric_tbl_read(struct file *filp, struct kobject *kobj,
> -				    struct bin_attribute *bin_attr, char *buf,
> -				    loff_t off, size_t count)
> +ssize_t hsmp_metric_tbl_read(struct file *filp, struct kobject *kobj,
> +			     struct bin_attribute *bin_attr, char *buf,
> +			     loff_t off, size_t count)
>  {
>  	struct hsmp_socket *sock = bin_attr->private;
>  	struct hsmp_message msg = { 0 };
> @@ -581,8 +535,8 @@ static int hsmp_get_tbl_dram_base(u16 sock_ind)
>  	return 0;
>  }
>  
> -static umode_t hsmp_is_sock_attr_visible(struct kobject *kobj,
> -					 struct bin_attribute *battr, int id)
> +umode_t hsmp_is_sock_attr_visible(struct kobject *kobj,
> +				  struct bin_attribute *battr, int id)
>  {
>  	if (plat_dev.proto_ver == HSMP_PROTO_VER6)
>  		return battr->attr.mode;
> @@ -611,8 +565,8 @@ static int hsmp_init_metric_tbl_bin_attr(struct bin_attribute **hattrs, u16 sock
>  /* One bin sysfs for metrics table */
>  #define NUM_HSMP_ATTRS		1
>  
> -static int hsmp_create_attr_list(struct attribute_group *attr_grp,
> -				 struct device *dev, u16 sock_ind)
> +int hsmp_create_attr_list(struct attribute_group *attr_grp,
> +			  struct device *dev, u16 sock_ind)
>  {
>  	struct bin_attribute **hsmp_bin_attrs;
>  
> @@ -628,37 +582,7 @@ static int hsmp_create_attr_list(struct attribute_group *attr_grp,
>  	return hsmp_init_metric_tbl_bin_attr(hsmp_bin_attrs, sock_ind);
>  }
>  
> -static int hsmp_create_non_acpi_sysfs_if(struct device *dev)
> -{
> -	const struct attribute_group **hsmp_attr_grps;
> -	struct attribute_group *attr_grp;
> -	u16 i;
> -
> -	hsmp_attr_grps = devm_kcalloc(dev, plat_dev.num_sockets + 1,
> -				      sizeof(*hsmp_attr_grps),
> -				      GFP_KERNEL);
> -	if (!hsmp_attr_grps)
> -		return -ENOMEM;
> -
> -	/* Create a sysfs directory for each socket */
> -	for (i = 0; i < plat_dev.num_sockets; i++) {
> -		attr_grp = devm_kzalloc(dev, sizeof(struct attribute_group),
> -					GFP_KERNEL);
> -		if (!attr_grp)
> -			return -ENOMEM;
> -
> -		snprintf(plat_dev.sock[i].name, HSMP_ATTR_GRP_NAME_SIZE, "socket%u", (u8)i);
> -		attr_grp->name			= plat_dev.sock[i].name;
> -		attr_grp->is_bin_visible	= hsmp_is_sock_attr_visible;
> -		hsmp_attr_grps[i]		= attr_grp;
> -
> -		hsmp_create_attr_list(attr_grp, dev, i);
> -	}
> -
> -	return device_add_groups(dev, hsmp_attr_grps);
> -}
> -
> -static int hsmp_create_acpi_sysfs_if(struct device *dev)
> +int hsmp_create_acpi_sysfs_if(struct device *dev)
>  {
>  	struct attribute_group *attr_grp;
>  	u16 sock_ind;
> @@ -681,7 +605,7 @@ static int hsmp_create_acpi_sysfs_if(struct device *dev)
>  	return devm_device_add_group(dev, attr_grp);
>  }
>  
> -static int hsmp_cache_proto_ver(u16 sock_ind)
> +int hsmp_cache_proto_ver(u16 sock_ind)
>  {
>  	struct hsmp_message msg = { 0 };
>  	int ret;
> @@ -697,76 +621,7 @@ static int hsmp_cache_proto_ver(u16 sock_ind)
>  	return ret;
>  }
>  
> -static inline bool is_f1a_m0h(void)
> -{
> -	if (boot_cpu_data.x86 == 0x1A && boot_cpu_data.x86_model <= 0x0F)
> -		return true;
> -
> -	return false;
> -}
> -
> -static int init_platform_device(struct device *dev)
> -{
> -	struct hsmp_socket *sock;
> -	int ret, i;
> -
> -	for (i = 0; i < plat_dev.num_sockets; i++) {
> -		if (!node_to_amd_nb(i))
> -			return -ENODEV;
> -		sock = &plat_dev.sock[i];
> -		sock->root			= node_to_amd_nb(i)->root;
> -		sock->sock_ind			= i;
> -		sock->dev			= dev;
> -		sock->mbinfo.base_addr		= SMN_HSMP_BASE;
> -
> -		/*
> -		 * This is a transitional change from non-ACPI to ACPI, only
> -		 * family 0x1A, model 0x00 platform is supported for both ACPI and non-ACPI.
> -		 */
> -		if (is_f1a_m0h())
> -			sock->mbinfo.msg_id_off	= SMN_HSMP_MSG_ID_F1A_M0H;
> -		else
> -			sock->mbinfo.msg_id_off	= SMN_HSMP_MSG_ID;
> -
> -		sock->mbinfo.msg_resp_off	= SMN_HSMP_MSG_RESP;
> -		sock->mbinfo.msg_arg_off	= SMN_HSMP_MSG_DATA;
> -		sema_init(&sock->hsmp_sem, 1);
> -
> -		/* Test the hsmp interface on each socket */
> -		ret = hsmp_test(i, 0xDEADBEEF);
> -		if (ret) {
> -			dev_err(dev, "HSMP test message failed on Fam:%x model:%x\n",
> -				boot_cpu_data.x86, boot_cpu_data.x86_model);
> -			dev_err(dev, "Is HSMP disabled in BIOS ?\n");
> -			return ret;
> -		}
> -		ret = hsmp_cache_proto_ver(i);
> -		if (ret) {
> -			dev_err(dev, "Failed to read HSMP protocol version\n");
> -			return ret;
> -		}
> -	}
> -
> -	return 0;
> -}
> -
> -static const struct acpi_device_id amd_hsmp_acpi_ids[] = {
> -	{ACPI_HSMP_DEVICE_HID, 0},
> -	{}
> -};
> -MODULE_DEVICE_TABLE(acpi, amd_hsmp_acpi_ids);
> -
> -static bool check_acpi_support(struct device *dev)
> -{
> -	struct acpi_device *adev = ACPI_COMPANION(dev);
> -
> -	if (adev && !acpi_match_device_ids(adev, amd_hsmp_acpi_ids))
> -		return true;
> -
> -	return false;
> -}
> -
> -static int init_acpi(struct device *dev)
> +int init_acpi(struct device *dev)
>  {
>  	u16 sock_ind;
>  	int ret;
> @@ -800,178 +655,3 @@ static int init_acpi(struct device *dev)
>  
>  	return ret;
>  }
> -
> -static int hsmp_pltdrv_probe(struct platform_device *pdev)
> -{
> -	int ret;
> -
> -	/*
> -	 * On ACPI supported BIOS, there is an ACPI HSMP device added for
> -	 * each socket, so the per socket probing, but the memory allocated for
> -	 * sockets should be contiguous to access it as an array,
> -	 * Hence allocate memory for all the sockets at once instead of allocating
> -	 * on each probe.
> -	 */
> -	if (!plat_dev.is_probed) {
> -		plat_dev.sock = devm_kcalloc(&pdev->dev, plat_dev.num_sockets,
> -					     sizeof(*plat_dev.sock),
> -					     GFP_KERNEL);
> -		if (!plat_dev.sock)
> -			return -ENOMEM;
> -	}
> -	if (check_acpi_support(&pdev->dev)) {
> -		ret = init_acpi(&pdev->dev);
> -		if (ret) {
> -			dev_err(&pdev->dev, "Failed to init HSMP mailbox\n");
> -			return ret;
> -		}
> -		ret = hsmp_create_acpi_sysfs_if(&pdev->dev);
> -		if (ret)
> -			dev_err(&pdev->dev, "Failed to create HSMP sysfs interface\n");
> -	} else {
> -		ret = init_platform_device(&pdev->dev);
> -		if (ret) {
> -			dev_err(&pdev->dev, "Failed to init HSMP mailbox\n");
> -			return ret;
> -		}
> -		ret = hsmp_create_non_acpi_sysfs_if(&pdev->dev);
> -		if (ret)
> -			dev_err(&pdev->dev, "Failed to create HSMP sysfs interface\n");
> -	}
> -
> -	if (!plat_dev.is_probed) {
> -		plat_dev.hsmp_device.name	= HSMP_CDEV_NAME;
> -		plat_dev.hsmp_device.minor	= MISC_DYNAMIC_MINOR;
> -		plat_dev.hsmp_device.fops	= &hsmp_fops;
> -		plat_dev.hsmp_device.parent	= &pdev->dev;
> -		plat_dev.hsmp_device.nodename	= HSMP_DEVNODE_NAME;
> -		plat_dev.hsmp_device.mode	= 0644;
> -
> -		ret = misc_register(&plat_dev.hsmp_device);
> -		if (ret)
> -			return ret;
> -
> -		plat_dev.is_probed = true;
> -	}
> -
> -	return 0;
> -
> -}
> -
> -static void hsmp_pltdrv_remove(struct platform_device *pdev)
> -{
> -	/*
> -	 * We register only one misc_device even on multi socket system.
> -	 * So, deregister should happen only once.
> -	 */
> -	if (plat_dev.is_probed) {
> -		misc_deregister(&plat_dev.hsmp_device);
> -		plat_dev.is_probed = false;
> -	}
> -}
> -
> -static struct platform_driver amd_hsmp_driver = {
> -	.probe		= hsmp_pltdrv_probe,
> -	.remove_new	= hsmp_pltdrv_remove,
> -	.driver		= {
> -		.name	= DRIVER_NAME,
> -		.acpi_match_table = amd_hsmp_acpi_ids,
> -	},
> -};
> -
> -static struct platform_device *amd_hsmp_platdev;
> -
> -static int hsmp_plat_dev_register(void)
> -{
> -	int ret;
> -
> -	amd_hsmp_platdev = platform_device_alloc(DRIVER_NAME, PLATFORM_DEVID_NONE);
> -	if (!amd_hsmp_platdev)
> -		return -ENOMEM;
> -
> -	ret = platform_device_add(amd_hsmp_platdev);
> -	if (ret)
> -		platform_device_put(amd_hsmp_platdev);
> -
> -	return ret;
> -}
> -
> -/*
> - * This check is only needed for backward compatibility of previous platforms.
> - * All new platforms are expected to support ACPI based probing.
> - */
> -static bool legacy_hsmp_support(void)
> -{
> -	if (boot_cpu_data.x86_vendor != X86_VENDOR_AMD)
> -		return false;
> -
> -	switch (boot_cpu_data.x86) {
> -	case 0x19:
> -		switch (boot_cpu_data.x86_model) {
> -		case 0x00 ... 0x1F:
> -		case 0x30 ... 0x3F:
> -		case 0x90 ... 0x9F:
> -		case 0xA0 ... 0xAF:
> -			return true;
> -		default:
> -			return false;
> -		}
> -	case 0x1A:
> -		switch (boot_cpu_data.x86_model) {
> -		case 0x00 ... 0x1F:
> -			return true;
> -		default:
> -			return false;
> -		}
> -	default:
> -		return false;
> -	}
> -
> -	return false;
> -}
> -
> -static int __init hsmp_plt_init(void)
> -{
> -	int ret = -ENODEV;
> -
> -	/*
> -	 * amd_nb_num() returns number of SMN/DF interfaces present in the system
> -	 * if we have N SMN/DF interfaces that ideally means N sockets
> -	 */
> -	plat_dev.num_sockets = amd_nb_num();
> -	if (plat_dev.num_sockets == 0 || plat_dev.num_sockets > MAX_AMD_SOCKETS)
> -		return ret;
> -
> -	ret = platform_driver_register(&amd_hsmp_driver);
> -	if (ret)
> -		return ret;
> -
> -	if (!plat_dev.is_acpi_device) {
> -		if (legacy_hsmp_support()) {
> -			/* Not ACPI device, but supports HSMP, register a plat_dev */
> -			ret = hsmp_plat_dev_register();
> -		} else {
> -			/* Not ACPI, Does not support HSMP */
> -			pr_info("HSMP is not supported on Family:%x model:%x\n",
> -				boot_cpu_data.x86, boot_cpu_data.x86_model);
> -			ret = -ENODEV;
> -		}
> -		if (ret)
> -			platform_driver_unregister(&amd_hsmp_driver);
> -	}
> -
> -	return ret;
> -}
> -
> -static void __exit hsmp_plt_exit(void)
> -{
> -	platform_device_unregister(amd_hsmp_platdev);
> -	platform_driver_unregister(&amd_hsmp_driver);
> -}
> -
> -device_initcall(hsmp_plt_init);
> -module_exit(hsmp_plt_exit);
> -
> -MODULE_DESCRIPTION("AMD HSMP Platform Interface Driver");
> -MODULE_VERSION(DRIVER_VERSION);
> -MODULE_LICENSE("GPL v2");
> diff --git a/drivers/platform/x86/amd/hsmp/hsmp.h b/drivers/platform/x86/amd/hsmp/hsmp.h
> index 5afc7167fac1..1aa33c5633d0 100644
> --- a/drivers/platform/x86/amd/hsmp/hsmp.h
> +++ b/drivers/platform/x86/amd/hsmp/hsmp.h
> @@ -51,4 +51,21 @@ struct hsmp_plat_device {
>  	bool is_acpi_device;
>  	bool is_probed;
>  };
> +
> +extern struct hsmp_plat_device plat_dev;
> +
> +int init_acpi(struct device *dev);
> +ssize_t hsmp_metric_tbl_read(struct file *filp, struct kobject *kobj,
> +			     struct bin_attribute *bin_attr, char *buf,
> +			     loff_t off, size_t count);
> +int hsmp_create_acpi_sysfs_if(struct device *dev);
> +int amd_hsmp_pci_rdwr(struct hsmp_socket *sock, u32 offset,
> +		      u32 *value, bool write);
> +int hsmp_cache_proto_ver(u16 sock_ind);
> +long hsmp_ioctl(struct file *fp, unsigned int cmd, unsigned long arg);
> +umode_t hsmp_is_sock_attr_visible(struct kobject *kobj,
> +				  struct bin_attribute *battr, int id);
> +int hsmp_create_attr_list(struct attribute_group *attr_grp,
> +			  struct device *dev, u16 sock_ind);
> +int hsmp_test(u16 sock_ind, u32 value);
>  #endif /* HSMP_H */
> diff --git a/drivers/platform/x86/amd/hsmp/plat.c b/drivers/platform/x86/amd/hsmp/plat.c
> new file mode 100644
> index 000000000000..2ed5a9452244
> --- /dev/null
> +++ b/drivers/platform/x86/amd/hsmp/plat.c
> @@ -0,0 +1,338 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * AMD HSMP Platform Driver
> + * Copyright (c) 2024, AMD.
> + * All Rights Reserved.
> + *
> + * This file provides platform device implementations.
> + */
> +
> +#define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
> +
> +#include "hsmp.h"
> +
> +#include <asm/amd_nb.h>
> +
> +#include <linux/acpi.h>
> +#include <linux/device.h>
> +#include <linux/module.h>
> +#include <linux/pci.h>
> +#include <linux/platform_device.h>

The usual convention is to put "" ones last.

> +
> +#define DRIVER_NAME		"amd_hsmp"
> +#define DRIVER_VERSION		"2.2"
> +#define ACPI_HSMP_DEVICE_HID	"AMDI0097"
> +
> +/*
> + * To access specific HSMP mailbox register, s/w writes the SMN address of HSMP mailbox
> + * register into the SMN_INDEX register, and reads/writes the SMN_DATA reg.
> + * Below are required SMN address for HSMP Mailbox register offsets in SMU address space
> + */
> +#define SMN_HSMP_BASE		0x3B00000
> +#define SMN_HSMP_MSG_ID		0x0010534
> +#define SMN_HSMP_MSG_ID_F1A_M0H	0x0010934
> +#define SMN_HSMP_MSG_RESP	0x0010980
> +#define SMN_HSMP_MSG_DATA	0x00109E0
> +
> +#define HSMP_INDEX_REG		0xc4
> +#define HSMP_DATA_REG		0xc8
> +
> +int amd_hsmp_pci_rdwr(struct hsmp_socket *sock, u32 offset,
> +		      u32 *value, bool write)
> +{
> +	int ret;
> +
> +	if (!sock->root)
> +		return -ENODEV;
> +
> +	ret = pci_write_config_dword(sock->root, HSMP_INDEX_REG,
> +				     sock->mbinfo.base_addr + offset);
> +	if (ret)
> +		return ret;
> +
> +	ret = (write ? pci_write_config_dword(sock->root, HSMP_DATA_REG, *value)
> +		     : pci_read_config_dword(sock->root, HSMP_DATA_REG, value));
> +
> +	return ret;
> +}
> +
> +static const struct file_operations hsmp_fops = {
> +	.owner		= THIS_MODULE,
> +	.unlocked_ioctl	= hsmp_ioctl,
> +	.compat_ioctl	= hsmp_ioctl,
> +};
> +
> +static int hsmp_create_non_acpi_sysfs_if(struct device *dev)
> +{
> +	const struct attribute_group **hsmp_attr_grps;
> +	struct attribute_group *attr_grp;
> +	u16 i;
> +
> +	hsmp_attr_grps = devm_kcalloc(dev, plat_dev.num_sockets + 1,
> +				      sizeof(*hsmp_attr_grps),
> +				      GFP_KERNEL);
> +	if (!hsmp_attr_grps)
> +		return -ENOMEM;
> +
> +	/* Create a sysfs directory for each socket */
> +	for (i = 0; i < plat_dev.num_sockets; i++) {
> +		attr_grp = devm_kzalloc(dev, sizeof(struct attribute_group),
> +					GFP_KERNEL);
> +		if (!attr_grp)
> +			return -ENOMEM;
> +
> +		snprintf(plat_dev.sock[i].name, HSMP_ATTR_GRP_NAME_SIZE, "socket%u", (u8)i);
> +		attr_grp->name			= plat_dev.sock[i].name;
> +		attr_grp->is_bin_visible	= hsmp_is_sock_attr_visible;
> +		hsmp_attr_grps[i]		= attr_grp;
> +
> +		hsmp_create_attr_list(attr_grp, dev, i);
> +	}
> +
> +	return device_add_groups(dev, hsmp_attr_grps);
> +}
> +
> +static inline bool is_f1a_m0h(void)
> +{
> +	if (boot_cpu_data.x86 == 0x1A && boot_cpu_data.x86_model <= 0x0F)
> +		return true;
> +
> +	return false;
> +}
> +
> +static int init_platform_device(struct device *dev)
> +{
> +	struct hsmp_socket *sock;
> +	int ret, i;
> +
> +	for (i = 0; i < plat_dev.num_sockets; i++) {
> +		if (!node_to_amd_nb(i))
> +			return -ENODEV;
> +		sock = &plat_dev.sock[i];
> +		sock->root			= node_to_amd_nb(i)->root;
> +		sock->sock_ind			= i;
> +		sock->dev			= dev;
> +		sock->mbinfo.base_addr		= SMN_HSMP_BASE;
> +
> +		/*
> +		 * This is a transitional change from non-ACPI to ACPI, only
> +		 * family 0x1A, model 0x00 platform is supported for both ACPI and non-ACPI.
> +		 */
> +		if (is_f1a_m0h())
> +			sock->mbinfo.msg_id_off	= SMN_HSMP_MSG_ID_F1A_M0H;
> +		else
> +			sock->mbinfo.msg_id_off	= SMN_HSMP_MSG_ID;
> +
> +		sock->mbinfo.msg_resp_off	= SMN_HSMP_MSG_RESP;
> +		sock->mbinfo.msg_arg_off	= SMN_HSMP_MSG_DATA;
> +		sema_init(&sock->hsmp_sem, 1);
> +
> +		/* Test the hsmp interface on each socket */
> +		ret = hsmp_test(i, 0xDEADBEEF);
> +		if (ret) {
> +			dev_err(dev, "HSMP test message failed on Fam:%x model:%x\n",
> +				boot_cpu_data.x86, boot_cpu_data.x86_model);
> +			dev_err(dev, "Is HSMP disabled in BIOS ?\n");
> +			return ret;
> +		}
> +
> +		ret = hsmp_cache_proto_ver(i);
> +		if (ret) {
> +			dev_err(dev, "Failed to read HSMP protocol version\n");
> +			return ret;
> +		}
> +	}
> +
> +	return 0;
> +}
> +
> +static const struct acpi_device_id amd_hsmp_acpi_ids[] = {
> +	{ACPI_HSMP_DEVICE_HID, 0},
> +	{}
> +};
> +MODULE_DEVICE_TABLE(acpi, amd_hsmp_acpi_ids);
> +
> +static bool check_acpi_support(struct device *dev)
> +{
> +	struct acpi_device *adev = ACPI_COMPANION(dev);
> +
> +	if (adev && !acpi_match_device_ids(adev, amd_hsmp_acpi_ids))
> +		return true;
> +
> +	return false;
> +}
> +
> +static int hsmp_pltdrv_probe(struct platform_device *pdev)
> +{
> +	int ret;
> +
> +	/*
> +	 * On ACPI supported BIOS, there is an ACPI HSMP device added for
> +	 * each socket, so the per socket probing, but the memory allocated for
> +	 * sockets should be contiguous to access it as an array,
> +	 * Hence allocate memory for all the sockets at once instead of allocating
> +	 * on each probe.
> +	 */
> +	if (!plat_dev.is_probed) {
> +		plat_dev.sock = devm_kcalloc(&pdev->dev, plat_dev.num_sockets,
> +					     sizeof(*plat_dev.sock),
> +					     GFP_KERNEL);
> +		if (!plat_dev.sock)
> +			return -ENOMEM;
> +	}
> +
> +	if (check_acpi_support(&pdev->dev)) {
> +		ret = init_acpi(&pdev->dev);
> +		if (ret) {
> +			dev_err(&pdev->dev, "Failed to init HSMP mailbox\n");
> +			return ret;
> +		}
> +		ret = hsmp_create_acpi_sysfs_if(&pdev->dev);
> +		if (ret)
> +			dev_err(&pdev->dev, "Failed to create HSMP sysfs interface\n");

This now moves ACPI stuff into plat.c and that seems unnecessary.
It can be avoided by starting to construct the final probe functions 
differently within the series.

Effectively, you initially move just the code in these two if branches
into the per-probe mechanism probe functions and keep the common probe 
parts in hsmp.c until the actual split into two drivers.

-- 
 i.

> +	} else {
> +		ret = init_platform_device(&pdev->dev);
> +		if (ret) {
> +			dev_err(&pdev->dev, "Failed to init HSMP mailbox\n");
> +			return ret;
> +		}
> +		ret = hsmp_create_non_acpi_sysfs_if(&pdev->dev);
> +		if (ret)
> +			dev_err(&pdev->dev, "Failed to create HSMP sysfs interface\n");
> +	}
> +
> +	if (!plat_dev.is_probed) {
> +		plat_dev.hsmp_device.name	= HSMP_CDEV_NAME;
> +		plat_dev.hsmp_device.minor	= MISC_DYNAMIC_MINOR;
> +		plat_dev.hsmp_device.fops	= &hsmp_fops;
> +		plat_dev.hsmp_device.parent	= &pdev->dev;
> +		plat_dev.hsmp_device.nodename	= HSMP_DEVNODE_NAME;
> +		plat_dev.hsmp_device.mode	= 0644;
> +
> +		ret = misc_register(&plat_dev.hsmp_device);
> +		if (ret)
> +			return ret;
> +
> +		plat_dev.is_probed = true;
> +	}
> +
> +	return 0;
> +}
> +
> +static void hsmp_pltdrv_remove(struct platform_device *pdev)
> +{
> +	/*
> +	 * We register only one misc_device even on multi socket system.
> +	 * So, deregister should happen only once.
> +	 */
> +	if (plat_dev.is_probed) {
> +		misc_deregister(&plat_dev.hsmp_device);
> +		plat_dev.is_probed = false;
> +	}
> +}
> +
> +static struct platform_driver amd_hsmp_driver = {
> +	.probe		= hsmp_pltdrv_probe,
> +	.remove_new	= hsmp_pltdrv_remove,
> +	.driver		= {
> +		.name	= DRIVER_NAME,
> +		.acpi_match_table = amd_hsmp_acpi_ids,
> +	},
> +};
> +
> +static struct platform_device *amd_hsmp_platdev;
> +
> +static int hsmp_plat_dev_register(void)
> +{
> +	int ret;
> +
> +	amd_hsmp_platdev = platform_device_alloc(DRIVER_NAME, PLATFORM_DEVID_NONE);
> +	if (!amd_hsmp_platdev)
> +		return -ENOMEM;
> +
> +	ret = platform_device_add(amd_hsmp_platdev);
> +	if (ret)
> +		platform_device_put(amd_hsmp_platdev);
> +
> +	return ret;
> +}
> +
> +/*
> + * This check is only needed for backward compatibility of previous platforms.
> + * All new platforms are expected to support ACPI based probing.
> + */
> +static bool legacy_hsmp_support(void)
> +{
> +	if (boot_cpu_data.x86_vendor != X86_VENDOR_AMD)
> +		return false;
> +
> +	switch (boot_cpu_data.x86) {
> +	case 0x19:
> +		switch (boot_cpu_data.x86_model) {
> +		case 0x00 ... 0x1F:
> +		case 0x30 ... 0x3F:
> +		case 0x90 ... 0x9F:
> +		case 0xA0 ... 0xAF:
> +			return true;
> +		default:
> +			return false;
> +		}
> +	case 0x1A:
> +		switch (boot_cpu_data.x86_model) {
> +		case 0x00 ... 0x1F:
> +			return true;
> +		default:
> +			return false;
> +		}
> +	default:
> +		return false;
> +	}
> +
> +	return false;
> +}
> +
> +static int __init hsmp_plt_init(void)
> +{
> +	int ret = -ENODEV;
> +
> +	/*
> +	 * amd_nb_num() returns number of SMN/DF interfaces present in the system
> +	 * if we have N SMN/DF interfaces that ideally means N sockets
> +	 */
> +	plat_dev.num_sockets = amd_nb_num();
> +	if (plat_dev.num_sockets == 0 || plat_dev.num_sockets > MAX_AMD_SOCKETS)
> +		return ret;
> +
> +	ret = platform_driver_register(&amd_hsmp_driver);
> +	if (ret)
> +		return ret;
> +
> +	if (!plat_dev.is_acpi_device) {
> +		if (legacy_hsmp_support()) {
> +			/* Not ACPI device, but supports HSMP, register a plat_dev */
> +			ret = hsmp_plat_dev_register();
> +		} else {
> +			/* Not ACPI, Does not support HSMP */
> +			pr_info("HSMP is not supported on Family:%x model:%x\n",
> +				boot_cpu_data.x86, boot_cpu_data.x86_model);
> +			ret = -ENODEV;
> +		}
> +		if (ret)
> +			platform_driver_unregister(&amd_hsmp_driver);
> +	}
> +
> +	return ret;
> +}
> +
> +static void __exit hsmp_plt_exit(void)
> +{
> +	platform_device_unregister(amd_hsmp_platdev);
> +	platform_driver_unregister(&amd_hsmp_driver);
> +}
> +
> +device_initcall(hsmp_plt_init);
> +module_exit(hsmp_plt_exit);
> +
> +MODULE_DESCRIPTION("AMD HSMP Platform Interface Driver");
> +MODULE_VERSION(DRIVER_VERSION);
> +MODULE_LICENSE("GPL v2");
> 

