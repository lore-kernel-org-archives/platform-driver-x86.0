Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB86718E75F
	for <platform-driver-x86@vger.kernel.org>; Tue, 20 Aug 2024 13:20:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724160028; cv=none; b=Go3vkkJzA1H+PHDxP03FaxwiRjEIQmW6ReOWk8iydz1cZUshBxlSFAJzZ3FwNpKtAjp6W7RGZmzrO3Sj6x5D5n71g4uyxIf3qGhxiALBU6tERIszDQC6F8pVlEjlTQquaLHqa1DehwwyTbBZwuFPtrQdtUhjfIJPjqdQJv7qMGo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724160028; c=relaxed/simple;
	bh=Ud2WbDQne/GE4HWFIUhVNV0TkCIdh1fMdlMU1jkuM2M=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=gpaYbbPTRYgLMoxrBYlnjdsjCGZKTYm96uE1yIMH7q+0WPE0lriEiHQujzl9I3zBXnYNQO2ix72kzmQJMCUCKf+Pfyx1bVmHVICpVpTb9Bqos93oRWoDW7uz/mWpJIVkE+uMI+kVhuwis75pA0dgbRTfo+KmqaSsC/vdLAEW6OM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jGxGn2J4; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jGxGn2J4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1724160026; x=1755696026;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=Ud2WbDQne/GE4HWFIUhVNV0TkCIdh1fMdlMU1jkuM2M=;
  b=jGxGn2J4hHZuPkSUL4+a82Ht8KWtVejydiZC6dHHuIj4Rya2wvDLT9fX
   BbY/t4aeKCJildmp5G8ibVujPiDhVaUcdl2Q8/2wyTYnD8Uvb4qJg/EHW
   sz5qqFrE9KCxLKT1gJlVDoeyJqQxxvYeFLO5ngz6I7WU7zYqzJY5jMc4K
   8U/VaZgo7+K2ShsGa+gCpUCZkSRxns2QwUzVoJrW0uwJ+OlkHA+sJsLEb
   wnjFrRHuyXQUVtKG6DfKc7P9h4pgBoFyH3Kr5goplXAcU9LfkJLjRx2/k
   7g6FPtggZ6QLh7uvzN18oYI1iw5dnFip7mUUxUDGvBSbTUcefTb4+aDhy
   w==;
X-CSE-ConnectionGUID: x2exy0YoTsKprwzsWljHPg==
X-CSE-MsgGUID: R0HyjF2YR16J9ipEfVQYKQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11170"; a="22605428"
X-IronPort-AV: E=Sophos;i="6.10,162,1719903600"; 
   d="scan'208";a="22605428"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Aug 2024 06:20:25 -0700
X-CSE-ConnectionGUID: Oeub6jxaSgehxwBpeOklDg==
X-CSE-MsgGUID: KslmZT+OThq82qV8zIXwBA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,162,1719903600"; 
   d="scan'208";a="60389382"
Received: from ijarvine-desk1.ger.corp.intel.com (HELO localhost) ([10.245.245.102])
  by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Aug 2024 06:20:23 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Tue, 20 Aug 2024 16:20:19 +0300 (EEST)
To: Suma Hegde <suma.hegde@amd.com>
cc: platform-driver-x86@vger.kernel.org, Hans de Goede <hdegoede@redhat.com>, 
    Naveen Krishna Chatradhi <naveenkrishna.chatradhi@amd.com>
Subject: Re: [v4 08/11] platform/x86/amd/hsmp: Create mutually exclusive ACPI
 and plat drivers
In-Reply-To: <20240820102941.1813163-8-suma.hegde@amd.com>
Message-ID: <fc1dc0b1-6f81-0390-cc34-6ea84bb6b080@linux.intel.com>
References: <20240820102941.1813163-1-suma.hegde@amd.com> <20240820102941.1813163-8-suma.hegde@amd.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Tue, 20 Aug 2024, Suma Hegde wrote:

