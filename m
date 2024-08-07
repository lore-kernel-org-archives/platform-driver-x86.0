Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C39B11DF66F
	for <platform-driver-x86@vger.kernel.org>; Wed,  7 Aug 2024 12:31:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723033869; cv=none; b=jLrSjVMbacod1dhaNb1y6vCuANLRg+TNLwZK69ij0XLJnNjkLbBtHdGGabZ82q0bJVAS+vgiRGgBSUtAfS5qi69h7mqKIDrA9hQowTHgaq0M0wKqr+ZNPEgsTOeW0lMAYqQbxxSddT9oLGl6iQduCHXO1U4NusWW92WPQZNcyAY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723033869; c=relaxed/simple;
	bh=KjzdpCdVM0GxUjQ4T5IdKPcIcS6Y0b2owMvMCSX4Axc=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=h+qINgY+a3RtoNfGqTyOCWYiiyIZX3VH3kIgc1RijQmLfTP0J0unZJB7aXrZPf4y8LXbqXxDny9iXs2QqSQr5kO/U4yApQ27yuvutizRSDSpkraJ3GTKkNef7b843RUn5ORLXgF+643UYt/wYEIQULGUVLw+tCW/jltEkG07hnM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=OWQfmWbM; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="OWQfmWbM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1723033867; x=1754569867;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=KjzdpCdVM0GxUjQ4T5IdKPcIcS6Y0b2owMvMCSX4Axc=;
  b=OWQfmWbMK3zmHG+ZM4KMuGEbFv4VCVFSP0qYy6Jw3od1p8vuqv+dqn+X
   p/CpxWEXxwkQbv6xLnnFEIEchMoZjVOvCqcWnID0I7igHwmeSToIisHVV
   84U4o+hG3UWbjv/eqkCKc/ZUq0zwRim1b987qJ6Pyi5srQHN4vP5kuI7v
   wezN7h1N95/hwaQGZFwMSJxTNNjYccRCVwYCZl7nizojgPqqlt3MyiPWi
   5u9ZBe0NqtXgV7Lc+9YdtjWQDQUpmi5hWDQxFySZwWgcpjQHVLfzFUEPT
   rV5X2Zdv9515+cKer6fE7pO+AIkjXb6qXCaRhZAHarDoXeBpwW8mITG8h
   Q==;
X-CSE-ConnectionGUID: V9ro4IJhRsiEC9tIrIvpSg==
X-CSE-MsgGUID: yNXJcMv6TrascUv7TvP0PA==
X-IronPort-AV: E=McAfee;i="6700,10204,11157"; a="46503404"
X-IronPort-AV: E=Sophos;i="6.09,269,1716274800"; 
   d="scan'208";a="46503404"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Aug 2024 05:31:06 -0700
X-CSE-ConnectionGUID: IWo2oyPgSGe5ABGI9CmAiw==
X-CSE-MsgGUID: UWgi0IHHQzm59rzrGnRgHg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,269,1716274800"; 
   d="scan'208";a="60964320"
Received: from ijarvine-desk1.ger.corp.intel.com (HELO localhost) ([10.245.244.202])
  by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Aug 2024 05:31:03 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Wed, 7 Aug 2024 15:31:00 +0300 (EEST)
To: Suma Hegde <suma.hegde@amd.com>
cc: platform-driver-x86@vger.kernel.org, Hans de Goede <hdegoede@redhat.com>, 
    Naveen Krishna Chatradhi <naveenkrishna.chatradhi@amd.com>
Subject: Re: [v3 07/11] platform/x86/amd/hsmp: Create mutually exclusive ACPI
 and plat drivers
In-Reply-To: <20240720174552.946255-7-suma.hegde@amd.com>
Message-ID: <8807d11e-8272-6c22-a7e9-fd289ebd7f1b@linux.intel.com>
References: <20240720174552.946255-1-suma.hegde@amd.com> <20240720174552.946255-7-suma.hegde@amd.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Sat, 20 Jul 2024, Suma Hegde wrote:

> Separate the probes for ACPI and platform device drivers.
> Provide a Kconfig option to select either the
> ACPI or the platform device based driver.
> 
> Signed-off-by: Suma Hegde <suma.hegde@amd.com>
> Reviewed-by: Naveen Krishna Chatradhi <naveenkrishna.chatradhi@amd.com>
> ---
> Changes since v2:
> Following files are modified to add new symbol
>  - drivers/platform/x86/amd/hsmp/Kconfig, 
>  - drivers/platform/x86/amd/hsmp/Makefile
>  - drivers/platform/x86/amd/Makefile
> AMD_HSMP is used as common symbol and new AMD_HSMP_PLAT symbol is added
> 
> Changes since v1:
> Rename "plat_dev" to "hsmp_pdev"
> 
>  arch/x86/include/asm/amd_hsmp.h        |   2 +-
>  drivers/platform/x86/amd/Makefile      |   2 +-
>  drivers/platform/x86/amd/hsmp/Kconfig  |  33 ++++++-
>  drivers/platform/x86/amd/hsmp/Makefile |   6 +-
>  drivers/platform/x86/amd/hsmp/acpi.c   | 119 ++++++++++++++++++++++--
>  drivers/platform/x86/amd/hsmp/hsmp.c   |  25 ++---
>  drivers/platform/x86/amd/hsmp/hsmp.h   |   8 +-
>  drivers/platform/x86/amd/hsmp/plat.c   | 122 +++++++------------------
>  8 files changed, 188 insertions(+), 129 deletions(-)
> 
> diff --git a/arch/x86/include/asm/amd_hsmp.h b/arch/x86/include/asm/amd_hsmp.h
> index 03c2ce3edaf5..ada14e55f9f4 100644
> --- a/arch/x86/include/asm/amd_hsmp.h
> +++ b/arch/x86/include/asm/amd_hsmp.h
> @@ -5,7 +5,7 @@
>  
>  #include <uapi/asm/amd_hsmp.h>
>  
> -#if IS_ENABLED(CONFIG_AMD_HSMP)
> +#if IS_ENABLED(CONFIG_AMD_HSMP) || IS_ENABLED(CONFIG_AMD_HSMP_ACPI)
>  int hsmp_send_message(struct hsmp_message *msg);
>  #else
>  static inline int hsmp_send_message(struct hsmp_message *msg)
> diff --git a/drivers/platform/x86/amd/Makefile b/drivers/platform/x86/amd/Makefile
> index 96ec24c8701b..f0b2fe81c685 100644
> --- a/drivers/platform/x86/amd/Makefile
> +++ b/drivers/platform/x86/amd/Makefile
> @@ -5,6 +5,6 @@
>  #
>  
>  obj-$(CONFIG_AMD_PMC)		+= pmc/
> -obj-y				+= hsmp/
> +obj-$(CONFIG_AMD_HSMP)		+= hsmp/
>  obj-$(CONFIG_AMD_PMF)		+= pmf/
>  obj-$(CONFIG_AMD_WBRF)		+= wbrf.o
> diff --git a/drivers/platform/x86/amd/hsmp/Kconfig b/drivers/platform/x86/amd/hsmp/Kconfig
> index b55d4ed9bceb..23fb98066225 100644
> --- a/drivers/platform/x86/amd/hsmp/Kconfig
> +++ b/drivers/platform/x86/amd/hsmp/Kconfig
> @@ -4,14 +4,39 @@
>  #
>  
>  config AMD_HSMP
> -	tristate "AMD HSMP Driver"
> -	depends on AMD_NB && X86_64 && ACPI
> +	tristate "AMD Host System Management Port driver"
> +	depends on AMD_NB

This SYMBOL shouldn't be user visible at all since it's "library" for the 
other two drivers.

Since the other two will be select this, depends on won't propagate 
correctly so move it to the menu instead.

>  	help
> +	  Host System Management Port (HSMP) interface is a mailbox interface
> +	  between the x86 core and the System Management Unit (SMU) firmware.
>  	  The driver provides a way for user space tools to monitor and manage
>  	  system management functionality on EPYC server CPUs from AMD.
>
> -	  Host System Management Port (HSMP) interface is a mailbox interface
> -	  between the x86 core and the System Management Unit (SMU) firmware.
> +menu "AMD HSMP Probe"
> +	depends on AMD_HSMP

depends on AMD_NB

> +
> +config AMD_HSMP_ACPI
> +	tristate "ACPI based probe"
> +	depends on ACPI

select AMD_HSMP

> +	help
> +	  This driver supports ACPI based probing.
> +
> +	  You may enable this, if your platform bios provides an ACPI object

BIOS

> +	  as described in the documentation.

"in the documentation" ???

