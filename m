Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF424770F3
	for <platform-driver-x86@vger.kernel.org>; Mon,  8 Jul 2024 10:15:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720433708; cv=none; b=hId5o+Qz8mjcYEsWAqJKoyvydyks/SnXDktITmdXVDNgZjdL69nD0ns7vrZOKqrDkGxM2kvnkzY9O0DlOcCazZqcUSVYmoUKR3UTRk18Q3dSKYn3RCZyuFR5JO1NH0UaB/9jzgiDi9GEX/VRY6pwqQXp0F6ei/Mk9XuwtNf9IV0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720433708; c=relaxed/simple;
	bh=YMzwazf+iGWQAuGi+Z/mREmkW91PPqi+QXwFPV/kax8=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=jFv3n66PAtL6d0CG5kk4/PadeMLl1obRXataJv7qgagk/lJ9lFiVcqbBIBunV2upR5yjCYMr8fSkjVPfLKzEgbtMjifOiLuPiXES6ggH8cELLqN+7cnALn11Leok9VbZ/Eh/7wpZjT1tIwnlD7HZ5coS+9R91LR6aVWpptfGhyw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=NlIz2nGC; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NlIz2nGC"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1720433707; x=1751969707;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=YMzwazf+iGWQAuGi+Z/mREmkW91PPqi+QXwFPV/kax8=;
  b=NlIz2nGC5jkR2kQpV/UHlus7zMJDpHq9b3VlJ3vG/rGCpcKH38YRvbYU
   np3mOnYyVXSLDPkzLboL61+lWNVSJpbpQMvk+r6vKtVBWiSQm6Hq8Tbvk
   6mlyuZyqMEIX8xr3PeoEtwC/cZ3gbYbv2inRRope4p87NzwZpMxy/FqZd
   evsgDHfpUc1Rhay6998gtRoUaNTa+YfeDANgg7+ZYJam3LJletzh2zWPt
   elKvVzqyLJGGsEkEpO7iZZhEwqZK7NvrVEKB8w2e8q2EeEQs+9cnkbFy4
   qdUxQbAruotEJ045kifZ7a8Htd0I/ZbNeKr370youc5X3q5InX9p6BKqj
   g==;
X-CSE-ConnectionGUID: UoPiPjFmTe+6RGZJDAIG5A==
X-CSE-MsgGUID: XGqlskRLTkKhgit3iVmASw==
X-IronPort-AV: E=McAfee;i="6700,10204,11126"; a="40138457"
X-IronPort-AV: E=Sophos;i="6.09,191,1716274800"; 
   d="scan'208";a="40138457"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jul 2024 03:15:06 -0700
X-CSE-ConnectionGUID: ATfWTf1PQFSeQJ4N4q3tfw==
X-CSE-MsgGUID: dRCDnnU4T7KCDZ9OfvHZ6A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,191,1716274800"; 
   d="scan'208";a="47529700"
Received: from ijarvine-desk1.ger.corp.intel.com (HELO localhost) ([10.245.247.115])
  by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jul 2024 03:15:04 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Mon, 8 Jul 2024 13:15:01 +0300 (EEST)
To: Suma Hegde <suma.hegde@amd.com>
cc: platform-driver-x86@vger.kernel.org, Hans de Goede <hdegoede@redhat.com>, 
    Naveen Krishna Chatradhi <naveenkrishna.chatradhi@amd.com>
Subject: Re: [PATCH 06/10] platform/x86/amd/hsmp: Create mutually exclusive
 ACPI and plat drivers
In-Reply-To: <20240627053958.2533860-7-suma.hegde@amd.com>
Message-ID: <61f51c56-a378-8649-c165-f6b4fcdf54cc@linux.intel.com>
References: <20240627053958.2533860-1-suma.hegde@amd.com> <20240627053958.2533860-7-suma.hegde@amd.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Thu, 27 Jun 2024, Suma Hegde wrote:

> Separate the probes for ACPI and platform device drivers.
> Provide a Kconfig option to select either the
> ACPI or the platform device based driver.
> 
> Signed-off-by: Suma Hegde <suma.hegde@amd.com>
> Reviewed-by: Naveen Krishna Chatradhi <naveenkrishna.chatradhi@amd.com>
> ---
>  arch/x86/include/asm/amd_hsmp.h        |   2 +-
>  drivers/platform/x86/amd/hsmp/Kconfig  |  25 ++++-
>  drivers/platform/x86/amd/hsmp/Makefile |  10 +-
>  drivers/platform/x86/amd/hsmp/acpi.c   | 114 ++++++++++++++++++++++-
>  drivers/platform/x86/amd/hsmp/hsmp.c   |  25 ++---
>  drivers/platform/x86/amd/hsmp/hsmp.h   |   8 +-
>  drivers/platform/x86/amd/hsmp/plat.c   | 122 +++++++------------------
>  7 files changed, 183 insertions(+), 123 deletions(-)
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
> diff --git a/drivers/platform/x86/amd/hsmp/Kconfig b/drivers/platform/x86/amd/hsmp/Kconfig
> index b55d4ed9bceb..1cb10d2aac77 100644
> --- a/drivers/platform/x86/amd/hsmp/Kconfig
> +++ b/drivers/platform/x86/amd/hsmp/Kconfig
> @@ -3,9 +3,30 @@
>  # AMD HSMP Driver
>  #
>  
> +menu "AMD Host System Management Port driver"
> +	depends on AMD_NB
> +
> +config AMD_HSMP_ACPI
> +	tristate "AMD HSMP ACPI driver"
> +	depends on ACPI
> +	help
> +	  The driver provides a way for user space tools to monitor and manage
> +	  system management functionality on EPYC server CPUs from AMD.
> +
> +	  Host System Management Port (HSMP) interface is a mailbox interface
> +	  between the x86 core and the System Management Unit (SMU) firmware.
> +
> +	  This driver supports ACPI based probing.
> +
> +	  You  may enable this, if your platform bios provides an ACPI object
> +	  as described in the documentation.
> +
> +	  If you choose to compile this driver as a module the module will be
> +	  called amd_hsmp.
> +
>  config AMD_HSMP
>  	tristate "AMD HSMP Driver"
> -	depends on AMD_NB && X86_64 && ACPI
> +	depends on !(AMD_HSMP_ACPI || AMD_HSMP_ACPI=m)