> Separate the probes for ACPI and platform device drivers.

Should not depend on the shortlog for understand the changelog. So you 
need to mention "HSMP" here please.

> Provide a Kconfig option to select either the
> ACPI or the platform device based driver.

This is a bit ambiguous because 'select' is "reserved" word in Kconfig 
language. The library/core part (AMD_HSMP) is being selected so it's a 
bit misleading to use "select" for ACPI/platform driver choice. Perhaps 
replace that with e.g., "choose between".

It would also be good to explicitly mention about the common code and 
that it is selected by those two drivers. Don't assume people know all 
these details.

> Also add  "|| COMPILE_TEST" clause in Kconfig to get build coverage

extra space.

> for HSMP.
> 
> Signed-off-by: Suma Hegde <suma.hegde@amd.com>
> Reviewed-by: Naveen Krishna Chatradhi <naveenkrishna.chatradhi@amd.com>
> ---
> Changes since v3:
> 1. Added documentation for ACPI object.
> 2. Kconfig is updated.
> 3. Added COMPILE_TEST clause in Kconfig.
> 
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
>  Documentation/arch/x86/amd_hsmp.rst    |  62 +++++++-
>  arch/x86/include/asm/amd_hsmp.h        |   2 +-
>  drivers/platform/x86/amd/Makefile      |   2 +-
>  drivers/platform/x86/amd/hsmp/Kconfig  |  37 ++++-
>  drivers/platform/x86/amd/hsmp/Makefile |   6 +-
>  drivers/platform/x86/amd/hsmp/acpi.c   | 110 ++++++++++++-
>  drivers/platform/x86/amd/hsmp/hsmp.c   | 205 +------------------------
>  drivers/platform/x86/amd/hsmp/hsmp.h   |   6 +-
>  drivers/platform/x86/amd/hsmp/plat.c   | 151 +++++++++++++++++-
>  9 files changed, 355 insertions(+), 226 deletions(-)
> 
> diff --git a/Documentation/arch/x86/amd_hsmp.rst b/Documentation/arch/x86/amd_hsmp.rst
> index 1e499ecf5f4e..2e5802783da4 100644
> --- a/Documentation/arch/x86/amd_hsmp.rst
> +++ b/Documentation/arch/x86/amd_hsmp.rst
> @@ -4,8 +4,8 @@
>  AMD HSMP interface
>  ============================================
>  
> -Newer Fam19h EPYC server line of processors from AMD support system
> -management functionality via HSMP (Host System Management Port).
> +Newer Fam19h(model 0x00-0x1f, 0x30-0x3f, 0x90-0x9f, 0xa0-0xaf), Fam1Ah(model 0x00-0x1f) EPYC server line of processors
> +from AMD support system management functionality via HSMP (Host System Management Port).

Please keep these documentation lines shorter. Too long lines require 
major eye  movement which makes long lines of text harder to read.

(This line length comment only relates to documentation/text, not code 
lines).