>  
>  	  If you choose to compile this driver as a module the module will be
>  	  called amd_hsmp.
> +
> +config AMD_HSMP_PLAT
> +	tristate "Platform device based probe"
> +	depends on AMD_HSMP_ACPI=n

select AMD_HSMP

> +	help
> +	  This driver supports platform device based probing.
> +
> +	  You may enable this, if your platform bios does not provide

BIOS

> +	  HSMP ACPI object.
> +
> +	  If you choose to compile this driver as a module the module will be
> +	  called amd_hsmp.
> +
> +endmenu

You'll probably also want to rewrite some of the string slightly to match 
the changes this causes in the user-visible config entries.

> diff --git a/drivers/platform/x86/amd/hsmp/Makefile b/drivers/platform/x86/amd/hsmp/Makefile
> index 0cc92865c0a2..18d9a0d1e8c5 100644
> --- a/drivers/platform/x86/amd/hsmp/Makefile
> +++ b/drivers/platform/x86/amd/hsmp/Makefile
> @@ -4,5 +4,7 @@
>  # AMD HSMP Driver
>  #
>  
> -obj-$(CONFIG_AMD_HSMP)		+= amd_hsmp.o
> -amd_hsmp-objs			:= hsmp.o plat.o acpi.o
> +obj-$(CONFIG_AMD_HSMP)			+= amd_hsmp.o
> +amd_hsmp-objs				:= hsmp.o
> +amd_hsmp-$(CONFIG_AMD_HSMP_PLAT)	+= plat.o
> +amd_hsmp-$(CONFIG_AMD_HSMP_ACPI)	+= acpi.o
> diff --git a/drivers/platform/x86/amd/hsmp/acpi.c b/drivers/platform/x86/amd/hsmp/acpi.c
> index 46cb86d5d550..86100943aadc 100644
> --- a/drivers/platform/x86/amd/hsmp/acpi.c
> +++ b/drivers/platform/x86/amd/hsmp/acpi.c
> @@ -11,29 +11,43 @@
>  
>  #include "hsmp.h"
>  
> +#include <asm/amd_nb.h>
> +
>  #include <linux/acpi.h>
>  #include <linux/device.h>
>  #include <linux/dev_printk.h>
>  #include <linux/ioport.h>
>  #include <linux/kstrtox.h>
> +#include <linux/platform_device.h>
>  #include <linux/uuid.h>
>  
>  #include <uapi/asm-generic/errno-base.h>
>  
> +#define DRIVER_NAME		"amd_hsmp"
> +#define DRIVER_VERSION		"2.3"
> +#define ACPI_HSMP_DEVICE_HID	"AMDI0097"
> +
>  /* These are the strings specified in ACPI table */
>  #define MSG_IDOFF_STR		"MsgIdOffset"
>  #define MSG_ARGOFF_STR		"MsgArgOffset"
>  #define MSG_RESPOFF_STR		"MsgRspOffset"
>  
> -void amd_hsmp_acpi_rdwr(struct hsmp_socket *sock, u32 offset,
> -			u32 *value, bool write)
> +static int amd_hsmp_acpi_rdwr(struct hsmp_socket *sock, u32 offset,
> +			      u32 *value, bool write)
>  {
>  	if (write)
>  		iowrite32(*value, sock->virt_base_addr + offset);
>  	else
>  		*value = ioread32(sock->virt_base_addr + offset);
> +	return 0;
>  }
>  
> +static const struct file_operations hsmp_fops = {
> +	.owner		= THIS_MODULE,
> +	.unlocked_ioctl	= hsmp_ioctl,
> +	.compat_ioctl	= hsmp_ioctl,
> +};
> +
>  /* This is the UUID used for HSMP */
>  static const guid_t acpi_hsmp_uuid = GUID_INIT(0xb74d619d, 0x5707, 0x48bd,
>  						0xa6, 0x9f, 0x4e, 0xa2,
> @@ -194,9 +208,9 @@ static int hsmp_parse_acpi_table(struct device *dev, u16 sock_ind)
>  	struct hsmp_socket *sock = &hsmp_pdev.sock[sock_ind];
>  	int ret;
>  
> -	sock->sock_ind			= sock_ind;
> -	sock->dev			= dev;
> -	hsmp_pdev.is_acpi_device	= true;
> +	sock->sock_ind		= sock_ind;
> +	sock->dev		= dev;
> +	sock->amd_hsmp_rdwr	= amd_hsmp_acpi_rdwr;
>  
>  	sema_init(&sock->hsmp_sem, 1);
>  
> @@ -209,7 +223,7 @@ static int hsmp_parse_acpi_table(struct device *dev, u16 sock_ind)
>  	return hsmp_read_acpi_dsd(sock);
>  }
>  
> -int hsmp_create_acpi_sysfs_if(struct device *dev)
> +static int hsmp_create_acpi_sysfs_if(struct device *dev)
>  {
>  	struct attribute_group *attr_grp;
>  	u16 sock_ind;
> @@ -232,7 +246,7 @@ int hsmp_create_acpi_sysfs_if(struct device *dev)
>  	return devm_device_add_group(dev, attr_grp);
>  }
>  
> -int init_acpi(struct device *dev)
> +static int init_acpi(struct device *dev)
>  {
>  	u16 sock_ind;
>  	int ret;
> @@ -266,3 +280,94 @@ int init_acpi(struct device *dev)
>  
>  	return ret;
>  }
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
> +static int hsmp_acpi_probe(struct platform_device *pdev)
> +{
> +	int ret;
> +
> +	if (!hsmp_pdev.is_probed) {
> +		hsmp_pdev.num_sockets = amd_nb_num();
> +		if (hsmp_pdev.num_sockets == 0 || hsmp_pdev.num_sockets > MAX_AMD_SOCKETS)
> +			return -ENODEV;
> +
> +		hsmp_pdev.sock = devm_kcalloc(&pdev->dev, hsmp_pdev.num_sockets,
> +					      sizeof(*hsmp_pdev.sock),
> +					      GFP_KERNEL);

Unrelated to this patch, don't you need a mutex to protect against two 
concurrent probes?

> +		if (!hsmp_pdev.sock)
> +			return -ENOMEM;
> +	}
> +
> +	if (!check_acpi_support(&pdev->dev)) {
> +		dev_err(&pdev->dev, "Not ACPI device?\n");
> +		return -ENODEV;
> +	}
> +
> +	ret = init_acpi(&pdev->dev);
> +	if (ret) {
> +		dev_err(&pdev->dev, "Failed to initialize HSMP interface.\n");
> +		return ret;
> +	}
> +
> +	ret = hsmp_create_acpi_sysfs_if(&pdev->dev);
> +	if (ret)
> +		dev_err(&pdev->dev, "Failed to create HSMP sysfs interface\n");
> +
> +	if (!hsmp_pdev.is_probed) {
> +		hsmp_pdev.mdev.name	= HSMP_CDEV_NAME;
> +		hsmp_pdev.mdev.minor	= MISC_DYNAMIC_MINOR;
> +		hsmp_pdev.mdev.fops	= &hsmp_fops;
> +		hsmp_pdev.mdev.parent	= &pdev->dev;
> +		hsmp_pdev.mdev.nodename	= HSMP_DEVNODE_NAME;
> +		hsmp_pdev.mdev.mode	= 0644;
> +
> +		ret = misc_register(&hsmp_pdev.mdev);
> +		if (ret)
> +			return ret;
> +		hsmp_pdev.is_probed = true;
> +	}
> +
> +	return 0;
> +}
> +
> +static void hsmp_acpi_remove(struct platform_device *pdev)
> +{
> +	/*
> +	 * We register only one misc_device even on multi-socket system.
> +	 * So, deregister should happen only once.
> +	 */
> +	if (hsmp_pdev.is_probed) {
> +		misc_deregister(&hsmp_pdev.mdev);
> +		hsmp_pdev.is_probed = false;
> +	}
> +}
> +
> +static struct platform_driver amd_hsmp_driver = {
> +	.probe		= hsmp_acpi_probe,
> +	.remove_new	= hsmp_acpi_remove,
> +	.driver		= {
> +		.name	= DRIVER_NAME,
> +		.acpi_match_table = amd_hsmp_acpi_ids,
> +	},
> +};
> +
> +module_platform_driver(amd_hsmp_driver);
> +
> +MODULE_DESCRIPTION("AMD HSMP Platform Interface Driver");
> +MODULE_VERSION(DRIVER_VERSION);
> +MODULE_LICENSE("GPL v2");
> diff --git a/drivers/platform/x86/amd/hsmp/hsmp.c b/drivers/platform/x86/amd/hsmp/hsmp.c
> index 14edaace4379..759ec1d4d60d 100644
> --- a/drivers/platform/x86/amd/hsmp/hsmp.c
> +++ b/drivers/platform/x86/amd/hsmp/hsmp.c
> @@ -31,17 +31,6 @@
>  
>  struct hsmp_plat_device hsmp_pdev;
>  
> -static int amd_hsmp_rdwr(struct hsmp_socket *sock, u32 offset,
> -			 u32 *value, bool write)
> -{
> -	if (hsmp_pdev.is_acpi_device)
> -		amd_hsmp_acpi_rdwr(sock, offset, value, write);
> -	else
> -		return amd_hsmp_pci_rdwr(sock, offset, value, write);
> -
> -	return 0;
> -}
> -
>  /*
>   * Send a message to the HSMP port via PCI-e config space registers
>   * or by writing to MMIO space.
> @@ -64,7 +53,7 @@ static int __hsmp_send_message(struct hsmp_socket *sock, struct hsmp_message *ms
>  
>  	/* Clear the status register */
>  	mbox_status = HSMP_STATUS_NOT_READY;
> -	ret = amd_hsmp_rdwr(sock, mbinfo->msg_resp_off, &mbox_status, HSMP_WR);
> +	ret = sock->amd_hsmp_rdwr(sock, mbinfo->msg_resp_off, &mbox_status, HSMP_WR);
>  	if (ret) {
>  		pr_err("Error %d clearing mailbox status register\n", ret);
>  		return ret;
> @@ -73,8 +62,8 @@ static int __hsmp_send_message(struct hsmp_socket *sock, struct hsmp_message *ms
>  	index = 0;
>  	/* Write any message arguments */
>  	while (index < msg->num_args) {
> -		ret = amd_hsmp_rdwr(sock, mbinfo->msg_arg_off + (index << 2),
> -				    &msg->args[index], HSMP_WR);
> +		ret = sock->amd_hsmp_rdwr(sock, mbinfo->msg_arg_off + (index << 2),
> +					  &msg->args[index], HSMP_WR);
>  		if (ret) {
>  			pr_err("Error %d writing message argument %d\n", ret, index);
>  			return ret;
> @@ -83,7 +72,7 @@ static int __hsmp_send_message(struct hsmp_socket *sock, struct hsmp_message *ms
>  	}
>  
>  	/* Write the message ID which starts the operation */
> -	ret = amd_hsmp_rdwr(sock, mbinfo->msg_id_off, &msg->msg_id, HSMP_WR);
> +	ret = sock->amd_hsmp_rdwr(sock, mbinfo->msg_id_off, &msg->msg_id, HSMP_WR);
>  	if (ret) {
>  		pr_err("Error %d writing message ID %u\n", ret, msg->msg_id);
>  		return ret;
> @@ -100,7 +89,7 @@ static int __hsmp_send_message(struct hsmp_socket *sock, struct hsmp_message *ms
>  	timeout	= jiffies + msecs_to_jiffies(HSMP_MSG_TIMEOUT);
>  
>  	while (time_before(jiffies, timeout)) {
> -		ret = amd_hsmp_rdwr(sock, mbinfo->msg_resp_off, &mbox_status, HSMP_RD);
> +		ret = sock->amd_hsmp_rdwr(sock, mbinfo->msg_resp_off, &mbox_status, HSMP_RD);
>  		if (ret) {
>  			pr_err("Error %d reading mailbox status\n", ret);
>  			return ret;
> @@ -135,8 +124,8 @@ static int __hsmp_send_message(struct hsmp_socket *sock, struct hsmp_message *ms
>  	 */
>  	index = 0;
>  	while (index < msg->response_sz) {
> -		ret = amd_hsmp_rdwr(sock, mbinfo->msg_arg_off + (index << 2),
> -				    &msg->args[index], HSMP_RD);
> +		ret = sock->amd_hsmp_rdwr(sock, mbinfo->msg_arg_off + (index << 2),
> +					  &msg->args[index], HSMP_RD);
>  		if (ret) {
>  			pr_err("Error %d reading response %u for message ID:%u\n",
>  			       ret, index, msg->msg_id);
> diff --git a/drivers/platform/x86/amd/hsmp/hsmp.h b/drivers/platform/x86/amd/hsmp/hsmp.h
> index a77887d298b6..5d4fc7735a87 100644
> --- a/drivers/platform/x86/amd/hsmp/hsmp.h
> +++ b/drivers/platform/x86/amd/hsmp/hsmp.h
> @@ -41,6 +41,7 @@ struct hsmp_socket {
>  	struct pci_dev *root;
>  	struct device *dev;
>  	u16 sock_ind;
> +	int (*amd_hsmp_rdwr)(struct hsmp_socket *sock, u32 off, u32 *val, bool rw);

This should be introduced earlier in the series in a separate patch 
(before the code is moved anywhere so there's no need to have non-static 
rdwr funcs in any stage of the moving).

>  };
>  
>  struct hsmp_plat_device {
> @@ -48,19 +49,14 @@ struct hsmp_plat_device {
>  	struct hsmp_socket *sock;
>  	u32 proto_ver;
>  	u16 num_sockets;
> -	bool is_acpi_device;
>  	bool is_probed;
>  };
>  
>  extern struct hsmp_plat_device hsmp_pdev;
>  
> -int init_acpi(struct device *dev);
>  ssize_t hsmp_metric_tbl_read(struct file *filp, struct kobject *kobj,
>  			     struct bin_attribute *bin_attr, char *buf,
>  			     loff_t off, size_t count);
> -int hsmp_create_acpi_sysfs_if(struct device *dev);
> -int amd_hsmp_pci_rdwr(struct hsmp_socket *sock, u32 offset,
> -		      u32 *value, bool write);
>  int hsmp_cache_proto_ver(u16 sock_ind);
>  long hsmp_ioctl(struct file *fp, unsigned int cmd, unsigned long arg);
>  umode_t hsmp_is_sock_attr_visible(struct kobject *kobj,
> @@ -68,6 +64,4 @@ umode_t hsmp_is_sock_attr_visible(struct kobject *kobj,
>  int hsmp_create_attr_list(struct attribute_group *attr_grp,
>  			  struct device *dev, u16 sock_ind);
>  int hsmp_test(u16 sock_ind, u32 value);
> -void amd_hsmp_acpi_rdwr(struct hsmp_socket *sock, u32 offset,
> -			u32 *value, bool write);
>  #endif /* HSMP_H */
> diff --git a/drivers/platform/x86/amd/hsmp/plat.c b/drivers/platform/x86/amd/hsmp/plat.c
> index c297540bb64c..3bce2c570f2b 100644
> --- a/drivers/platform/x86/amd/hsmp/plat.c
> +++ b/drivers/platform/x86/amd/hsmp/plat.c
> @@ -13,15 +13,13 @@
>  
>  #include <asm/amd_nb.h>
>  
> -#include <linux/acpi.h>
>  #include <linux/device.h>
>  #include <linux/module.h>
>  #include <linux/pci.h>
>  #include <linux/platform_device.h>
>  
>  #define DRIVER_NAME		"amd_hsmp"
> -#define DRIVER_VERSION		"2.2"
> -#define ACPI_HSMP_DEVICE_HID	"AMDI0097"
> +#define DRIVER_VERSION		"2.3"
>  
>  /*
>   * To access specific HSMP mailbox register, s/w writes the SMN address of HSMP mailbox
> @@ -37,8 +35,8 @@
>  #define HSMP_INDEX_REG		0xc4
>  #define HSMP_DATA_REG		0xc8
>  
> -int amd_hsmp_pci_rdwr(struct hsmp_socket *sock, u32 offset,
> -		      u32 *value, bool write)
> +static int amd_hsmp_pci_rdwr(struct hsmp_socket *sock, u32 offset,
> +			     u32 *value, bool write)
>  {
>  	int ret;
>  
> @@ -113,6 +111,7 @@ static int init_platform_device(struct device *dev)
>  		sock->sock_ind			= i;
>  		sock->dev			= dev;
>  		sock->mbinfo.base_addr		= SMN_HSMP_BASE;
> +		sock->amd_hsmp_rdwr		= amd_hsmp_pci_rdwr;
>  
>  		/*
>  		 * This is a transitional change from non-ACPI to ACPI, only
> @@ -146,89 +145,39 @@ static int init_platform_device(struct device *dev)
>  	return 0;
>  }
>  
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
>  static int hsmp_pltdrv_probe(struct platform_device *pdev)
>  {
>  	int ret;
>  
> -	/*
> -	 * On ACPI supported BIOS, there is an ACPI HSMP device added for
> -	 * each socket, so the per socket probing, but the memory allocated for
> -	 * sockets should be contiguous to access it as an array,
> -	 * Hence allocate memory for all the sockets at once instead of allocating
> -	 * on each probe.
> -	 */
> -	if (!hsmp_pdev.is_probed) {
> -		hsmp_pdev.sock = devm_kcalloc(&pdev->dev, hsmp_pdev.num_sockets,
> -					      sizeof(*hsmp_pdev.sock),
> -					      GFP_KERNEL);
> -		if (!hsmp_pdev.sock)
> -			return -ENOMEM;
> -	}
> +	hsmp_pdev.sock = devm_kcalloc(&pdev->dev, hsmp_pdev.num_sockets,
> +				      sizeof(*hsmp_pdev.sock),
> +				      GFP_KERNEL);
> +	if (!hsmp_pdev.sock)
> +		return -ENOMEM;
>  
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
> +	ret = init_platform_device(&pdev->dev);
> +	if (ret) {
> +		dev_err(&pdev->dev, "Failed to init HSMP mailbox\n");
> +		return ret;
>  	}
>  
> -	if (!hsmp_pdev.is_probed) {
> -		hsmp_pdev.mdev.name	= HSMP_CDEV_NAME;
> -		hsmp_pdev.mdev.minor	= MISC_DYNAMIC_MINOR;
> -		hsmp_pdev.mdev.fops	= &hsmp_fops;
> -		hsmp_pdev.mdev.parent	= &pdev->dev;
> -		hsmp_pdev.mdev.nodename	= HSMP_DEVNODE_NAME;
> -		hsmp_pdev.mdev.mode	= 0644;
> -
> -		ret = misc_register(&hsmp_pdev.mdev);
> -		if (ret)
> -			return ret;
> +	ret = hsmp_create_non_acpi_sysfs_if(&pdev->dev);
> +	if (ret)
> +		dev_err(&pdev->dev, "Failed to create HSMP sysfs interface\n");
>  
> -		hsmp_pdev.is_probed = true;
> -	}
> +	hsmp_pdev.mdev.name	= HSMP_CDEV_NAME;
> +	hsmp_pdev.mdev.minor	= MISC_DYNAMIC_MINOR;
> +	hsmp_pdev.mdev.fops	= &hsmp_fops;
> +	hsmp_pdev.mdev.parent	= &pdev->dev;
> +	hsmp_pdev.mdev.nodename	= HSMP_DEVNODE_NAME;
> +	hsmp_pdev.mdev.mode	= 0644;
>  
> -	return 0;
> +	return misc_register(&hsmp_pdev.mdev);
>  }
>  
>  static void hsmp_pltdrv_remove(struct platform_device *pdev)
>  {
> -	/*
> -	 * We register only one misc_device even on multi socket system.
> -	 * So, deregister should happen only once.
> -	 */
> -	if (hsmp_pdev.is_probed) {
> -		misc_deregister(&hsmp_pdev.mdev);
> -		hsmp_pdev.is_probed = false;
> -	}
> +	misc_deregister(&hsmp_pdev.mdev);
>  }
>  
>  static struct platform_driver amd_hsmp_driver = {
> @@ -236,7 +185,6 @@ static struct platform_driver amd_hsmp_driver = {
>  	.remove_new	= hsmp_pltdrv_remove,
>  	.driver		= {
>  		.name	= DRIVER_NAME,
> -		.acpi_match_table = amd_hsmp_acpi_ids,
>  	},
>  };
>  
> @@ -295,6 +243,12 @@ static int __init hsmp_plt_init(void)
>  {
>  	int ret = -ENODEV;
>  
> +	if (!legacy_hsmp_support()) {
> +		pr_info("HSMP is not supported on Family:%x model:%x\n",
> +			boot_cpu_data.x86, boot_cpu_data.x86_model);
> +		return ret;

return -ENODEV; directly.

...the other case below this one should be cleaned up too to directly 
return that value and the ret initilization removed (although not in 
this patch).

-- 
 i.

> +	}
> +
>  	/*
>  	 * amd_nb_num() returns number of SMN/DF interfaces present in the system
>  	 * if we have N SMN/DF interfaces that ideally means N sockets
> @@ -307,19 +261,9 @@ static int __init hsmp_plt_init(void)
>  	if (ret)
>  		return ret;
>  
> -	if (!hsmp_pdev.is_acpi_device) {
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
> +	ret = hsmp_plat_dev_register();
> +	if (ret)
> +		platform_driver_unregister(&amd_hsmp_driver);
>  
>  	return ret;
>  }
> 