depends on AMD_HSMP_ACPI=n is simpler.

>  	help
>  	  The driver provides a way for user space tools to monitor and manage
>  	  system management functionality on EPYC server CPUs from AMD.
> @@ -15,3 +36,5 @@ config AMD_HSMP
>  
>  	  If you choose to compile this driver as a module the module will be
>  	  called amd_hsmp.
> +
> +endmenu
> diff --git a/drivers/platform/x86/amd/hsmp/Makefile b/drivers/platform/x86/amd/hsmp/Makefile
> index 0cc92865c0a2..53ebc462b0f9 100644
> --- a/drivers/platform/x86/amd/hsmp/Makefile
> +++ b/drivers/platform/x86/amd/hsmp/Makefile
> @@ -4,5 +4,11 @@
>  # AMD HSMP Driver
>  #
>  
> -obj-$(CONFIG_AMD_HSMP)		+= amd_hsmp.o
> -amd_hsmp-objs			:= hsmp.o plat.o acpi.o
> +ifneq ($(CONFIG_AMD_HSMP), )
> +obj-$(CONFIG_AMD_HSMP)          += amd_hsmp.o
> +amd_hsmp-objs = hsmp.o plat.o
> +endif
> +ifneq ($(CONFIG_AMD_HSMP_ACPI), )
> +obj-$(CONFIG_AMD_HSMP_ACPI)     += amd_hsmp.o
> +amd_hsmp-objs = hsmp.o acpi.o
> +endif

You should add a third symbol for the core that is selected to make 
the Makefile side less convoluted.

The build system might work with something as simple as this (I'm not sure 
if ...-m postfix works for composite objects, ...-y is documented to 
work):

obj-$(CONFIG_xx)			+= amd_hsmp.o
amd_hsmp-$(CONFIG_xx)			= hsmp.o
amd_hsmp-$(CONFIG_AMD_HSMP)		+= plat.o
amd_hsmp-$(CONFIG_AMD_HSMP_ACPI)	+= acpi.o

> diff --git a/drivers/platform/x86/amd/hsmp/acpi.c b/drivers/platform/x86/amd/hsmp/acpi.c
> index 90bfa1ddadbf..0307f4e7176d 100644
> --- a/drivers/platform/x86/amd/hsmp/acpi.c
> +++ b/drivers/platform/x86/amd/hsmp/acpi.c
> @@ -12,21 +12,34 @@
>  #include "hsmp.h"
>  
>  #include <linux/acpi.h>
> +#include <asm/amd_nb.h>
> +#include <linux/platform_device.h>
> +
> +#define DRIVER_NAME		"amd_hsmp"
> +#define DRIVER_VERSION		"2.3"
> +#define ACPI_HSMP_DEVICE_HID	"AMDI0097"
>  
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
> @@ -189,7 +202,7 @@ static int hsmp_parse_acpi_table(struct device *dev, u16 sock_ind)
>  
>  	sock->sock_ind		= sock_ind;
>  	sock->dev		= dev;
> -	plat_dev.is_acpi_device	= true;
> +	sock->amd_hsmp_rdwr	= amd_hsmp_acpi_rdwr;
>  
>  	sema_init(&sock->hsmp_sem, 1);
>  
> @@ -202,7 +215,7 @@ static int hsmp_parse_acpi_table(struct device *dev, u16 sock_ind)
>  	return hsmp_read_acpi_dsd(sock);
>  }
>  
> -int hsmp_create_acpi_sysfs_if(struct device *dev)
> +static int hsmp_create_acpi_sysfs_if(struct device *dev)
>  {
>  	struct attribute_group *attr_grp;
>  	u16 sock_ind;
> @@ -225,7 +238,7 @@ int hsmp_create_acpi_sysfs_if(struct device *dev)
>  	return devm_device_add_group(dev, attr_grp);
>  }
>  
> -int init_acpi(struct device *dev)
> +static int init_acpi(struct device *dev)
>  {
>  	u16 sock_ind;
>  	int ret;
> @@ -259,3 +272,94 @@ int init_acpi(struct device *dev)
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
> +	if (!plat_dev.is_probed) {
> +		plat_dev.num_sockets = amd_nb_num();
> +		if (plat_dev.num_sockets == 0 || plat_dev.num_sockets > MAX_AMD_SOCKETS)
> +			return -ENODEV;
> +
> +		plat_dev.sock = devm_kcalloc(&pdev->dev, plat_dev.num_sockets,
> +					     sizeof(*plat_dev.sock),
> +					     GFP_KERNEL);
> +		if (!plat_dev.sock)
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
> +		plat_dev.is_probed = true;
> +	}
> +
> +	return 0;
> +}
> +
> +static void hsmp_acpi_remove(struct platform_device *pdev)
> +{
> +	/*
> +	 * We register only one misc_device even on multi socket system.

multi-socket

> +	 * So, deregister should happen only once.
> +	 */
> +	if (plat_dev.is_probed) {
> +		misc_deregister(&plat_dev.hsmp_device);
> +		plat_dev.is_probed = false;
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

-- 
 i.