>  The Host System Management Port (HSMP) is an interface to provide
>  OS-level software with access to system management functions via a
> @@ -16,14 +16,21 @@ More details on the interface can be found in chapter
>  Eg: https://www.amd.com/content/dam/amd/en/documents/epyc-technical-docs/programmer-references/55898_B1_pub_0_50.zip
>  
>  
> -HSMP interface is supported on EPYC server CPU models only.
> +HSMP interface is supported on EPYC line of server CPUs and MI300A (APU).
>  
>  
>  HSMP device
>  ============================================
>  
> -amd_hsmp driver under the drivers/platforms/x86/ creates miscdevice
> -/dev/hsmp to let user space programs run hsmp mailbox commands.
> +amd_hsmp driver under the drivers/platforms/x86/amd/hsmp/ is now split into separate driver files
> +with mutually exclusive compile time Kconfig options to choose between ACPI object based probing
> +or as a platform device which continues to create the miscdevice /dev/hsmp to let user
> +space programs run hsmp mailbox commands.
> +
> +The ACPI object format supported by the driver is defined below.
> +
> +Kconfig option CONFIG_AMD_HSMP compiles plat.c + hsmp.c for platform probing.
> +Kconfig option CONFIG_AMD_HSMP_ACPI compiles acpi.c + hsmp.c for ACPI probing.
>  
>  $ ls -al /dev/hsmp
>  crw-r--r-- 1 root root 10, 123 Jan 21 21:41 /dev/hsmp
> @@ -59,6 +66,51 @@ Note: lseek() is not supported as entire metrics table is read.
>  Metrics table definitions will be documented as part of Public PPR.
>  The same is defined in the amd_hsmp.h header.
>  
> +ACPI device object format
> +=========================
> +The ACPI object format expected from the amd_hsmp driver
> +for socket with ID00 is given below.
> +
> +Device(HSMP)
> +		{
> +			Name(_HID, "AMDI0097")
> +			Name(_UID, "ID00")
> +			Name(HSE0, 0x00000001)
> +			Name(RBF0, ResourceTemplate()
> +			{
> +				Memory32Fixed(ReadWrite, 0xxxxxxx, 0x00100000)
> +			})
> +			Method(_CRS, 0, NotSerialized)
> +			{
> +				Return(RBF0)
> +			}
> +			Method(_STA, 0, NotSerialized)
> +			{
> +				If(LEqual(HSE0, One))
> +				{
> +					Return(0x0F)
> +				}
> +				Else
> +				{
> +					Return(Zero)
> +				}
> +			}
> +			Name(_DSD, Package(2)
> +			{
> +				Buffer(0x10)
> +				{
> +					0x9D, 0x61, 0x4D, 0xB7, 0x07, 0x57, 0xBD, 0x48,
> +					0xA6, 0x9F, 0x4E, 0xA2, 0x87, 0x1F, 0xC2, 0xF6
> +				},
> +				Package(3)
> +				{
> +					Package(2) {"MsgIdOffset", 0x00010934},
> +					Package(2) {"MsgRspOffset", 0x00010980},
> +					Package(2) {"MsgArgOffset", 0x000109E0}
> +				}
> +			})
> +		}
> +
>  
>  An example
>  ==========
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
> index b55d4ed9bceb..6740f68243d7 100644
> --- a/drivers/platform/x86/amd/hsmp/Kconfig
> +++ b/drivers/platform/x86/amd/hsmp/Kconfig
> @@ -4,14 +4,45 @@
>  #
>  
>  config AMD_HSMP
> -	tristate "AMD HSMP Driver"
> -	depends on AMD_NB && X86_64 && ACPI
> +	tristate
> +
> +menu "AMD HSMP Driver"
> +	depends on AMD_NB || COMPILE_TEST
> +
> +config AMD_HSMP_ACPI
> +	tristate "AMD HSMP ACPI device driver"
> +	depends on ACPI
> +	select AMD_HSMP
>  	help
> +	  Host System Management Port (HSMP) interface is a mailbox interface
> +	  between the x86 core and the System Management Unit (SMU) firmware.
>  	  The driver provides a way for user space tools to monitor and manage
> -	  system management functionality on EPYC server CPUs from AMD.
> +	  system management functionality on EPYC and MI300A server CPUs
> +	  from AMD.
> +
> +	  This option supports ACPI based probing.
> +	  You may enable this, if your platform BIOS provides an ACPI object
> +	  as described in the documentation.
> +
> +	  If you choose to compile this driver as a module the module will be
> +	  called amd_hsmp.
>  
> +config AMD_HSMP_PLAT
> +	tristate "AMD HSMP platform device driver"
> +	depends on AMD_HSMP_ACPI=n
> +	select AMD_HSMP
> +	help
>  	  Host System Management Port (HSMP) interface is a mailbox interface
>  	  between the x86 core and the System Management Unit (SMU) firmware.
> +	  The driver provides a way for user space tools to monitor and manage
> +	  system management functionality on EPYC and MI300A server CPUs
> +	  from AMD.
> +
> +	  This option supports platform device based probing.
> +	  You may enable this, if your platform BIOS does not provide
> +	  HSMP ACPI object.
>  
>  	  If you choose to compile this driver as a module the module will be
>  	  called amd_hsmp.
> +
> +endmenu

This looks okay now.

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
> index 6f8e7962266a..6aa7810ebc71 100644
> --- a/drivers/platform/x86/amd/hsmp/acpi.c
> +++ b/drivers/platform/x86/amd/hsmp/acpi.c
> @@ -9,11 +9,15 @@
>  
>  #define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
>  
> +#include <asm/amd_nb.h>
> +
>  #include <linux/acpi.h>
>  #include <linux/device.h>
>  #include <linux/dev_printk.h>
>  #include <linux/ioport.h>
>  #include <linux/kstrtox.h>
> +#include <linux/module.h>
> +#include <linux/platform_device.h>
>  #include <linux/sysfs.h>
>  #include <linux/uuid.h>
>  
> @@ -21,6 +25,10 @@
>  
>  #include "hsmp.h"
>  
> +#define DRIVER_NAME		"amd_hsmp"
> +#define DRIVER_VERSION		"2.3"
> +#define ACPI_HSMP_DEVICE_HID	"AMDI0097"
> +
>  /* These are the strings specified in ACPI table */
>  #define MSG_IDOFF_STR		"MsgIdOffset"
>  #define MSG_ARGOFF_STR		"MsgArgOffset"
> @@ -37,6 +45,12 @@ static int amd_hsmp_acpi_rdwr(struct hsmp_socket *sock, u32 offset,
>  	return 0;
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
> @@ -200,7 +214,6 @@ static int hsmp_parse_acpi_table(struct device *dev, u16 sock_ind)
>  	sock->sock_ind		= sock_ind;
>  	sock->dev		= dev;
>  	sock->amd_hsmp_rdwr	= amd_hsmp_acpi_rdwr;
> -	hsmp_pdev.is_acpi_device	= true;
>  
>  	sema_init(&sock->hsmp_sem, 1);
>  
> @@ -213,7 +226,7 @@ static int hsmp_parse_acpi_table(struct device *dev, u16 sock_ind)
>  	return hsmp_read_acpi_dsd(sock);
>  }
>  
> -int hsmp_create_acpi_sysfs_if(struct device *dev)
> +static int hsmp_create_acpi_sysfs_if(struct device *dev)
>  {
>  	struct attribute_group *attr_grp;
>  	u16 sock_ind;
> @@ -236,7 +249,7 @@ int hsmp_create_acpi_sysfs_if(struct device *dev)
>  	return devm_device_add_group(dev, attr_grp);
>  }
>  
> -int init_acpi(struct device *dev)
> +static int init_acpi(struct device *dev)
>  {
>  	u16 sock_ind;
>  	int ret;
> @@ -270,3 +283,94 @@ int init_acpi(struct device *dev)
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
> +		if (!hsmp_pdev.sock)
> +			return -ENOMEM;
> +	}
> +
> +	if (!check_acpi_support(&pdev->dev)) {

Can this ever be false anymore?

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
> index 78945750d590..bbe4d9aa8963 100644
> --- a/drivers/platform/x86/amd/hsmp/hsmp.c
> +++ b/drivers/platform/x86/amd/hsmp/hsmp.c
> @@ -15,17 +15,11 @@
>  #include <linux/acpi.h>
>  #include <linux/delay.h>
>  #include <linux/device.h>
> -#include <linux/module.h>
> -#include <linux/platform_device.h>
>  #include <linux/semaphore.h>
>  #include <linux/sysfs.h>
>  
>  #include "hsmp.h"
>  
> -#define DRIVER_NAME		"amd_hsmp"
> -#define DRIVER_VERSION		"2.2"
> -#define ACPI_HSMP_DEVICE_HID	"AMDI0097"
> -
>  /* HSMP Status / Error codes */
>  #define HSMP_STATUS_NOT_READY	0x00
>  #define HSMP_STATUS_OK		0x01
> @@ -228,7 +222,7 @@ int hsmp_test(u16 sock_ind, u32 value)
>  	return ret;
>  }
>  
> -static long hsmp_ioctl(struct file *fp, unsigned int cmd, unsigned long arg)
> +long hsmp_ioctl(struct file *fp, unsigned int cmd, unsigned long arg)
>  {
>  	int __user *arguser = (int  __user *)arg;
>  	struct hsmp_message msg = { 0 };
> @@ -284,12 +278,6 @@ static long hsmp_ioctl(struct file *fp, unsigned int cmd, unsigned long arg)
>  	return 0;
>  }
>  
> -static const struct file_operations hsmp_fops = {
> -	.owner		= THIS_MODULE,
> -	.unlocked_ioctl	= hsmp_ioctl,
> -	.compat_ioctl	= hsmp_ioctl,
> -};
> -
>  ssize_t hsmp_metric_tbl_read(struct file *filp, struct kobject *kobj,
>  			     struct bin_attribute *bin_attr, char *buf,
>  			     loff_t off, size_t count)
> @@ -413,194 +401,3 @@ int hsmp_cache_proto_ver(u16 sock_ind)
>  
>  	return ret;
>  }
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
> -	if (!hsmp_pdev.is_probed) {
> -		hsmp_pdev.sock = devm_kcalloc(&pdev->dev, hsmp_pdev.num_sockets,
> -					      sizeof(*hsmp_pdev.sock),
> -					      GFP_KERNEL);
> -		if (!hsmp_pdev.sock)
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
> -
> -		hsmp_pdev.is_probed = true;
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
> -	if (hsmp_pdev.is_probed) {
> -		misc_deregister(&hsmp_pdev.mdev);
> -		hsmp_pdev.is_probed = false;
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
> -	hsmp_pdev.num_sockets = amd_nb_num();
> -	if (hsmp_pdev.num_sockets == 0 || hsmp_pdev.num_sockets > MAX_AMD_SOCKETS)
> -		return ret;
> -
> -	ret = platform_driver_register(&amd_hsmp_driver);
> -	if (ret)
> -		return ret;
> -
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
> index 9c5b9c263fc1..90d76070c93a 100644
> --- a/drivers/platform/x86/amd/hsmp/hsmp.h
> +++ b/drivers/platform/x86/amd/hsmp/hsmp.h
> @@ -52,7 +52,6 @@ struct hsmp_plat_device {
>  	struct hsmp_socket *sock;
>  	u32 proto_ver;
>  	u16 num_sockets;
> -	bool is_acpi_device;
>  	bool is_probed;
>  };
>  
> @@ -61,14 +60,11 @@ extern struct hsmp_plat_device hsmp_pdev;
>  ssize_t hsmp_metric_tbl_read(struct file *filp, struct kobject *kobj,
>  			     struct bin_attribute *bin_attr, char *buf,
>  			     loff_t off, size_t count);
> -int hsmp_create_non_acpi_sysfs_if(struct device *dev);
> -int hsmp_create_acpi_sysfs_if(struct device *dev);
>  int hsmp_cache_proto_ver(u16 sock_ind);
>  umode_t hsmp_is_sock_attr_visible(struct kobject *kobj,
>  				  struct bin_attribute *battr, int id);
>  int hsmp_create_attr_list(struct attribute_group *attr_grp,
>  			  struct device *dev, u16 sock_ind);
>  int hsmp_test(u16 sock_ind, u32 value);
> -int init_platform_device(struct device *dev);
> -int init_acpi(struct device *dev);
> +long hsmp_ioctl(struct file *fp, unsigned int cmd, unsigned long arg);
>  #endif /* HSMP_H */
> diff --git a/drivers/platform/x86/amd/hsmp/plat.c b/drivers/platform/x86/amd/hsmp/plat.c
> index e18cf82478a0..bc1f2693c04e 100644
> --- a/drivers/platform/x86/amd/hsmp/plat.c
> +++ b/drivers/platform/x86/amd/hsmp/plat.c
> @@ -12,11 +12,16 @@
>  #include <asm/amd_nb.h>
>  
>  #include <linux/device.h>
> +#include <linux/module.h>
>  #include <linux/pci.h>
> +#include <linux/platform_device.h>
>  #include <linux/sysfs.h>
>  
>  #include "hsmp.h"
>  
> +#define DRIVER_NAME		"amd_hsmp"
> +#define DRIVER_VERSION		"2.3"
> +
>  /*
>   * To access specific HSMP mailbox register, s/w writes the SMN address of HSMP mailbox
>   * register into the SMN_INDEX register, and reads/writes the SMN_DATA reg.
> @@ -50,7 +55,13 @@ static int amd_hsmp_pci_rdwr(struct hsmp_socket *sock, u32 offset,
>  	return ret;
>  }
>  
> -int hsmp_create_non_acpi_sysfs_if(struct device *dev)
> +static const struct file_operations hsmp_fops = {
> +	.owner		= THIS_MODULE,
> +	.unlocked_ioctl	= hsmp_ioctl,
> +	.compat_ioctl	= hsmp_ioctl,
> +};
> +
> +static int hsmp_create_non_acpi_sysfs_if(struct device *dev)
>  {
>  	const struct attribute_group **hsmp_attr_grps;
>  	struct attribute_group *attr_grp;
> @@ -88,7 +99,7 @@ static inline bool is_f1a_m0h(void)
>  	return false;
>  }
>  
> -int init_platform_device(struct device *dev)
> +static int init_platform_device(struct device *dev)
>  {
>  	struct hsmp_socket *sock;
>  	int ret, i;
> @@ -134,3 +145,139 @@ int init_platform_device(struct device *dev)
>  
>  	return 0;
>  }
> +
> +static int hsmp_pltdrv_probe(struct platform_device *pdev)
> +{
> +	int ret;
> +
> +	hsmp_pdev.sock = devm_kcalloc(&pdev->dev, hsmp_pdev.num_sockets,
> +				      sizeof(*hsmp_pdev.sock),
> +				      GFP_KERNEL);
> +	if (!hsmp_pdev.sock)
> +		return -ENOMEM;
> +
> +	ret = init_platform_device(&pdev->dev);
> +	if (ret) {
> +		dev_err(&pdev->dev, "Failed to init HSMP mailbox\n");
> +		return ret;
> +	}
> +
> +	ret = hsmp_create_non_acpi_sysfs_if(&pdev->dev);
> +	if (ret)
> +		dev_err(&pdev->dev, "Failed to create HSMP sysfs interface\n");
> +
> +	hsmp_pdev.mdev.name	= HSMP_CDEV_NAME;
> +	hsmp_pdev.mdev.minor	= MISC_DYNAMIC_MINOR;
> +	hsmp_pdev.mdev.fops	= &hsmp_fops;
> +	hsmp_pdev.mdev.parent	= &pdev->dev;
> +	hsmp_pdev.mdev.nodename	= HSMP_DEVNODE_NAME;
> +	hsmp_pdev.mdev.mode	= 0644;
> +
> +	return misc_register(&hsmp_pdev.mdev);

Isn't this misc code common except for the &pdev->dev which could be 
given as a parameter to something that reside inside hsmp.c?

If the misc_register() is moved into HSMP core, you probably want to move 
deregister call there too for symmetry (even if that function will be just 
a one-liner).

-- 
 i.

